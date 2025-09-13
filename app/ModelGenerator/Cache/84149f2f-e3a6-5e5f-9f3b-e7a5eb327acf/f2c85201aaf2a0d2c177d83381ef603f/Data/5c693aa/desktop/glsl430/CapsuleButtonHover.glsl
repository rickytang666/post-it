#version 430
//#include <required.glsl> // [HACK 4/6/2023] See SCC shader_merger.cpp
// SCC_BACKEND_SHADER_FLAGS_BEGIN__
// SCC_BACKEND_SHADER_FLAGS_END__
//SG_REFLECTION_BEGIN(200)
//attribute vec4 boneData 5
//attribute vec3 blendShape0Pos 6
//attribute vec3 blendShape0Normal 12
//attribute vec3 blendShape1Pos 7
//attribute vec3 blendShape1Normal 13
//attribute vec3 blendShape2Pos 8
//attribute vec3 blendShape2Normal 14
//attribute vec3 blendShape3Pos 9
//attribute vec3 blendShape4Pos 10
//attribute vec3 blendShape5Pos 11
//attribute vec4 position 0
//attribute vec3 normal 1
//attribute vec4 tangent 2
//attribute vec2 texture0 3
//attribute vec2 texture1 4
//attribute vec4 color 18
//attribute vec3 positionNext 15
//attribute vec3 positionPrevious 16
//attribute vec4 strandProperties 17
//sampler sampler capsule_btn_refl_tex_1SmpSC 0:23
//sampler sampler capsule_btn_refl_tex_2SmpSC 0:24
//sampler sampler capsule_btn_refl_tex_3SmpSC 0:25
//sampler sampler intensityTextureSmpSC 0:26
//sampler sampler sc_OITCommonSampler 0:29
//sampler sampler sc_RayTracingHitCasterIdAndBarycentricSmpSC 0:30
//sampler sampler sc_RayTracingRayDirectionSmpSC 0:31
//sampler sampler sc_ScreenTextureSmpSC 0:33
//texture texture2D capsule_btn_refl_tex_1 0:3:0:23
//texture texture2D capsule_btn_refl_tex_2 0:4:0:24
//texture texture2D capsule_btn_refl_tex_3 0:5:0:25
//texture texture2D intensityTexture 0:6:0:26
//texture texture2D sc_OITAlpha0 0:9:0:29
//texture texture2D sc_OITAlpha1 0:10:0:29
//texture texture2D sc_OITDepthHigh0 0:11:0:29
//texture texture2D sc_OITDepthHigh1 0:12:0:29
//texture texture2D sc_OITDepthLow0 0:13:0:29
//texture texture2D sc_OITDepthLow1 0:14:0:29
//texture texture2D sc_OITFilteredDepthBoundsTexture 0:15:0:29
//texture texture2D sc_OITFrontDepthTexture 0:16:0:29
//texture utexture2D sc_RayTracingHitCasterIdAndBarycentric 0:17:0:30
//texture texture2D sc_RayTracingRayDirection 0:18:0:31
//texture texture2D sc_ScreenTexture 0:20:0:33
//texture texture2DArray capsule_btn_refl_tex_1ArrSC 0:36:0:23
//texture texture2DArray capsule_btn_refl_tex_2ArrSC 0:37:0:24
//texture texture2DArray capsule_btn_refl_tex_3ArrSC 0:38:0:25
//texture texture2DArray intensityTextureArrSC 0:39:0:26
//texture texture2DArray sc_ScreenTextureArrSC 0:43:0:33
//ssbo int sc_RayTracingCasterIndexBuffer 0:0:4 {
//uint sc_RayTracingCasterTriangles 0:[1]:4
//}
//ssbo float sc_RayTracingCasterNonAnimatedVertexBuffer 0:2:4 {
//float sc_RayTracingCasterNonAnimatedVertices 0:[1]:4
//}
//ssbo float sc_RayTracingCasterVertexBuffer 0:1:4 {
//float sc_RayTracingCasterVertices 0:[1]:4
//}
//spec_const bool BLEND_MODE_AVERAGE 0 0
//spec_const bool BLEND_MODE_BRIGHT 1 0
//spec_const bool BLEND_MODE_COLOR 2 0
//spec_const bool BLEND_MODE_COLOR_BURN 3 0
//spec_const bool BLEND_MODE_COLOR_DODGE 4 0
//spec_const bool BLEND_MODE_DARKEN 5 0
//spec_const bool BLEND_MODE_DIFFERENCE 6 0
//spec_const bool BLEND_MODE_DIVIDE 7 0
//spec_const bool BLEND_MODE_DIVISION 8 0
//spec_const bool BLEND_MODE_EXCLUSION 9 0
//spec_const bool BLEND_MODE_FORGRAY 10 0
//spec_const bool BLEND_MODE_HARD_GLOW 11 0
//spec_const bool BLEND_MODE_HARD_LIGHT 12 0
//spec_const bool BLEND_MODE_HARD_MIX 13 0
//spec_const bool BLEND_MODE_HARD_PHOENIX 14 0
//spec_const bool BLEND_MODE_HARD_REFLECT 15 0
//spec_const bool BLEND_MODE_HUE 16 0
//spec_const bool BLEND_MODE_INTENSE 17 0
//spec_const bool BLEND_MODE_LIGHTEN 18 0
//spec_const bool BLEND_MODE_LINEAR_LIGHT 19 0
//spec_const bool BLEND_MODE_LUMINOSITY 20 0
//spec_const bool BLEND_MODE_NEGATION 21 0
//spec_const bool BLEND_MODE_NOTBRIGHT 22 0
//spec_const bool BLEND_MODE_OVERLAY 23 0
//spec_const bool BLEND_MODE_PIN_LIGHT 24 0
//spec_const bool BLEND_MODE_REALISTIC 25 0
//spec_const bool BLEND_MODE_SATURATION 26 0
//spec_const bool BLEND_MODE_SOFT_LIGHT 27 0
//spec_const bool BLEND_MODE_SUBTRACT 28 0
//spec_const bool BLEND_MODE_VIVID_LIGHT 29 0
//spec_const bool ENABLE_STIPPLE_PATTERN_TEST 30 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_1 31 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_2 32 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_3 33 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 34 0
//spec_const bool SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_1 35 0
//spec_const bool SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_2 36 0
//spec_const bool SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_3 37 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 38 0
//spec_const bool SC_USE_UV_TRANSFORM_capsule_btn_refl_tex_1 39 0
//spec_const bool SC_USE_UV_TRANSFORM_capsule_btn_refl_tex_2 40 0
//spec_const bool SC_USE_UV_TRANSFORM_capsule_btn_refl_tex_3 41 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 42 0
//spec_const bool UseViewSpaceDepthVariant 43 1
//spec_const bool capsule_btn_refl_tex_1HasSwappedViews 44 0
//spec_const bool capsule_btn_refl_tex_2HasSwappedViews 45 0
//spec_const bool capsule_btn_refl_tex_3HasSwappedViews 46 0
//spec_const bool intensityTextureHasSwappedViews 47 0
//spec_const bool sc_BlendMode_Add 48 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 49 0
//spec_const bool sc_BlendMode_AlphaTest 50 0
//spec_const bool sc_BlendMode_AlphaToCoverage 51 0
//spec_const bool sc_BlendMode_ColoredGlass 52 0
//spec_const bool sc_BlendMode_Custom 53 0
//spec_const bool sc_BlendMode_Max 54 0
//spec_const bool sc_BlendMode_Min 55 0
//spec_const bool sc_BlendMode_Multiply 56 0
//spec_const bool sc_BlendMode_MultiplyOriginal 57 0
//spec_const bool sc_BlendMode_Normal 58 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 59 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 60 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 61 0
//spec_const bool sc_BlendMode_Screen 62 0
//spec_const bool sc_DepthOnly 63 0
//spec_const bool sc_FramebufferFetch 64 0
//spec_const bool sc_MotionVectorsPass 65 0
//spec_const bool sc_OITCompositingPass 66 0
//spec_const bool sc_OITDepthBoundsPass 67 0
//spec_const bool sc_OITDepthGatherPass 68 0
//spec_const bool sc_OITDepthPrepass 69 0
//spec_const bool sc_OITFrontLayerPass 70 0
//spec_const bool sc_OITMaxLayers4Plus1 71 0
//spec_const bool sc_OITMaxLayers8 72 0
//spec_const bool sc_OITMaxLayersVisualizeLayerCount 73 0
//spec_const bool sc_OutputBounds 74 0
//spec_const bool sc_ProjectiveShadowsCaster 75 0
//spec_const bool sc_ProjectiveShadowsReceiver 76 0
//spec_const bool sc_RayTracingCasterForceOpaque 77 0
//spec_const bool sc_RenderAlphaToColor 78 0
//spec_const bool sc_ScreenTextureHasSwappedViews 79 0
//spec_const bool sc_TAAEnabled 80 0
//spec_const bool sc_VertexBlending 81 0
//spec_const bool sc_VertexBlendingUseNormals 82 0
//spec_const bool sc_Voxelization 83 0
//spec_const int SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_1 84 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_2 85 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_3 86 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 87 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_1 88 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_2 89 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_3 90 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 91 -1
//spec_const int capsule_btn_refl_tex_1Layout 92 0
//spec_const int capsule_btn_refl_tex_2Layout 93 0
//spec_const int capsule_btn_refl_tex_3Layout 94 0
//spec_const int intensityTextureLayout 95 0
//spec_const int sc_DepthBufferMode 96 0
//spec_const int sc_RenderingSpace 97 -1
//spec_const int sc_ScreenTextureLayout 98 0
//spec_const int sc_ShaderCacheConstant 99 0
//spec_const int sc_SkinBonesCount 100 0
//spec_const int sc_StereoRenderingMode 101 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 102 0
//spec_const int sc_StereoViewID 103 0
//SG_REFLECTION_END
#define sc_StereoRendering_Disabled 0
#define sc_StereoRendering_InstancedClipped 1
#define sc_StereoRendering_Multiview 2
#ifdef VERTEX_SHADER
#define scOutPos(clipPosition) gl_Position=clipPosition
#define MAIN main
#endif
#ifdef SC_ENABLE_INSTANCED_RENDERING
#ifndef sc_EnableInstancing
#define sc_EnableInstancing 1
#endif
#endif
#define mod(x,y) (x-y*floor((x+1e-6)/y))
#if __VERSION__<300
#define isinf(x) (x!=0.0&&x*2.0==x ? true : false)
#define isnan(x) (x>0.0||x<0.0||x==0.0 ? false : true)
#define inverse(M) M
#endif
#ifdef sc_EnableStereoClipDistance
#if defined(GL_APPLE_clip_distance)
#extension GL_APPLE_clip_distance : require
#elif defined(GL_EXT_clip_cull_distance)
#extension GL_EXT_clip_cull_distance : require
#else
#error Clip distance is requested but not supported by this device.
#endif
#endif
#ifdef sc_EnableMultiviewStereoRendering
#define sc_StereoRenderingMode sc_StereoRendering_Multiview
#define sc_NumStereoViews 2
#extension GL_OVR_multiview2 : require
#ifdef VERTEX_SHADER
#ifdef sc_EnableInstancingFallback
#define sc_GlobalInstanceID (sc_FallbackInstanceID*2+gl_InstanceID)
#else
#define sc_GlobalInstanceID gl_InstanceID
#endif
#define sc_LocalInstanceID sc_GlobalInstanceID
#define sc_StereoViewID int(gl_ViewID_OVR)
#endif
#elif defined(sc_EnableInstancedClippedStereoRendering)
#ifndef sc_EnableInstancing
#error Instanced-clipped stereo rendering requires enabled instancing.
#endif
#ifndef sc_EnableStereoClipDistance
#define sc_StereoRendering_IsClipDistanceEnabled 0
#else
#define sc_StereoRendering_IsClipDistanceEnabled 1
#endif
#define sc_StereoRenderingMode sc_StereoRendering_InstancedClipped
#define sc_NumStereoClipPlanes 1
#define sc_NumStereoViews 2
#ifdef VERTEX_SHADER
#ifdef sc_EnableInstancingFallback
#define sc_GlobalInstanceID (sc_FallbackInstanceID*2+gl_InstanceID)
#else
#define sc_GlobalInstanceID gl_InstanceID
#endif
#define sc_LocalInstanceID (sc_GlobalInstanceID/2)
#define sc_StereoViewID (sc_GlobalInstanceID%2)
#endif
#else
#define sc_StereoRenderingMode sc_StereoRendering_Disabled
#endif
#if defined(sc_EnableInstancing)&&defined(VERTEX_SHADER)
#ifdef GL_ARB_draw_instanced
#extension GL_ARB_draw_instanced : require
#define gl_InstanceID gl_InstanceIDARB
#endif
#ifdef GL_EXT_draw_instanced
#extension GL_EXT_draw_instanced : require
#define gl_InstanceID gl_InstanceIDEXT
#endif
#ifndef sc_InstanceID
#define sc_InstanceID gl_InstanceID
#endif
#ifndef sc_GlobalInstanceID
#ifdef sc_EnableInstancingFallback
#define sc_GlobalInstanceID (sc_FallbackInstanceID)
#define sc_LocalInstanceID (sc_FallbackInstanceID)
#else
#define sc_GlobalInstanceID gl_InstanceID
#define sc_LocalInstanceID gl_InstanceID
#endif
#endif
#endif
#ifndef GL_ES
#extension GL_EXT_gpu_shader4 : enable
#extension GL_ARB_shader_texture_lod : enable
#define precision
#define lowp
#define mediump
#define highp
#define sc_FragmentPrecision
#endif
#ifdef GL_ES
#ifdef sc_FramebufferFetch
#if defined(GL_EXT_shader_framebuffer_fetch)
#extension GL_EXT_shader_framebuffer_fetch : require
#elif defined(GL_ARM_shader_framebuffer_fetch)
#extension GL_ARM_shader_framebuffer_fetch : require
#else
#error Framebuffer fetch is requested but not supported by this device.
#endif
#endif
#ifdef GL_FRAGMENT_PRECISION_HIGH
#define sc_FragmentPrecision highp
#else
#define sc_FragmentPrecision mediump
#endif
#ifdef FRAGMENT_SHADER
precision highp int;
precision highp float;
#endif
#endif
#ifdef VERTEX_SHADER
#ifdef sc_EnableMultiviewStereoRendering
layout(num_views=sc_NumStereoViews) in;
#endif
#endif
#define SC_INT_FALLBACK_FLOAT int
#define SC_INTERPOLATION_FLAT flat
#define SC_INTERPOLATION_CENTROID centroid
#ifndef sc_NumStereoViews
#define sc_NumStereoViews 1
#endif
#ifndef sc_TextureRenderingLayout_Regular
#define sc_TextureRenderingLayout_Regular 0
#define sc_TextureRenderingLayout_StereoInstancedClipped 1
#define sc_TextureRenderingLayout_StereoMultiview 2
#endif
#if defined VERTEX_SHADER
struct sc_Vertex_t
{
vec4 position;
vec3 normal;
vec3 tangent;
vec2 texture0;
vec2 texture1;
};
#ifndef sc_StereoRenderingMode
#define sc_StereoRenderingMode 0
#endif
#ifndef sc_StereoViewID
#define sc_StereoViewID 0
#endif
#ifndef sc_RenderingSpace
#define sc_RenderingSpace -1
#endif
#ifndef sc_TAAEnabled
#define sc_TAAEnabled 0
#elif sc_TAAEnabled==1
#undef sc_TAAEnabled
#define sc_TAAEnabled 1
#endif
#ifndef sc_MotionVectorsPass
#define sc_MotionVectorsPass 0
#elif sc_MotionVectorsPass==1
#undef sc_MotionVectorsPass
#define sc_MotionVectorsPass 1
#endif
#ifndef sc_NumStereoViews
#define sc_NumStereoViews 1
#endif
#ifndef sc_StereoRendering_IsClipDistanceEnabled
#define sc_StereoRendering_IsClipDistanceEnabled 0
#endif
#ifndef sc_ShaderCacheConstant
#define sc_ShaderCacheConstant 0
#endif
#ifndef sc_SkinBonesCount
#define sc_SkinBonesCount 0
#endif
#ifndef sc_VertexBlending
#define sc_VertexBlending 0
#elif sc_VertexBlending==1
#undef sc_VertexBlending
#define sc_VertexBlending 1
#endif
#ifndef sc_VertexBlendingUseNormals
#define sc_VertexBlendingUseNormals 0
#elif sc_VertexBlendingUseNormals==1
#undef sc_VertexBlendingUseNormals
#define sc_VertexBlendingUseNormals 1
#endif
struct sc_Camera_t
{
vec3 position;
float aspect;
vec2 clipPlanes;
};
#ifndef sc_DepthBufferMode
#define sc_DepthBufferMode 0
#endif
#ifndef sc_ProjectiveShadowsReceiver
#define sc_ProjectiveShadowsReceiver 0
#elif sc_ProjectiveShadowsReceiver==1
#undef sc_ProjectiveShadowsReceiver
#define sc_ProjectiveShadowsReceiver 1
#endif
#ifndef sc_OITDepthGatherPass
#define sc_OITDepthGatherPass 0
#elif sc_OITDepthGatherPass==1
#undef sc_OITDepthGatherPass
#define sc_OITDepthGatherPass 1
#endif
#ifndef sc_OITCompositingPass
#define sc_OITCompositingPass 0
#elif sc_OITCompositingPass==1
#undef sc_OITCompositingPass
#define sc_OITCompositingPass 1
#endif
#ifndef sc_OITDepthBoundsPass
#define sc_OITDepthBoundsPass 0
#elif sc_OITDepthBoundsPass==1
#undef sc_OITDepthBoundsPass
#define sc_OITDepthBoundsPass 1
#endif
#ifndef sc_Voxelization
#define sc_Voxelization 0
#elif sc_Voxelization==1
#undef sc_Voxelization
#define sc_Voxelization 1
#endif
#ifndef UseViewSpaceDepthVariant
#define UseViewSpaceDepthVariant 1
#elif UseViewSpaceDepthVariant==1
#undef UseViewSpaceDepthVariant
#define UseViewSpaceDepthVariant 1
#endif
#ifndef sc_OutputBounds
#define sc_OutputBounds 0
#elif sc_OutputBounds==1
#undef sc_OutputBounds
#define sc_OutputBounds 1
#endif
layout(binding=0,std430) readonly buffer sc_RayTracingCasterIndexBuffer
{
uint sc_RayTracingCasterTriangles[1];
} sc_RayTracingCasterIndexBuffer_obj;
layout(binding=1,std430) readonly buffer sc_RayTracingCasterVertexBuffer
{
float sc_RayTracingCasterVertices[1];
} sc_RayTracingCasterVertexBuffer_obj;
layout(binding=2,std430) readonly buffer sc_RayTracingCasterNonAnimatedVertexBuffer
{
float sc_RayTracingCasterNonAnimatedVertices[1];
} sc_RayTracingCasterNonAnimatedVertexBuffer_obj;
uniform mat4 sc_ModelMatrix;
uniform mat4 sc_ProjectorMatrix;
uniform vec2 sc_TAAJitterOffset;
uniform mat4 sc_ViewProjectionMatrixArray[sc_NumStereoViews];
uniform mat4 sc_PrevFrameViewProjectionMatrixArray[sc_NumStereoViews];
uniform mat4 sc_PrevFrameModelMatrix;
uniform mat4 sc_ModelMatrixInverse;
uniform int sc_FallbackInstanceID;
uniform vec4 sc_StereoClipPlanes[sc_NumStereoViews];
uniform vec4 sc_UniformConstants;
uniform vec4 sc_BoneMatrices[(sc_SkinBonesCount*3)+1];
uniform mat3 sc_SkinBonesNormalMatrices[sc_SkinBonesCount+1];
uniform vec4 weights0;
uniform vec4 weights1;
uniform mat4 sc_ModelViewMatrixArray[sc_NumStereoViews];
uniform sc_Camera_t sc_Camera;
uniform mat4 sc_ProjectionMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_ViewMatrixArray[sc_NumStereoViews];
uniform mat4 sc_ProjectionMatrixArray[sc_NumStereoViews];
uniform mat3 sc_NormalMatrix;
uniform vec4 voxelization_params_0;
uniform vec4 voxelization_params_frustum_lrbt;
uniform vec4 voxelization_params_frustum_nf;
uniform vec3 voxelization_params_camera_pos;
uniform mat4 sc_ModelMatrixVoxelization;
uniform int PreviewEnabled;
uniform uvec4 sc_RayTracingCasterConfiguration;
uniform float depthRef;
out vec4 varPosAndMotion;
out vec4 varNormalAndMotion;
out float varClipDistance;
flat out int varStereoViewID;
in vec4 boneData;
in vec3 blendShape0Pos;
in vec3 blendShape0Normal;
in vec3 blendShape1Pos;
in vec3 blendShape1Normal;
in vec3 blendShape2Pos;
in vec3 blendShape2Normal;
in vec3 blendShape3Pos;
in vec3 blendShape4Pos;
in vec3 blendShape5Pos;
in vec4 position;
in vec3 normal;
in vec4 tangent;
in vec2 texture0;
in vec2 texture1;
out vec4 varTangent;
out vec4 varTex01;
out vec4 varScreenPos;
out vec2 varScreenTexturePos;
out vec2 varShadowTex;
out float varViewSpaceDepth;
out vec4 varColor;
in vec4 color;
out vec4 PreviewVertexColor;
out float PreviewVertexSaved;
in vec3 positionNext;
in vec3 positionPrevious;
in vec4 strandProperties;
void sc_SetClipDistancePlatform(float dstClipDistance)
{
#if sc_StereoRenderingMode==sc_StereoRendering_InstancedClipped&&sc_StereoRendering_IsClipDistanceEnabled
gl_ClipDistance[0]=dstClipDistance;
#endif
}
void sc_SetClipDistance(float dstClipDistance)
{
#if (sc_StereoRendering_IsClipDistanceEnabled==1)
{
sc_SetClipDistancePlatform(dstClipDistance);
}
#else
{
varClipDistance=dstClipDistance;
}
#endif
}
void sc_SetClipDistance(vec4 clipPosition)
{
#if (sc_StereoRenderingMode==1)
{
sc_SetClipDistance(dot(clipPosition,sc_StereoClipPlanes[sc_StereoViewID]));
}
#endif
}
void sc_SetClipPosition(vec4 clipPosition)
{
#if (sc_ShaderCacheConstant!=0)
{
clipPosition.x+=(sc_UniformConstants.x*float(sc_ShaderCacheConstant));
}
#endif
#if (sc_StereoRenderingMode>0)
{
varStereoViewID=sc_StereoViewID;
}
#endif
sc_SetClipDistance(clipPosition);
gl_Position=clipPosition;
}
int sc_GetLocalInstanceIDInternal(int id)
{
#ifdef sc_LocalInstanceID
return sc_LocalInstanceID;
#else
return 0;
#endif
}
void blendTargetShapeWithNormal(inout sc_Vertex_t v,vec3 position_1,vec3 normal_1,float weight)
{
vec3 l9_0=v.position.xyz+(position_1*weight);
v=sc_Vertex_t(vec4(l9_0.x,l9_0.y,l9_0.z,v.position.w),v.normal,v.tangent,v.texture0,v.texture1);
v.normal+=(normal_1*weight);
}
void sc_BlendVertex(inout sc_Vertex_t v)
{
#if (sc_VertexBlending)
{
#if (sc_VertexBlendingUseNormals)
{
blendTargetShapeWithNormal(v,blendShape0Pos,blendShape0Normal,weights0.x);
blendTargetShapeWithNormal(v,blendShape1Pos,blendShape1Normal,weights0.y);
blendTargetShapeWithNormal(v,blendShape2Pos,blendShape2Normal,weights0.z);
}
#else
{
vec3 l9_0=v.position.xyz+(blendShape0Pos*weights0.x);
v=sc_Vertex_t(vec4(l9_0.x,l9_0.y,l9_0.z,v.position.w),v.normal,v.tangent,v.texture0,v.texture1);
vec3 l9_1=v.position.xyz+(blendShape1Pos*weights0.y);
v=sc_Vertex_t(vec4(l9_1.x,l9_1.y,l9_1.z,v.position.w),v.normal,v.tangent,v.texture0,v.texture1);
vec3 l9_2=v.position.xyz+(blendShape2Pos*weights0.z);
v=sc_Vertex_t(vec4(l9_2.x,l9_2.y,l9_2.z,v.position.w),v.normal,v.tangent,v.texture0,v.texture1);
vec3 l9_3=v.position.xyz+(blendShape3Pos*weights0.w);
v=sc_Vertex_t(vec4(l9_3.x,l9_3.y,l9_3.z,v.position.w),v.normal,v.tangent,v.texture0,v.texture1);
vec3 l9_4=v.position.xyz+(blendShape4Pos*weights1.x);
v=sc_Vertex_t(vec4(l9_4.x,l9_4.y,l9_4.z,v.position.w),v.normal,v.tangent,v.texture0,v.texture1);
vec3 l9_5=v.position.xyz+(blendShape5Pos*weights1.y);
v=sc_Vertex_t(vec4(l9_5.x,l9_5.y,l9_5.z,v.position.w),v.normal,v.tangent,v.texture0,v.texture1);
}
#endif
}
#endif
}
vec4 sc_GetBoneWeights()
{
vec4 l9_0;
#if (sc_SkinBonesCount>0)
{
vec4 l9_1=vec4(1.0,fract(boneData.yzw));
vec4 l9_2=l9_1;
l9_2.x=1.0-dot(l9_1.yzw,vec3(1.0));
l9_0=l9_2;
}
#else
{
l9_0=vec4(0.0);
}
#endif
return l9_0;
}
void sc_GetBoneMatrix(int index,out vec4 m0,out vec4 m1,out vec4 m2)
{
int l9_0=3*index;
m0=sc_BoneMatrices[l9_0];
m1=sc_BoneMatrices[l9_0+1];
m2=sc_BoneMatrices[l9_0+2];
}
vec3 skinVertexPosition(int i,vec4 v)
{
vec3 l9_0;
#if (sc_SkinBonesCount>0)
{
vec4 param_1;
vec4 param_2;
vec4 param_3;
sc_GetBoneMatrix(i,param_1,param_2,param_3);
l9_0=vec3(dot(v,param_1),dot(v,param_2),dot(v,param_3));
}
#else
{
l9_0=v.xyz;
}
#endif
return l9_0;
}
void sc_SkinVertex(inout sc_Vertex_t v)
{
#if (sc_SkinBonesCount>0)
{
vec4 l9_0=sc_GetBoneWeights();
int l9_1=int(boneData.x);
int l9_2=int(boneData.y);
int l9_3=int(boneData.z);
int l9_4=int(boneData.w);
float l9_5=l9_0.x;
float l9_6=l9_0.y;
float l9_7=l9_0.z;
float l9_8=l9_0.w;
vec3 l9_9=(((skinVertexPosition(l9_1,v.position)*l9_5)+(skinVertexPosition(l9_2,v.position)*l9_6))+(skinVertexPosition(l9_3,v.position)*l9_7))+(skinVertexPosition(l9_4,v.position)*l9_8);
v.position=vec4(l9_9.x,l9_9.y,l9_9.z,v.position.w);
v.normal=((((sc_SkinBonesNormalMatrices[l9_1]*v.normal)*l9_5)+((sc_SkinBonesNormalMatrices[l9_2]*v.normal)*l9_6))+((sc_SkinBonesNormalMatrices[l9_3]*v.normal)*l9_7))+((sc_SkinBonesNormalMatrices[l9_4]*v.normal)*l9_8);
v.tangent=((((sc_SkinBonesNormalMatrices[l9_1]*v.tangent)*l9_5)+((sc_SkinBonesNormalMatrices[l9_2]*v.tangent)*l9_6))+((sc_SkinBonesNormalMatrices[l9_3]*v.tangent)*l9_7))+((sc_SkinBonesNormalMatrices[l9_4]*v.tangent)*l9_8);
}
#endif
}
int sc_GetStereoViewIndex()
{
int l9_0;
#if (sc_StereoRenderingMode==0)
{
l9_0=0;
}
#else
{
l9_0=sc_StereoViewID;
}
#endif
return l9_0;
}
mat4 createVoxelOrthoMatrix(float left,float right,float bottom,float top,float near,float far)
{
return mat4(vec4(2.0/(right-left),0.0,0.0,(-(right+left))/(right-left)),vec4(0.0,2.0/(top-bottom),0.0,(-(top+bottom))/(top-bottom)),vec4(0.0,0.0,(-2.0)/(far-near),(-(far+near))/(far-near)),vec4(0.0,0.0,0.0,1.0));
}
void main()
{
if (sc_RayTracingCasterConfiguration.x!=0u)
{
sc_SetClipPosition(vec4(position.xy,depthRef+(1e-10*position.z),1.0+(1e-10*position.w)));
return;
}
PreviewVertexColor=vec4(0.5);
PreviewVertexSaved=0.0;
sc_Vertex_t l9_0=sc_Vertex_t(position,normal,tangent.xyz,texture0,texture1);
sc_BlendVertex(l9_0);
sc_SkinVertex(l9_0);
#if (sc_RenderingSpace==3)
{
varPosAndMotion=vec4(vec3(0.0).x,vec3(0.0).y,vec3(0.0).z,varPosAndMotion.w);
varNormalAndMotion=vec4(l9_0.normal.x,l9_0.normal.y,l9_0.normal.z,varNormalAndMotion.w);
varTangent=vec4(l9_0.tangent.x,l9_0.tangent.y,l9_0.tangent.z,varTangent.w);
}
#else
{
#if (sc_RenderingSpace==4)
{
varPosAndMotion=vec4(vec3(0.0).x,vec3(0.0).y,vec3(0.0).z,varPosAndMotion.w);
varNormalAndMotion=vec4(l9_0.normal.x,l9_0.normal.y,l9_0.normal.z,varNormalAndMotion.w);
varTangent=vec4(l9_0.tangent.x,l9_0.tangent.y,l9_0.tangent.z,varTangent.w);
}
#else
{
#if (sc_RenderingSpace==2)
{
varPosAndMotion=vec4(l9_0.position.x,l9_0.position.y,l9_0.position.z,varPosAndMotion.w);
varNormalAndMotion=vec4(l9_0.normal.x,l9_0.normal.y,l9_0.normal.z,varNormalAndMotion.w);
varTangent=vec4(l9_0.tangent.x,l9_0.tangent.y,l9_0.tangent.z,varTangent.w);
}
#else
{
#if (sc_RenderingSpace==1)
{
vec4 l9_1=sc_ModelMatrix*l9_0.position;
varPosAndMotion=vec4(l9_1.x,l9_1.y,l9_1.z,varPosAndMotion.w);
vec3 l9_2=sc_NormalMatrix*l9_0.normal;
varNormalAndMotion=vec4(l9_2.x,l9_2.y,l9_2.z,varNormalAndMotion.w);
vec3 l9_3=sc_NormalMatrix*l9_0.tangent;
varTangent=vec4(l9_3.x,l9_3.y,l9_3.z,varTangent.w);
}
#endif
}
#endif
}
#endif
}
#endif
bool l9_4=PreviewEnabled==1;
vec2 l9_5;
if (l9_4)
{
vec2 l9_6=l9_0.texture0;
l9_6.x=1.0-l9_0.texture0.x;
l9_5=l9_6;
}
else
{
l9_5=l9_0.texture0;
}
varColor=color;
vec3 l9_7;
vec3 l9_8;
vec3 l9_9;
if (l9_4)
{
l9_9=varTangent.xyz;
l9_8=varNormalAndMotion.xyz;
l9_7=varPosAndMotion.xyz;
}
else
{
l9_9=varTangent.xyz;
l9_8=varNormalAndMotion.xyz;
l9_7=varPosAndMotion.xyz;
}
varPosAndMotion=vec4(l9_7.x,l9_7.y,l9_7.z,varPosAndMotion.w);
vec3 l9_10=normalize(l9_8);
varNormalAndMotion=vec4(l9_10.x,l9_10.y,l9_10.z,varNormalAndMotion.w);
vec3 l9_11=normalize(l9_9);
varTangent=vec4(l9_11.x,l9_11.y,l9_11.z,varTangent.w);
varTangent.w=tangent.w;
#if (UseViewSpaceDepthVariant&&((sc_OITDepthGatherPass||sc_OITCompositingPass)||sc_OITDepthBoundsPass))
{
vec4 l9_12;
#if (sc_RenderingSpace==3)
{
l9_12=sc_ProjectionMatrixInverseArray[sc_GetStereoViewIndex()]*l9_0.position;
}
#else
{
vec4 l9_13;
#if (sc_RenderingSpace==2)
{
l9_13=sc_ViewMatrixArray[sc_GetStereoViewIndex()]*l9_0.position;
}
#else
{
vec4 l9_14;
#if (sc_RenderingSpace==1)
{
l9_14=sc_ModelViewMatrixArray[sc_GetStereoViewIndex()]*l9_0.position;
}
#else
{
l9_14=l9_0.position;
}
#endif
l9_13=l9_14;
}
#endif
l9_12=l9_13;
}
#endif
varViewSpaceDepth=-l9_12.z;
}
#endif
vec4 l9_15;
#if (sc_RenderingSpace==3)
{
l9_15=l9_0.position;
}
#else
{
vec4 l9_16;
#if (sc_RenderingSpace==4)
{
l9_16=(sc_ModelViewMatrixArray[sc_GetStereoViewIndex()]*l9_0.position)*vec4(1.0/sc_Camera.aspect,1.0,1.0,1.0);
}
#else
{
vec4 l9_17;
#if (sc_RenderingSpace==2)
{
l9_17=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(varPosAndMotion.xyz,1.0);
}
#else
{
vec4 l9_18;
#if (sc_RenderingSpace==1)
{
l9_18=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(varPosAndMotion.xyz,1.0);
}
#else
{
l9_18=vec4(0.0);
}
#endif
l9_17=l9_18;
}
#endif
l9_16=l9_17;
}
#endif
l9_15=l9_16;
}
#endif
varTex01=vec4(l9_5,l9_0.texture1);
#if (sc_ProjectiveShadowsReceiver)
{
vec4 l9_19;
#if (sc_RenderingSpace==1)
{
l9_19=sc_ModelMatrix*l9_0.position;
}
#else
{
l9_19=l9_0.position;
}
#endif
vec4 l9_20=sc_ProjectorMatrix*l9_19;
varShadowTex=((l9_20.xy/vec2(l9_20.w))*0.5)+vec2(0.5);
}
#endif
vec4 l9_21;
#if (sc_DepthBufferMode==1)
{
vec4 l9_22;
if (sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][2].w!=0.0)
{
vec4 l9_23=l9_15;
l9_23.z=((log2(max(sc_Camera.clipPlanes.x,1.0+l9_15.w))*(2.0/log2(sc_Camera.clipPlanes.y+1.0)))-1.0)*l9_15.w;
l9_22=l9_23;
}
else
{
l9_22=l9_15;
}
l9_21=l9_22;
}
#else
{
l9_21=l9_15;
}
#endif
vec4 l9_24;
#if (sc_TAAEnabled)
{
vec2 l9_25=l9_21.xy+(sc_TAAJitterOffset*l9_21.w);
l9_24=vec4(l9_25.x,l9_25.y,l9_21.z,l9_21.w);
}
#else
{
l9_24=l9_21;
}
#endif
sc_SetClipPosition(l9_24);
#if (sc_Voxelization)
{
sc_Vertex_t l9_26=sc_Vertex_t(l9_0.position,l9_0.normal,l9_0.tangent,l9_5,l9_0.texture1);
sc_BlendVertex(l9_26);
sc_SkinVertex(l9_26);
int l9_27=sc_GetLocalInstanceIDInternal(sc_FallbackInstanceID);
int l9_28=int(voxelization_params_0.w);
vec4 l9_29=createVoxelOrthoMatrix(voxelization_params_frustum_lrbt.x,voxelization_params_frustum_lrbt.y,voxelization_params_frustum_lrbt.z,voxelization_params_frustum_lrbt.w,voxelization_params_frustum_nf.x,voxelization_params_frustum_nf.y)*vec4(((sc_ModelMatrixVoxelization*l9_26.position).xyz+vec3(float(l9_27%l9_28)*voxelization_params_0.y,float(l9_27/l9_28)*voxelization_params_0.y,(float(l9_27)*(voxelization_params_0.y/voxelization_params_0.z))+voxelization_params_frustum_nf.x))-voxelization_params_camera_pos,1.0);
l9_29.w=1.0;
varScreenPos=l9_29;
sc_SetClipPosition(l9_29*1.0);
}
#else
{
#if (sc_OutputBounds)
{
sc_Vertex_t l9_30=sc_Vertex_t(l9_0.position,l9_0.normal,l9_0.tangent,l9_5,l9_0.texture1);
sc_BlendVertex(l9_30);
sc_SkinVertex(l9_30);
vec2 l9_31=((l9_30.position.xy/vec2(l9_30.position.w))*0.5)+vec2(0.5);
varTex01=vec4(l9_31.x,l9_31.y,varTex01.z,varTex01.w);
vec4 l9_32=sc_ModelMatrixVoxelization*l9_30.position;
vec3 l9_33=l9_32.xyz-voxelization_params_camera_pos;
varPosAndMotion=vec4(l9_33.x,l9_33.y,l9_33.z,varPosAndMotion.w);
vec3 l9_34=normalize(l9_30.normal);
varNormalAndMotion=vec4(l9_34.x,l9_34.y,l9_34.z,varNormalAndMotion.w);
vec4 l9_35=createVoxelOrthoMatrix(voxelization_params_frustum_lrbt.x,voxelization_params_frustum_lrbt.y,voxelization_params_frustum_lrbt.z,voxelization_params_frustum_lrbt.w,voxelization_params_frustum_nf.x,voxelization_params_frustum_nf.y)*vec4(l9_33.x,l9_33.y,l9_33.z,l9_32.w);
vec4 l9_36=vec4(l9_35.x,l9_35.y,l9_35.z,vec4(0.0).w);
l9_36.w=1.0;
varScreenPos=l9_36;
sc_SetClipPosition(l9_36*1.0);
}
#endif
}
#endif
vec4 l9_37=varPosAndMotion;
#if (sc_MotionVectorsPass)
{
vec4 l9_38=vec4(l9_37.xyz,1.0);
#if (sc_MotionVectorsPass)
{
vec4 l9_39=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*l9_38;
vec4 l9_40=sc_PrevFrameViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(((sc_PrevFrameModelMatrix*sc_ModelMatrixInverse)*l9_38).xyz,1.0);
vec2 l9_41=((l9_39.xy/vec2(l9_39.w)).xy-(l9_40.xy/vec2(l9_40.w)).xy)*0.5;
varPosAndMotion.w=l9_41.x;
varNormalAndMotion.w=l9_41.y;
}
#endif
}
#endif
}
#elif defined FRAGMENT_SHADER // #if defined VERTEX_SHADER
#ifndef sc_FramebufferFetch
#define sc_FramebufferFetch 0
#elif sc_FramebufferFetch==1
#undef sc_FramebufferFetch
#define sc_FramebufferFetch 1
#endif
#if defined(GL_ES)||__VERSION__>=420
#if sc_FragDataCount>=1
#define sc_DeclareFragData0(StorageQualifier) layout(location=0) StorageQualifier sc_FragmentPrecision vec4 sc_FragData0
#endif
#if sc_FragDataCount>=2
#define sc_DeclareFragData1(StorageQualifier) layout(location=1) StorageQualifier sc_FragmentPrecision vec4 sc_FragData1
#endif
#if sc_FragDataCount>=3
#define sc_DeclareFragData2(StorageQualifier) layout(location=2) StorageQualifier sc_FragmentPrecision vec4 sc_FragData2
#endif
#if sc_FragDataCount>=4
#define sc_DeclareFragData3(StorageQualifier) layout(location=3) StorageQualifier sc_FragmentPrecision vec4 sc_FragData3
#endif
#ifndef sc_DeclareFragData0
#define sc_DeclareFragData0(_) const vec4 sc_FragData0=vec4(0.0)
#endif
#ifndef sc_DeclareFragData1
#define sc_DeclareFragData1(_) const vec4 sc_FragData1=vec4(0.0)
#endif
#ifndef sc_DeclareFragData2
#define sc_DeclareFragData2(_) const vec4 sc_FragData2=vec4(0.0)
#endif
#ifndef sc_DeclareFragData3
#define sc_DeclareFragData3(_) const vec4 sc_FragData3=vec4(0.0)
#endif
#if sc_FramebufferFetch
#ifdef GL_EXT_shader_framebuffer_fetch
sc_DeclareFragData0(inout);
sc_DeclareFragData1(inout);
sc_DeclareFragData2(inout);
sc_DeclareFragData3(inout);
mediump mat4 getFragData() { return mat4(sc_FragData0,sc_FragData1,sc_FragData2,sc_FragData3); }
#define gl_LastFragData (getFragData())
#elif defined(GL_ARM_shader_framebuffer_fetch)
sc_DeclareFragData0(out);
sc_DeclareFragData1(out);
sc_DeclareFragData2(out);
sc_DeclareFragData3(out);
mediump mat4 getFragData() { return mat4(gl_LastFragColorARM,vec4(0.0),vec4(0.0),vec4(0.0)); }
#define gl_LastFragData (getFragData())
#endif
#else
sc_DeclareFragData0(out);
sc_DeclareFragData1(out);
sc_DeclareFragData2(out);
sc_DeclareFragData3(out);
mediump mat4 getFragData() { return mat4(vec4(0.0),vec4(0.0),vec4(0.0),vec4(0.0)); }
#define gl_LastFragData (getFragData())
#endif
#else
#ifdef FRAGMENT_SHADER
#define sc_FragData0 gl_FragData[0]
#define sc_FragData1 gl_FragData[1]
#define sc_FragData2 gl_FragData[2]
#define sc_FragData3 gl_FragData[3]
#endif
mat4 getFragData() { return mat4(vec4(0.0),vec4(0.0),vec4(0.0),vec4(0.0)); }
#define gl_LastFragData (getFragData())
#if sc_FramebufferFetch
#error Framebuffer fetch is requested but not supported by this device.
#endif
#endif
struct sc_RayTracingHitPayload
{
vec3 viewDirWS;
vec3 positionWS;
vec3 normalWS;
vec4 tangentWS;
vec4 color;
vec2 uv0;
vec2 uv1;
vec2 uv2;
vec2 uv3;
uvec2 id;
};
#ifndef sc_StereoRenderingMode
#define sc_StereoRenderingMode 0
#endif
#ifndef sc_ScreenTextureHasSwappedViews
#define sc_ScreenTextureHasSwappedViews 0
#elif sc_ScreenTextureHasSwappedViews==1
#undef sc_ScreenTextureHasSwappedViews
#define sc_ScreenTextureHasSwappedViews 1
#endif
#ifndef sc_ScreenTextureLayout
#define sc_ScreenTextureLayout 0
#endif
#ifndef sc_NumStereoViews
#define sc_NumStereoViews 1
#endif
#ifndef sc_BlendMode_Normal
#define sc_BlendMode_Normal 0
#elif sc_BlendMode_Normal==1
#undef sc_BlendMode_Normal
#define sc_BlendMode_Normal 1
#endif
#ifndef sc_BlendMode_AlphaToCoverage
#define sc_BlendMode_AlphaToCoverage 0
#elif sc_BlendMode_AlphaToCoverage==1
#undef sc_BlendMode_AlphaToCoverage
#define sc_BlendMode_AlphaToCoverage 1
#endif
#ifndef sc_BlendMode_PremultipliedAlphaHardware
#define sc_BlendMode_PremultipliedAlphaHardware 0
#elif sc_BlendMode_PremultipliedAlphaHardware==1
#undef sc_BlendMode_PremultipliedAlphaHardware
#define sc_BlendMode_PremultipliedAlphaHardware 1
#endif
#ifndef sc_BlendMode_PremultipliedAlphaAuto
#define sc_BlendMode_PremultipliedAlphaAuto 0
#elif sc_BlendMode_PremultipliedAlphaAuto==1
#undef sc_BlendMode_PremultipliedAlphaAuto
#define sc_BlendMode_PremultipliedAlphaAuto 1
#endif
#ifndef sc_BlendMode_PremultipliedAlpha
#define sc_BlendMode_PremultipliedAlpha 0
#elif sc_BlendMode_PremultipliedAlpha==1
#undef sc_BlendMode_PremultipliedAlpha
#define sc_BlendMode_PremultipliedAlpha 1
#endif
#ifndef sc_BlendMode_AddWithAlphaFactor
#define sc_BlendMode_AddWithAlphaFactor 0
#elif sc_BlendMode_AddWithAlphaFactor==1
#undef sc_BlendMode_AddWithAlphaFactor
#define sc_BlendMode_AddWithAlphaFactor 1
#endif
#ifndef sc_BlendMode_AlphaTest
#define sc_BlendMode_AlphaTest 0
#elif sc_BlendMode_AlphaTest==1
#undef sc_BlendMode_AlphaTest
#define sc_BlendMode_AlphaTest 1
#endif
#ifndef sc_BlendMode_Multiply
#define sc_BlendMode_Multiply 0
#elif sc_BlendMode_Multiply==1
#undef sc_BlendMode_Multiply
#define sc_BlendMode_Multiply 1
#endif
#ifndef sc_BlendMode_MultiplyOriginal
#define sc_BlendMode_MultiplyOriginal 0
#elif sc_BlendMode_MultiplyOriginal==1
#undef sc_BlendMode_MultiplyOriginal
#define sc_BlendMode_MultiplyOriginal 1
#endif
#ifndef sc_BlendMode_ColoredGlass
#define sc_BlendMode_ColoredGlass 0
#elif sc_BlendMode_ColoredGlass==1
#undef sc_BlendMode_ColoredGlass
#define sc_BlendMode_ColoredGlass 1
#endif
#ifndef sc_BlendMode_Add
#define sc_BlendMode_Add 0
#elif sc_BlendMode_Add==1
#undef sc_BlendMode_Add
#define sc_BlendMode_Add 1
#endif
#ifndef sc_BlendMode_Screen
#define sc_BlendMode_Screen 0
#elif sc_BlendMode_Screen==1
#undef sc_BlendMode_Screen
#define sc_BlendMode_Screen 1
#endif
#ifndef sc_BlendMode_Min
#define sc_BlendMode_Min 0
#elif sc_BlendMode_Min==1
#undef sc_BlendMode_Min
#define sc_BlendMode_Min 1
#endif
#ifndef sc_BlendMode_Max
#define sc_BlendMode_Max 0
#elif sc_BlendMode_Max==1
#undef sc_BlendMode_Max
#define sc_BlendMode_Max 1
#endif
#ifndef sc_MotionVectorsPass
#define sc_MotionVectorsPass 0
#elif sc_MotionVectorsPass==1
#undef sc_MotionVectorsPass
#define sc_MotionVectorsPass 1
#endif
#ifndef sc_StereoRendering_IsClipDistanceEnabled
#define sc_StereoRendering_IsClipDistanceEnabled 0
#endif
#ifndef sc_ShaderCacheConstant
#define sc_ShaderCacheConstant 0
#endif
#ifndef sc_FramebufferFetch
#define sc_FramebufferFetch 0
#elif sc_FramebufferFetch==1
#undef sc_FramebufferFetch
#define sc_FramebufferFetch 1
#endif
#ifndef sc_RayTracingCasterForceOpaque
#define sc_RayTracingCasterForceOpaque 0
#elif sc_RayTracingCasterForceOpaque==1
#undef sc_RayTracingCasterForceOpaque
#define sc_RayTracingCasterForceOpaque 1
#endif
#ifndef intensityTextureHasSwappedViews
#define intensityTextureHasSwappedViews 0
#elif intensityTextureHasSwappedViews==1
#undef intensityTextureHasSwappedViews
#define intensityTextureHasSwappedViews 1
#endif
#ifndef intensityTextureLayout
#define intensityTextureLayout 0
#endif
#ifndef BLEND_MODE_REALISTIC
#define BLEND_MODE_REALISTIC 0
#elif BLEND_MODE_REALISTIC==1
#undef BLEND_MODE_REALISTIC
#define BLEND_MODE_REALISTIC 1
#endif
#ifndef BLEND_MODE_FORGRAY
#define BLEND_MODE_FORGRAY 0
#elif BLEND_MODE_FORGRAY==1
#undef BLEND_MODE_FORGRAY
#define BLEND_MODE_FORGRAY 1
#endif
#ifndef BLEND_MODE_NOTBRIGHT
#define BLEND_MODE_NOTBRIGHT 0
#elif BLEND_MODE_NOTBRIGHT==1
#undef BLEND_MODE_NOTBRIGHT
#define BLEND_MODE_NOTBRIGHT 1
#endif
#ifndef BLEND_MODE_DIVISION
#define BLEND_MODE_DIVISION 0
#elif BLEND_MODE_DIVISION==1
#undef BLEND_MODE_DIVISION
#define BLEND_MODE_DIVISION 1
#endif
#ifndef BLEND_MODE_BRIGHT
#define BLEND_MODE_BRIGHT 0
#elif BLEND_MODE_BRIGHT==1
#undef BLEND_MODE_BRIGHT
#define BLEND_MODE_BRIGHT 1
#endif
#ifndef BLEND_MODE_INTENSE
#define BLEND_MODE_INTENSE 0
#elif BLEND_MODE_INTENSE==1
#undef BLEND_MODE_INTENSE
#define BLEND_MODE_INTENSE 1
#endif
#ifndef SC_USE_UV_TRANSFORM_intensityTexture
#define SC_USE_UV_TRANSFORM_intensityTexture 0
#elif SC_USE_UV_TRANSFORM_intensityTexture==1
#undef SC_USE_UV_TRANSFORM_intensityTexture
#define SC_USE_UV_TRANSFORM_intensityTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_intensityTexture
#define SC_SOFTWARE_WRAP_MODE_U_intensityTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_intensityTexture
#define SC_SOFTWARE_WRAP_MODE_V_intensityTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_intensityTexture
#define SC_USE_UV_MIN_MAX_intensityTexture 0
#elif SC_USE_UV_MIN_MAX_intensityTexture==1
#undef SC_USE_UV_MIN_MAX_intensityTexture
#define SC_USE_UV_MIN_MAX_intensityTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_intensityTexture
#define SC_USE_CLAMP_TO_BORDER_intensityTexture 0
#elif SC_USE_CLAMP_TO_BORDER_intensityTexture==1
#undef SC_USE_CLAMP_TO_BORDER_intensityTexture
#define SC_USE_CLAMP_TO_BORDER_intensityTexture 1
#endif
#ifndef BLEND_MODE_LIGHTEN
#define BLEND_MODE_LIGHTEN 0
#elif BLEND_MODE_LIGHTEN==1
#undef BLEND_MODE_LIGHTEN
#define BLEND_MODE_LIGHTEN 1
#endif
#ifndef BLEND_MODE_DARKEN
#define BLEND_MODE_DARKEN 0
#elif BLEND_MODE_DARKEN==1
#undef BLEND_MODE_DARKEN
#define BLEND_MODE_DARKEN 1
#endif
#ifndef BLEND_MODE_DIVIDE
#define BLEND_MODE_DIVIDE 0
#elif BLEND_MODE_DIVIDE==1
#undef BLEND_MODE_DIVIDE
#define BLEND_MODE_DIVIDE 1
#endif
#ifndef BLEND_MODE_AVERAGE
#define BLEND_MODE_AVERAGE 0
#elif BLEND_MODE_AVERAGE==1
#undef BLEND_MODE_AVERAGE
#define BLEND_MODE_AVERAGE 1
#endif
#ifndef BLEND_MODE_SUBTRACT
#define BLEND_MODE_SUBTRACT 0
#elif BLEND_MODE_SUBTRACT==1
#undef BLEND_MODE_SUBTRACT
#define BLEND_MODE_SUBTRACT 1
#endif
#ifndef BLEND_MODE_DIFFERENCE
#define BLEND_MODE_DIFFERENCE 0
#elif BLEND_MODE_DIFFERENCE==1
#undef BLEND_MODE_DIFFERENCE
#define BLEND_MODE_DIFFERENCE 1
#endif
#ifndef BLEND_MODE_NEGATION
#define BLEND_MODE_NEGATION 0
#elif BLEND_MODE_NEGATION==1
#undef BLEND_MODE_NEGATION
#define BLEND_MODE_NEGATION 1
#endif
#ifndef BLEND_MODE_EXCLUSION
#define BLEND_MODE_EXCLUSION 0
#elif BLEND_MODE_EXCLUSION==1
#undef BLEND_MODE_EXCLUSION
#define BLEND_MODE_EXCLUSION 1
#endif
#ifndef BLEND_MODE_OVERLAY
#define BLEND_MODE_OVERLAY 0
#elif BLEND_MODE_OVERLAY==1
#undef BLEND_MODE_OVERLAY
#define BLEND_MODE_OVERLAY 1
#endif
#ifndef BLEND_MODE_SOFT_LIGHT
#define BLEND_MODE_SOFT_LIGHT 0
#elif BLEND_MODE_SOFT_LIGHT==1
#undef BLEND_MODE_SOFT_LIGHT
#define BLEND_MODE_SOFT_LIGHT 1
#endif
#ifndef BLEND_MODE_HARD_LIGHT
#define BLEND_MODE_HARD_LIGHT 0
#elif BLEND_MODE_HARD_LIGHT==1
#undef BLEND_MODE_HARD_LIGHT
#define BLEND_MODE_HARD_LIGHT 1
#endif
#ifndef BLEND_MODE_COLOR_DODGE
#define BLEND_MODE_COLOR_DODGE 0
#elif BLEND_MODE_COLOR_DODGE==1
#undef BLEND_MODE_COLOR_DODGE
#define BLEND_MODE_COLOR_DODGE 1
#endif
#ifndef BLEND_MODE_COLOR_BURN
#define BLEND_MODE_COLOR_BURN 0
#elif BLEND_MODE_COLOR_BURN==1
#undef BLEND_MODE_COLOR_BURN
#define BLEND_MODE_COLOR_BURN 1
#endif
#ifndef BLEND_MODE_LINEAR_LIGHT
#define BLEND_MODE_LINEAR_LIGHT 0
#elif BLEND_MODE_LINEAR_LIGHT==1
#undef BLEND_MODE_LINEAR_LIGHT
#define BLEND_MODE_LINEAR_LIGHT 1
#endif
#ifndef BLEND_MODE_VIVID_LIGHT
#define BLEND_MODE_VIVID_LIGHT 0
#elif BLEND_MODE_VIVID_LIGHT==1
#undef BLEND_MODE_VIVID_LIGHT
#define BLEND_MODE_VIVID_LIGHT 1
#endif
#ifndef BLEND_MODE_PIN_LIGHT
#define BLEND_MODE_PIN_LIGHT 0
#elif BLEND_MODE_PIN_LIGHT==1
#undef BLEND_MODE_PIN_LIGHT
#define BLEND_MODE_PIN_LIGHT 1
#endif
#ifndef BLEND_MODE_HARD_MIX
#define BLEND_MODE_HARD_MIX 0
#elif BLEND_MODE_HARD_MIX==1
#undef BLEND_MODE_HARD_MIX
#define BLEND_MODE_HARD_MIX 1
#endif
#ifndef BLEND_MODE_HARD_REFLECT
#define BLEND_MODE_HARD_REFLECT 0
#elif BLEND_MODE_HARD_REFLECT==1
#undef BLEND_MODE_HARD_REFLECT
#define BLEND_MODE_HARD_REFLECT 1
#endif
#ifndef BLEND_MODE_HARD_GLOW
#define BLEND_MODE_HARD_GLOW 0
#elif BLEND_MODE_HARD_GLOW==1
#undef BLEND_MODE_HARD_GLOW
#define BLEND_MODE_HARD_GLOW 1
#endif
#ifndef BLEND_MODE_HARD_PHOENIX
#define BLEND_MODE_HARD_PHOENIX 0
#elif BLEND_MODE_HARD_PHOENIX==1
#undef BLEND_MODE_HARD_PHOENIX
#define BLEND_MODE_HARD_PHOENIX 1
#endif
#ifndef BLEND_MODE_HUE
#define BLEND_MODE_HUE 0
#elif BLEND_MODE_HUE==1
#undef BLEND_MODE_HUE
#define BLEND_MODE_HUE 1
#endif
#ifndef BLEND_MODE_SATURATION
#define BLEND_MODE_SATURATION 0
#elif BLEND_MODE_SATURATION==1
#undef BLEND_MODE_SATURATION
#define BLEND_MODE_SATURATION 1
#endif
#ifndef BLEND_MODE_COLOR
#define BLEND_MODE_COLOR 0
#elif BLEND_MODE_COLOR==1
#undef BLEND_MODE_COLOR
#define BLEND_MODE_COLOR 1
#endif
#ifndef BLEND_MODE_LUMINOSITY
#define BLEND_MODE_LUMINOSITY 0
#elif BLEND_MODE_LUMINOSITY==1
#undef BLEND_MODE_LUMINOSITY
#define BLEND_MODE_LUMINOSITY 1
#endif
#ifndef sc_SkinBonesCount
#define sc_SkinBonesCount 0
#endif
#ifndef UseViewSpaceDepthVariant
#define UseViewSpaceDepthVariant 1
#elif UseViewSpaceDepthVariant==1
#undef UseViewSpaceDepthVariant
#define UseViewSpaceDepthVariant 1
#endif
#ifndef sc_OITDepthGatherPass
#define sc_OITDepthGatherPass 0
#elif sc_OITDepthGatherPass==1
#undef sc_OITDepthGatherPass
#define sc_OITDepthGatherPass 1
#endif
#ifndef sc_OITCompositingPass
#define sc_OITCompositingPass 0
#elif sc_OITCompositingPass==1
#undef sc_OITCompositingPass
#define sc_OITCompositingPass 1
#endif
#ifndef sc_OITDepthBoundsPass
#define sc_OITDepthBoundsPass 0
#elif sc_OITDepthBoundsPass==1
#undef sc_OITDepthBoundsPass
#define sc_OITDepthBoundsPass 1
#endif
#ifndef sc_OITMaxLayers4Plus1
#define sc_OITMaxLayers4Plus1 0
#elif sc_OITMaxLayers4Plus1==1
#undef sc_OITMaxLayers4Plus1
#define sc_OITMaxLayers4Plus1 1
#endif
#ifndef sc_OITMaxLayersVisualizeLayerCount
#define sc_OITMaxLayersVisualizeLayerCount 0
#elif sc_OITMaxLayersVisualizeLayerCount==1
#undef sc_OITMaxLayersVisualizeLayerCount
#define sc_OITMaxLayersVisualizeLayerCount 1
#endif
#ifndef sc_OITMaxLayers8
#define sc_OITMaxLayers8 0
#elif sc_OITMaxLayers8==1
#undef sc_OITMaxLayers8
#define sc_OITMaxLayers8 1
#endif
#ifndef sc_OITFrontLayerPass
#define sc_OITFrontLayerPass 0
#elif sc_OITFrontLayerPass==1
#undef sc_OITFrontLayerPass
#define sc_OITFrontLayerPass 1
#endif
#ifndef sc_OITDepthPrepass
#define sc_OITDepthPrepass 0
#elif sc_OITDepthPrepass==1
#undef sc_OITDepthPrepass
#define sc_OITDepthPrepass 1
#endif
#ifndef ENABLE_STIPPLE_PATTERN_TEST
#define ENABLE_STIPPLE_PATTERN_TEST 0
#elif ENABLE_STIPPLE_PATTERN_TEST==1
#undef ENABLE_STIPPLE_PATTERN_TEST
#define ENABLE_STIPPLE_PATTERN_TEST 1
#endif
#ifndef sc_ProjectiveShadowsCaster
#define sc_ProjectiveShadowsCaster 0
#elif sc_ProjectiveShadowsCaster==1
#undef sc_ProjectiveShadowsCaster
#define sc_ProjectiveShadowsCaster 1
#endif
#ifndef sc_RenderAlphaToColor
#define sc_RenderAlphaToColor 0
#elif sc_RenderAlphaToColor==1
#undef sc_RenderAlphaToColor
#define sc_RenderAlphaToColor 1
#endif
#ifndef sc_BlendMode_Custom
#define sc_BlendMode_Custom 0
#elif sc_BlendMode_Custom==1
#undef sc_BlendMode_Custom
#define sc_BlendMode_Custom 1
#endif
#ifndef sc_Voxelization
#define sc_Voxelization 0
#elif sc_Voxelization==1
#undef sc_Voxelization
#define sc_Voxelization 1
#endif
#ifndef sc_OutputBounds
#define sc_OutputBounds 0
#elif sc_OutputBounds==1
#undef sc_OutputBounds
#define sc_OutputBounds 1
#endif
#ifndef capsule_btn_refl_tex_2HasSwappedViews
#define capsule_btn_refl_tex_2HasSwappedViews 0
#elif capsule_btn_refl_tex_2HasSwappedViews==1
#undef capsule_btn_refl_tex_2HasSwappedViews
#define capsule_btn_refl_tex_2HasSwappedViews 1
#endif
#ifndef capsule_btn_refl_tex_2Layout
#define capsule_btn_refl_tex_2Layout 0
#endif
#ifndef capsule_btn_refl_tex_3HasSwappedViews
#define capsule_btn_refl_tex_3HasSwappedViews 0
#elif capsule_btn_refl_tex_3HasSwappedViews==1
#undef capsule_btn_refl_tex_3HasSwappedViews
#define capsule_btn_refl_tex_3HasSwappedViews 1
#endif
#ifndef capsule_btn_refl_tex_3Layout
#define capsule_btn_refl_tex_3Layout 0
#endif
#ifndef capsule_btn_refl_tex_1HasSwappedViews
#define capsule_btn_refl_tex_1HasSwappedViews 0
#elif capsule_btn_refl_tex_1HasSwappedViews==1
#undef capsule_btn_refl_tex_1HasSwappedViews
#define capsule_btn_refl_tex_1HasSwappedViews 1
#endif
#ifndef capsule_btn_refl_tex_1Layout
#define capsule_btn_refl_tex_1Layout 0
#endif
#ifndef sc_DepthOnly
#define sc_DepthOnly 0
#elif sc_DepthOnly==1
#undef sc_DepthOnly
#define sc_DepthOnly 1
#endif
struct sc_Camera_t
{
vec3 position;
float aspect;
vec2 clipPlanes;
};
#ifndef SC_USE_UV_TRANSFORM_capsule_btn_refl_tex_2
#define SC_USE_UV_TRANSFORM_capsule_btn_refl_tex_2 0
#elif SC_USE_UV_TRANSFORM_capsule_btn_refl_tex_2==1
#undef SC_USE_UV_TRANSFORM_capsule_btn_refl_tex_2
#define SC_USE_UV_TRANSFORM_capsule_btn_refl_tex_2 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_2
#define SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_2 -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_2
#define SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_2 -1
#endif
#ifndef SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_2
#define SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_2 0
#elif SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_2==1
#undef SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_2
#define SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_2 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_2
#define SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_2 0
#elif SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_2==1
#undef SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_2
#define SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_2 1
#endif
#ifndef SC_USE_UV_TRANSFORM_capsule_btn_refl_tex_3
#define SC_USE_UV_TRANSFORM_capsule_btn_refl_tex_3 0
#elif SC_USE_UV_TRANSFORM_capsule_btn_refl_tex_3==1
#undef SC_USE_UV_TRANSFORM_capsule_btn_refl_tex_3
#define SC_USE_UV_TRANSFORM_capsule_btn_refl_tex_3 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_3
#define SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_3 -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_3
#define SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_3 -1
#endif
#ifndef SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_3
#define SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_3 0
#elif SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_3==1
#undef SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_3
#define SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_3 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_3
#define SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_3 0
#elif SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_3==1
#undef SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_3
#define SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_3 1
#endif
#ifndef SC_USE_UV_TRANSFORM_capsule_btn_refl_tex_1
#define SC_USE_UV_TRANSFORM_capsule_btn_refl_tex_1 0
#elif SC_USE_UV_TRANSFORM_capsule_btn_refl_tex_1==1
#undef SC_USE_UV_TRANSFORM_capsule_btn_refl_tex_1
#define SC_USE_UV_TRANSFORM_capsule_btn_refl_tex_1 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_1
#define SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_1 -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_1
#define SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_1 -1
#endif
#ifndef SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_1
#define SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_1 0
#elif SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_1==1
#undef SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_1
#define SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_1 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_1
#define SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_1 0
#elif SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_1==1
#undef SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_1
#define SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_1 1
#endif
layout(binding=1,std430) readonly buffer sc_RayTracingCasterVertexBuffer
{
float sc_RayTracingCasterVertices[1];
} sc_RayTracingCasterVertexBuffer_obj;
layout(binding=2,std430) readonly buffer sc_RayTracingCasterNonAnimatedVertexBuffer
{
float sc_RayTracingCasterNonAnimatedVertices[1];
} sc_RayTracingCasterNonAnimatedVertexBuffer_obj;
layout(binding=0,std430) readonly buffer sc_RayTracingCasterIndexBuffer
{
uint sc_RayTracingCasterTriangles[1];
} sc_RayTracingCasterIndexBuffer_obj;
uniform vec4 sc_CurrentRenderTargetDims;
uniform mat4 sc_ProjectionMatrixArray[sc_NumStereoViews];
uniform float sc_ShadowDensity;
uniform vec4 sc_ShadowColor;
uniform vec4 sc_UniformConstants;
uniform uvec4 sc_RayTracingCasterConfiguration;
uniform uvec4 sc_RayTracingCasterOffsetPNTC;
uniform uvec4 sc_RayTracingCasterFormatPNTC;
uniform uvec4 sc_RayTracingCasterOffsetTexture;
uniform uvec4 sc_RayTracingCasterFormatTexture;
uniform mat4 sc_ModelMatrix;
uniform mat3 sc_NormalMatrix;
uniform float correctedIntensity;
uniform mat3 intensityTextureTransform;
uniform vec4 intensityTextureUvMinMax;
uniform vec4 intensityTextureBorderColor;
uniform float alphaTestThreshold;
uniform sc_Camera_t sc_Camera;
uniform float Port_Import_N101;
uniform vec3 Port_Import_N111;
uniform mat4 sc_ViewMatrixArray[sc_NumStereoViews];
uniform float Port_Input1_N115;
uniform float Port_Input2_N115;
uniform mat3 capsule_btn_refl_tex_2Transform;
uniform vec4 capsule_btn_refl_tex_2UvMinMax;
uniform vec4 capsule_btn_refl_tex_2BorderColor;
uniform mat3 capsule_btn_refl_tex_3Transform;
uniform vec4 capsule_btn_refl_tex_3UvMinMax;
uniform vec4 capsule_btn_refl_tex_3BorderColor;
uniform float Port_Import_N027;
uniform vec3 Port_Import_N041;
uniform float Port_Input1_N045;
uniform float Port_Input2_N045;
uniform mat3 capsule_btn_refl_tex_1Transform;
uniform vec4 capsule_btn_refl_tex_1UvMinMax;
uniform vec4 capsule_btn_refl_tex_1BorderColor;
uniform vec4 Port_Value0_N016;
uniform float Port_Position1_N016;
uniform vec4 Port_Value1_N016;
uniform float Port_Position2_N016;
uniform vec4 Port_Value2_N016;
uniform float Port_Position3_N016;
uniform vec4 Port_Value3_N016;
uniform vec4 Port_Value4_N016;
uniform vec3 Port_Normal_N023;
uniform float Port_Exponent_N023;
uniform float Port_Intensity_N023;
uniform vec2 Port_Center_N019;
uniform vec2 Port_Scale_N019;
uniform vec4 Port_Input0_N020;
uniform vec4 Port_Input1_N020;
uniform vec4 Port_Input0_N048;
uniform vec4 Port_Input1_N050;
uniform float Port_Rotation_N035;
uniform vec2 Port_Center_N035;
uniform float Port_Value0_N030;
uniform float Port_Position1_N030;
uniform float Port_Value1_N030;
uniform float Port_Position2_N030;
uniform float Port_Value2_N030;
uniform float Port_Position3_N030;
uniform float Port_Value3_N030;
uniform float Port_Value4_N030;
uniform int PreviewEnabled;
uniform usampler2D sc_RayTracingHitCasterIdAndBarycentric;
uniform sampler2D sc_RayTracingRayDirection;
uniform sampler2D capsule_btn_refl_tex_2;
uniform sampler2DArray capsule_btn_refl_tex_2ArrSC;
uniform sampler2D capsule_btn_refl_tex_3;
uniform sampler2DArray capsule_btn_refl_tex_3ArrSC;
uniform sampler2D capsule_btn_refl_tex_1;
uniform sampler2DArray capsule_btn_refl_tex_1ArrSC;
uniform sampler2D sc_ScreenTexture;
uniform sampler2DArray sc_ScreenTextureArrSC;
uniform sampler2D intensityTexture;
uniform sampler2DArray intensityTextureArrSC;
uniform sampler2D sc_OITFrontDepthTexture;
uniform sampler2D sc_OITDepthHigh0;
uniform sampler2D sc_OITDepthLow0;
uniform sampler2D sc_OITAlpha0;
uniform sampler2D sc_OITDepthHigh1;
uniform sampler2D sc_OITDepthLow1;
uniform sampler2D sc_OITAlpha1;
uniform sampler2D sc_OITFilteredDepthBoundsTexture;
flat in int varStereoViewID;
in vec2 varShadowTex;
in vec4 varPosAndMotion;
in vec4 varNormalAndMotion;
in float varClipDistance;
in vec4 varScreenPos;
in float varViewSpaceDepth;
in vec4 PreviewVertexColor;
in float PreviewVertexSaved;
in vec4 varTangent;
in vec4 varTex01;
in vec2 varScreenTexturePos;
in vec4 varColor;
vec3 sc_RayTracingInterpolateAnimatedFloat3(vec3 brc,uvec3 indices,uint offset)
{
uvec3 l9_0=(indices*uvec3(6u))+uvec3(offset);
uint l9_1=l9_0.x;
uint l9_2=l9_0.y;
uint l9_3=l9_0.z;
return ((vec3(sc_RayTracingCasterNonAnimatedVertexBuffer_obj.sc_RayTracingCasterNonAnimatedVertices[l9_1],sc_RayTracingCasterNonAnimatedVertexBuffer_obj.sc_RayTracingCasterNonAnimatedVertices[l9_1+1u],sc_RayTracingCasterNonAnimatedVertexBuffer_obj.sc_RayTracingCasterNonAnimatedVertices[l9_1+2u])*brc.x)+(vec3(sc_RayTracingCasterNonAnimatedVertexBuffer_obj.sc_RayTracingCasterNonAnimatedVertices[l9_2],sc_RayTracingCasterNonAnimatedVertexBuffer_obj.sc_RayTracingCasterNonAnimatedVertices[l9_2+1u],sc_RayTracingCasterNonAnimatedVertexBuffer_obj.sc_RayTracingCasterNonAnimatedVertices[l9_2+2u])*brc.y))+(vec3(sc_RayTracingCasterNonAnimatedVertexBuffer_obj.sc_RayTracingCasterNonAnimatedVertices[l9_3],sc_RayTracingCasterNonAnimatedVertexBuffer_obj.sc_RayTracingCasterNonAnimatedVertices[l9_3+1u],sc_RayTracingCasterNonAnimatedVertexBuffer_obj.sc_RayTracingCasterNonAnimatedVertices[l9_3+2u])*brc.z);
}
vec4 sc_RayTracingFetchUnorm4(uint offset)
{
uint l9_0=floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[offset]);
return vec4(float(l9_0&255u),float((l9_0>>uint(8))&255u),float((l9_0>>uint(16))&255u),float((l9_0>>uint(24))&255u))/vec4(255.0);
}
sc_RayTracingHitPayload sc_RayTracingEvaluateHitPayload(ivec2 screenPos)
{
ivec2 l9_0=screenPos;
uvec4 l9_1=texelFetch(sc_RayTracingHitCasterIdAndBarycentric,l9_0,0);
uvec2 l9_2=l9_1.xy;
if (l9_1.x!=(sc_RayTracingCasterConfiguration.y&65535u))
{
return sc_RayTracingHitPayload(vec3(0.0),vec3(0.0),vec3(0.0),vec4(0.0),vec4(0.0),vec2(0.0),vec2(0.0),vec2(0.0),vec2(0.0),l9_2);
}
vec2 l9_3=unpackHalf2x16(l9_1.z|(l9_1.w<<uint(16)));
float l9_4=l9_3.x;
float l9_5=l9_3.y;
float l9_6=(1.0-l9_4)-l9_5;
vec3 l9_7=vec3(l9_6,l9_4,l9_5);
ivec2 l9_8=screenPos;
vec4 l9_9=texelFetch(sc_RayTracingRayDirection,l9_8,0);
float l9_10=l9_9.x;
float l9_11=l9_9.y;
float l9_12=(1.0-abs(l9_10))-abs(l9_11);
vec3 l9_13=vec3(l9_10,l9_11,l9_12);
float l9_14=clamp(-l9_12,0.0,1.0);
float l9_15;
if (l9_10>=0.0)
{
l9_15=-l9_14;
}
else
{
l9_15=l9_14;
}
float l9_16;
if (l9_11>=0.0)
{
l9_16=-l9_14;
}
else
{
l9_16=l9_14;
}
vec2 l9_17=vec2(l9_15,l9_16);
vec2 l9_18=l9_13.xy+l9_17;
uint l9_19=min(l9_1.y,sc_RayTracingCasterConfiguration.z)*6u;
uint l9_20=l9_19&4294967292u;
uint l9_21=l9_20/4u;
uint l9_22=sc_RayTracingCasterIndexBuffer_obj.sc_RayTracingCasterTriangles[l9_21];
uint l9_23=l9_21+1u;
uint l9_24=sc_RayTracingCasterIndexBuffer_obj.sc_RayTracingCasterTriangles[l9_23];
uvec4 l9_25=(uvec4(l9_22,l9_22,l9_24,l9_24)&uvec4(65535u,4294967295u,65535u,4294967295u))>>uvec4(0u,16u,0u,16u);
uvec3 l9_26;
if (l9_19==l9_20)
{
l9_26=l9_25.xyz;
}
else
{
l9_26=l9_25.yzw;
}
bool l9_27=sc_RayTracingCasterConfiguration.x==2u;
vec3 l9_28;
if (l9_27)
{
l9_28=sc_RayTracingInterpolateAnimatedFloat3(l9_7,l9_26,0u);
}
else
{
uint l9_29=sc_RayTracingCasterConfiguration.y>>16u;
uint l9_30=(l9_26.x*l9_29)+sc_RayTracingCasterOffsetPNTC.x;
uint l9_31=(l9_26.y*l9_29)+sc_RayTracingCasterOffsetPNTC.x;
uint l9_32=(l9_26.z*l9_29)+sc_RayTracingCasterOffsetPNTC.x;
vec3 l9_33;
if (sc_RayTracingCasterFormatPNTC.x==5u)
{
l9_33=((vec3(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_30],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_30+1u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_30+2u])*l9_6)+(vec3(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_31],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_31+1u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_31+2u])*l9_4))+(vec3(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_32],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_32+1u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_32+2u])*l9_5);
}
else
{
vec3 l9_34;
if (sc_RayTracingCasterFormatPNTC.x==6u)
{
l9_34=((vec3(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_30])),unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_30+1u])).x)*l9_6)+(vec3(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_31])),unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_31+1u])).x)*l9_4))+(vec3(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_32])),unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_32+1u])).x)*l9_5);
}
else
{
l9_34=vec3(1.0,0.0,0.0);
}
l9_33=l9_34;
}
l9_28=(sc_ModelMatrix*vec4(l9_33,1.0)).xyz;
}
vec3 l9_35;
if (sc_RayTracingCasterOffsetPNTC.y>0u)
{
vec3 l9_36;
if (l9_27)
{
l9_36=sc_RayTracingInterpolateAnimatedFloat3(l9_7,l9_26,3u);
}
else
{
uint l9_37=sc_RayTracingCasterConfiguration.y>>16u;
uint l9_38=(l9_26.x*l9_37)+sc_RayTracingCasterOffsetPNTC.y;
uint l9_39=(l9_26.y*l9_37)+sc_RayTracingCasterOffsetPNTC.y;
uint l9_40=(l9_26.z*l9_37)+sc_RayTracingCasterOffsetPNTC.y;
vec3 l9_41;
if (sc_RayTracingCasterFormatPNTC.y==5u)
{
l9_41=((vec3(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_38],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_38+1u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_38+2u])*l9_6)+(vec3(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_39],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_39+1u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_39+2u])*l9_4))+(vec3(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_40],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_40+1u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_40+2u])*l9_5);
}
else
{
vec3 l9_42;
if (sc_RayTracingCasterFormatPNTC.y==6u)
{
l9_42=((vec3(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_38])),unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_38+1u])).x)*l9_6)+(vec3(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_39])),unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_39+1u])).x)*l9_4))+(vec3(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_40])),unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_40+1u])).x)*l9_5);
}
else
{
l9_42=vec3(1.0,0.0,0.0);
}
l9_41=l9_42;
}
l9_36=normalize(sc_NormalMatrix*l9_41);
}
l9_35=l9_36;
}
else
{
l9_35=vec3(1.0,0.0,0.0);
}
bool l9_43=!l9_27;
bool l9_44;
if (l9_43)
{
l9_44=sc_RayTracingCasterOffsetPNTC.z>0u;
}
else
{
l9_44=l9_43;
}
vec4 l9_45;
if (l9_44)
{
uint l9_46=sc_RayTracingCasterConfiguration.y>>16u;
uint l9_47=(l9_26.x*l9_46)+sc_RayTracingCasterOffsetPNTC.z;
uint l9_48=(l9_26.y*l9_46)+sc_RayTracingCasterOffsetPNTC.z;
uint l9_49=(l9_26.z*l9_46)+sc_RayTracingCasterOffsetPNTC.z;
vec4 l9_50;
if (sc_RayTracingCasterFormatPNTC.z==5u)
{
l9_50=((vec4(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_47],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_47+1u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_47+2u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_47+3u])*l9_6)+(vec4(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_48],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_48+1u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_48+2u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_48+3u])*l9_4))+(vec4(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_49],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_49+1u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_49+2u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_49+3u])*l9_5);
}
else
{
vec4 l9_51;
if (sc_RayTracingCasterFormatPNTC.z==6u)
{
l9_51=((vec4(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_47])),unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_47+1u])))*l9_6)+(vec4(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_48])),unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_48+1u])))*l9_4))+(vec4(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_49])),unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_49+1u])))*l9_5);
}
else
{
vec4 l9_52;
if (sc_RayTracingCasterFormatPNTC.z==2u)
{
l9_52=((sc_RayTracingFetchUnorm4(l9_47)*l9_6)+(sc_RayTracingFetchUnorm4(l9_48)*l9_4))+(sc_RayTracingFetchUnorm4(l9_49)*l9_5);
}
else
{
l9_52=vec4(1.0,0.0,0.0,0.0);
}
l9_51=l9_52;
}
l9_50=l9_51;
}
l9_45=vec4(normalize(sc_NormalMatrix*l9_50.xyz),l9_50.w);
}
else
{
l9_45=vec4(1.0,0.0,0.0,1.0);
}
vec4 l9_53;
if (sc_RayTracingCasterFormatPNTC.w>0u)
{
uint l9_54=sc_RayTracingCasterConfiguration.y>>16u;
uint l9_55=(l9_26.x*l9_54)+sc_RayTracingCasterOffsetPNTC.w;
uint l9_56=(l9_26.y*l9_54)+sc_RayTracingCasterOffsetPNTC.w;
uint l9_57=(l9_26.z*l9_54)+sc_RayTracingCasterOffsetPNTC.w;
vec4 l9_58;
if (sc_RayTracingCasterFormatPNTC.w==5u)
{
l9_58=((vec4(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_55],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_55+1u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_55+2u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_55+3u])*l9_6)+(vec4(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_56],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_56+1u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_56+2u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_56+3u])*l9_4))+(vec4(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_57],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_57+1u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_57+2u],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_57+3u])*l9_5);
}
else
{
vec4 l9_59;
if (sc_RayTracingCasterFormatPNTC.w==6u)
{
l9_59=((vec4(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_55])),unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_55+1u])))*l9_6)+(vec4(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_56])),unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_56+1u])))*l9_4))+(vec4(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_57])),unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_57+1u])))*l9_5);
}
else
{
vec4 l9_60;
if (sc_RayTracingCasterFormatPNTC.w==2u)
{
l9_60=((sc_RayTracingFetchUnorm4(l9_55)*l9_6)+(sc_RayTracingFetchUnorm4(l9_56)*l9_4))+(sc_RayTracingFetchUnorm4(l9_57)*l9_5);
}
else
{
l9_60=vec4(1.0,0.0,0.0,0.0);
}
l9_59=l9_60;
}
l9_58=l9_59;
}
l9_53=l9_58;
}
else
{
l9_53=vec4(0.0);
}
uvec3 l9_61=l9_26%uvec3(2u);
vec2 l9_62=vec2(dot(l9_7,vec3(uvec3(1u)-l9_61)),0.0);
vec2 l9_63;
if (sc_RayTracingCasterFormatTexture.x>0u)
{
uint l9_64=sc_RayTracingCasterConfiguration.y>>16u;
uint l9_65=(l9_26.x*l9_64)+sc_RayTracingCasterOffsetTexture.x;
uint l9_66=(l9_26.y*l9_64)+sc_RayTracingCasterOffsetTexture.x;
uint l9_67=(l9_26.z*l9_64)+sc_RayTracingCasterOffsetTexture.x;
vec2 l9_68;
if (sc_RayTracingCasterFormatTexture.x==5u)
{
l9_68=((vec2(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_65],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_65+1u])*l9_6)+(vec2(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_66],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_66+1u])*l9_4))+(vec2(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_67],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_67+1u])*l9_5);
}
else
{
vec2 l9_69;
if (sc_RayTracingCasterFormatTexture.x==6u)
{
l9_69=((unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_65]))*l9_6)+(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_66]))*l9_4))+(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_67]))*l9_5);
}
else
{
l9_69=vec2(1.0,0.0);
}
l9_68=l9_69;
}
l9_63=l9_68;
}
else
{
l9_63=l9_62;
}
vec2 l9_70;
if (sc_RayTracingCasterFormatTexture.y>0u)
{
uint l9_71=sc_RayTracingCasterConfiguration.y>>16u;
uint l9_72=(l9_26.x*l9_71)+sc_RayTracingCasterOffsetTexture.y;
uint l9_73=(l9_26.y*l9_71)+sc_RayTracingCasterOffsetTexture.y;
uint l9_74=(l9_26.z*l9_71)+sc_RayTracingCasterOffsetTexture.y;
vec2 l9_75;
if (sc_RayTracingCasterFormatTexture.y==5u)
{
l9_75=((vec2(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_72],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_72+1u])*l9_6)+(vec2(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_73],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_73+1u])*l9_4))+(vec2(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_74],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_74+1u])*l9_5);
}
else
{
vec2 l9_76;
if (sc_RayTracingCasterFormatTexture.y==6u)
{
l9_76=((unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_72]))*l9_6)+(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_73]))*l9_4))+(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_74]))*l9_5);
}
else
{
l9_76=vec2(1.0,0.0);
}
l9_75=l9_76;
}
l9_70=l9_75;
}
else
{
l9_70=l9_62;
}
vec2 l9_77;
if (sc_RayTracingCasterFormatTexture.z>0u)
{
uint l9_78=sc_RayTracingCasterConfiguration.y>>16u;
uint l9_79=(l9_26.x*l9_78)+sc_RayTracingCasterOffsetTexture.z;
uint l9_80=(l9_26.y*l9_78)+sc_RayTracingCasterOffsetTexture.z;
uint l9_81=(l9_26.z*l9_78)+sc_RayTracingCasterOffsetTexture.z;
vec2 l9_82;
if (sc_RayTracingCasterFormatTexture.z==5u)
{
l9_82=((vec2(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_79],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_79+1u])*l9_6)+(vec2(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_80],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_80+1u])*l9_4))+(vec2(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_81],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_81+1u])*l9_5);
}
else
{
vec2 l9_83;
if (sc_RayTracingCasterFormatTexture.z==6u)
{
l9_83=((unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_79]))*l9_6)+(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_80]))*l9_4))+(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_81]))*l9_5);
}
else
{
l9_83=vec2(1.0,0.0);
}
l9_82=l9_83;
}
l9_77=l9_82;
}
else
{
l9_77=l9_62;
}
vec2 l9_84;
if (sc_RayTracingCasterFormatTexture.w>0u)
{
uint l9_85=sc_RayTracingCasterConfiguration.y>>16u;
uint l9_86=(l9_26.x*l9_85)+sc_RayTracingCasterOffsetTexture.w;
uint l9_87=(l9_26.y*l9_85)+sc_RayTracingCasterOffsetTexture.w;
uint l9_88=(l9_26.z*l9_85)+sc_RayTracingCasterOffsetTexture.w;
vec2 l9_89;
if (sc_RayTracingCasterFormatTexture.w==5u)
{
l9_89=((vec2(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_86],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_86+1u])*l9_6)+(vec2(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_87],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_87+1u])*l9_4))+(vec2(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_88],sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_88+1u])*l9_5);
}
else
{
vec2 l9_90;
if (sc_RayTracingCasterFormatTexture.w==6u)
{
l9_90=((unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_86]))*l9_6)+(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_87]))*l9_4))+(unpackHalf2x16(floatBitsToUint(sc_RayTracingCasterVertexBuffer_obj.sc_RayTracingCasterVertices[l9_88]))*l9_5);
}
else
{
l9_90=vec2(1.0,0.0);
}
l9_89=l9_90;
}
l9_84=l9_89;
}
else
{
l9_84=l9_62;
}
return sc_RayTracingHitPayload(-normalize(vec3(l9_18.x,l9_18.y,l9_13.z)),l9_28,l9_35,l9_45,l9_53,l9_63,l9_70,l9_77,l9_84,l9_2);
}
int sc_GetStereoViewIndex()
{
int l9_0;
#if (sc_StereoRenderingMode==0)
{
l9_0=0;
}
#else
{
l9_0=varStereoViewID;
}
#endif
return l9_0;
}
int capsule_btn_refl_tex_2GetStereoViewIndex()
{
int l9_0;
#if (capsule_btn_refl_tex_2HasSwappedViews)
{
l9_0=1-sc_GetStereoViewIndex();
}
#else
{
l9_0=sc_GetStereoViewIndex();
}
#endif
return l9_0;
}
void sc_SoftwareWrapEarly(inout float uv,int softwareWrapMode)
{
if (softwareWrapMode==1)
{
uv=fract(uv);
}
else
{
if (softwareWrapMode==2)
{
float l9_0=fract(uv);
uv=mix(l9_0,1.0-l9_0,clamp(step(0.25,fract((uv-l9_0)*0.5)),0.0,1.0));
}
}
}
void sc_ClampUV(inout float value,float minValue,float maxValue,bool useClampToBorder,inout float clampToBorderFactor)
{
float l9_0=clamp(value,minValue,maxValue);
float l9_1=step(abs(value-l9_0),9.9999997e-06);
clampToBorderFactor*=(l9_1+((1.0-float(useClampToBorder))*(1.0-l9_1)));
value=l9_0;
}
vec2 sc_TransformUV(vec2 uv,bool useUvTransform,mat3 uvTransform)
{
if (useUvTransform)
{
uv=vec2((uvTransform*vec3(uv,1.0)).xy);
}
return uv;
}
void sc_SoftwareWrapLate(inout float uv,int softwareWrapMode,bool useClampToBorder,inout float clampToBorderFactor)
{
if ((softwareWrapMode==0)||(softwareWrapMode==3))
{
sc_ClampUV(uv,0.0,1.0,useClampToBorder,clampToBorderFactor);
}
}
vec3 sc_SamplingCoordsViewToGlobal(vec2 uv,int renderingLayout,int viewIndex)
{
vec3 l9_0;
if (renderingLayout==0)
{
l9_0=vec3(uv,0.0);
}
else
{
vec3 l9_1;
if (renderingLayout==1)
{
l9_1=vec3(uv.x,(uv.y*0.5)+(0.5-(float(viewIndex)*0.5)),0.0);
}
else
{
l9_1=vec3(uv,float(viewIndex));
}
l9_0=l9_1;
}
return l9_0;
}
int capsule_btn_refl_tex_3GetStereoViewIndex()
{
int l9_0;
#if (capsule_btn_refl_tex_3HasSwappedViews)
{
l9_0=1-sc_GetStereoViewIndex();
}
#else
{
l9_0=sc_GetStereoViewIndex();
}
#endif
return l9_0;
}
int capsule_btn_refl_tex_1GetStereoViewIndex()
{
int l9_0;
#if (capsule_btn_refl_tex_1HasSwappedViews)
{
l9_0=1-sc_GetStereoViewIndex();
}
#else
{
l9_0=sc_GetStereoViewIndex();
}
#endif
return l9_0;
}
void sc_writeFragData0Internal(vec4 col,float zero,int cacheConst)
{
col.x+=zero*float(cacheConst);
sc_FragData0=col;
}
vec2 sc_SamplingCoordsGlobalToView(vec3 uvi,int renderingLayout,int viewIndex)
{
if (renderingLayout==1)
{
uvi.y=((2.0*uvi.y)+float(viewIndex))-1.0;
}
return uvi.xy;
}
vec2 sc_ScreenCoordsGlobalToView(vec2 uv)
{
vec2 l9_0;
#if (sc_StereoRenderingMode==1)
{
l9_0=sc_SamplingCoordsGlobalToView(vec3(uv,0.0),1,sc_GetStereoViewIndex());
}
#else
{
l9_0=uv;
}
#endif
return l9_0;
}
int sc_ScreenTextureGetStereoViewIndex()
{
int l9_0;
#if (sc_ScreenTextureHasSwappedViews)
{
l9_0=1-sc_GetStereoViewIndex();
}
#else
{
l9_0=sc_GetStereoViewIndex();
}
#endif
return l9_0;
}
vec4 sc_readFragData0_Platform()
{
return getFragData()[0];
}
int intensityTextureGetStereoViewIndex()
{
int l9_0;
#if (intensityTextureHasSwappedViews)
{
l9_0=1-sc_GetStereoViewIndex();
}
#else
{
l9_0=sc_GetStereoViewIndex();
}
#endif
return l9_0;
}
float transformSingleColor(float original,float intMap,float target)
{
#if ((BLEND_MODE_REALISTIC||BLEND_MODE_FORGRAY)||BLEND_MODE_NOTBRIGHT)
{
return original/pow(1.0-target,intMap);
}
#else
{
#if (BLEND_MODE_DIVISION)
{
return original/(1.0-target);
}
#else
{
#if (BLEND_MODE_BRIGHT)
{
return original/pow(1.0-target,2.0-(2.0*original));
}
#endif
}
#endif
}
#endif
return 0.0;
}
vec3 RGBtoHCV(vec3 rgb)
{
vec4 l9_0;
if (rgb.y<rgb.z)
{
l9_0=vec4(rgb.zy,-1.0,0.66666669);
}
else
{
l9_0=vec4(rgb.yz,0.0,-0.33333334);
}
vec4 l9_1;
if (rgb.x<l9_0.x)
{
l9_1=vec4(l9_0.xyw,rgb.x);
}
else
{
l9_1=vec4(rgb.x,l9_0.yzx);
}
float l9_2=l9_1.x-min(l9_1.w,l9_1.y);
return vec3(abs(((l9_1.w-l9_1.y)/((6.0*l9_2)+1e-07))+l9_1.z),l9_2,l9_1.x);
}
vec3 RGBToHSL(vec3 rgb)
{
vec3 l9_0=RGBtoHCV(rgb);
float l9_1=l9_0.y;
float l9_2=l9_0.z-(l9_1*0.5);
return vec3(l9_0.x,l9_1/((1.0-abs((2.0*l9_2)-1.0))+1e-07),l9_2);
}
vec3 HUEtoRGB(float hue)
{
return clamp(vec3(abs((6.0*hue)-3.0)-1.0,2.0-abs((6.0*hue)-2.0),2.0-abs((6.0*hue)-4.0)),vec3(0.0),vec3(1.0));
}
vec3 HSLToRGB(vec3 hsl)
{
return ((HUEtoRGB(hsl.x)-vec3(0.5))*((1.0-abs((2.0*hsl.z)-1.0))*hsl.y))+vec3(hsl.z);
}
vec3 transformColor(float yValue,vec3 original,vec3 target,float weight,float intMap)
{
#if (BLEND_MODE_INTENSE)
{
return mix(original,HSLToRGB(vec3(target.x,target.y,RGBToHSL(original).z)),vec3(weight));
}
#else
{
return mix(original,clamp(vec3(transformSingleColor(yValue,intMap,target.x),transformSingleColor(yValue,intMap,target.y),transformSingleColor(yValue,intMap,target.z)),vec3(0.0),vec3(1.0)),vec3(weight));
}
#endif
}
vec3 definedBlend(vec3 a,vec3 b)
{
#if (BLEND_MODE_LIGHTEN)
{
return max(a,b);
}
#else
{
#if (BLEND_MODE_DARKEN)
{
return min(a,b);
}
#else
{
#if (BLEND_MODE_DIVIDE)
{
return b/a;
}
#else
{
#if (BLEND_MODE_AVERAGE)
{
return (a+b)*0.5;
}
#else
{
#if (BLEND_MODE_SUBTRACT)
{
return max((a+b)-vec3(1.0),vec3(0.0));
}
#else
{
#if (BLEND_MODE_DIFFERENCE)
{
return abs(a-b);
}
#else
{
#if (BLEND_MODE_NEGATION)
{
return vec3(1.0)-abs((vec3(1.0)-a)-b);
}
#else
{
#if (BLEND_MODE_EXCLUSION)
{
return (a+b)-((a*2.0)*b);
}
#else
{
#if (BLEND_MODE_OVERLAY)
{
float l9_0;
if (a.x<0.5)
{
l9_0=(2.0*a.x)*b.x;
}
else
{
l9_0=1.0-((2.0*(1.0-a.x))*(1.0-b.x));
}
float l9_1;
if (a.y<0.5)
{
l9_1=(2.0*a.y)*b.y;
}
else
{
l9_1=1.0-((2.0*(1.0-a.y))*(1.0-b.y));
}
float l9_2;
if (a.z<0.5)
{
l9_2=(2.0*a.z)*b.z;
}
else
{
l9_2=1.0-((2.0*(1.0-a.z))*(1.0-b.z));
}
return vec3(l9_0,l9_1,l9_2);
}
#else
{
#if (BLEND_MODE_SOFT_LIGHT)
{
return (((vec3(1.0)-(b*2.0))*a)*a)+((a*2.0)*b);
}
#else
{
#if (BLEND_MODE_HARD_LIGHT)
{
float l9_3;
if (b.x<0.5)
{
l9_3=(2.0*b.x)*a.x;
}
else
{
l9_3=1.0-((2.0*(1.0-b.x))*(1.0-a.x));
}
float l9_4;
if (b.y<0.5)
{
l9_4=(2.0*b.y)*a.y;
}
else
{
l9_4=1.0-((2.0*(1.0-b.y))*(1.0-a.y));
}
float l9_5;
if (b.z<0.5)
{
l9_5=(2.0*b.z)*a.z;
}
else
{
l9_5=1.0-((2.0*(1.0-b.z))*(1.0-a.z));
}
return vec3(l9_3,l9_4,l9_5);
}
#else
{
#if (BLEND_MODE_COLOR_DODGE)
{
float l9_6;
if (b.x==1.0)
{
l9_6=b.x;
}
else
{
l9_6=min(a.x/(1.0-b.x),1.0);
}
float l9_7;
if (b.y==1.0)
{
l9_7=b.y;
}
else
{
l9_7=min(a.y/(1.0-b.y),1.0);
}
float l9_8;
if (b.z==1.0)
{
l9_8=b.z;
}
else
{
l9_8=min(a.z/(1.0-b.z),1.0);
}
return vec3(l9_6,l9_7,l9_8);
}
#else
{
#if (BLEND_MODE_COLOR_BURN)
{
float l9_9;
if (b.x==0.0)
{
l9_9=b.x;
}
else
{
l9_9=max(1.0-((1.0-a.x)/b.x),0.0);
}
float l9_10;
if (b.y==0.0)
{
l9_10=b.y;
}
else
{
l9_10=max(1.0-((1.0-a.y)/b.y),0.0);
}
float l9_11;
if (b.z==0.0)
{
l9_11=b.z;
}
else
{
l9_11=max(1.0-((1.0-a.z)/b.z),0.0);
}
return vec3(l9_9,l9_10,l9_11);
}
#else
{
#if (BLEND_MODE_LINEAR_LIGHT)
{
float l9_12;
if (b.x<0.5)
{
l9_12=max((a.x+(2.0*b.x))-1.0,0.0);
}
else
{
l9_12=min(a.x+(2.0*(b.x-0.5)),1.0);
}
float l9_13;
if (b.y<0.5)
{
l9_13=max((a.y+(2.0*b.y))-1.0,0.0);
}
else
{
l9_13=min(a.y+(2.0*(b.y-0.5)),1.0);
}
float l9_14;
if (b.z<0.5)
{
l9_14=max((a.z+(2.0*b.z))-1.0,0.0);
}
else
{
l9_14=min(a.z+(2.0*(b.z-0.5)),1.0);
}
return vec3(l9_12,l9_13,l9_14);
}
#else
{
#if (BLEND_MODE_VIVID_LIGHT)
{
float l9_15;
if (b.x<0.5)
{
float l9_16;
if ((2.0*b.x)==0.0)
{
l9_16=2.0*b.x;
}
else
{
l9_16=max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_15=l9_16;
}
else
{
float l9_17;
if ((2.0*(b.x-0.5))==1.0)
{
l9_17=2.0*(b.x-0.5);
}
else
{
l9_17=min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_15=l9_17;
}
float l9_18;
if (b.y<0.5)
{
float l9_19;
if ((2.0*b.y)==0.0)
{
l9_19=2.0*b.y;
}
else
{
l9_19=max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_18=l9_19;
}
else
{
float l9_20;
if ((2.0*(b.y-0.5))==1.0)
{
l9_20=2.0*(b.y-0.5);
}
else
{
l9_20=min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_18=l9_20;
}
float l9_21;
if (b.z<0.5)
{
float l9_22;
if ((2.0*b.z)==0.0)
{
l9_22=2.0*b.z;
}
else
{
l9_22=max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_21=l9_22;
}
else
{
float l9_23;
if ((2.0*(b.z-0.5))==1.0)
{
l9_23=2.0*(b.z-0.5);
}
else
{
l9_23=min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_21=l9_23;
}
return vec3(l9_15,l9_18,l9_21);
}
#else
{
#if (BLEND_MODE_PIN_LIGHT)
{
float l9_24;
if (b.x<0.5)
{
l9_24=min(a.x,2.0*b.x);
}
else
{
l9_24=max(a.x,2.0*(b.x-0.5));
}
float l9_25;
if (b.y<0.5)
{
l9_25=min(a.y,2.0*b.y);
}
else
{
l9_25=max(a.y,2.0*(b.y-0.5));
}
float l9_26;
if (b.z<0.5)
{
l9_26=min(a.z,2.0*b.z);
}
else
{
l9_26=max(a.z,2.0*(b.z-0.5));
}
return vec3(l9_24,l9_25,l9_26);
}
#else
{
#if (BLEND_MODE_HARD_MIX)
{
float l9_27;
if (b.x<0.5)
{
float l9_28;
if ((2.0*b.x)==0.0)
{
l9_28=2.0*b.x;
}
else
{
l9_28=max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_27=l9_28;
}
else
{
float l9_29;
if ((2.0*(b.x-0.5))==1.0)
{
l9_29=2.0*(b.x-0.5);
}
else
{
l9_29=min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_27=l9_29;
}
bool l9_30=l9_27<0.5;
float l9_31;
if (b.y<0.5)
{
float l9_32;
if ((2.0*b.y)==0.0)
{
l9_32=2.0*b.y;
}
else
{
l9_32=max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_31=l9_32;
}
else
{
float l9_33;
if ((2.0*(b.y-0.5))==1.0)
{
l9_33=2.0*(b.y-0.5);
}
else
{
l9_33=min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_31=l9_33;
}
bool l9_34=l9_31<0.5;
float l9_35;
if (b.z<0.5)
{
float l9_36;
if ((2.0*b.z)==0.0)
{
l9_36=2.0*b.z;
}
else
{
l9_36=max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_35=l9_36;
}
else
{
float l9_37;
if ((2.0*(b.z-0.5))==1.0)
{
l9_37=2.0*(b.z-0.5);
}
else
{
l9_37=min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_35=l9_37;
}
return vec3(l9_30 ? 0.0 : 1.0,l9_34 ? 0.0 : 1.0,(l9_35<0.5) ? 0.0 : 1.0);
}
#else
{
#if (BLEND_MODE_HARD_REFLECT)
{
float l9_38;
if (b.x==1.0)
{
l9_38=b.x;
}
else
{
l9_38=min((a.x*a.x)/(1.0-b.x),1.0);
}
float l9_39;
if (b.y==1.0)
{
l9_39=b.y;
}
else
{
l9_39=min((a.y*a.y)/(1.0-b.y),1.0);
}
float l9_40;
if (b.z==1.0)
{
l9_40=b.z;
}
else
{
l9_40=min((a.z*a.z)/(1.0-b.z),1.0);
}
return vec3(l9_38,l9_39,l9_40);
}
#else
{
#if (BLEND_MODE_HARD_GLOW)
{
float l9_41;
if (a.x==1.0)
{
l9_41=a.x;
}
else
{
l9_41=min((b.x*b.x)/(1.0-a.x),1.0);
}
float l9_42;
if (a.y==1.0)
{
l9_42=a.y;
}
else
{
l9_42=min((b.y*b.y)/(1.0-a.y),1.0);
}
float l9_43;
if (a.z==1.0)
{
l9_43=a.z;
}
else
{
l9_43=min((b.z*b.z)/(1.0-a.z),1.0);
}
return vec3(l9_41,l9_42,l9_43);
}
#else
{
#if (BLEND_MODE_HARD_PHOENIX)
{
return (min(a,b)-max(a,b))+vec3(1.0);
}
#else
{
#if (BLEND_MODE_HUE)
{
return HSLToRGB(vec3(RGBToHSL(b).x,RGBToHSL(a).yz));
}
#else
{
#if (BLEND_MODE_SATURATION)
{
vec3 l9_44=RGBToHSL(a);
return HSLToRGB(vec3(l9_44.x,RGBToHSL(b).y,l9_44.z));
}
#else
{
#if (BLEND_MODE_COLOR)
{
return HSLToRGB(vec3(RGBToHSL(b).xy,RGBToHSL(a).z));
}
#else
{
#if (BLEND_MODE_LUMINOSITY)
{
return HSLToRGB(vec3(RGBToHSL(a).xy,RGBToHSL(b).z));
}
#else
{
vec3 l9_45=a;
vec3 l9_46=b;
float l9_47=((0.29899999*l9_45.x)+(0.58700001*l9_45.y))+(0.114*l9_45.z);
float l9_48=pow(l9_47,1.0/correctedIntensity);
vec4 l9_49;
#if (intensityTextureLayout==2)
{
bool l9_50=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_intensityTexture)!=0));
float l9_51=l9_48;
sc_SoftwareWrapEarly(l9_51,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).x);
float l9_52=l9_51;
float l9_53=0.5;
sc_SoftwareWrapEarly(l9_53,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).y);
float l9_54=l9_53;
vec2 l9_55;
float l9_56;
#if (SC_USE_UV_MIN_MAX_intensityTexture)
{
bool l9_57;
#if (SC_USE_CLAMP_TO_BORDER_intensityTexture)
{
l9_57=ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).x==3;
}
#else
{
l9_57=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0);
}
#endif
float l9_58=l9_52;
float l9_59=1.0;
sc_ClampUV(l9_58,intensityTextureUvMinMax.x,intensityTextureUvMinMax.z,l9_57,l9_59);
float l9_60=l9_58;
float l9_61=l9_59;
bool l9_62;
#if (SC_USE_CLAMP_TO_BORDER_intensityTexture)
{
l9_62=ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).y==3;
}
#else
{
l9_62=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0);
}
#endif
float l9_63=l9_54;
float l9_64=l9_61;
sc_ClampUV(l9_63,intensityTextureUvMinMax.y,intensityTextureUvMinMax.w,l9_62,l9_64);
l9_56=l9_64;
l9_55=vec2(l9_60,l9_63);
}
#else
{
l9_56=1.0;
l9_55=vec2(l9_52,l9_54);
}
#endif
vec2 l9_65=sc_TransformUV(l9_55,(int(SC_USE_UV_TRANSFORM_intensityTexture)!=0),intensityTextureTransform);
float l9_66=l9_65.x;
float l9_67=l9_56;
sc_SoftwareWrapLate(l9_66,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).x,l9_50,l9_67);
float l9_68=l9_65.y;
float l9_69=l9_67;
sc_SoftwareWrapLate(l9_68,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).y,l9_50,l9_69);
float l9_70=l9_69;
vec3 l9_71=sc_SamplingCoordsViewToGlobal(vec2(l9_66,l9_68),intensityTextureLayout,intensityTextureGetStereoViewIndex());
vec4 l9_72=texture(intensityTextureArrSC,l9_71,0.0);
vec4 l9_73;
#if (SC_USE_CLAMP_TO_BORDER_intensityTexture)
{
l9_73=mix(intensityTextureBorderColor,l9_72,vec4(l9_70));
}
#else
{
l9_73=l9_72;
}
#endif
l9_49=l9_73;
}
#else
{
bool l9_74=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_intensityTexture)!=0));
float l9_75=l9_48;
sc_SoftwareWrapEarly(l9_75,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).x);
float l9_76=l9_75;
float l9_77=0.5;
sc_SoftwareWrapEarly(l9_77,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).y);
float l9_78=l9_77;
vec2 l9_79;
float l9_80;
#if (SC_USE_UV_MIN_MAX_intensityTexture)
{
bool l9_81;
#if (SC_USE_CLAMP_TO_BORDER_intensityTexture)
{
l9_81=ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).x==3;
}
#else
{
l9_81=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0);
}
#endif
float l9_82=l9_76;
float l9_83=1.0;
sc_ClampUV(l9_82,intensityTextureUvMinMax.x,intensityTextureUvMinMax.z,l9_81,l9_83);
float l9_84=l9_82;
float l9_85=l9_83;
bool l9_86;
#if (SC_USE_CLAMP_TO_BORDER_intensityTexture)
{
l9_86=ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).y==3;
}
#else
{
l9_86=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0);
}
#endif
float l9_87=l9_78;
float l9_88=l9_85;
sc_ClampUV(l9_87,intensityTextureUvMinMax.y,intensityTextureUvMinMax.w,l9_86,l9_88);
l9_80=l9_88;
l9_79=vec2(l9_84,l9_87);
}
#else
{
l9_80=1.0;
l9_79=vec2(l9_76,l9_78);
}
#endif
vec2 l9_89=sc_TransformUV(l9_79,(int(SC_USE_UV_TRANSFORM_intensityTexture)!=0),intensityTextureTransform);
float l9_90=l9_89.x;
float l9_91=l9_80;
sc_SoftwareWrapLate(l9_90,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).x,l9_74,l9_91);
float l9_92=l9_89.y;
float l9_93=l9_91;
sc_SoftwareWrapLate(l9_92,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).y,l9_74,l9_93);
float l9_94=l9_93;
vec3 l9_95=sc_SamplingCoordsViewToGlobal(vec2(l9_90,l9_92),intensityTextureLayout,intensityTextureGetStereoViewIndex());
vec4 l9_96=texture(intensityTexture,l9_95.xy,0.0);
vec4 l9_97;
#if (SC_USE_CLAMP_TO_BORDER_intensityTexture)
{
l9_97=mix(intensityTextureBorderColor,l9_96,vec4(l9_94));
}
#else
{
l9_97=l9_96;
}
#endif
l9_49=l9_97;
}
#endif
float l9_98=((((l9_49.x*256.0)+l9_49.y)+(l9_49.z/256.0))/257.00391)*16.0;
float l9_99;
#if (BLEND_MODE_FORGRAY)
{
l9_99=max(l9_98,1.0);
}
#else
{
l9_99=l9_98;
}
#endif
float l9_100;
#if (BLEND_MODE_NOTBRIGHT)
{
l9_100=min(l9_99,1.0);
}
#else
{
l9_100=l9_99;
}
#endif
return transformColor(l9_47,l9_45,l9_46,1.0,l9_100);
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
vec4 sc_OutputMotionVectorIfNeeded(vec4 finalColor)
{
#if (sc_MotionVectorsPass)
{
float l9_0=floor(((varPosAndMotion.w*5.0)+0.5)*65535.0);
float l9_1=floor(l9_0*0.00390625);
float l9_2=floor(((varNormalAndMotion.w*5.0)+0.5)*65535.0);
float l9_3=floor(l9_2*0.00390625);
return vec4(l9_1/255.0,(l9_0-(l9_1*256.0))/255.0,l9_3/255.0,(l9_2-(l9_3*256.0))/255.0);
}
#else
{
return finalColor;
}
#endif
}
float getFrontLayerZTestEpsilon()
{
#if (sc_SkinBonesCount>0)
{
return 5e-07;
}
#else
{
return 5.0000001e-08;
}
#endif
}
void unpackValues(float channel,int passIndex,inout int values[8])
{
#if (sc_OITCompositingPass)
{
channel=floor((channel*255.0)+0.5);
int l9_0=((passIndex+1)*4)-1;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_0>=(passIndex*4))
{
values[l9_0]=(values[l9_0]*4)+int(floor(mod(channel,4.0)));
channel=floor(channel/4.0);
l9_0--;
continue;
}
else
{
break;
}
}
}
#endif
}
float getDepthOrderingEpsilon()
{
#if (sc_SkinBonesCount>0)
{
return 0.001;
}
#else
{
return 0.0;
}
#endif
}
int encodeDepth(float depth,vec2 depthBounds)
{
float l9_0=(1.0-depthBounds.x)*1000.0;
return int(clamp((depth-l9_0)/((depthBounds.y*1000.0)-l9_0),0.0,1.0)*65535.0);
}
float viewSpaceDepth()
{
#if (UseViewSpaceDepthVariant&&((sc_OITDepthGatherPass||sc_OITCompositingPass)||sc_OITDepthBoundsPass))
{
return varViewSpaceDepth;
}
#else
{
return sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][3].z/(sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][2].z+((gl_FragCoord.z*2.0)-1.0));
}
#endif
}
float packValue(inout int value)
{
#if (sc_OITDepthGatherPass)
{
int l9_0=value;
value/=4;
return floor(floor(mod(float(l9_0),4.0))*64.0)/255.0;
}
#else
{
return 0.0;
}
#endif
}
void sc_writeFragData1(vec4 col)
{
#if sc_FragDataCount>=2
sc_FragData1=col;
#endif
}
void sc_writeFragData2(vec4 col)
{
#if sc_FragDataCount>=3
sc_FragData2=col;
#endif
}
void main()
{
#if (sc_DepthOnly)
{
return;
}
#endif
#if ((sc_StereoRenderingMode==1)&&(sc_StereoRendering_IsClipDistanceEnabled==0))
{
if (varClipDistance<0.0)
{
discard;
}
}
#endif
bool l9_0=sc_RayTracingCasterConfiguration.x!=0u;
vec3 l9_1;
vec3 l9_2;
vec3 l9_3;
vec2 l9_4;
vec3 l9_5;
if (l9_0)
{
sc_RayTracingHitPayload l9_6=sc_RayTracingEvaluateHitPayload(ivec2(gl_FragCoord.xy));
vec3 l9_7=l9_6.normalWS;
vec4 l9_8=l9_6.tangentWS;
if (l9_6.id.x!=(sc_RayTracingCasterConfiguration.y&65535u))
{
return;
}
vec3 l9_9=l9_8.xyz;
l9_5=l9_6.viewDirWS;
l9_4=l9_6.uv0;
l9_3=l9_7;
l9_2=cross(l9_7,l9_9)*l9_8.w;
l9_1=l9_9;
}
else
{
vec3 l9_10=normalize(varTangent.xyz);
vec3 l9_11=normalize(varNormalAndMotion.xyz);
l9_5=normalize(sc_Camera.position-varPosAndMotion.xyz);
l9_4=varTex01.xy;
l9_3=l9_11;
l9_2=cross(l9_11,l9_10)*varTangent.w;
l9_1=l9_10;
}
mat3 l9_12=mat3(l9_1,l9_2,l9_3);
vec3 l9_13=l9_12*Port_Import_N111;
float l9_14=dot(l9_13,l9_13);
float l9_15;
if (l9_14>0.0)
{
l9_15=1.0/sqrt(l9_14);
}
else
{
l9_15=0.0;
}
vec3 l9_16=l9_13*l9_15;
vec3 l9_17=((sc_ViewMatrixArray[sc_GetStereoViewIndex()]*vec4(l9_16,0.0)).xyz*vec3(Port_Input1_N115))+vec3(Port_Input2_N115);
vec4 l9_18;
#if (capsule_btn_refl_tex_2Layout==2)
{
bool l9_19=(int(SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_2)!=0)&&(!(int(SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_2)!=0));
float l9_20=l9_17.x;
sc_SoftwareWrapEarly(l9_20,ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_2,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_2).x);
float l9_21=l9_20;
float l9_22=l9_17.y;
sc_SoftwareWrapEarly(l9_22,ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_2,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_2).y);
float l9_23=l9_22;
vec2 l9_24;
float l9_25;
#if (SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_2)
{
bool l9_26;
#if (SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_2)
{
l9_26=ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_2,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_2).x==3;
}
#else
{
l9_26=(int(SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_2)!=0);
}
#endif
float l9_27=l9_21;
float l9_28=1.0;
sc_ClampUV(l9_27,capsule_btn_refl_tex_2UvMinMax.x,capsule_btn_refl_tex_2UvMinMax.z,l9_26,l9_28);
float l9_29=l9_27;
float l9_30=l9_28;
bool l9_31;
#if (SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_2)
{
l9_31=ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_2,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_2).y==3;
}
#else
{
l9_31=(int(SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_2)!=0);
}
#endif
float l9_32=l9_23;
float l9_33=l9_30;
sc_ClampUV(l9_32,capsule_btn_refl_tex_2UvMinMax.y,capsule_btn_refl_tex_2UvMinMax.w,l9_31,l9_33);
l9_25=l9_33;
l9_24=vec2(l9_29,l9_32);
}
#else
{
l9_25=1.0;
l9_24=vec2(l9_21,l9_23);
}
#endif
vec2 l9_34=sc_TransformUV(l9_24,(int(SC_USE_UV_TRANSFORM_capsule_btn_refl_tex_2)!=0),capsule_btn_refl_tex_2Transform);
float l9_35=l9_34.x;
float l9_36=l9_25;
sc_SoftwareWrapLate(l9_35,ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_2,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_2).x,l9_19,l9_36);
float l9_37=l9_34.y;
float l9_38=l9_36;
sc_SoftwareWrapLate(l9_37,ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_2,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_2).y,l9_19,l9_38);
float l9_39=l9_38;
vec3 l9_40=sc_SamplingCoordsViewToGlobal(vec2(l9_35,l9_37),capsule_btn_refl_tex_2Layout,capsule_btn_refl_tex_2GetStereoViewIndex());
vec4 l9_41=texture(capsule_btn_refl_tex_2ArrSC,l9_40,0.0);
vec4 l9_42;
#if (SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_2)
{
l9_42=mix(capsule_btn_refl_tex_2BorderColor,l9_41,vec4(l9_39));
}
#else
{
l9_42=l9_41;
}
#endif
l9_18=l9_42;
}
#else
{
bool l9_43=(int(SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_2)!=0)&&(!(int(SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_2)!=0));
float l9_44=l9_17.x;
sc_SoftwareWrapEarly(l9_44,ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_2,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_2).x);
float l9_45=l9_44;
float l9_46=l9_17.y;
sc_SoftwareWrapEarly(l9_46,ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_2,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_2).y);
float l9_47=l9_46;
vec2 l9_48;
float l9_49;
#if (SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_2)
{
bool l9_50;
#if (SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_2)
{
l9_50=ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_2,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_2).x==3;
}
#else
{
l9_50=(int(SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_2)!=0);
}
#endif
float l9_51=l9_45;
float l9_52=1.0;
sc_ClampUV(l9_51,capsule_btn_refl_tex_2UvMinMax.x,capsule_btn_refl_tex_2UvMinMax.z,l9_50,l9_52);
float l9_53=l9_51;
float l9_54=l9_52;
bool l9_55;
#if (SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_2)
{
l9_55=ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_2,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_2).y==3;
}
#else
{
l9_55=(int(SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_2)!=0);
}
#endif
float l9_56=l9_47;
float l9_57=l9_54;
sc_ClampUV(l9_56,capsule_btn_refl_tex_2UvMinMax.y,capsule_btn_refl_tex_2UvMinMax.w,l9_55,l9_57);
l9_49=l9_57;
l9_48=vec2(l9_53,l9_56);
}
#else
{
l9_49=1.0;
l9_48=vec2(l9_45,l9_47);
}
#endif
vec2 l9_58=sc_TransformUV(l9_48,(int(SC_USE_UV_TRANSFORM_capsule_btn_refl_tex_2)!=0),capsule_btn_refl_tex_2Transform);
float l9_59=l9_58.x;
float l9_60=l9_49;
sc_SoftwareWrapLate(l9_59,ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_2,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_2).x,l9_43,l9_60);
float l9_61=l9_58.y;
float l9_62=l9_60;
sc_SoftwareWrapLate(l9_61,ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_2,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_2).y,l9_43,l9_62);
float l9_63=l9_62;
vec3 l9_64=sc_SamplingCoordsViewToGlobal(vec2(l9_59,l9_61),capsule_btn_refl_tex_2Layout,capsule_btn_refl_tex_2GetStereoViewIndex());
vec4 l9_65=texture(capsule_btn_refl_tex_2,l9_64.xy,0.0);
vec4 l9_66;
#if (SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_2)
{
l9_66=mix(capsule_btn_refl_tex_2BorderColor,l9_65,vec4(l9_63));
}
#else
{
l9_66=l9_65;
}
#endif
l9_18=l9_66;
}
#endif
vec4 l9_67=vec4(Port_Import_N101)*l9_18;
vec4 l9_68;
#if (capsule_btn_refl_tex_3Layout==2)
{
bool l9_69=(int(SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_3)!=0)&&(!(int(SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_3)!=0));
float l9_70=l9_4.x;
sc_SoftwareWrapEarly(l9_70,ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_3,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_3).x);
float l9_71=l9_70;
float l9_72=l9_4.y;
sc_SoftwareWrapEarly(l9_72,ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_3,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_3).y);
float l9_73=l9_72;
vec2 l9_74;
float l9_75;
#if (SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_3)
{
bool l9_76;
#if (SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_3)
{
l9_76=ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_3,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_3).x==3;
}
#else
{
l9_76=(int(SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_3)!=0);
}
#endif
float l9_77=l9_71;
float l9_78=1.0;
sc_ClampUV(l9_77,capsule_btn_refl_tex_3UvMinMax.x,capsule_btn_refl_tex_3UvMinMax.z,l9_76,l9_78);
float l9_79=l9_77;
float l9_80=l9_78;
bool l9_81;
#if (SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_3)
{
l9_81=ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_3,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_3).y==3;
}
#else
{
l9_81=(int(SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_3)!=0);
}
#endif
float l9_82=l9_73;
float l9_83=l9_80;
sc_ClampUV(l9_82,capsule_btn_refl_tex_3UvMinMax.y,capsule_btn_refl_tex_3UvMinMax.w,l9_81,l9_83);
l9_75=l9_83;
l9_74=vec2(l9_79,l9_82);
}
#else
{
l9_75=1.0;
l9_74=vec2(l9_71,l9_73);
}
#endif
vec2 l9_84=sc_TransformUV(l9_74,(int(SC_USE_UV_TRANSFORM_capsule_btn_refl_tex_3)!=0),capsule_btn_refl_tex_3Transform);
float l9_85=l9_84.x;
float l9_86=l9_75;
sc_SoftwareWrapLate(l9_85,ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_3,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_3).x,l9_69,l9_86);
float l9_87=l9_84.y;
float l9_88=l9_86;
sc_SoftwareWrapLate(l9_87,ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_3,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_3).y,l9_69,l9_88);
float l9_89=l9_88;
vec3 l9_90=sc_SamplingCoordsViewToGlobal(vec2(l9_85,l9_87),capsule_btn_refl_tex_3Layout,capsule_btn_refl_tex_3GetStereoViewIndex());
vec4 l9_91=texture(capsule_btn_refl_tex_3ArrSC,l9_90,0.0);
vec4 l9_92;
#if (SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_3)
{
l9_92=mix(capsule_btn_refl_tex_3BorderColor,l9_91,vec4(l9_89));
}
#else
{
l9_92=l9_91;
}
#endif
l9_68=l9_92;
}
#else
{
bool l9_93=(int(SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_3)!=0)&&(!(int(SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_3)!=0));
float l9_94=l9_4.x;
sc_SoftwareWrapEarly(l9_94,ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_3,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_3).x);
float l9_95=l9_94;
float l9_96=l9_4.y;
sc_SoftwareWrapEarly(l9_96,ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_3,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_3).y);
float l9_97=l9_96;
vec2 l9_98;
float l9_99;
#if (SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_3)
{
bool l9_100;
#if (SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_3)
{
l9_100=ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_3,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_3).x==3;
}
#else
{
l9_100=(int(SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_3)!=0);
}
#endif
float l9_101=l9_95;
float l9_102=1.0;
sc_ClampUV(l9_101,capsule_btn_refl_tex_3UvMinMax.x,capsule_btn_refl_tex_3UvMinMax.z,l9_100,l9_102);
float l9_103=l9_101;
float l9_104=l9_102;
bool l9_105;
#if (SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_3)
{
l9_105=ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_3,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_3).y==3;
}
#else
{
l9_105=(int(SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_3)!=0);
}
#endif
float l9_106=l9_97;
float l9_107=l9_104;
sc_ClampUV(l9_106,capsule_btn_refl_tex_3UvMinMax.y,capsule_btn_refl_tex_3UvMinMax.w,l9_105,l9_107);
l9_99=l9_107;
l9_98=vec2(l9_103,l9_106);
}
#else
{
l9_99=1.0;
l9_98=vec2(l9_95,l9_97);
}
#endif
vec2 l9_108=sc_TransformUV(l9_98,(int(SC_USE_UV_TRANSFORM_capsule_btn_refl_tex_3)!=0),capsule_btn_refl_tex_3Transform);
float l9_109=l9_108.x;
float l9_110=l9_99;
sc_SoftwareWrapLate(l9_109,ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_3,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_3).x,l9_93,l9_110);
float l9_111=l9_108.y;
float l9_112=l9_110;
sc_SoftwareWrapLate(l9_111,ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_3,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_3).y,l9_93,l9_112);
float l9_113=l9_112;
vec3 l9_114=sc_SamplingCoordsViewToGlobal(vec2(l9_109,l9_111),capsule_btn_refl_tex_3Layout,capsule_btn_refl_tex_3GetStereoViewIndex());
vec4 l9_115=texture(capsule_btn_refl_tex_3,l9_114.xy,0.0);
vec4 l9_116;
#if (SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_3)
{
l9_116=mix(capsule_btn_refl_tex_3BorderColor,l9_115,vec4(l9_113));
}
#else
{
l9_116=l9_115;
}
#endif
l9_68=l9_116;
}
#endif
vec4 l9_117=l9_67*l9_68;
vec3 l9_118=l9_12*Port_Import_N041;
float l9_119=dot(l9_118,l9_118);
float l9_120;
if (l9_119>0.0)
{
l9_120=1.0/sqrt(l9_119);
}
else
{
l9_120=0.0;
}
vec3 l9_121=l9_118*l9_120;
vec3 l9_122=((sc_ViewMatrixArray[sc_GetStereoViewIndex()]*vec4(l9_121,0.0)).xyz*vec3(Port_Input1_N045))+vec3(Port_Input2_N045);
vec4 l9_123;
#if (capsule_btn_refl_tex_1Layout==2)
{
bool l9_124=(int(SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_1)!=0)&&(!(int(SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_1)!=0));
float l9_125=l9_122.x;
sc_SoftwareWrapEarly(l9_125,ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_1,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_1).x);
float l9_126=l9_125;
float l9_127=l9_122.y;
sc_SoftwareWrapEarly(l9_127,ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_1,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_1).y);
float l9_128=l9_127;
vec2 l9_129;
float l9_130;
#if (SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_1)
{
bool l9_131;
#if (SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_1)
{
l9_131=ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_1,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_1).x==3;
}
#else
{
l9_131=(int(SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_1)!=0);
}
#endif
float l9_132=l9_126;
float l9_133=1.0;
sc_ClampUV(l9_132,capsule_btn_refl_tex_1UvMinMax.x,capsule_btn_refl_tex_1UvMinMax.z,l9_131,l9_133);
float l9_134=l9_132;
float l9_135=l9_133;
bool l9_136;
#if (SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_1)
{
l9_136=ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_1,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_1).y==3;
}
#else
{
l9_136=(int(SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_1)!=0);
}
#endif
float l9_137=l9_128;
float l9_138=l9_135;
sc_ClampUV(l9_137,capsule_btn_refl_tex_1UvMinMax.y,capsule_btn_refl_tex_1UvMinMax.w,l9_136,l9_138);
l9_130=l9_138;
l9_129=vec2(l9_134,l9_137);
}
#else
{
l9_130=1.0;
l9_129=vec2(l9_126,l9_128);
}
#endif
vec2 l9_139=sc_TransformUV(l9_129,(int(SC_USE_UV_TRANSFORM_capsule_btn_refl_tex_1)!=0),capsule_btn_refl_tex_1Transform);
float l9_140=l9_139.x;
float l9_141=l9_130;
sc_SoftwareWrapLate(l9_140,ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_1,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_1).x,l9_124,l9_141);
float l9_142=l9_139.y;
float l9_143=l9_141;
sc_SoftwareWrapLate(l9_142,ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_1,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_1).y,l9_124,l9_143);
float l9_144=l9_143;
vec3 l9_145=sc_SamplingCoordsViewToGlobal(vec2(l9_140,l9_142),capsule_btn_refl_tex_1Layout,capsule_btn_refl_tex_1GetStereoViewIndex());
vec4 l9_146=texture(capsule_btn_refl_tex_1ArrSC,l9_145,0.0);
vec4 l9_147;
#if (SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_1)
{
l9_147=mix(capsule_btn_refl_tex_1BorderColor,l9_146,vec4(l9_144));
}
#else
{
l9_147=l9_146;
}
#endif
l9_123=l9_147;
}
#else
{
bool l9_148=(int(SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_1)!=0)&&(!(int(SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_1)!=0));
float l9_149=l9_122.x;
sc_SoftwareWrapEarly(l9_149,ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_1,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_1).x);
float l9_150=l9_149;
float l9_151=l9_122.y;
sc_SoftwareWrapEarly(l9_151,ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_1,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_1).y);
float l9_152=l9_151;
vec2 l9_153;
float l9_154;
#if (SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_1)
{
bool l9_155;
#if (SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_1)
{
l9_155=ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_1,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_1).x==3;
}
#else
{
l9_155=(int(SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_1)!=0);
}
#endif
float l9_156=l9_150;
float l9_157=1.0;
sc_ClampUV(l9_156,capsule_btn_refl_tex_1UvMinMax.x,capsule_btn_refl_tex_1UvMinMax.z,l9_155,l9_157);
float l9_158=l9_156;
float l9_159=l9_157;
bool l9_160;
#if (SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_1)
{
l9_160=ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_1,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_1).y==3;
}
#else
{
l9_160=(int(SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_1)!=0);
}
#endif
float l9_161=l9_152;
float l9_162=l9_159;
sc_ClampUV(l9_161,capsule_btn_refl_tex_1UvMinMax.y,capsule_btn_refl_tex_1UvMinMax.w,l9_160,l9_162);
l9_154=l9_162;
l9_153=vec2(l9_158,l9_161);
}
#else
{
l9_154=1.0;
l9_153=vec2(l9_150,l9_152);
}
#endif
vec2 l9_163=sc_TransformUV(l9_153,(int(SC_USE_UV_TRANSFORM_capsule_btn_refl_tex_1)!=0),capsule_btn_refl_tex_1Transform);
float l9_164=l9_163.x;
float l9_165=l9_154;
sc_SoftwareWrapLate(l9_164,ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_1,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_1).x,l9_148,l9_165);
float l9_166=l9_163.y;
float l9_167=l9_165;
sc_SoftwareWrapLate(l9_166,ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_1,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_1).y,l9_148,l9_167);
float l9_168=l9_167;
vec3 l9_169=sc_SamplingCoordsViewToGlobal(vec2(l9_164,l9_166),capsule_btn_refl_tex_1Layout,capsule_btn_refl_tex_1GetStereoViewIndex());
vec4 l9_170=texture(capsule_btn_refl_tex_1,l9_169.xy,0.0);
vec4 l9_171;
#if (SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_1)
{
l9_171=mix(capsule_btn_refl_tex_1BorderColor,l9_170,vec4(l9_168));
}
#else
{
l9_171=l9_170;
}
#endif
l9_123=l9_171;
}
#endif
vec4 l9_172=vec4(Port_Import_N027)*l9_123;
float l9_173=clamp(l9_172.x,0.0,1.0);
vec4 l9_174;
if (l9_173<Port_Position1_N016)
{
l9_174=mix(Port_Value0_N016,Port_Value1_N016,vec4(clamp(l9_173/Port_Position1_N016,0.0,1.0)));
}
else
{
vec4 l9_175;
if (l9_173<Port_Position2_N016)
{
l9_175=mix(Port_Value1_N016,Port_Value2_N016,vec4(clamp((l9_173-Port_Position1_N016)/(Port_Position2_N016-Port_Position1_N016),0.0,1.0)));
}
else
{
vec4 l9_176;
if (l9_173<Port_Position3_N016)
{
l9_176=mix(Port_Value2_N016,Port_Value3_N016,vec4(clamp((l9_173-Port_Position2_N016)/(Port_Position3_N016-Port_Position2_N016),0.0,1.0)));
}
else
{
l9_176=mix(Port_Value3_N016,Port_Value4_N016,vec4(clamp((l9_173-Port_Position3_N016)/(1.0-Port_Position3_N016),0.0,1.0)));
}
l9_175=l9_176;
}
l9_174=l9_175;
}
vec3 l9_177=-l9_5;
vec2 l9_178=l9_4-Port_Center_N019;
vec2 l9_179=(l9_178*Port_Scale_N019)+Port_Center_N019;
vec4 l9_180;
#if (capsule_btn_refl_tex_1Layout==2)
{
bool l9_181=(int(SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_1)!=0)&&(!(int(SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_1)!=0));
float l9_182=l9_179.x;
sc_SoftwareWrapEarly(l9_182,ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_1,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_1).x);
float l9_183=l9_182;
float l9_184=l9_179.y;
sc_SoftwareWrapEarly(l9_184,ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_1,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_1).y);
float l9_185=l9_184;
vec2 l9_186;
float l9_187;
#if (SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_1)
{
bool l9_188;
#if (SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_1)
{
l9_188=ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_1,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_1).x==3;
}
#else
{
l9_188=(int(SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_1)!=0);
}
#endif
float l9_189=l9_183;
float l9_190=1.0;
sc_ClampUV(l9_189,capsule_btn_refl_tex_1UvMinMax.x,capsule_btn_refl_tex_1UvMinMax.z,l9_188,l9_190);
float l9_191=l9_189;
float l9_192=l9_190;
bool l9_193;
#if (SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_1)
{
l9_193=ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_1,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_1).y==3;
}
#else
{
l9_193=(int(SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_1)!=0);
}
#endif
float l9_194=l9_185;
float l9_195=l9_192;
sc_ClampUV(l9_194,capsule_btn_refl_tex_1UvMinMax.y,capsule_btn_refl_tex_1UvMinMax.w,l9_193,l9_195);
l9_187=l9_195;
l9_186=vec2(l9_191,l9_194);
}
#else
{
l9_187=1.0;
l9_186=vec2(l9_183,l9_185);
}
#endif
vec2 l9_196=sc_TransformUV(l9_186,(int(SC_USE_UV_TRANSFORM_capsule_btn_refl_tex_1)!=0),capsule_btn_refl_tex_1Transform);
float l9_197=l9_196.x;
float l9_198=l9_187;
sc_SoftwareWrapLate(l9_197,ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_1,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_1).x,l9_181,l9_198);
float l9_199=l9_196.y;
float l9_200=l9_198;
sc_SoftwareWrapLate(l9_199,ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_1,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_1).y,l9_181,l9_200);
float l9_201=l9_200;
vec3 l9_202=sc_SamplingCoordsViewToGlobal(vec2(l9_197,l9_199),capsule_btn_refl_tex_1Layout,capsule_btn_refl_tex_1GetStereoViewIndex());
vec4 l9_203=texture(capsule_btn_refl_tex_1ArrSC,l9_202,0.0);
vec4 l9_204;
#if (SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_1)
{
l9_204=mix(capsule_btn_refl_tex_1BorderColor,l9_203,vec4(l9_201));
}
#else
{
l9_204=l9_203;
}
#endif
l9_180=l9_204;
}
#else
{
bool l9_205=(int(SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_1)!=0)&&(!(int(SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_1)!=0));
float l9_206=l9_179.x;
sc_SoftwareWrapEarly(l9_206,ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_1,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_1).x);
float l9_207=l9_206;
float l9_208=l9_179.y;
sc_SoftwareWrapEarly(l9_208,ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_1,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_1).y);
float l9_209=l9_208;
vec2 l9_210;
float l9_211;
#if (SC_USE_UV_MIN_MAX_capsule_btn_refl_tex_1)
{
bool l9_212;
#if (SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_1)
{
l9_212=ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_1,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_1).x==3;
}
#else
{
l9_212=(int(SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_1)!=0);
}
#endif
float l9_213=l9_207;
float l9_214=1.0;
sc_ClampUV(l9_213,capsule_btn_refl_tex_1UvMinMax.x,capsule_btn_refl_tex_1UvMinMax.z,l9_212,l9_214);
float l9_215=l9_213;
float l9_216=l9_214;
bool l9_217;
#if (SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_1)
{
l9_217=ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_1,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_1).y==3;
}
#else
{
l9_217=(int(SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_1)!=0);
}
#endif
float l9_218=l9_209;
float l9_219=l9_216;
sc_ClampUV(l9_218,capsule_btn_refl_tex_1UvMinMax.y,capsule_btn_refl_tex_1UvMinMax.w,l9_217,l9_219);
l9_211=l9_219;
l9_210=vec2(l9_215,l9_218);
}
#else
{
l9_211=1.0;
l9_210=vec2(l9_207,l9_209);
}
#endif
vec2 l9_220=sc_TransformUV(l9_210,(int(SC_USE_UV_TRANSFORM_capsule_btn_refl_tex_1)!=0),capsule_btn_refl_tex_1Transform);
float l9_221=l9_220.x;
float l9_222=l9_211;
sc_SoftwareWrapLate(l9_221,ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_1,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_1).x,l9_205,l9_222);
float l9_223=l9_220.y;
float l9_224=l9_222;
sc_SoftwareWrapLate(l9_223,ivec2(SC_SOFTWARE_WRAP_MODE_U_capsule_btn_refl_tex_1,SC_SOFTWARE_WRAP_MODE_V_capsule_btn_refl_tex_1).y,l9_205,l9_224);
float l9_225=l9_224;
vec3 l9_226=sc_SamplingCoordsViewToGlobal(vec2(l9_221,l9_223),capsule_btn_refl_tex_1Layout,capsule_btn_refl_tex_1GetStereoViewIndex());
vec4 l9_227=texture(capsule_btn_refl_tex_1,l9_226.xy,0.0);
vec4 l9_228;
#if (SC_USE_CLAMP_TO_BORDER_capsule_btn_refl_tex_1)
{
l9_228=mix(capsule_btn_refl_tex_1BorderColor,l9_227,vec4(l9_225));
}
#else
{
l9_228=l9_227;
}
#endif
l9_180=l9_228;
}
#endif
vec4 l9_229=smoothstep(Port_Input0_N020,Port_Input1_N020,l9_180);
vec4 l9_230=mix(l9_174,Port_Input1_N050,mix(Port_Input0_N048,vec4(max(pow(1.0-abs(dot(l9_177,l9_12*Port_Normal_N023)),Port_Exponent_N023),0.0)*Port_Intensity_N023),l9_229));
float l9_231=radians(Port_Rotation_N035);
float l9_232=clamp((vec2(dot(vec2(cos(l9_231),sin(l9_231)),l9_179-Port_Center_N035),0.0)+Port_Center_N035).x,0.0,1.0);
float l9_233;
if (l9_232<Port_Position1_N030)
{
l9_233=mix(Port_Value0_N030,Port_Value1_N030,clamp(l9_232/Port_Position1_N030,0.0,1.0));
}
else
{
float l9_234;
if (l9_232<Port_Position2_N030)
{
l9_234=mix(Port_Value1_N030,Port_Value2_N030,clamp((l9_232-Port_Position1_N030)/(Port_Position2_N030-Port_Position1_N030),0.0,1.0));
}
else
{
float l9_235;
if (l9_232<Port_Position3_N030)
{
l9_235=mix(Port_Value2_N030,Port_Value3_N030,clamp((l9_232-Port_Position2_N030)/(Port_Position3_N030-Port_Position2_N030),0.0,1.0));
}
else
{
l9_235=mix(Port_Value3_N030,Port_Value4_N030,clamp((l9_232-Port_Position3_N030)/(1.0-Port_Position3_N030),0.0,1.0));
}
l9_234=l9_235;
}
l9_233=l9_234;
}
vec4 l9_236=vec4(l9_230.x,l9_230.y,l9_230.z,vec4(0.0).w);
l9_236.w=l9_233;
vec4 l9_237=l9_117+l9_236;
float l9_238=l9_237.w;
#if (sc_BlendMode_AlphaTest)
{
if (l9_238<alphaTestThreshold)
{
discard;
}
}
#endif
#if (ENABLE_STIPPLE_PATTERN_TEST)
{
if (l9_238<((mod(dot(floor(mod(gl_FragCoord.xy,vec2(4.0))),vec2(4.0,1.0))*9.0,16.0)+1.0)/17.0))
{
discard;
}
}
#endif
if (l9_0)
{
vec4 l9_239;
#if (sc_RayTracingCasterForceOpaque)
{
vec4 l9_240=l9_237;
l9_240.w=1.0;
l9_239=l9_240;
}
#else
{
l9_239=l9_237;
}
#endif
sc_writeFragData0Internal(max(l9_239,vec4(0.0)),sc_UniformConstants.x,sc_ShaderCacheConstant);
return;
}
vec4 l9_241;
#if (sc_ProjectiveShadowsCaster)
{
float l9_242;
#if (((sc_BlendMode_Normal||sc_BlendMode_AlphaToCoverage)||sc_BlendMode_PremultipliedAlphaHardware)||sc_BlendMode_PremultipliedAlphaAuto)
{
l9_242=l9_238;
}
#else
{
float l9_243;
#if (sc_BlendMode_PremultipliedAlpha)
{
l9_243=clamp(l9_238*2.0,0.0,1.0);
}
#else
{
float l9_244;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_244=clamp(dot(l9_237.xyz,vec3(l9_238)),0.0,1.0);
}
#else
{
float l9_245;
#if (sc_BlendMode_AlphaTest)
{
l9_245=1.0;
}
#else
{
float l9_246;
#if (sc_BlendMode_Multiply)
{
l9_246=(1.0-dot(l9_237.xyz,vec3(0.33333001)))*l9_238;
}
#else
{
float l9_247;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_247=(1.0-clamp(dot(l9_237.xyz,vec3(1.0)),0.0,1.0))*l9_238;
}
#else
{
float l9_248;
#if (sc_BlendMode_ColoredGlass)
{
l9_248=clamp(dot(l9_237.xyz,vec3(1.0)),0.0,1.0)*l9_238;
}
#else
{
float l9_249;
#if (sc_BlendMode_Add)
{
l9_249=clamp(dot(l9_237.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_250;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_250=clamp(dot(l9_237.xyz,vec3(1.0)),0.0,1.0)*l9_238;
}
#else
{
float l9_251;
#if (sc_BlendMode_Screen)
{
l9_251=dot(l9_237.xyz,vec3(0.33333001))*l9_238;
}
#else
{
float l9_252;
#if (sc_BlendMode_Min)
{
l9_252=1.0-clamp(dot(l9_237.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_253;
#if (sc_BlendMode_Max)
{
l9_253=clamp(dot(l9_237.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
l9_253=1.0;
}
#endif
l9_252=l9_253;
}
#endif
l9_251=l9_252;
}
#endif
l9_250=l9_251;
}
#endif
l9_249=l9_250;
}
#endif
l9_248=l9_249;
}
#endif
l9_247=l9_248;
}
#endif
l9_246=l9_247;
}
#endif
l9_245=l9_246;
}
#endif
l9_244=l9_245;
}
#endif
l9_243=l9_244;
}
#endif
l9_242=l9_243;
}
#endif
l9_241=vec4(mix(sc_ShadowColor.xyz,sc_ShadowColor.xyz*l9_237.xyz,vec3(sc_ShadowColor.w)),sc_ShadowDensity*l9_242);
}
#else
{
vec4 l9_254;
#if (sc_RenderAlphaToColor)
{
l9_254=vec4(l9_238);
}
#else
{
vec4 l9_255;
#if (sc_BlendMode_Custom)
{
vec4 l9_256;
#if (sc_FramebufferFetch)
{
l9_256=sc_readFragData0_Platform();
}
#else
{
vec2 l9_257=sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw);
vec4 l9_258;
#if (sc_ScreenTextureLayout==2)
{
l9_258=texture(sc_ScreenTextureArrSC,sc_SamplingCoordsViewToGlobal(l9_257,sc_ScreenTextureLayout,sc_ScreenTextureGetStereoViewIndex()),0.0);
}
#else
{
l9_258=texture(sc_ScreenTexture,sc_SamplingCoordsViewToGlobal(l9_257,sc_ScreenTextureLayout,sc_ScreenTextureGetStereoViewIndex()).xy,0.0);
}
#endif
l9_256=l9_258;
}
#endif
vec3 l9_259=mix(l9_256.xyz,definedBlend(l9_256.xyz,l9_237.xyz).xyz,vec3(l9_238));
vec4 l9_260=vec4(l9_259.x,l9_259.y,l9_259.z,vec4(0.0).w);
l9_260.w=1.0;
l9_255=l9_260;
}
#else
{
vec4 l9_261;
#if (sc_Voxelization)
{
l9_261=vec4(varScreenPos.xyz,1.0);
}
#else
{
vec4 l9_262;
#if (sc_OutputBounds)
{
float l9_263=clamp(abs(gl_FragCoord.z),0.0,1.0);
l9_262=vec4(l9_263,1.0-l9_263,1.0,1.0);
}
#else
{
vec4 l9_264;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_264=vec4(mix(vec3(1.0),l9_237.xyz,vec3(l9_238)),l9_238);
}
#else
{
vec4 l9_265;
#if (sc_BlendMode_Screen||sc_BlendMode_PremultipliedAlphaAuto)
{
float l9_266;
#if (sc_BlendMode_PremultipliedAlphaAuto)
{
l9_266=clamp(l9_238,0.0,1.0);
}
#else
{
l9_266=l9_238;
}
#endif
l9_265=vec4(l9_237.xyz*l9_266,l9_266);
}
#else
{
l9_265=l9_237;
}
#endif
l9_264=l9_265;
}
#endif
l9_262=l9_264;
}
#endif
l9_261=l9_262;
}
#endif
l9_255=l9_261;
}
#endif
l9_254=l9_255;
}
#endif
l9_241=l9_254;
}
#endif
vec4 l9_267;
if (PreviewEnabled==1)
{
vec4 l9_268;
if (((PreviewVertexSaved*1.0)!=0.0) ? true : false)
{
l9_268=PreviewVertexColor;
}
else
{
l9_268=vec4(0.0);
}
l9_267=l9_268;
}
else
{
l9_267=l9_241;
}
vec4 l9_269=sc_OutputMotionVectorIfNeeded(max(l9_267,vec4(0.0)));
vec4 l9_270=clamp(l9_269,vec4(0.0),vec4(1.0));
#if (sc_OITDepthBoundsPass)
{
#if (sc_OITDepthBoundsPass)
{
float l9_271=clamp(viewSpaceDepth()/1000.0,0.0,1.0);
sc_writeFragData0Internal(vec4(max(0.0,1.0-(l9_271-0.0039215689)),min(1.0,l9_271+0.0039215689),0.0,0.0),sc_UniformConstants.x,sc_ShaderCacheConstant);
}
#endif
}
#else
{
#if (sc_OITDepthPrepass)
{
sc_writeFragData0Internal(vec4(1.0),sc_UniformConstants.x,sc_ShaderCacheConstant);
}
#else
{
#if (sc_OITDepthGatherPass)
{
#if (sc_OITDepthGatherPass)
{
vec2 l9_272=sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture(sc_OITFrontDepthTexture,l9_272).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_273=encodeDepth(viewSpaceDepth(),texture(sc_OITFilteredDepthBoundsTexture,l9_272).xy);
float l9_274=packValue(l9_273);
int l9_281=int(l9_270.w*255.0);
float l9_282=packValue(l9_281);
sc_writeFragData0Internal(vec4(packValue(l9_273),packValue(l9_273),packValue(l9_273),packValue(l9_273)),sc_UniformConstants.x,sc_ShaderCacheConstant);
sc_writeFragData1(vec4(l9_274,packValue(l9_273),packValue(l9_273),packValue(l9_273)));
sc_writeFragData2(vec4(l9_282,packValue(l9_281),packValue(l9_281),packValue(l9_281)));
#if (sc_OITMaxLayersVisualizeLayerCount)
{
sc_writeFragData2(vec4(0.0039215689,0.0,0.0,0.0));
}
#endif
}
#endif
}
#else
{
#if (sc_OITCompositingPass)
{
#if (sc_OITCompositingPass)
{
vec2 l9_285=sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture(sc_OITFrontDepthTexture,l9_285).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_286[8];
int l9_287[8];
int l9_288=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_288<8)
{
l9_286[l9_288]=0;
l9_287[l9_288]=0;
l9_288++;
continue;
}
else
{
break;
}
}
int l9_289;
#if (sc_OITMaxLayers8)
{
l9_289=2;
}
#else
{
l9_289=1;
}
#endif
int l9_290=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_290<l9_289)
{
vec4 l9_291;
vec4 l9_292;
vec4 l9_293;
if (l9_290==0)
{
l9_293=texture(sc_OITAlpha0,l9_285);
l9_292=texture(sc_OITDepthLow0,l9_285);
l9_291=texture(sc_OITDepthHigh0,l9_285);
}
else
{
l9_293=vec4(0.0);
l9_292=vec4(0.0);
l9_291=vec4(0.0);
}
vec4 l9_294;
vec4 l9_295;
vec4 l9_296;
if (l9_290==1)
{
l9_296=texture(sc_OITAlpha1,l9_285);
l9_295=texture(sc_OITDepthLow1,l9_285);
l9_294=texture(sc_OITDepthHigh1,l9_285);
}
else
{
l9_296=l9_293;
l9_295=l9_292;
l9_294=l9_291;
}
if (any(notEqual(l9_294,vec4(0.0)))||any(notEqual(l9_295,vec4(0.0))))
{
int l9_297[8]=l9_286;
unpackValues(l9_294.w,l9_290,l9_297);
unpackValues(l9_294.z,l9_290,l9_297);
unpackValues(l9_294.y,l9_290,l9_297);
unpackValues(l9_294.x,l9_290,l9_297);
unpackValues(l9_295.w,l9_290,l9_297);
unpackValues(l9_295.z,l9_290,l9_297);
unpackValues(l9_295.y,l9_290,l9_297);
unpackValues(l9_295.x,l9_290,l9_297);
int l9_306[8]=l9_287;
unpackValues(l9_296.w,l9_290,l9_306);
unpackValues(l9_296.z,l9_290,l9_306);
unpackValues(l9_296.y,l9_290,l9_306);
unpackValues(l9_296.x,l9_290,l9_306);
}
l9_290++;
continue;
}
else
{
break;
}
}
vec4 l9_311=texture(sc_OITFilteredDepthBoundsTexture,l9_285);
vec2 l9_312=l9_311.xy;
int l9_313;
#if (sc_SkinBonesCount>0)
{
l9_313=encodeDepth(((1.0-l9_311.x)*1000.0)+getDepthOrderingEpsilon(),l9_312);
}
#else
{
l9_313=0;
}
#endif
int l9_314=encodeDepth(viewSpaceDepth(),l9_312);
vec4 l9_315;
l9_315=l9_270*l9_270.w;
vec4 l9_316;
int l9_317=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_317<8)
{
int l9_318=l9_286[l9_317];
int l9_319=l9_314-l9_313;
bool l9_320=l9_318<l9_319;
bool l9_321;
if (l9_320)
{
l9_321=l9_286[l9_317]>0;
}
else
{
l9_321=l9_320;
}
if (l9_321)
{
vec3 l9_322=l9_315.xyz*(1.0-(float(l9_287[l9_317])/255.0));
l9_316=vec4(l9_322.x,l9_322.y,l9_322.z,l9_315.w);
}
else
{
l9_316=l9_315;
}
l9_315=l9_316;
l9_317++;
continue;
}
else
{
break;
}
}
sc_writeFragData0Internal(l9_315,sc_UniformConstants.x,sc_ShaderCacheConstant);
#if (sc_OITMaxLayersVisualizeLayerCount)
{
discard;
}
#endif
}
#endif
}
#else
{
#if (sc_OITFrontLayerPass)
{
#if (sc_OITFrontLayerPass)
{
if (abs(gl_FragCoord.z-texture(sc_OITFrontDepthTexture,sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw)).x)>getFrontLayerZTestEpsilon())
{
discard;
}
sc_writeFragData0Internal(l9_270,sc_UniformConstants.x,sc_ShaderCacheConstant);
}
#endif
}
#else
{
sc_writeFragData0Internal(l9_269,sc_UniformConstants.x,sc_ShaderCacheConstant);
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif // #elif defined FRAGMENT_SHADER // #if defined VERTEX_SHADER
