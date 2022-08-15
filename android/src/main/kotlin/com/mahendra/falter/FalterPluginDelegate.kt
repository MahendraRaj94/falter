package com.mahendra.falter

import alter.sdk.api.AvatarDesigner
import android.app.Activity
import android.content.Intent
import co.facemoji.avatar.AvatarFactory
import co.facemoji.avatar.data.AvatarMatrix
import co.facemoji.logging.logError
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry


open class FalterPluginDelegate(private var activity: Activity) : PluginRegistry.ActivityResultListener {
    private lateinit var pendingResult: MethodChannel.Result

    private var avatarMatrix: AvatarMatrix? = null
    private lateinit var factory: AvatarFactory
    private lateinit var designer: AvatarDesigner

    fun showDesigner(result: MethodChannel.Result){
        pendingResult = result
        designer = AvatarDesigner.create(activity, "g7qt3hgasm2d3pdd2nxvwvpslwtu3sxozchnsfwt3rxd3rtvqadk6hq").orThrow
        factory = designer.avatarFactory
        designer.showDesigner(avatarMatrix).whenDone { matrix ->
            if(matrix == null){
                pendingResult?.error("400","Not Designed","")
            }else{
                avatarMatrix = matrix
                pendingResult?.success(matrix?.name)
            }
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        return false
    }
}