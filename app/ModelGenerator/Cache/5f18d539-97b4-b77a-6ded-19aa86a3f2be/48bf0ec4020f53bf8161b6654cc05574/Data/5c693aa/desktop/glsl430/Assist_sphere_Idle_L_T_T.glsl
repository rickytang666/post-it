#version 430
//#include <required.glsl> // [HACK 4/6/2023] See SCC shader_merger.cpp
// SCC_BACKEND_SHADER_FLAGS_BEGIN__
// SCC_BACKEND_SHADER_FLAG_DISABLE_FRUSTUM_CULLING
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
//sampler sampler Tweak_N55SmpSC 0:18
//sampler sampler Tweak_N66SmpSC 0:19
//sampler sampler Tweak_N67SmpSC 0:20
//sampler sampler intensityTextureSmpSC 0:21
//sampler sampler sc_OITCommonSampler 0:24
//sampler sampler sc_ScreenTextureSmpSC 0:26
//texture texture2D Tweak_N55 0:0:0:18
//texture texture2D Tweak_N66 0:1:0:19
//texture texture2D Tweak_N67 0:2:0:20
//texture texture2D intensityTexture 0:3:0:21
//texture texture2D sc_OITAlpha0 0:6:0:24
//texture texture2D sc_OITAlpha1 0:7:0:24
//texture texture2D sc_OITDepthHigh0 0:8:0:24
//texture texture2D sc_OITDepthHigh1 0:9:0:24
//texture texture2D sc_OITDepthLow0 0:10:0:24
//texture texture2D sc_OITDepthLow1 0:11:0:24
//texture texture2D sc_OITFilteredDepthBoundsTexture 0:12:0:24
//texture texture2D sc_OITFrontDepthTexture 0:13:0:24
//texture texture2D sc_ScreenTexture 0:15:0:26
//texture texture2DArray Tweak_N55ArrSC 0:29:0:18
//texture texture2DArray Tweak_N66ArrSC 0:30:0:19
//texture texture2DArray Tweak_N67ArrSC 0:31:0:20
//texture texture2DArray intensityTextureArrSC 0:32:0:21
//texture texture2DArray sc_ScreenTextureArrSC 0:35:0:26
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
//spec_const bool SC_USE_CLAMP_TO_BORDER_Tweak_N55 31 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_Tweak_N66 32 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_Tweak_N67 33 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 34 0
//spec_const bool SC_USE_UV_MIN_MAX_Tweak_N55 35 0
//spec_const bool SC_USE_UV_MIN_MAX_Tweak_N66 36 0
//spec_const bool SC_USE_UV_MIN_MAX_Tweak_N67 37 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 38 0
//spec_const bool SC_USE_UV_TRANSFORM_Tweak_N55 39 0
//spec_const bool SC_USE_UV_TRANSFORM_Tweak_N66 40 0
//spec_const bool SC_USE_UV_TRANSFORM_Tweak_N67 41 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 42 0
//spec_const bool Tweak_N55HasSwappedViews 43 0
//spec_const bool Tweak_N66HasSwappedViews 44 0
//spec_const bool Tweak_N67HasSwappedViews 45 0
//spec_const bool UseViewSpaceDepthVariant 46 1
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
//spec_const bool sc_RenderAlphaToColor 77 0
//spec_const bool sc_ScreenTextureHasSwappedViews 78 0
//spec_const bool sc_TAAEnabled 79 0
//spec_const bool sc_VertexBlending 80 0
//spec_const bool sc_VertexBlendingUseNormals 81 0
//spec_const bool sc_Voxelization 82 0
//spec_const int SC_DEVICE_CLASS 83 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_Tweak_N55 84 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_Tweak_N66 85 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_Tweak_N67 86 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 87 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_Tweak_N55 88 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_Tweak_N66 89 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_Tweak_N67 90 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 91 -1
//spec_const int Tweak_N55Layout 92 0
//spec_const int Tweak_N66Layout 93 0
//spec_const int Tweak_N67Layout 94 0
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
#ifndef SC_DEVICE_CLASS
#define SC_DEVICE_CLASS -1
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
uniform int idleTalkThinking;
uniform float Port_TimeBias_N053;
uniform float Port_ValueA_N053;
uniform float Port_TimeA_N053;
uniform float Port_TimeTransition_N053;
uniform float Port_ValueB_N053;
uniform float Port_TimeB_N053;
uniform float Port_Multiplier_N001;
uniform vec2 Port_Scale_N047;
uniform float Port_RangeMinA_N048;
uniform float Port_RangeMaxA_N048;
uniform float Port_RangeMaxB_N048;
uniform float Port_RangeMinB_N048;
uniform float Port_ValueA_N063;
uniform float Port_TimeA_N063;
uniform float Port_TimeTransition_N063;
uniform float Port_ValueB_N063;
uniform float Port_TimeB_N063;
uniform vec4 sc_Time;
uniform vec4 Port_Value2_N061;
uniform vec4 Port_Default_N061;
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
float snoise(vec2 v)
{
#if (SC_DEVICE_CLASS>=2)
{
vec2 l9_0=floor(v+vec2(dot(v,vec2(0.36602542))));
vec2 l9_1=(v-l9_0)+vec2(dot(l9_0,vec2(0.21132487)));
float l9_2=l9_1.x;
float l9_3=l9_1.y;
bvec2 l9_4=bvec2(l9_2>l9_3);
vec2 l9_5=vec2(l9_4.x ? vec2(1.0,0.0).x : vec2(0.0,1.0).x,l9_4.y ? vec2(1.0,0.0).y : vec2(0.0,1.0).y);
vec2 l9_6=(l9_1+vec2(0.21132487))-l9_5;
vec2 l9_7=l9_1+vec2(-0.57735026);
vec2 l9_8=l9_0-(floor(l9_0*0.0034602077)*289.0);
vec3 l9_9=vec3(l9_8.y)+vec3(0.0,l9_5.y,1.0);
vec3 l9_10=((l9_9*34.0)+vec3(1.0))*l9_9;
vec3 l9_11=((l9_10-(floor(l9_10*0.0034602077)*289.0))+vec3(l9_8.x))+vec3(0.0,l9_5.x,1.0);
vec3 l9_12=((l9_11*34.0)+vec3(1.0))*l9_11;
vec3 l9_13=max(vec3(0.5)-vec3(dot(l9_1,l9_1),dot(l9_6,l9_6),dot(l9_7,l9_7)),vec3(0.0));
vec3 l9_14=l9_13*l9_13;
vec3 l9_15=(fract((l9_12-(floor(l9_12*0.0034602077)*289.0))*vec3(0.024390243))*2.0)-vec3(1.0);
vec3 l9_16=abs(l9_15)-vec3(0.5);
vec3 l9_17=l9_15-floor(l9_15+vec3(0.5));
vec3 l9_18=vec3(0.0);
l9_18.x=(l9_17.x*l9_2)+(l9_16.x*l9_3);
vec2 l9_19=(l9_17.yz*vec2(l9_6.x,l9_7.x))+(l9_16.yz*vec2(l9_6.y,l9_7.y));
return 130.0*dot((l9_14*l9_14)*(vec3(1.7928429)-(((l9_17*l9_17)+(l9_16*l9_16))*0.85373473)),vec3(l9_18.x,l9_19.x,l9_19.y));
}
#else
{
return 0.0;
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
mat4 createVoxelOrthoMatrix(float left,float right,float bottom,float top,float near,float far)
{
return mat4(vec4(2.0/(right-left),0.0,0.0,(-(right+left))/(right-left)),vec4(0.0,2.0/(top-bottom),0.0,(-(top+bottom))/(top-bottom)),vec4(0.0,0.0,(-2.0)/(far-near),(-(far+near))/(far-near)),vec4(0.0,0.0,0.0,1.0));
}
void main()
{
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
float l9_7=floor(float(idleTalkThinking));
vec4 l9_8;
if (l9_7==0.0)
{
float l9_9=((Port_TimeA_N053+Port_TimeTransition_N053)+Port_TimeB_N053)+9.9999997e-05;
l9_8=vec4(mix(Port_ValueA_N053,Port_ValueB_N053,smoothstep(Port_TimeA_N053/l9_9,1.0-(Port_TimeB_N053/l9_9),abs((mod((sc_Time.x/l9_9)+Port_TimeBias_N053,1.0)*2.0)-1.0))));
}
else
{
vec4 l9_10;
if (l9_7==1.0)
{
float l9_11=((Port_TimeA_N063+Port_TimeTransition_N063)+Port_TimeB_N063)+9.9999997e-05;
l9_10=vec4(mix(Port_ValueA_N063,Port_ValueB_N063,smoothstep(Port_TimeA_N063/l9_11,1.0-(Port_TimeB_N063/l9_11),abs((mod((sc_Time.x/l9_11)+(((((floor(((snoise(vec2(floor(fract(sc_Time.x*Port_Multiplier_N001)*10000.0)*9.9999997e-05)*(Port_Scale_N047*0.5))*0.5)+0.5)*10000.0)*9.9999997e-05)-Port_RangeMinA_N048)/((Port_RangeMaxA_N048-Port_RangeMinA_N048)+1e-06))*(Port_RangeMaxB_N048-Port_RangeMinB_N048))+Port_RangeMinB_N048),1.0)*2.0)-1.0))));
}
else
{
vec4 l9_12;
if (l9_7==2.0)
{
l9_12=Port_Value2_N061;
}
else
{
l9_12=Port_Default_N061;
}
l9_10=l9_12;
}
l9_8=l9_10;
}
vec3 l9_13;
vec3 l9_14;
vec3 l9_15;
if (l9_4)
{
l9_15=varTangent.xyz;
l9_14=varNormalAndMotion.xyz;
l9_13=varPosAndMotion.xyz;
}
else
{
l9_15=varTangent.xyz;
l9_14=varNormalAndMotion.xyz;
l9_13=(sc_ModelMatrix*vec4((sc_ModelMatrixInverse*vec4(varPosAndMotion.xyz,1.0)).xyz*l9_8.xyz,1.0)).xyz;
}
varPosAndMotion=vec4(l9_13.x,l9_13.y,l9_13.z,varPosAndMotion.w);
vec3 l9_16=normalize(l9_14);
varNormalAndMotion=vec4(l9_16.x,l9_16.y,l9_16.z,varNormalAndMotion.w);
vec3 l9_17=normalize(l9_15);
varTangent=vec4(l9_17.x,l9_17.y,l9_17.z,varTangent.w);
varTangent.w=tangent.w;
#if (UseViewSpaceDepthVariant&&((sc_OITDepthGatherPass||sc_OITCompositingPass)||sc_OITDepthBoundsPass))
{
vec4 l9_18;
#if (sc_RenderingSpace==3)
{
l9_18=sc_ProjectionMatrixInverseArray[sc_GetStereoViewIndex()]*l9_0.position;
}
#else
{
vec4 l9_19;
#if (sc_RenderingSpace==2)
{
l9_19=sc_ViewMatrixArray[sc_GetStereoViewIndex()]*l9_0.position;
}
#else
{
vec4 l9_20;
#if (sc_RenderingSpace==1)
{
l9_20=sc_ModelViewMatrixArray[sc_GetStereoViewIndex()]*l9_0.position;
}
#else
{
l9_20=l9_0.position;
}
#endif
l9_19=l9_20;
}
#endif
l9_18=l9_19;
}
#endif
varViewSpaceDepth=-l9_18.z;
}
#endif
vec4 l9_21;
#if (sc_RenderingSpace==3)
{
l9_21=l9_0.position;
}
#else
{
vec4 l9_22;
#if (sc_RenderingSpace==4)
{
l9_22=(sc_ModelViewMatrixArray[sc_GetStereoViewIndex()]*l9_0.position)*vec4(1.0/sc_Camera.aspect,1.0,1.0,1.0);
}
#else
{
vec4 l9_23;
#if (sc_RenderingSpace==2)
{
l9_23=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(varPosAndMotion.xyz,1.0);
}
#else
{
vec4 l9_24;
#if (sc_RenderingSpace==1)
{
l9_24=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(varPosAndMotion.xyz,1.0);
}
#else
{
l9_24=vec4(0.0);
}
#endif
l9_23=l9_24;
}
#endif
l9_22=l9_23;
}
#endif
l9_21=l9_22;
}
#endif
varTex01=vec4(l9_5,l9_0.texture1);
#if (sc_ProjectiveShadowsReceiver)
{
vec4 l9_25;
#if (sc_RenderingSpace==1)
{
l9_25=sc_ModelMatrix*l9_0.position;
}
#else
{
l9_25=l9_0.position;
}
#endif
vec4 l9_26=sc_ProjectorMatrix*l9_25;
varShadowTex=((l9_26.xy/vec2(l9_26.w))*0.5)+vec2(0.5);
}
#endif
vec4 l9_27;
#if (sc_DepthBufferMode==1)
{
vec4 l9_28;
if (sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][2].w!=0.0)
{
vec4 l9_29=l9_21;
l9_29.z=((log2(max(sc_Camera.clipPlanes.x,1.0+l9_21.w))*(2.0/log2(sc_Camera.clipPlanes.y+1.0)))-1.0)*l9_21.w;
l9_28=l9_29;
}
else
{
l9_28=l9_21;
}
l9_27=l9_28;
}
#else
{
l9_27=l9_21;
}
#endif
vec4 l9_30;
#if (sc_TAAEnabled)
{
vec2 l9_31=l9_27.xy+(sc_TAAJitterOffset*l9_27.w);
l9_30=vec4(l9_31.x,l9_31.y,l9_27.z,l9_27.w);
}
#else
{
l9_30=l9_27;
}
#endif
sc_SetClipPosition(l9_30);
#if (sc_Voxelization)
{
sc_Vertex_t l9_32=sc_Vertex_t(l9_0.position,l9_0.normal,l9_0.tangent,l9_5,l9_0.texture1);
sc_BlendVertex(l9_32);
sc_SkinVertex(l9_32);
int l9_33=sc_GetLocalInstanceIDInternal(sc_FallbackInstanceID);
int l9_34=int(voxelization_params_0.w);
vec4 l9_35=createVoxelOrthoMatrix(voxelization_params_frustum_lrbt.x,voxelization_params_frustum_lrbt.y,voxelization_params_frustum_lrbt.z,voxelization_params_frustum_lrbt.w,voxelization_params_frustum_nf.x,voxelization_params_frustum_nf.y)*vec4(((sc_ModelMatrixVoxelization*l9_32.position).xyz+vec3(float(l9_33%l9_34)*voxelization_params_0.y,float(l9_33/l9_34)*voxelization_params_0.y,(float(l9_33)*(voxelization_params_0.y/voxelization_params_0.z))+voxelization_params_frustum_nf.x))-voxelization_params_camera_pos,1.0);
l9_35.w=1.0;
varScreenPos=l9_35;
sc_SetClipPosition(l9_35*1.0);
}
#else
{
#if (sc_OutputBounds)
{
sc_Vertex_t l9_36=sc_Vertex_t(l9_0.position,l9_0.normal,l9_0.tangent,l9_5,l9_0.texture1);
sc_BlendVertex(l9_36);
sc_SkinVertex(l9_36);
vec2 l9_37=((l9_36.position.xy/vec2(l9_36.position.w))*0.5)+vec2(0.5);
varTex01=vec4(l9_37.x,l9_37.y,varTex01.z,varTex01.w);
vec4 l9_38=sc_ModelMatrixVoxelization*l9_36.position;
vec3 l9_39=l9_38.xyz-voxelization_params_camera_pos;
varPosAndMotion=vec4(l9_39.x,l9_39.y,l9_39.z,varPosAndMotion.w);
vec3 l9_40=normalize(l9_36.normal);
varNormalAndMotion=vec4(l9_40.x,l9_40.y,l9_40.z,varNormalAndMotion.w);
vec4 l9_41=createVoxelOrthoMatrix(voxelization_params_frustum_lrbt.x,voxelization_params_frustum_lrbt.y,voxelization_params_frustum_lrbt.z,voxelization_params_frustum_lrbt.w,voxelization_params_frustum_nf.x,voxelization_params_frustum_nf.y)*vec4(l9_39.x,l9_39.y,l9_39.z,l9_38.w);
vec4 l9_42=vec4(l9_41.x,l9_41.y,l9_41.z,vec4(0.0).w);
l9_42.w=1.0;
varScreenPos=l9_42;
sc_SetClipPosition(l9_42*1.0);
}
#endif
}
#endif
vec4 l9_43=varPosAndMotion;
#if (sc_MotionVectorsPass)
{
vec4 l9_44=vec4(l9_43.xyz,1.0);
#if (sc_MotionVectorsPass)
{
vec4 l9_45=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*l9_44;
vec4 l9_46=sc_PrevFrameViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(((sc_PrevFrameModelMatrix*sc_ModelMatrixInverse)*l9_44).xyz,1.0);
vec2 l9_47=((l9_45.xy/vec2(l9_45.w)).xy-(l9_46.xy/vec2(l9_46.w)).xy)*0.5;
varPosAndMotion.w=l9_47.x;
varNormalAndMotion.w=l9_47.y;
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
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
vec3 ViewDirWS;
vec3 SurfacePosition_WorldSpace;
vec3 VertexNormal_WorldSpace;
vec3 VertexTangent_WorldSpace;
vec3 VertexBinormal_WorldSpace;
vec2 Surface_UVCoord0;
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
#ifndef Tweak_N66HasSwappedViews
#define Tweak_N66HasSwappedViews 0
#elif Tweak_N66HasSwappedViews==1
#undef Tweak_N66HasSwappedViews
#define Tweak_N66HasSwappedViews 1
#endif
#ifndef Tweak_N66Layout
#define Tweak_N66Layout 0
#endif
#ifndef Tweak_N67HasSwappedViews
#define Tweak_N67HasSwappedViews 0
#elif Tweak_N67HasSwappedViews==1
#undef Tweak_N67HasSwappedViews
#define Tweak_N67HasSwappedViews 1
#endif
#ifndef Tweak_N67Layout
#define Tweak_N67Layout 0
#endif
#ifndef Tweak_N55HasSwappedViews
#define Tweak_N55HasSwappedViews 0
#elif Tweak_N55HasSwappedViews==1
#undef Tweak_N55HasSwappedViews
#define Tweak_N55HasSwappedViews 1
#endif
#ifndef Tweak_N55Layout
#define Tweak_N55Layout 0
#endif
#ifndef SC_USE_UV_TRANSFORM_Tweak_N66
#define SC_USE_UV_TRANSFORM_Tweak_N66 0
#elif SC_USE_UV_TRANSFORM_Tweak_N66==1
#undef SC_USE_UV_TRANSFORM_Tweak_N66
#define SC_USE_UV_TRANSFORM_Tweak_N66 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_Tweak_N66
#define SC_SOFTWARE_WRAP_MODE_U_Tweak_N66 -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_Tweak_N66
#define SC_SOFTWARE_WRAP_MODE_V_Tweak_N66 -1
#endif
#ifndef SC_USE_UV_MIN_MAX_Tweak_N66
#define SC_USE_UV_MIN_MAX_Tweak_N66 0
#elif SC_USE_UV_MIN_MAX_Tweak_N66==1
#undef SC_USE_UV_MIN_MAX_Tweak_N66
#define SC_USE_UV_MIN_MAX_Tweak_N66 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_Tweak_N66
#define SC_USE_CLAMP_TO_BORDER_Tweak_N66 0
#elif SC_USE_CLAMP_TO_BORDER_Tweak_N66==1
#undef SC_USE_CLAMP_TO_BORDER_Tweak_N66
#define SC_USE_CLAMP_TO_BORDER_Tweak_N66 1
#endif
#ifndef SC_USE_UV_TRANSFORM_Tweak_N67
#define SC_USE_UV_TRANSFORM_Tweak_N67 0
#elif SC_USE_UV_TRANSFORM_Tweak_N67==1
#undef SC_USE_UV_TRANSFORM_Tweak_N67
#define SC_USE_UV_TRANSFORM_Tweak_N67 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_Tweak_N67
#define SC_SOFTWARE_WRAP_MODE_U_Tweak_N67 -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_Tweak_N67
#define SC_SOFTWARE_WRAP_MODE_V_Tweak_N67 -1
#endif
#ifndef SC_USE_UV_MIN_MAX_Tweak_N67
#define SC_USE_UV_MIN_MAX_Tweak_N67 0
#elif SC_USE_UV_MIN_MAX_Tweak_N67==1
#undef SC_USE_UV_MIN_MAX_Tweak_N67
#define SC_USE_UV_MIN_MAX_Tweak_N67 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_Tweak_N67
#define SC_USE_CLAMP_TO_BORDER_Tweak_N67 0
#elif SC_USE_CLAMP_TO_BORDER_Tweak_N67==1
#undef SC_USE_CLAMP_TO_BORDER_Tweak_N67
#define SC_USE_CLAMP_TO_BORDER_Tweak_N67 1
#endif
#ifndef SC_USE_UV_TRANSFORM_Tweak_N55
#define SC_USE_UV_TRANSFORM_Tweak_N55 0
#elif SC_USE_UV_TRANSFORM_Tweak_N55==1
#undef SC_USE_UV_TRANSFORM_Tweak_N55
#define SC_USE_UV_TRANSFORM_Tweak_N55 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_Tweak_N55
#define SC_SOFTWARE_WRAP_MODE_U_Tweak_N55 -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_Tweak_N55
#define SC_SOFTWARE_WRAP_MODE_V_Tweak_N55 -1
#endif
#ifndef SC_USE_UV_MIN_MAX_Tweak_N55
#define SC_USE_UV_MIN_MAX_Tweak_N55 0
#elif SC_USE_UV_MIN_MAX_Tweak_N55==1
#undef SC_USE_UV_MIN_MAX_Tweak_N55
#define SC_USE_UV_MIN_MAX_Tweak_N55 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_Tweak_N55
#define SC_USE_CLAMP_TO_BORDER_Tweak_N55 0
#elif SC_USE_CLAMP_TO_BORDER_Tweak_N55==1
#undef SC_USE_CLAMP_TO_BORDER_Tweak_N55
#define SC_USE_CLAMP_TO_BORDER_Tweak_N55 1
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
uniform vec4 sc_CurrentRenderTargetDims;
uniform mat4 sc_ProjectionMatrixArray[sc_NumStereoViews];
uniform float sc_ShadowDensity;
uniform vec4 sc_ShadowColor;
uniform vec4 sc_UniformConstants;
uniform float correctedIntensity;
uniform mat3 intensityTextureTransform;
uniform vec4 intensityTextureUvMinMax;
uniform vec4 intensityTextureBorderColor;
uniform float alphaTestThreshold;
uniform int colorSwitchFrom;
uniform vec3 Port_Input1_N111;
uniform vec3 Port_Input1_N112;
uniform mat3 Tweak_N66Transform;
uniform vec4 Tweak_N66UvMinMax;
uniform vec4 Tweak_N66BorderColor;
uniform float Port_Multiplier_N006;
uniform vec2 Port_Center_N005;
uniform mat3 Tweak_N67Transform;
uniform vec4 Tweak_N67UvMinMax;
uniform vec4 Tweak_N67BorderColor;
uniform mat3 Tweak_N55Transform;
uniform vec4 Tweak_N55UvMinMax;
uniform vec4 Tweak_N55BorderColor;
uniform int colorSwitchTo;
uniform float colorSwitchTransition;
uniform float Tweak_N57;
uniform float opacity;
uniform vec4 sc_Time;
uniform sc_Camera_t sc_Camera;
uniform vec4 Port_Default_N007;
uniform vec4 Port_Default_N008;
uniform vec3 Port_Normal_N025;
uniform float Port_Exponent_N025;
uniform float Port_Intensity_N025;
uniform float Port_TimeBias_N003;
uniform float Port_ValueA_N003;
uniform float Port_TimeA_N003;
uniform float Port_TimeTransition_N003;
uniform float Port_ValueB_N003;
uniform float Port_TimeB_N003;
uniform float Port_Input0_N058;
uniform float Port_Input1_N058;
uniform float Port_Input1_N045;
uniform float Port_Input1_N046;
uniform float Port_Input2_N046;
uniform vec4 Port_Input1_N118;
uniform vec4 Port_Input2_N118;
uniform int PreviewEnabled;
uniform sampler2D Tweak_N55;
uniform sampler2DArray Tweak_N55ArrSC;
uniform sampler2D Tweak_N67;
uniform sampler2DArray Tweak_N67ArrSC;
uniform sampler2D Tweak_N66;
uniform sampler2DArray Tweak_N66ArrSC;
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
int Tweak_N55GetStereoViewIndex()
{
int l9_0;
#if (Tweak_N55HasSwappedViews)
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
void Node5_Rotate_Coords(vec2 CoordsIn,float Rotation,vec2 Center,out vec2 CoordsOut,ssGlobals Globals)
{
float l9_0=sin(radians(Rotation));
float l9_1=cos(radians(Rotation));
CoordsOut=CoordsIn-Center;
CoordsOut=vec2(dot(vec2(l9_1,l9_0),CoordsOut),dot(vec2(-l9_0,l9_1),CoordsOut))+Center;
}
int Tweak_N67GetStereoViewIndex()
{
int l9_0;
#if (Tweak_N67HasSwappedViews)
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
int Tweak_N66GetStereoViewIndex()
{
int l9_0;
#if (Tweak_N66HasSwappedViews)
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
void sc_writeFragData0Internal(vec4 col,float zero,int cacheConst)
{
col.x+=zero*float(cacheConst);
sc_FragData0=col;
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
vec3 l9_0=normalize(sc_Camera.position-varPosAndMotion.xyz);
vec3 l9_1=normalize(varNormalAndMotion.xyz);
vec3 l9_2=normalize(varTangent.xyz);
vec3 l9_3=cross(l9_1,l9_2)*varTangent.w;
ssGlobals l9_4=ssGlobals(sc_Time.x,sc_Time.y,0.0,l9_0,varPosAndMotion.xyz,l9_1,l9_2,l9_3,varTex01.xy);
float l9_5=floor(float(colorSwitchFrom));
vec4 l9_6;
if (l9_5==0.0)
{
vec3 l9_7=(reflect(-l9_0,l9_1)*Port_Input1_N111)+Port_Input1_N112;
vec4 l9_8;
#if (Tweak_N66Layout==2)
{
bool l9_9=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N66)!=0)&&(!(int(SC_USE_UV_MIN_MAX_Tweak_N66)!=0));
float l9_10=l9_7.x;
sc_SoftwareWrapEarly(l9_10,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N66,SC_SOFTWARE_WRAP_MODE_V_Tweak_N66).x);
float l9_11=l9_10;
float l9_12=l9_7.y;
sc_SoftwareWrapEarly(l9_12,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N66,SC_SOFTWARE_WRAP_MODE_V_Tweak_N66).y);
float l9_13=l9_12;
vec2 l9_14;
float l9_15;
#if (SC_USE_UV_MIN_MAX_Tweak_N66)
{
bool l9_16;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N66)
{
l9_16=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N66,SC_SOFTWARE_WRAP_MODE_V_Tweak_N66).x==3;
}
#else
{
l9_16=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N66)!=0);
}
#endif
float l9_17=l9_11;
float l9_18=1.0;
sc_ClampUV(l9_17,Tweak_N66UvMinMax.x,Tweak_N66UvMinMax.z,l9_16,l9_18);
float l9_19=l9_17;
float l9_20=l9_18;
bool l9_21;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N66)
{
l9_21=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N66,SC_SOFTWARE_WRAP_MODE_V_Tweak_N66).y==3;
}
#else
{
l9_21=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N66)!=0);
}
#endif
float l9_22=l9_13;
float l9_23=l9_20;
sc_ClampUV(l9_22,Tweak_N66UvMinMax.y,Tweak_N66UvMinMax.w,l9_21,l9_23);
l9_15=l9_23;
l9_14=vec2(l9_19,l9_22);
}
#else
{
l9_15=1.0;
l9_14=vec2(l9_11,l9_13);
}
#endif
vec2 l9_24=sc_TransformUV(l9_14,(int(SC_USE_UV_TRANSFORM_Tweak_N66)!=0),Tweak_N66Transform);
float l9_25=l9_24.x;
float l9_26=l9_15;
sc_SoftwareWrapLate(l9_25,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N66,SC_SOFTWARE_WRAP_MODE_V_Tweak_N66).x,l9_9,l9_26);
float l9_27=l9_24.y;
float l9_28=l9_26;
sc_SoftwareWrapLate(l9_27,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N66,SC_SOFTWARE_WRAP_MODE_V_Tweak_N66).y,l9_9,l9_28);
float l9_29=l9_28;
vec3 l9_30=sc_SamplingCoordsViewToGlobal(vec2(l9_25,l9_27),Tweak_N66Layout,Tweak_N66GetStereoViewIndex());
vec4 l9_31=texture(Tweak_N66ArrSC,l9_30,0.0);
vec4 l9_32;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N66)
{
l9_32=mix(Tweak_N66BorderColor,l9_31,vec4(l9_29));
}
#else
{
l9_32=l9_31;
}
#endif
l9_8=l9_32;
}
#else
{
bool l9_33=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N66)!=0)&&(!(int(SC_USE_UV_MIN_MAX_Tweak_N66)!=0));
float l9_34=l9_7.x;
sc_SoftwareWrapEarly(l9_34,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N66,SC_SOFTWARE_WRAP_MODE_V_Tweak_N66).x);
float l9_35=l9_34;
float l9_36=l9_7.y;
sc_SoftwareWrapEarly(l9_36,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N66,SC_SOFTWARE_WRAP_MODE_V_Tweak_N66).y);
float l9_37=l9_36;
vec2 l9_38;
float l9_39;
#if (SC_USE_UV_MIN_MAX_Tweak_N66)
{
bool l9_40;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N66)
{
l9_40=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N66,SC_SOFTWARE_WRAP_MODE_V_Tweak_N66).x==3;
}
#else
{
l9_40=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N66)!=0);
}
#endif
float l9_41=l9_35;
float l9_42=1.0;
sc_ClampUV(l9_41,Tweak_N66UvMinMax.x,Tweak_N66UvMinMax.z,l9_40,l9_42);
float l9_43=l9_41;
float l9_44=l9_42;
bool l9_45;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N66)
{
l9_45=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N66,SC_SOFTWARE_WRAP_MODE_V_Tweak_N66).y==3;
}
#else
{
l9_45=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N66)!=0);
}
#endif
float l9_46=l9_37;
float l9_47=l9_44;
sc_ClampUV(l9_46,Tweak_N66UvMinMax.y,Tweak_N66UvMinMax.w,l9_45,l9_47);
l9_39=l9_47;
l9_38=vec2(l9_43,l9_46);
}
#else
{
l9_39=1.0;
l9_38=vec2(l9_35,l9_37);
}
#endif
vec2 l9_48=sc_TransformUV(l9_38,(int(SC_USE_UV_TRANSFORM_Tweak_N66)!=0),Tweak_N66Transform);
float l9_49=l9_48.x;
float l9_50=l9_39;
sc_SoftwareWrapLate(l9_49,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N66,SC_SOFTWARE_WRAP_MODE_V_Tweak_N66).x,l9_33,l9_50);
float l9_51=l9_48.y;
float l9_52=l9_50;
sc_SoftwareWrapLate(l9_51,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N66,SC_SOFTWARE_WRAP_MODE_V_Tweak_N66).y,l9_33,l9_52);
float l9_53=l9_52;
vec3 l9_54=sc_SamplingCoordsViewToGlobal(vec2(l9_49,l9_51),Tweak_N66Layout,Tweak_N66GetStereoViewIndex());
vec4 l9_55=texture(Tweak_N66,l9_54.xy,0.0);
vec4 l9_56;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N66)
{
l9_56=mix(Tweak_N66BorderColor,l9_55,vec4(l9_53));
}
#else
{
l9_56=l9_55;
}
#endif
l9_8=l9_56;
}
#endif
l9_6=l9_8;
}
else
{
vec4 l9_57;
if (l9_5==1.0)
{
vec2 l9_58;
Node5_Rotate_Coords(((reflect(-l9_0,l9_1)*Port_Input1_N111)+Port_Input1_N112).xy,sc_Time.x*Port_Multiplier_N006,Port_Center_N005,l9_58,l9_4);
vec2 l9_59=l9_58;
vec4 l9_60;
#if (Tweak_N67Layout==2)
{
bool l9_61=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N67)!=0)&&(!(int(SC_USE_UV_MIN_MAX_Tweak_N67)!=0));
float l9_62=l9_59.x;
sc_SoftwareWrapEarly(l9_62,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N67,SC_SOFTWARE_WRAP_MODE_V_Tweak_N67).x);
float l9_63=l9_62;
float l9_64=l9_59.y;
sc_SoftwareWrapEarly(l9_64,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N67,SC_SOFTWARE_WRAP_MODE_V_Tweak_N67).y);
float l9_65=l9_64;
vec2 l9_66;
float l9_67;
#if (SC_USE_UV_MIN_MAX_Tweak_N67)
{
bool l9_68;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N67)
{
l9_68=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N67,SC_SOFTWARE_WRAP_MODE_V_Tweak_N67).x==3;
}
#else
{
l9_68=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N67)!=0);
}
#endif
float l9_69=l9_63;
float l9_70=1.0;
sc_ClampUV(l9_69,Tweak_N67UvMinMax.x,Tweak_N67UvMinMax.z,l9_68,l9_70);
float l9_71=l9_69;
float l9_72=l9_70;
bool l9_73;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N67)
{
l9_73=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N67,SC_SOFTWARE_WRAP_MODE_V_Tweak_N67).y==3;
}
#else
{
l9_73=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N67)!=0);
}
#endif
float l9_74=l9_65;
float l9_75=l9_72;
sc_ClampUV(l9_74,Tweak_N67UvMinMax.y,Tweak_N67UvMinMax.w,l9_73,l9_75);
l9_67=l9_75;
l9_66=vec2(l9_71,l9_74);
}
#else
{
l9_67=1.0;
l9_66=vec2(l9_63,l9_65);
}
#endif
vec2 l9_76=sc_TransformUV(l9_66,(int(SC_USE_UV_TRANSFORM_Tweak_N67)!=0),Tweak_N67Transform);
float l9_77=l9_76.x;
float l9_78=l9_67;
sc_SoftwareWrapLate(l9_77,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N67,SC_SOFTWARE_WRAP_MODE_V_Tweak_N67).x,l9_61,l9_78);
float l9_79=l9_76.y;
float l9_80=l9_78;
sc_SoftwareWrapLate(l9_79,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N67,SC_SOFTWARE_WRAP_MODE_V_Tweak_N67).y,l9_61,l9_80);
float l9_81=l9_80;
vec3 l9_82=sc_SamplingCoordsViewToGlobal(vec2(l9_77,l9_79),Tweak_N67Layout,Tweak_N67GetStereoViewIndex());
vec4 l9_83=texture(Tweak_N67ArrSC,l9_82,0.0);
vec4 l9_84;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N67)
{
l9_84=mix(Tweak_N67BorderColor,l9_83,vec4(l9_81));
}
#else
{
l9_84=l9_83;
}
#endif
l9_60=l9_84;
}
#else
{
bool l9_85=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N67)!=0)&&(!(int(SC_USE_UV_MIN_MAX_Tweak_N67)!=0));
float l9_86=l9_59.x;
sc_SoftwareWrapEarly(l9_86,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N67,SC_SOFTWARE_WRAP_MODE_V_Tweak_N67).x);
float l9_87=l9_86;
float l9_88=l9_59.y;
sc_SoftwareWrapEarly(l9_88,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N67,SC_SOFTWARE_WRAP_MODE_V_Tweak_N67).y);
float l9_89=l9_88;
vec2 l9_90;
float l9_91;
#if (SC_USE_UV_MIN_MAX_Tweak_N67)
{
bool l9_92;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N67)
{
l9_92=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N67,SC_SOFTWARE_WRAP_MODE_V_Tweak_N67).x==3;
}
#else
{
l9_92=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N67)!=0);
}
#endif
float l9_93=l9_87;
float l9_94=1.0;
sc_ClampUV(l9_93,Tweak_N67UvMinMax.x,Tweak_N67UvMinMax.z,l9_92,l9_94);
float l9_95=l9_93;
float l9_96=l9_94;
bool l9_97;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N67)
{
l9_97=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N67,SC_SOFTWARE_WRAP_MODE_V_Tweak_N67).y==3;
}
#else
{
l9_97=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N67)!=0);
}
#endif
float l9_98=l9_89;
float l9_99=l9_96;
sc_ClampUV(l9_98,Tweak_N67UvMinMax.y,Tweak_N67UvMinMax.w,l9_97,l9_99);
l9_91=l9_99;
l9_90=vec2(l9_95,l9_98);
}
#else
{
l9_91=1.0;
l9_90=vec2(l9_87,l9_89);
}
#endif
vec2 l9_100=sc_TransformUV(l9_90,(int(SC_USE_UV_TRANSFORM_Tweak_N67)!=0),Tweak_N67Transform);
float l9_101=l9_100.x;
float l9_102=l9_91;
sc_SoftwareWrapLate(l9_101,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N67,SC_SOFTWARE_WRAP_MODE_V_Tweak_N67).x,l9_85,l9_102);
float l9_103=l9_100.y;
float l9_104=l9_102;
sc_SoftwareWrapLate(l9_103,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N67,SC_SOFTWARE_WRAP_MODE_V_Tweak_N67).y,l9_85,l9_104);
float l9_105=l9_104;
vec3 l9_106=sc_SamplingCoordsViewToGlobal(vec2(l9_101,l9_103),Tweak_N67Layout,Tweak_N67GetStereoViewIndex());
vec4 l9_107=texture(Tweak_N67,l9_106.xy,0.0);
vec4 l9_108;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N67)
{
l9_108=mix(Tweak_N67BorderColor,l9_107,vec4(l9_105));
}
#else
{
l9_108=l9_107;
}
#endif
l9_60=l9_108;
}
#endif
l9_57=l9_60;
}
else
{
vec4 l9_109;
if (l9_5==2.0)
{
vec3 l9_110=(reflect(-l9_0,l9_1)*Port_Input1_N111)+Port_Input1_N112;
vec4 l9_111;
#if (Tweak_N55Layout==2)
{
bool l9_112=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N55)!=0)&&(!(int(SC_USE_UV_MIN_MAX_Tweak_N55)!=0));
float l9_113=l9_110.x;
sc_SoftwareWrapEarly(l9_113,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N55,SC_SOFTWARE_WRAP_MODE_V_Tweak_N55).x);
float l9_114=l9_113;
float l9_115=l9_110.y;
sc_SoftwareWrapEarly(l9_115,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N55,SC_SOFTWARE_WRAP_MODE_V_Tweak_N55).y);
float l9_116=l9_115;
vec2 l9_117;
float l9_118;
#if (SC_USE_UV_MIN_MAX_Tweak_N55)
{
bool l9_119;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N55)
{
l9_119=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N55,SC_SOFTWARE_WRAP_MODE_V_Tweak_N55).x==3;
}
#else
{
l9_119=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N55)!=0);
}
#endif
float l9_120=l9_114;
float l9_121=1.0;
sc_ClampUV(l9_120,Tweak_N55UvMinMax.x,Tweak_N55UvMinMax.z,l9_119,l9_121);
float l9_122=l9_120;
float l9_123=l9_121;
bool l9_124;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N55)
{
l9_124=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N55,SC_SOFTWARE_WRAP_MODE_V_Tweak_N55).y==3;
}
#else
{
l9_124=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N55)!=0);
}
#endif
float l9_125=l9_116;
float l9_126=l9_123;
sc_ClampUV(l9_125,Tweak_N55UvMinMax.y,Tweak_N55UvMinMax.w,l9_124,l9_126);
l9_118=l9_126;
l9_117=vec2(l9_122,l9_125);
}
#else
{
l9_118=1.0;
l9_117=vec2(l9_114,l9_116);
}
#endif
vec2 l9_127=sc_TransformUV(l9_117,(int(SC_USE_UV_TRANSFORM_Tweak_N55)!=0),Tweak_N55Transform);
float l9_128=l9_127.x;
float l9_129=l9_118;
sc_SoftwareWrapLate(l9_128,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N55,SC_SOFTWARE_WRAP_MODE_V_Tweak_N55).x,l9_112,l9_129);
float l9_130=l9_127.y;
float l9_131=l9_129;
sc_SoftwareWrapLate(l9_130,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N55,SC_SOFTWARE_WRAP_MODE_V_Tweak_N55).y,l9_112,l9_131);
float l9_132=l9_131;
vec3 l9_133=sc_SamplingCoordsViewToGlobal(vec2(l9_128,l9_130),Tweak_N55Layout,Tweak_N55GetStereoViewIndex());
vec4 l9_134=texture(Tweak_N55ArrSC,l9_133,0.0);
vec4 l9_135;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N55)
{
l9_135=mix(Tweak_N55BorderColor,l9_134,vec4(l9_132));
}
#else
{
l9_135=l9_134;
}
#endif
l9_111=l9_135;
}
#else
{
bool l9_136=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N55)!=0)&&(!(int(SC_USE_UV_MIN_MAX_Tweak_N55)!=0));
float l9_137=l9_110.x;
sc_SoftwareWrapEarly(l9_137,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N55,SC_SOFTWARE_WRAP_MODE_V_Tweak_N55).x);
float l9_138=l9_137;
float l9_139=l9_110.y;
sc_SoftwareWrapEarly(l9_139,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N55,SC_SOFTWARE_WRAP_MODE_V_Tweak_N55).y);
float l9_140=l9_139;
vec2 l9_141;
float l9_142;
#if (SC_USE_UV_MIN_MAX_Tweak_N55)
{
bool l9_143;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N55)
{
l9_143=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N55,SC_SOFTWARE_WRAP_MODE_V_Tweak_N55).x==3;
}
#else
{
l9_143=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N55)!=0);
}
#endif
float l9_144=l9_138;
float l9_145=1.0;
sc_ClampUV(l9_144,Tweak_N55UvMinMax.x,Tweak_N55UvMinMax.z,l9_143,l9_145);
float l9_146=l9_144;
float l9_147=l9_145;
bool l9_148;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N55)
{
l9_148=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N55,SC_SOFTWARE_WRAP_MODE_V_Tweak_N55).y==3;
}
#else
{
l9_148=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N55)!=0);
}
#endif
float l9_149=l9_140;
float l9_150=l9_147;
sc_ClampUV(l9_149,Tweak_N55UvMinMax.y,Tweak_N55UvMinMax.w,l9_148,l9_150);
l9_142=l9_150;
l9_141=vec2(l9_146,l9_149);
}
#else
{
l9_142=1.0;
l9_141=vec2(l9_138,l9_140);
}
#endif
vec2 l9_151=sc_TransformUV(l9_141,(int(SC_USE_UV_TRANSFORM_Tweak_N55)!=0),Tweak_N55Transform);
float l9_152=l9_151.x;
float l9_153=l9_142;
sc_SoftwareWrapLate(l9_152,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N55,SC_SOFTWARE_WRAP_MODE_V_Tweak_N55).x,l9_136,l9_153);
float l9_154=l9_151.y;
float l9_155=l9_153;
sc_SoftwareWrapLate(l9_154,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N55,SC_SOFTWARE_WRAP_MODE_V_Tweak_N55).y,l9_136,l9_155);
float l9_156=l9_155;
vec3 l9_157=sc_SamplingCoordsViewToGlobal(vec2(l9_152,l9_154),Tweak_N55Layout,Tweak_N55GetStereoViewIndex());
vec4 l9_158=texture(Tweak_N55,l9_157.xy,0.0);
vec4 l9_159;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N55)
{
l9_159=mix(Tweak_N55BorderColor,l9_158,vec4(l9_156));
}
#else
{
l9_159=l9_158;
}
#endif
l9_111=l9_159;
}
#endif
l9_109=l9_111;
}
else
{
l9_109=Port_Default_N007;
}
l9_57=l9_109;
}
l9_6=l9_57;
}
float l9_160=floor(float(colorSwitchTo));
vec4 l9_161;
if (l9_160==0.0)
{
vec3 l9_162=(reflect(-l9_0,l9_1)*Port_Input1_N111)+Port_Input1_N112;
vec4 l9_163;
#if (Tweak_N66Layout==2)
{
bool l9_164=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N66)!=0)&&(!(int(SC_USE_UV_MIN_MAX_Tweak_N66)!=0));
float l9_165=l9_162.x;
sc_SoftwareWrapEarly(l9_165,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N66,SC_SOFTWARE_WRAP_MODE_V_Tweak_N66).x);
float l9_166=l9_165;
float l9_167=l9_162.y;
sc_SoftwareWrapEarly(l9_167,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N66,SC_SOFTWARE_WRAP_MODE_V_Tweak_N66).y);
float l9_168=l9_167;
vec2 l9_169;
float l9_170;
#if (SC_USE_UV_MIN_MAX_Tweak_N66)
{
bool l9_171;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N66)
{
l9_171=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N66,SC_SOFTWARE_WRAP_MODE_V_Tweak_N66).x==3;
}
#else
{
l9_171=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N66)!=0);
}
#endif
float l9_172=l9_166;
float l9_173=1.0;
sc_ClampUV(l9_172,Tweak_N66UvMinMax.x,Tweak_N66UvMinMax.z,l9_171,l9_173);
float l9_174=l9_172;
float l9_175=l9_173;
bool l9_176;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N66)
{
l9_176=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N66,SC_SOFTWARE_WRAP_MODE_V_Tweak_N66).y==3;
}
#else
{
l9_176=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N66)!=0);
}
#endif
float l9_177=l9_168;
float l9_178=l9_175;
sc_ClampUV(l9_177,Tweak_N66UvMinMax.y,Tweak_N66UvMinMax.w,l9_176,l9_178);
l9_170=l9_178;
l9_169=vec2(l9_174,l9_177);
}
#else
{
l9_170=1.0;
l9_169=vec2(l9_166,l9_168);
}
#endif
vec2 l9_179=sc_TransformUV(l9_169,(int(SC_USE_UV_TRANSFORM_Tweak_N66)!=0),Tweak_N66Transform);
float l9_180=l9_179.x;
float l9_181=l9_170;
sc_SoftwareWrapLate(l9_180,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N66,SC_SOFTWARE_WRAP_MODE_V_Tweak_N66).x,l9_164,l9_181);
float l9_182=l9_179.y;
float l9_183=l9_181;
sc_SoftwareWrapLate(l9_182,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N66,SC_SOFTWARE_WRAP_MODE_V_Tweak_N66).y,l9_164,l9_183);
float l9_184=l9_183;
vec3 l9_185=sc_SamplingCoordsViewToGlobal(vec2(l9_180,l9_182),Tweak_N66Layout,Tweak_N66GetStereoViewIndex());
vec4 l9_186=texture(Tweak_N66ArrSC,l9_185,0.0);
vec4 l9_187;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N66)
{
l9_187=mix(Tweak_N66BorderColor,l9_186,vec4(l9_184));
}
#else
{
l9_187=l9_186;
}
#endif
l9_163=l9_187;
}
#else
{
bool l9_188=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N66)!=0)&&(!(int(SC_USE_UV_MIN_MAX_Tweak_N66)!=0));
float l9_189=l9_162.x;
sc_SoftwareWrapEarly(l9_189,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N66,SC_SOFTWARE_WRAP_MODE_V_Tweak_N66).x);
float l9_190=l9_189;
float l9_191=l9_162.y;
sc_SoftwareWrapEarly(l9_191,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N66,SC_SOFTWARE_WRAP_MODE_V_Tweak_N66).y);
float l9_192=l9_191;
vec2 l9_193;
float l9_194;
#if (SC_USE_UV_MIN_MAX_Tweak_N66)
{
bool l9_195;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N66)
{
l9_195=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N66,SC_SOFTWARE_WRAP_MODE_V_Tweak_N66).x==3;
}
#else
{
l9_195=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N66)!=0);
}
#endif
float l9_196=l9_190;
float l9_197=1.0;
sc_ClampUV(l9_196,Tweak_N66UvMinMax.x,Tweak_N66UvMinMax.z,l9_195,l9_197);
float l9_198=l9_196;
float l9_199=l9_197;
bool l9_200;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N66)
{
l9_200=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N66,SC_SOFTWARE_WRAP_MODE_V_Tweak_N66).y==3;
}
#else
{
l9_200=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N66)!=0);
}
#endif
float l9_201=l9_192;
float l9_202=l9_199;
sc_ClampUV(l9_201,Tweak_N66UvMinMax.y,Tweak_N66UvMinMax.w,l9_200,l9_202);
l9_194=l9_202;
l9_193=vec2(l9_198,l9_201);
}
#else
{
l9_194=1.0;
l9_193=vec2(l9_190,l9_192);
}
#endif
vec2 l9_203=sc_TransformUV(l9_193,(int(SC_USE_UV_TRANSFORM_Tweak_N66)!=0),Tweak_N66Transform);
float l9_204=l9_203.x;
float l9_205=l9_194;
sc_SoftwareWrapLate(l9_204,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N66,SC_SOFTWARE_WRAP_MODE_V_Tweak_N66).x,l9_188,l9_205);
float l9_206=l9_203.y;
float l9_207=l9_205;
sc_SoftwareWrapLate(l9_206,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N66,SC_SOFTWARE_WRAP_MODE_V_Tweak_N66).y,l9_188,l9_207);
float l9_208=l9_207;
vec3 l9_209=sc_SamplingCoordsViewToGlobal(vec2(l9_204,l9_206),Tweak_N66Layout,Tweak_N66GetStereoViewIndex());
vec4 l9_210=texture(Tweak_N66,l9_209.xy,0.0);
vec4 l9_211;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N66)
{
l9_211=mix(Tweak_N66BorderColor,l9_210,vec4(l9_208));
}
#else
{
l9_211=l9_210;
}
#endif
l9_163=l9_211;
}
#endif
l9_161=l9_163;
}
else
{
vec4 l9_212;
if (l9_160==1.0)
{
vec2 l9_213;
Node5_Rotate_Coords(((reflect(-l9_0,l9_1)*Port_Input1_N111)+Port_Input1_N112).xy,sc_Time.x*Port_Multiplier_N006,Port_Center_N005,l9_213,l9_4);
vec2 l9_214=l9_213;
vec4 l9_215;
#if (Tweak_N67Layout==2)
{
bool l9_216=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N67)!=0)&&(!(int(SC_USE_UV_MIN_MAX_Tweak_N67)!=0));
float l9_217=l9_214.x;
sc_SoftwareWrapEarly(l9_217,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N67,SC_SOFTWARE_WRAP_MODE_V_Tweak_N67).x);
float l9_218=l9_217;
float l9_219=l9_214.y;
sc_SoftwareWrapEarly(l9_219,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N67,SC_SOFTWARE_WRAP_MODE_V_Tweak_N67).y);
float l9_220=l9_219;
vec2 l9_221;
float l9_222;
#if (SC_USE_UV_MIN_MAX_Tweak_N67)
{
bool l9_223;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N67)
{
l9_223=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N67,SC_SOFTWARE_WRAP_MODE_V_Tweak_N67).x==3;
}
#else
{
l9_223=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N67)!=0);
}
#endif
float l9_224=l9_218;
float l9_225=1.0;
sc_ClampUV(l9_224,Tweak_N67UvMinMax.x,Tweak_N67UvMinMax.z,l9_223,l9_225);
float l9_226=l9_224;
float l9_227=l9_225;
bool l9_228;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N67)
{
l9_228=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N67,SC_SOFTWARE_WRAP_MODE_V_Tweak_N67).y==3;
}
#else
{
l9_228=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N67)!=0);
}
#endif
float l9_229=l9_220;
float l9_230=l9_227;
sc_ClampUV(l9_229,Tweak_N67UvMinMax.y,Tweak_N67UvMinMax.w,l9_228,l9_230);
l9_222=l9_230;
l9_221=vec2(l9_226,l9_229);
}
#else
{
l9_222=1.0;
l9_221=vec2(l9_218,l9_220);
}
#endif
vec2 l9_231=sc_TransformUV(l9_221,(int(SC_USE_UV_TRANSFORM_Tweak_N67)!=0),Tweak_N67Transform);
float l9_232=l9_231.x;
float l9_233=l9_222;
sc_SoftwareWrapLate(l9_232,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N67,SC_SOFTWARE_WRAP_MODE_V_Tweak_N67).x,l9_216,l9_233);
float l9_234=l9_231.y;
float l9_235=l9_233;
sc_SoftwareWrapLate(l9_234,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N67,SC_SOFTWARE_WRAP_MODE_V_Tweak_N67).y,l9_216,l9_235);
float l9_236=l9_235;
vec3 l9_237=sc_SamplingCoordsViewToGlobal(vec2(l9_232,l9_234),Tweak_N67Layout,Tweak_N67GetStereoViewIndex());
vec4 l9_238=texture(Tweak_N67ArrSC,l9_237,0.0);
vec4 l9_239;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N67)
{
l9_239=mix(Tweak_N67BorderColor,l9_238,vec4(l9_236));
}
#else
{
l9_239=l9_238;
}
#endif
l9_215=l9_239;
}
#else
{
bool l9_240=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N67)!=0)&&(!(int(SC_USE_UV_MIN_MAX_Tweak_N67)!=0));
float l9_241=l9_214.x;
sc_SoftwareWrapEarly(l9_241,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N67,SC_SOFTWARE_WRAP_MODE_V_Tweak_N67).x);
float l9_242=l9_241;
float l9_243=l9_214.y;
sc_SoftwareWrapEarly(l9_243,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N67,SC_SOFTWARE_WRAP_MODE_V_Tweak_N67).y);
float l9_244=l9_243;
vec2 l9_245;
float l9_246;
#if (SC_USE_UV_MIN_MAX_Tweak_N67)
{
bool l9_247;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N67)
{
l9_247=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N67,SC_SOFTWARE_WRAP_MODE_V_Tweak_N67).x==3;
}
#else
{
l9_247=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N67)!=0);
}
#endif
float l9_248=l9_242;
float l9_249=1.0;
sc_ClampUV(l9_248,Tweak_N67UvMinMax.x,Tweak_N67UvMinMax.z,l9_247,l9_249);
float l9_250=l9_248;
float l9_251=l9_249;
bool l9_252;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N67)
{
l9_252=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N67,SC_SOFTWARE_WRAP_MODE_V_Tweak_N67).y==3;
}
#else
{
l9_252=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N67)!=0);
}
#endif
float l9_253=l9_244;
float l9_254=l9_251;
sc_ClampUV(l9_253,Tweak_N67UvMinMax.y,Tweak_N67UvMinMax.w,l9_252,l9_254);
l9_246=l9_254;
l9_245=vec2(l9_250,l9_253);
}
#else
{
l9_246=1.0;
l9_245=vec2(l9_242,l9_244);
}
#endif
vec2 l9_255=sc_TransformUV(l9_245,(int(SC_USE_UV_TRANSFORM_Tweak_N67)!=0),Tweak_N67Transform);
float l9_256=l9_255.x;
float l9_257=l9_246;
sc_SoftwareWrapLate(l9_256,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N67,SC_SOFTWARE_WRAP_MODE_V_Tweak_N67).x,l9_240,l9_257);
float l9_258=l9_255.y;
float l9_259=l9_257;
sc_SoftwareWrapLate(l9_258,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N67,SC_SOFTWARE_WRAP_MODE_V_Tweak_N67).y,l9_240,l9_259);
float l9_260=l9_259;
vec3 l9_261=sc_SamplingCoordsViewToGlobal(vec2(l9_256,l9_258),Tweak_N67Layout,Tweak_N67GetStereoViewIndex());
vec4 l9_262=texture(Tweak_N67,l9_261.xy,0.0);
vec4 l9_263;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N67)
{
l9_263=mix(Tweak_N67BorderColor,l9_262,vec4(l9_260));
}
#else
{
l9_263=l9_262;
}
#endif
l9_215=l9_263;
}
#endif
l9_212=l9_215;
}
else
{
vec4 l9_264;
if (l9_160==2.0)
{
vec3 l9_265=(reflect(-l9_0,l9_1)*Port_Input1_N111)+Port_Input1_N112;
vec4 l9_266;
#if (Tweak_N55Layout==2)
{
bool l9_267=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N55)!=0)&&(!(int(SC_USE_UV_MIN_MAX_Tweak_N55)!=0));
float l9_268=l9_265.x;
sc_SoftwareWrapEarly(l9_268,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N55,SC_SOFTWARE_WRAP_MODE_V_Tweak_N55).x);
float l9_269=l9_268;
float l9_270=l9_265.y;
sc_SoftwareWrapEarly(l9_270,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N55,SC_SOFTWARE_WRAP_MODE_V_Tweak_N55).y);
float l9_271=l9_270;
vec2 l9_272;
float l9_273;
#if (SC_USE_UV_MIN_MAX_Tweak_N55)
{
bool l9_274;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N55)
{
l9_274=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N55,SC_SOFTWARE_WRAP_MODE_V_Tweak_N55).x==3;
}
#else
{
l9_274=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N55)!=0);
}
#endif
float l9_275=l9_269;
float l9_276=1.0;
sc_ClampUV(l9_275,Tweak_N55UvMinMax.x,Tweak_N55UvMinMax.z,l9_274,l9_276);
float l9_277=l9_275;
float l9_278=l9_276;
bool l9_279;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N55)
{
l9_279=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N55,SC_SOFTWARE_WRAP_MODE_V_Tweak_N55).y==3;
}
#else
{
l9_279=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N55)!=0);
}
#endif
float l9_280=l9_271;
float l9_281=l9_278;
sc_ClampUV(l9_280,Tweak_N55UvMinMax.y,Tweak_N55UvMinMax.w,l9_279,l9_281);
l9_273=l9_281;
l9_272=vec2(l9_277,l9_280);
}
#else
{
l9_273=1.0;
l9_272=vec2(l9_269,l9_271);
}
#endif
vec2 l9_282=sc_TransformUV(l9_272,(int(SC_USE_UV_TRANSFORM_Tweak_N55)!=0),Tweak_N55Transform);
float l9_283=l9_282.x;
float l9_284=l9_273;
sc_SoftwareWrapLate(l9_283,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N55,SC_SOFTWARE_WRAP_MODE_V_Tweak_N55).x,l9_267,l9_284);
float l9_285=l9_282.y;
float l9_286=l9_284;
sc_SoftwareWrapLate(l9_285,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N55,SC_SOFTWARE_WRAP_MODE_V_Tweak_N55).y,l9_267,l9_286);
float l9_287=l9_286;
vec3 l9_288=sc_SamplingCoordsViewToGlobal(vec2(l9_283,l9_285),Tweak_N55Layout,Tweak_N55GetStereoViewIndex());
vec4 l9_289=texture(Tweak_N55ArrSC,l9_288,0.0);
vec4 l9_290;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N55)
{
l9_290=mix(Tweak_N55BorderColor,l9_289,vec4(l9_287));
}
#else
{
l9_290=l9_289;
}
#endif
l9_266=l9_290;
}
#else
{
bool l9_291=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N55)!=0)&&(!(int(SC_USE_UV_MIN_MAX_Tweak_N55)!=0));
float l9_292=l9_265.x;
sc_SoftwareWrapEarly(l9_292,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N55,SC_SOFTWARE_WRAP_MODE_V_Tweak_N55).x);
float l9_293=l9_292;
float l9_294=l9_265.y;
sc_SoftwareWrapEarly(l9_294,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N55,SC_SOFTWARE_WRAP_MODE_V_Tweak_N55).y);
float l9_295=l9_294;
vec2 l9_296;
float l9_297;
#if (SC_USE_UV_MIN_MAX_Tweak_N55)
{
bool l9_298;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N55)
{
l9_298=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N55,SC_SOFTWARE_WRAP_MODE_V_Tweak_N55).x==3;
}
#else
{
l9_298=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N55)!=0);
}
#endif
float l9_299=l9_293;
float l9_300=1.0;
sc_ClampUV(l9_299,Tweak_N55UvMinMax.x,Tweak_N55UvMinMax.z,l9_298,l9_300);
float l9_301=l9_299;
float l9_302=l9_300;
bool l9_303;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N55)
{
l9_303=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N55,SC_SOFTWARE_WRAP_MODE_V_Tweak_N55).y==3;
}
#else
{
l9_303=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N55)!=0);
}
#endif
float l9_304=l9_295;
float l9_305=l9_302;
sc_ClampUV(l9_304,Tweak_N55UvMinMax.y,Tweak_N55UvMinMax.w,l9_303,l9_305);
l9_297=l9_305;
l9_296=vec2(l9_301,l9_304);
}
#else
{
l9_297=1.0;
l9_296=vec2(l9_293,l9_295);
}
#endif
vec2 l9_306=sc_TransformUV(l9_296,(int(SC_USE_UV_TRANSFORM_Tweak_N55)!=0),Tweak_N55Transform);
float l9_307=l9_306.x;
float l9_308=l9_297;
sc_SoftwareWrapLate(l9_307,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N55,SC_SOFTWARE_WRAP_MODE_V_Tweak_N55).x,l9_291,l9_308);
float l9_309=l9_306.y;
float l9_310=l9_308;
sc_SoftwareWrapLate(l9_309,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N55,SC_SOFTWARE_WRAP_MODE_V_Tweak_N55).y,l9_291,l9_310);
float l9_311=l9_310;
vec3 l9_312=sc_SamplingCoordsViewToGlobal(vec2(l9_307,l9_309),Tweak_N55Layout,Tweak_N55GetStereoViewIndex());
vec4 l9_313=texture(Tweak_N55,l9_312.xy,0.0);
vec4 l9_314;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N55)
{
l9_314=mix(Tweak_N55BorderColor,l9_313,vec4(l9_311));
}
#else
{
l9_314=l9_313;
}
#endif
l9_266=l9_314;
}
#endif
l9_264=l9_266;
}
else
{
l9_264=Port_Default_N008;
}
l9_212=l9_264;
}
l9_161=l9_212;
}
float l9_315=max(pow(1.0-abs(dot(-l9_0,mat3(l9_2,l9_3,l9_1)*Port_Normal_N025)),Port_Exponent_N025),0.0)*Port_Intensity_N025;
float l9_316=((Port_TimeA_N003+Port_TimeTransition_N003)+Port_TimeB_N003)+9.9999997e-05;
vec4 l9_317=mix(l9_6,l9_161,vec4(colorSwitchTransition))+vec4(l9_315*mix(Port_ValueA_N003,Port_ValueB_N003,smoothstep(Port_TimeA_N003/l9_316,1.0-(Port_TimeB_N003/l9_316),abs((mod((sc_Time.x/l9_316)+Port_TimeBias_N003,1.0)*2.0)-1.0))));
vec4 l9_318=vec4(l9_317.x,l9_317.y,l9_317.z,vec4(0.0).w);
l9_318.w=(clamp((((smoothstep(Port_Input0_N058,Port_Input1_N058,varTex01.y)*Tweak_N57)+Port_Input1_N045)+l9_315)+0.001,Port_Input1_N046+0.001,Port_Input2_N046+0.001)-0.001)*opacity;
vec4 l9_319=clamp(l9_318+vec4(0.001),Port_Input1_N118+vec4(0.001),Port_Input2_N118+vec4(0.001))-vec4(0.001);
float l9_320=l9_319.w;
#if (sc_BlendMode_AlphaTest)
{
if (l9_320<alphaTestThreshold)
{
discard;
}
}
#endif
#if (ENABLE_STIPPLE_PATTERN_TEST)
{
if (l9_320<((mod(dot(floor(mod(gl_FragCoord.xy,vec2(4.0))),vec2(4.0,1.0))*9.0,16.0)+1.0)/17.0))
{
discard;
}
}
#endif
vec4 l9_321;
#if (sc_ProjectiveShadowsCaster)
{
float l9_322;
#if (((sc_BlendMode_Normal||sc_BlendMode_AlphaToCoverage)||sc_BlendMode_PremultipliedAlphaHardware)||sc_BlendMode_PremultipliedAlphaAuto)
{
l9_322=l9_320;
}
#else
{
float l9_323;
#if (sc_BlendMode_PremultipliedAlpha)
{
l9_323=clamp(l9_320*2.0,0.0,1.0);
}
#else
{
float l9_324;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_324=clamp(dot(l9_319.xyz,vec3(l9_320)),0.0,1.0);
}
#else
{
float l9_325;
#if (sc_BlendMode_AlphaTest)
{
l9_325=1.0;
}
#else
{
float l9_326;
#if (sc_BlendMode_Multiply)
{
l9_326=(1.0-dot(l9_319.xyz,vec3(0.33333001)))*l9_320;
}
#else
{
float l9_327;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_327=(1.0-clamp(dot(l9_319.xyz,vec3(1.0)),0.0,1.0))*l9_320;
}
#else
{
float l9_328;
#if (sc_BlendMode_ColoredGlass)
{
l9_328=clamp(dot(l9_319.xyz,vec3(1.0)),0.0,1.0)*l9_320;
}
#else
{
float l9_329;
#if (sc_BlendMode_Add)
{
l9_329=clamp(dot(l9_319.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_330;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_330=clamp(dot(l9_319.xyz,vec3(1.0)),0.0,1.0)*l9_320;
}
#else
{
float l9_331;
#if (sc_BlendMode_Screen)
{
l9_331=dot(l9_319.xyz,vec3(0.33333001))*l9_320;
}
#else
{
float l9_332;
#if (sc_BlendMode_Min)
{
l9_332=1.0-clamp(dot(l9_319.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_333;
#if (sc_BlendMode_Max)
{
l9_333=clamp(dot(l9_319.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
l9_333=1.0;
}
#endif
l9_332=l9_333;
}
#endif
l9_331=l9_332;
}
#endif
l9_330=l9_331;
}
#endif
l9_329=l9_330;
}
#endif
l9_328=l9_329;
}
#endif
l9_327=l9_328;
}
#endif
l9_326=l9_327;
}
#endif
l9_325=l9_326;
}
#endif
l9_324=l9_325;
}
#endif
l9_323=l9_324;
}
#endif
l9_322=l9_323;
}
#endif
l9_321=vec4(mix(sc_ShadowColor.xyz,sc_ShadowColor.xyz*l9_319.xyz,vec3(sc_ShadowColor.w)),sc_ShadowDensity*l9_322);
}
#else
{
vec4 l9_334;
#if (sc_RenderAlphaToColor)
{
l9_334=vec4(l9_320);
}
#else
{
vec4 l9_335;
#if (sc_BlendMode_Custom)
{
vec4 l9_336;
#if (sc_FramebufferFetch)
{
l9_336=sc_readFragData0_Platform();
}
#else
{
vec2 l9_337=sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw);
vec4 l9_338;
#if (sc_ScreenTextureLayout==2)
{
l9_338=texture(sc_ScreenTextureArrSC,sc_SamplingCoordsViewToGlobal(l9_337,sc_ScreenTextureLayout,sc_ScreenTextureGetStereoViewIndex()),0.0);
}
#else
{
l9_338=texture(sc_ScreenTexture,sc_SamplingCoordsViewToGlobal(l9_337,sc_ScreenTextureLayout,sc_ScreenTextureGetStereoViewIndex()).xy,0.0);
}
#endif
l9_336=l9_338;
}
#endif
vec3 l9_339=mix(l9_336.xyz,definedBlend(l9_336.xyz,l9_319.xyz).xyz,vec3(l9_320));
vec4 l9_340=vec4(l9_339.x,l9_339.y,l9_339.z,vec4(0.0).w);
l9_340.w=1.0;
l9_335=l9_340;
}
#else
{
vec4 l9_341;
#if (sc_Voxelization)
{
l9_341=vec4(varScreenPos.xyz,1.0);
}
#else
{
vec4 l9_342;
#if (sc_OutputBounds)
{
float l9_343=clamp(abs(gl_FragCoord.z),0.0,1.0);
l9_342=vec4(l9_343,1.0-l9_343,1.0,1.0);
}
#else
{
vec4 l9_344;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_344=vec4(mix(vec3(1.0),l9_319.xyz,vec3(l9_320)),l9_320);
}
#else
{
vec4 l9_345;
#if (sc_BlendMode_Screen||sc_BlendMode_PremultipliedAlphaAuto)
{
float l9_346;
#if (sc_BlendMode_PremultipliedAlphaAuto)
{
l9_346=clamp(l9_320,0.0,1.0);
}
#else
{
l9_346=l9_320;
}
#endif
l9_345=vec4(l9_319.xyz*l9_346,l9_346);
}
#else
{
l9_345=l9_319;
}
#endif
l9_344=l9_345;
}
#endif
l9_342=l9_344;
}
#endif
l9_341=l9_342;
}
#endif
l9_335=l9_341;
}
#endif
l9_334=l9_335;
}
#endif
l9_321=l9_334;
}
#endif
vec4 l9_347;
if (PreviewEnabled==1)
{
vec4 l9_348;
if (((PreviewVertexSaved*1.0)!=0.0) ? true : false)
{
l9_348=PreviewVertexColor;
}
else
{
l9_348=vec4(0.0);
}
l9_347=l9_348;
}
else
{
l9_347=l9_321;
}
vec4 l9_349=sc_OutputMotionVectorIfNeeded(max(l9_347,vec4(0.0)));
vec4 l9_350=clamp(l9_349,vec4(0.0),vec4(1.0));
#if (sc_OITDepthBoundsPass)
{
#if (sc_OITDepthBoundsPass)
{
float l9_351=clamp(viewSpaceDepth()/1000.0,0.0,1.0);
sc_writeFragData0Internal(vec4(max(0.0,1.0-(l9_351-0.0039215689)),min(1.0,l9_351+0.0039215689),0.0,0.0),sc_UniformConstants.x,sc_ShaderCacheConstant);
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
vec2 l9_352=sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture(sc_OITFrontDepthTexture,l9_352).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_353=encodeDepth(viewSpaceDepth(),texture(sc_OITFilteredDepthBoundsTexture,l9_352).xy);
float l9_354=packValue(l9_353);
int l9_361=int(l9_350.w*255.0);
float l9_362=packValue(l9_361);
sc_writeFragData0Internal(vec4(packValue(l9_353),packValue(l9_353),packValue(l9_353),packValue(l9_353)),sc_UniformConstants.x,sc_ShaderCacheConstant);
sc_writeFragData1(vec4(l9_354,packValue(l9_353),packValue(l9_353),packValue(l9_353)));
sc_writeFragData2(vec4(l9_362,packValue(l9_361),packValue(l9_361),packValue(l9_361)));
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
vec2 l9_365=sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture(sc_OITFrontDepthTexture,l9_365).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_366[8];
int l9_367[8];
int l9_368=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_368<8)
{
l9_366[l9_368]=0;
l9_367[l9_368]=0;
l9_368++;
continue;
}
else
{
break;
}
}
int l9_369;
#if (sc_OITMaxLayers8)
{
l9_369=2;
}
#else
{
l9_369=1;
}
#endif
int l9_370=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_370<l9_369)
{
vec4 l9_371;
vec4 l9_372;
vec4 l9_373;
if (l9_370==0)
{
l9_373=texture(sc_OITAlpha0,l9_365);
l9_372=texture(sc_OITDepthLow0,l9_365);
l9_371=texture(sc_OITDepthHigh0,l9_365);
}
else
{
l9_373=vec4(0.0);
l9_372=vec4(0.0);
l9_371=vec4(0.0);
}
vec4 l9_374;
vec4 l9_375;
vec4 l9_376;
if (l9_370==1)
{
l9_376=texture(sc_OITAlpha1,l9_365);
l9_375=texture(sc_OITDepthLow1,l9_365);
l9_374=texture(sc_OITDepthHigh1,l9_365);
}
else
{
l9_376=l9_373;
l9_375=l9_372;
l9_374=l9_371;
}
if (any(notEqual(l9_374,vec4(0.0)))||any(notEqual(l9_375,vec4(0.0))))
{
int l9_377[8]=l9_366;
unpackValues(l9_374.w,l9_370,l9_377);
unpackValues(l9_374.z,l9_370,l9_377);
unpackValues(l9_374.y,l9_370,l9_377);
unpackValues(l9_374.x,l9_370,l9_377);
unpackValues(l9_375.w,l9_370,l9_377);
unpackValues(l9_375.z,l9_370,l9_377);
unpackValues(l9_375.y,l9_370,l9_377);
unpackValues(l9_375.x,l9_370,l9_377);
int l9_386[8]=l9_367;
unpackValues(l9_376.w,l9_370,l9_386);
unpackValues(l9_376.z,l9_370,l9_386);
unpackValues(l9_376.y,l9_370,l9_386);
unpackValues(l9_376.x,l9_370,l9_386);
}
l9_370++;
continue;
}
else
{
break;
}
}
vec4 l9_391=texture(sc_OITFilteredDepthBoundsTexture,l9_365);
vec2 l9_392=l9_391.xy;
int l9_393;
#if (sc_SkinBonesCount>0)
{
l9_393=encodeDepth(((1.0-l9_391.x)*1000.0)+getDepthOrderingEpsilon(),l9_392);
}
#else
{
l9_393=0;
}
#endif
int l9_394=encodeDepth(viewSpaceDepth(),l9_392);
vec4 l9_395;
l9_395=l9_350*l9_350.w;
vec4 l9_396;
int l9_397=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_397<8)
{
int l9_398=l9_366[l9_397];
int l9_399=l9_394-l9_393;
bool l9_400=l9_398<l9_399;
bool l9_401;
if (l9_400)
{
l9_401=l9_366[l9_397]>0;
}
else
{
l9_401=l9_400;
}
if (l9_401)
{
vec3 l9_402=l9_395.xyz*(1.0-(float(l9_367[l9_397])/255.0));
l9_396=vec4(l9_402.x,l9_402.y,l9_402.z,l9_395.w);
}
else
{
l9_396=l9_395;
}
l9_395=l9_396;
l9_397++;
continue;
}
else
{
break;
}
}
sc_writeFragData0Internal(l9_395,sc_UniformConstants.x,sc_ShaderCacheConstant);
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
sc_writeFragData0Internal(l9_350,sc_UniformConstants.x,sc_ShaderCacheConstant);
}
#endif
}
#else
{
sc_writeFragData0Internal(l9_349,sc_UniformConstants.x,sc_ShaderCacheConstant);
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
