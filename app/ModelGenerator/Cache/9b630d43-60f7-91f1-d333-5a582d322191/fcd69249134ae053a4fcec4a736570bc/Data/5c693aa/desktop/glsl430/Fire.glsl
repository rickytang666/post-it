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
//attribute vec2 texture3 19
//attribute vec3 positionNext 15
//attribute vec3 positionPrevious 16
//attribute vec4 strandProperties 17
//sampler sampler Tweak_N14SmpSC 0:16
//sampler sampler intensityTextureSmpSC 0:17
//sampler sampler sc_OITCommonSampler 0:20
//sampler sampler sc_ScreenTextureSmpSC 0:22
//texture texture2D Tweak_N14 0:0:0:16
//texture texture2D intensityTexture 0:1:0:17
//texture texture2D sc_OITAlpha0 0:4:0:20
//texture texture2D sc_OITAlpha1 0:5:0:20
//texture texture2D sc_OITDepthHigh0 0:6:0:20
//texture texture2D sc_OITDepthHigh1 0:7:0:20
//texture texture2D sc_OITDepthLow0 0:8:0:20
//texture texture2D sc_OITDepthLow1 0:9:0:20
//texture texture2D sc_OITFilteredDepthBoundsTexture 0:10:0:20
//texture texture2D sc_OITFrontDepthTexture 0:11:0:20
//texture texture2D sc_ScreenTexture 0:13:0:22
//texture texture2DArray Tweak_N14ArrSC 0:25:0:16
//texture texture2DArray intensityTextureArrSC 0:26:0:17
//texture texture2DArray sc_ScreenTextureArrSC 0:29:0:22
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
//spec_const bool SC_USE_CLAMP_TO_BORDER_Tweak_N14 31 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 32 0
//spec_const bool SC_USE_UV_MIN_MAX_Tweak_N14 33 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 34 0
//spec_const bool SC_USE_UV_TRANSFORM_Tweak_N14 35 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 36 0
//spec_const bool Tweak_N14HasSwappedViews 37 0
//spec_const bool UseViewSpaceDepthVariant 38 1
//spec_const bool intensityTextureHasSwappedViews 39 0
//spec_const bool sc_BlendMode_Add 40 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 41 0
//spec_const bool sc_BlendMode_AlphaTest 42 0
//spec_const bool sc_BlendMode_AlphaToCoverage 43 0
//spec_const bool sc_BlendMode_ColoredGlass 44 0
//spec_const bool sc_BlendMode_Custom 45 0
//spec_const bool sc_BlendMode_Max 46 0
//spec_const bool sc_BlendMode_Min 47 0
//spec_const bool sc_BlendMode_Multiply 48 0
//spec_const bool sc_BlendMode_MultiplyOriginal 49 0
//spec_const bool sc_BlendMode_Normal 50 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 51 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 52 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 53 0
//spec_const bool sc_BlendMode_Screen 54 0
//spec_const bool sc_DepthOnly 55 0
//spec_const bool sc_FramebufferFetch 56 0
//spec_const bool sc_MotionVectorsPass 57 0
//spec_const bool sc_OITCompositingPass 58 0
//spec_const bool sc_OITDepthBoundsPass 59 0
//spec_const bool sc_OITDepthGatherPass 60 0
//spec_const bool sc_OITDepthPrepass 61 0
//spec_const bool sc_OITFrontLayerPass 62 0
//spec_const bool sc_OITMaxLayers4Plus1 63 0
//spec_const bool sc_OITMaxLayers8 64 0
//spec_const bool sc_OITMaxLayersVisualizeLayerCount 65 0
//spec_const bool sc_OutputBounds 66 0
//spec_const bool sc_ProjectiveShadowsCaster 67 0
//spec_const bool sc_ProjectiveShadowsReceiver 68 0
//spec_const bool sc_RenderAlphaToColor 69 0
//spec_const bool sc_ScreenTextureHasSwappedViews 70 0
//spec_const bool sc_TAAEnabled 71 0
//spec_const bool sc_VertexBlending 72 0
//spec_const bool sc_VertexBlendingUseNormals 73 0
//spec_const bool sc_Voxelization 74 0
//spec_const int SC_DEVICE_CLASS 75 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_Tweak_N14 76 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 77 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_Tweak_N14 78 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 79 -1
//spec_const int Tweak_N14Layout 80 0
//spec_const int intensityTextureLayout 81 0
//spec_const int sc_DepthBufferMode 82 0
//spec_const int sc_RenderingSpace 83 -1
//spec_const int sc_ScreenTextureLayout 84 0
//spec_const int sc_ShaderCacheConstant 85 0
//spec_const int sc_SkinBonesCount 86 0
//spec_const int sc_StereoRenderingMode 87 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 88 0
//spec_const int sc_StereoViewID 89 0
//SG_REFLECTION_END
#define SC_ENABLE_INSTANCED_RENDERING
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
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
vec3 SurfacePosition_ObjectSpace;
vec4 VertexColor;
vec2 UVCoord3;
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
uniform float noise_freq;
uniform float fire_scale;
uniform float range;
uniform float Port_Input1_N019;
uniform float Port_Multiplier_N024;
uniform float Port_Input1_N034;
uniform float Port_Input1_N032;
uniform float Port_Value1_N031;
uniform float Port_Input1_N060;
uniform float Port_Input1_N029;
uniform float Port_RangeMinA_N035;
uniform float Port_RangeMaxA_N035;
uniform float Port_Input1_N056;
uniform float Port_RangeMinA_N038;
uniform float Port_RangeMaxA_N038;
uniform float Port_Input1_N054;
uniform float Port_RangeMinA_N040;
uniform float Port_RangeMaxA_N040;
uniform float Port_Input1_N050;
uniform vec4 sc_Time;
uniform float Port_Input1_N009;
uniform float Port_Input1_N007;
uniform float Port_Value2_N059;
uniform float Port_Value3_N059;
uniform vec4 Port_Default_N017;
uniform float Port_Input0_N006;
uniform float Port_Input1_N006;
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
in vec2 texture3;
out vec2 Interpolator_UVCoord3;
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
void Node17_Switch(float Switch,vec4 Value0,vec4 Value1,vec4 Value2,vec4 Default,out vec4 Result,ssGlobals Globals)
{
Switch=floor((Globals.VertexColor.x*Port_Input1_N019)+0.5);
Switch=floor(Switch);
if (Switch==0.0)
{
float l9_0=floor((Globals.VertexColor.x*Port_Input1_N019)+0.5);
float l9_1=(l9_0+(fire_scale*Port_Input1_N060))*Port_Input1_N029;
float l9_2=((((floor(((snoise(vec2(floor(((Globals.gTimeElapsed*Port_Multiplier_N024)+(l9_0+Port_Input1_N034))*10000.0)*9.9999997e-05)*(vec2(Port_Value1_N031,noise_freq*Port_Input1_N032)*0.5))*0.5)+0.5)*10000.0)*9.9999997e-05)-Port_RangeMinA_N035)/((Port_RangeMaxA_N035-Port_RangeMinA_N035)+1e-06))*((l9_1+range)-l9_1))+l9_1;
float l9_3=1.0-(l9_2*Port_Input1_N056);
Value0=vec4(l9_3,l9_2,l9_3,0.0);
Result=Value0;
}
else
{
if (Switch==1.0)
{
float l9_4=floor((Globals.VertexColor.x*Port_Input1_N019)+0.5);
float l9_5=(l9_4+(fire_scale*Port_Input1_N060))*Port_Input1_N029;
float l9_6=((((floor(((snoise(vec2(floor(((Globals.gTimeElapsed*Port_Multiplier_N024)+(l9_4+Port_Input1_N034))*10000.0)*9.9999997e-05)*(vec2(Port_Value1_N031,noise_freq*Port_Input1_N032)*0.5))*0.5)+0.5)*10000.0)*9.9999997e-05)-Port_RangeMinA_N038)/((Port_RangeMaxA_N038-Port_RangeMinA_N038)+1e-06))*((l9_5+range)-l9_5))+l9_5;
float l9_7=1.0-(l9_6*Port_Input1_N054);
Value1=vec4(l9_7,l9_6,l9_7,0.0);
Result=Value1;
}
else
{
if (Switch==2.0)
{
float l9_8=floor((Globals.VertexColor.x*Port_Input1_N019)+0.5);
float l9_9=(l9_8+(fire_scale*Port_Input1_N060))*Port_Input1_N029;
float l9_10=((((floor(((snoise(vec2(floor(((Globals.gTimeElapsed*Port_Multiplier_N024)+(l9_8+Port_Input1_N034))*10000.0)*9.9999997e-05)*(vec2(Port_Value1_N031,noise_freq*Port_Input1_N032)*0.5))*0.5)+0.5)*10000.0)*9.9999997e-05)-Port_RangeMinA_N040)/((Port_RangeMaxA_N040-Port_RangeMinA_N040)+1e-06))*((l9_9+range)-l9_9))+l9_9;
float l9_11=1.0-(l9_10*Port_Input1_N050);
Value2=vec4(l9_11,l9_10,l9_11,0.0);
Result=Value2;
}
else
{
Result=Default;
}
}
}
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
int l9_0=sc_GetLocalInstanceIDInternal(sc_FallbackInstanceID);
sc_Vertex_t l9_1=sc_Vertex_t(position,normal,tangent.xyz,texture0,texture1);
sc_BlendVertex(l9_1);
sc_SkinVertex(l9_1);
#if (sc_RenderingSpace==3)
{
varPosAndMotion=vec4(vec3(0.0).x,vec3(0.0).y,vec3(0.0).z,varPosAndMotion.w);
varNormalAndMotion=vec4(l9_1.normal.x,l9_1.normal.y,l9_1.normal.z,varNormalAndMotion.w);
varTangent=vec4(l9_1.tangent.x,l9_1.tangent.y,l9_1.tangent.z,varTangent.w);
}
#else
{
#if (sc_RenderingSpace==4)
{
varPosAndMotion=vec4(vec3(0.0).x,vec3(0.0).y,vec3(0.0).z,varPosAndMotion.w);
varNormalAndMotion=vec4(l9_1.normal.x,l9_1.normal.y,l9_1.normal.z,varNormalAndMotion.w);
varTangent=vec4(l9_1.tangent.x,l9_1.tangent.y,l9_1.tangent.z,varTangent.w);
}
#else
{
#if (sc_RenderingSpace==2)
{
varPosAndMotion=vec4(l9_1.position.x,l9_1.position.y,l9_1.position.z,varPosAndMotion.w);
varNormalAndMotion=vec4(l9_1.normal.x,l9_1.normal.y,l9_1.normal.z,varNormalAndMotion.w);
varTangent=vec4(l9_1.tangent.x,l9_1.tangent.y,l9_1.tangent.z,varTangent.w);
}
#else
{
#if (sc_RenderingSpace==1)
{
vec4 l9_2=sc_ModelMatrix*l9_1.position;
varPosAndMotion=vec4(l9_2.x,l9_2.y,l9_2.z,varPosAndMotion.w);
vec3 l9_3=sc_NormalMatrix*l9_1.normal;
varNormalAndMotion=vec4(l9_3.x,l9_3.y,l9_3.z,varNormalAndMotion.w);
vec3 l9_4=sc_NormalMatrix*l9_1.tangent;
varTangent=vec4(l9_4.x,l9_4.y,l9_4.z,varTangent.w);
}
#endif
}
#endif
}
#endif
}
#endif
bool l9_5=PreviewEnabled==1;
vec2 l9_6;
if (l9_5)
{
vec2 l9_7=l9_1.texture0;
l9_7.x=1.0-l9_1.texture0.x;
l9_6=l9_7;
}
else
{
l9_6=l9_1.texture0;
}
varColor=color;
vec3 l9_8=(sc_ModelMatrixInverse*vec4(varPosAndMotion.xyz,1.0)).xyz;
vec4 param_5;
Node17_Switch(0.0,vec4(0.0),vec4(0.0),vec4(0.0),Port_Default_N017,param_5,ssGlobals(sc_Time.x,sc_Time.y,0.0,l9_8,varColor,texture3));
vec3 l9_9;
vec3 l9_10;
vec3 l9_11;
if (l9_5)
{
l9_11=varTangent.xyz;
l9_10=varNormalAndMotion.xyz;
l9_9=varPosAndMotion.xyz;
}
else
{
l9_11=varTangent.xyz;
l9_10=varNormalAndMotion.xyz;
l9_9=(sc_ModelMatrix*vec4(((l9_8*vec3((float(l9_0)*Port_Input1_N009)+Port_Input1_N007,Port_Value2_N059,Port_Value3_N059))*param_5.xyz)*vec3(smoothstep(Port_Input0_N006,Port_Input1_N006,fire_scale)),1.0)).xyz;
}
varPosAndMotion=vec4(l9_9.x,l9_9.y,l9_9.z,varPosAndMotion.w);
vec3 l9_12=normalize(l9_10);
varNormalAndMotion=vec4(l9_12.x,l9_12.y,l9_12.z,varNormalAndMotion.w);
vec3 l9_13=normalize(l9_11);
varTangent=vec4(l9_13.x,l9_13.y,l9_13.z,varTangent.w);
varTangent.w=tangent.w;
#if (UseViewSpaceDepthVariant&&((sc_OITDepthGatherPass||sc_OITCompositingPass)||sc_OITDepthBoundsPass))
{
vec4 l9_14;
#if (sc_RenderingSpace==3)
{
l9_14=sc_ProjectionMatrixInverseArray[sc_GetStereoViewIndex()]*l9_1.position;
}
#else
{
vec4 l9_15;
#if (sc_RenderingSpace==2)
{
l9_15=sc_ViewMatrixArray[sc_GetStereoViewIndex()]*l9_1.position;
}
#else
{
vec4 l9_16;
#if (sc_RenderingSpace==1)
{
l9_16=sc_ModelViewMatrixArray[sc_GetStereoViewIndex()]*l9_1.position;
}
#else
{
l9_16=l9_1.position;
}
#endif
l9_15=l9_16;
}
#endif
l9_14=l9_15;
}
#endif
varViewSpaceDepth=-l9_14.z;
}
#endif
vec4 l9_17;
#if (sc_RenderingSpace==3)
{
l9_17=l9_1.position;
}
#else
{
vec4 l9_18;
#if (sc_RenderingSpace==4)
{
l9_18=(sc_ModelViewMatrixArray[sc_GetStereoViewIndex()]*l9_1.position)*vec4(1.0/sc_Camera.aspect,1.0,1.0,1.0);
}
#else
{
vec4 l9_19;
#if (sc_RenderingSpace==2)
{
l9_19=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(varPosAndMotion.xyz,1.0);
}
#else
{
vec4 l9_20;
#if (sc_RenderingSpace==1)
{
l9_20=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(varPosAndMotion.xyz,1.0);
}
#else
{
l9_20=vec4(0.0);
}
#endif
l9_19=l9_20;
}
#endif
l9_18=l9_19;
}
#endif
l9_17=l9_18;
}
#endif
varTex01=vec4(l9_6,l9_1.texture1);
#if (sc_ProjectiveShadowsReceiver)
{
vec4 l9_21;
#if (sc_RenderingSpace==1)
{
l9_21=sc_ModelMatrix*l9_1.position;
}
#else
{
l9_21=l9_1.position;
}
#endif
vec4 l9_22=sc_ProjectorMatrix*l9_21;
varShadowTex=((l9_22.xy/vec2(l9_22.w))*0.5)+vec2(0.5);
}
#endif
vec4 l9_23;
#if (sc_DepthBufferMode==1)
{
vec4 l9_24;
if (sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][2].w!=0.0)
{
vec4 l9_25=l9_17;
l9_25.z=((log2(max(sc_Camera.clipPlanes.x,1.0+l9_17.w))*(2.0/log2(sc_Camera.clipPlanes.y+1.0)))-1.0)*l9_17.w;
l9_24=l9_25;
}
else
{
l9_24=l9_17;
}
l9_23=l9_24;
}
#else
{
l9_23=l9_17;
}
#endif
vec4 l9_26;
#if (sc_TAAEnabled)
{
vec2 l9_27=l9_23.xy+(sc_TAAJitterOffset*l9_23.w);
l9_26=vec4(l9_27.x,l9_27.y,l9_23.z,l9_23.w);
}
#else
{
l9_26=l9_23;
}
#endif
sc_SetClipPosition(l9_26);
#if (sc_Voxelization)
{
sc_Vertex_t l9_28=sc_Vertex_t(l9_1.position,l9_1.normal,l9_1.tangent,l9_6,l9_1.texture1);
sc_BlendVertex(l9_28);
sc_SkinVertex(l9_28);
int l9_29=sc_GetLocalInstanceIDInternal(sc_FallbackInstanceID);
int l9_30=int(voxelization_params_0.w);
vec4 l9_31=createVoxelOrthoMatrix(voxelization_params_frustum_lrbt.x,voxelization_params_frustum_lrbt.y,voxelization_params_frustum_lrbt.z,voxelization_params_frustum_lrbt.w,voxelization_params_frustum_nf.x,voxelization_params_frustum_nf.y)*vec4(((sc_ModelMatrixVoxelization*l9_28.position).xyz+vec3(float(l9_29%l9_30)*voxelization_params_0.y,float(l9_29/l9_30)*voxelization_params_0.y,(float(l9_29)*(voxelization_params_0.y/voxelization_params_0.z))+voxelization_params_frustum_nf.x))-voxelization_params_camera_pos,1.0);
l9_31.w=1.0;
varScreenPos=l9_31;
sc_SetClipPosition(l9_31*1.0);
}
#else
{
#if (sc_OutputBounds)
{
sc_Vertex_t l9_32=sc_Vertex_t(l9_1.position,l9_1.normal,l9_1.tangent,l9_6,l9_1.texture1);
sc_BlendVertex(l9_32);
sc_SkinVertex(l9_32);
vec2 l9_33=((l9_32.position.xy/vec2(l9_32.position.w))*0.5)+vec2(0.5);
varTex01=vec4(l9_33.x,l9_33.y,varTex01.z,varTex01.w);
vec4 l9_34=sc_ModelMatrixVoxelization*l9_32.position;
vec3 l9_35=l9_34.xyz-voxelization_params_camera_pos;
varPosAndMotion=vec4(l9_35.x,l9_35.y,l9_35.z,varPosAndMotion.w);
vec3 l9_36=normalize(l9_32.normal);
varNormalAndMotion=vec4(l9_36.x,l9_36.y,l9_36.z,varNormalAndMotion.w);
vec4 l9_37=createVoxelOrthoMatrix(voxelization_params_frustum_lrbt.x,voxelization_params_frustum_lrbt.y,voxelization_params_frustum_lrbt.z,voxelization_params_frustum_lrbt.w,voxelization_params_frustum_nf.x,voxelization_params_frustum_nf.y)*vec4(l9_35.x,l9_35.y,l9_35.z,l9_34.w);
vec4 l9_38=vec4(l9_37.x,l9_37.y,l9_37.z,vec4(0.0).w);
l9_38.w=1.0;
varScreenPos=l9_38;
sc_SetClipPosition(l9_38*1.0);
}
#endif
}
#endif
Interpolator_UVCoord3=texture3;
vec4 l9_39=varPosAndMotion;
#if (sc_MotionVectorsPass)
{
vec4 l9_40=vec4(l9_39.xyz,1.0);
#if (sc_MotionVectorsPass)
{
vec4 l9_41=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*l9_40;
vec4 l9_42=sc_PrevFrameViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(((sc_PrevFrameModelMatrix*sc_ModelMatrixInverse)*l9_40).xyz,1.0);
vec2 l9_43=((l9_41.xy/vec2(l9_41.w)).xy-(l9_42.xy/vec2(l9_42.w)).xy)*0.5;
varPosAndMotion.w=l9_43.x;
varNormalAndMotion.w=l9_43.y;
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
#ifndef Tweak_N14HasSwappedViews
#define Tweak_N14HasSwappedViews 0
#elif Tweak_N14HasSwappedViews==1
#undef Tweak_N14HasSwappedViews
#define Tweak_N14HasSwappedViews 1
#endif
#ifndef Tweak_N14Layout
#define Tweak_N14Layout 0
#endif
#ifndef sc_DepthOnly
#define sc_DepthOnly 0
#elif sc_DepthOnly==1
#undef sc_DepthOnly
#define sc_DepthOnly 1
#endif
#ifndef SC_USE_UV_TRANSFORM_Tweak_N14
#define SC_USE_UV_TRANSFORM_Tweak_N14 0
#elif SC_USE_UV_TRANSFORM_Tweak_N14==1
#undef SC_USE_UV_TRANSFORM_Tweak_N14
#define SC_USE_UV_TRANSFORM_Tweak_N14 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_Tweak_N14
#define SC_SOFTWARE_WRAP_MODE_U_Tweak_N14 -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_Tweak_N14
#define SC_SOFTWARE_WRAP_MODE_V_Tweak_N14 -1
#endif
#ifndef SC_USE_UV_MIN_MAX_Tweak_N14
#define SC_USE_UV_MIN_MAX_Tweak_N14 0
#elif SC_USE_UV_MIN_MAX_Tweak_N14==1
#undef SC_USE_UV_MIN_MAX_Tweak_N14
#define SC_USE_UV_MIN_MAX_Tweak_N14 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_Tweak_N14
#define SC_USE_CLAMP_TO_BORDER_Tweak_N14 0
#elif SC_USE_CLAMP_TO_BORDER_Tweak_N14==1
#undef SC_USE_CLAMP_TO_BORDER_Tweak_N14
#define SC_USE_CLAMP_TO_BORDER_Tweak_N14 1
#endif
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
uniform int PreviewEnabled;
uniform int PreviewNodeID;
uniform float Port_Input1_N019;
uniform vec4 Port_Value0_N010;
uniform float Port_Position1_N010;
uniform vec4 Port_Value1_N010;
uniform vec4 Port_Value2_N010;
uniform vec4 Port_Value0_N043;
uniform float Port_Position1_N043;
uniform vec4 Port_Value1_N043;
uniform vec4 Port_Value2_N043;
uniform vec4 Port_Value0_N044;
uniform float Port_Position1_N044;
uniform vec4 Port_Value1_N044;
uniform vec4 Port_Value2_N044;
uniform vec4 sc_Time;
uniform vec4 Port_Default_N042;
uniform float Port_Rotation_N012;
uniform vec2 Port_Center_N012;
uniform vec4 Port_Value0_N049;
uniform float Port_Position1_N049;
uniform vec4 Port_Value1_N049;
uniform vec4 Port_Value2_N049;
uniform float Port_Speed_N013;
uniform vec2 Port_Direction_N013;
uniform mat3 Tweak_N14Transform;
uniform vec4 Tweak_N14UvMinMax;
uniform vec4 Tweak_N14BorderColor;
uniform float Port_Value2_N001;
uniform sampler2D Tweak_N14;
uniform sampler2DArray Tweak_N14ArrSC;
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
in vec4 varColor;
in vec2 Interpolator_UVCoord3;
in vec4 varTangent;
in vec4 varTex01;
in vec2 varScreenTexturePos;
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
int Tweak_N14GetStereoViewIndex()
{
int l9_0;
#if (Tweak_N14HasSwappedViews)
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
bool l9_0=((PreviewVertexSaved*1.0)!=0.0) ? true : false;
float l9_1=floor(floor((varColor.x*Port_Input1_N019)+0.5));
vec4 l9_2;
bool l9_3;
vec4 l9_4;
if (l9_1==0.0)
{
float l9_5=clamp(Interpolator_UVCoord3.y,0.0,1.0);
vec4 l9_6;
if (l9_5<Port_Position1_N010)
{
l9_6=mix(Port_Value0_N010,Port_Value1_N010,vec4(clamp(l9_5/Port_Position1_N010,0.0,1.0)));
}
else
{
l9_6=mix(Port_Value1_N010,Port_Value2_N010,vec4(clamp((l9_5-Port_Position1_N010)/(1.0-Port_Position1_N010),0.0,1.0)));
}
bool l9_7=PreviewEnabled==1;
bool l9_8;
if (l9_7)
{
l9_8=!l9_0;
}
else
{
l9_8=l9_7;
}
bool l9_9;
vec4 l9_10;
if (l9_8&&(10==PreviewNodeID))
{
vec4 l9_11=l9_6;
l9_11.w=1.0;
l9_10=l9_11;
l9_9=true;
}
else
{
l9_10=PreviewVertexColor;
l9_9=l9_0;
}
l9_4=l9_10;
l9_3=l9_9;
l9_2=l9_6;
}
else
{
vec4 l9_12;
bool l9_13;
vec4 l9_14;
if (l9_1==1.0)
{
float l9_15=clamp(Interpolator_UVCoord3.y,0.0,1.0);
vec4 l9_16;
if (l9_15<Port_Position1_N043)
{
l9_16=mix(Port_Value0_N043,Port_Value1_N043,vec4(clamp(l9_15/Port_Position1_N043,0.0,1.0)));
}
else
{
l9_16=mix(Port_Value1_N043,Port_Value2_N043,vec4(clamp((l9_15-Port_Position1_N043)/(1.0-Port_Position1_N043),0.0,1.0)));
}
bool l9_17=PreviewEnabled==1;
bool l9_18;
if (l9_17)
{
l9_18=!l9_0;
}
else
{
l9_18=l9_17;
}
bool l9_19;
vec4 l9_20;
if (l9_18&&(43==PreviewNodeID))
{
vec4 l9_21=l9_16;
l9_21.w=1.0;
l9_20=l9_21;
l9_19=true;
}
else
{
l9_20=PreviewVertexColor;
l9_19=l9_0;
}
l9_14=l9_20;
l9_13=l9_19;
l9_12=l9_16;
}
else
{
vec4 l9_22;
bool l9_23;
vec4 l9_24;
if (l9_1==2.0)
{
float l9_25=clamp(Interpolator_UVCoord3.y,0.0,1.0);
vec4 l9_26;
if (l9_25<Port_Position1_N044)
{
l9_26=mix(Port_Value0_N044,Port_Value1_N044,vec4(clamp(l9_25/Port_Position1_N044,0.0,1.0)));
}
else
{
l9_26=mix(Port_Value1_N044,Port_Value2_N044,vec4(clamp((l9_25-Port_Position1_N044)/(1.0-Port_Position1_N044),0.0,1.0)));
}
bool l9_27=PreviewEnabled==1;
bool l9_28;
if (l9_27)
{
l9_28=!l9_0;
}
else
{
l9_28=l9_27;
}
bool l9_29;
vec4 l9_30;
if (l9_28&&(44==PreviewNodeID))
{
vec4 l9_31=l9_26;
l9_31.w=1.0;
l9_30=l9_31;
l9_29=true;
}
else
{
l9_30=PreviewVertexColor;
l9_29=l9_0;
}
l9_24=l9_30;
l9_23=l9_29;
l9_22=l9_26;
}
else
{
l9_24=PreviewVertexColor;
l9_23=l9_0;
l9_22=Port_Default_N042;
}
l9_14=l9_24;
l9_13=l9_23;
l9_12=l9_22;
}
l9_4=l9_14;
l9_3=l9_13;
l9_2=l9_12;
}
float l9_32=radians(Port_Rotation_N012);
float l9_33=clamp((vec2(dot(vec2(cos(l9_32),sin(l9_32)),Interpolator_UVCoord3-Port_Center_N012),0.0)+Port_Center_N012).x,0.0,1.0);
vec4 l9_34;
if (l9_33<Port_Position1_N049)
{
l9_34=mix(Port_Value0_N049,Port_Value1_N049,vec4(clamp(l9_33/Port_Position1_N049,0.0,1.0)));
}
else
{
l9_34=mix(Port_Value1_N049,Port_Value2_N049,vec4(clamp((l9_33-Port_Position1_N049)/(1.0-Port_Position1_N049),0.0,1.0)));
}
bool l9_35=PreviewEnabled==1;
bool l9_36;
if (l9_35)
{
l9_36=!l9_3;
}
else
{
l9_36=l9_35;
}
bool l9_37;
vec4 l9_38;
if (l9_36&&(49==PreviewNodeID))
{
vec4 l9_39=l9_34;
l9_39.w=1.0;
l9_38=l9_39;
l9_37=true;
}
else
{
l9_38=l9_4;
l9_37=l9_3;
}
vec2 l9_40=Interpolator_UVCoord3+(Port_Direction_N013*(sc_Time.x*Port_Speed_N013));
vec4 l9_41;
#if (Tweak_N14Layout==2)
{
bool l9_42=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N14)!=0)&&(!(int(SC_USE_UV_MIN_MAX_Tweak_N14)!=0));
float l9_43=l9_40.x;
sc_SoftwareWrapEarly(l9_43,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N14,SC_SOFTWARE_WRAP_MODE_V_Tweak_N14).x);
float l9_44=l9_43;
float l9_45=l9_40.y;
sc_SoftwareWrapEarly(l9_45,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N14,SC_SOFTWARE_WRAP_MODE_V_Tweak_N14).y);
float l9_46=l9_45;
vec2 l9_47;
float l9_48;
#if (SC_USE_UV_MIN_MAX_Tweak_N14)
{
bool l9_49;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N14)
{
l9_49=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N14,SC_SOFTWARE_WRAP_MODE_V_Tweak_N14).x==3;
}
#else
{
l9_49=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N14)!=0);
}
#endif
float l9_50=l9_44;
float l9_51=1.0;
sc_ClampUV(l9_50,Tweak_N14UvMinMax.x,Tweak_N14UvMinMax.z,l9_49,l9_51);
float l9_52=l9_50;
float l9_53=l9_51;
bool l9_54;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N14)
{
l9_54=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N14,SC_SOFTWARE_WRAP_MODE_V_Tweak_N14).y==3;
}
#else
{
l9_54=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N14)!=0);
}
#endif
float l9_55=l9_46;
float l9_56=l9_53;
sc_ClampUV(l9_55,Tweak_N14UvMinMax.y,Tweak_N14UvMinMax.w,l9_54,l9_56);
l9_48=l9_56;
l9_47=vec2(l9_52,l9_55);
}
#else
{
l9_48=1.0;
l9_47=vec2(l9_44,l9_46);
}
#endif
vec2 l9_57=sc_TransformUV(l9_47,(int(SC_USE_UV_TRANSFORM_Tweak_N14)!=0),Tweak_N14Transform);
float l9_58=l9_57.x;
float l9_59=l9_48;
sc_SoftwareWrapLate(l9_58,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N14,SC_SOFTWARE_WRAP_MODE_V_Tweak_N14).x,l9_42,l9_59);
float l9_60=l9_57.y;
float l9_61=l9_59;
sc_SoftwareWrapLate(l9_60,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N14,SC_SOFTWARE_WRAP_MODE_V_Tweak_N14).y,l9_42,l9_61);
float l9_62=l9_61;
vec3 l9_63=sc_SamplingCoordsViewToGlobal(vec2(l9_58,l9_60),Tweak_N14Layout,Tweak_N14GetStereoViewIndex());
vec4 l9_64=texture(Tweak_N14ArrSC,l9_63,0.0);
vec4 l9_65;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N14)
{
l9_65=mix(Tweak_N14BorderColor,l9_64,vec4(l9_62));
}
#else
{
l9_65=l9_64;
}
#endif
l9_41=l9_65;
}
#else
{
bool l9_66=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N14)!=0)&&(!(int(SC_USE_UV_MIN_MAX_Tweak_N14)!=0));
float l9_67=l9_40.x;
sc_SoftwareWrapEarly(l9_67,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N14,SC_SOFTWARE_WRAP_MODE_V_Tweak_N14).x);
float l9_68=l9_67;
float l9_69=l9_40.y;
sc_SoftwareWrapEarly(l9_69,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N14,SC_SOFTWARE_WRAP_MODE_V_Tweak_N14).y);
float l9_70=l9_69;
vec2 l9_71;
float l9_72;
#if (SC_USE_UV_MIN_MAX_Tweak_N14)
{
bool l9_73;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N14)
{
l9_73=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N14,SC_SOFTWARE_WRAP_MODE_V_Tweak_N14).x==3;
}
#else
{
l9_73=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N14)!=0);
}
#endif
float l9_74=l9_68;
float l9_75=1.0;
sc_ClampUV(l9_74,Tweak_N14UvMinMax.x,Tweak_N14UvMinMax.z,l9_73,l9_75);
float l9_76=l9_74;
float l9_77=l9_75;
bool l9_78;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N14)
{
l9_78=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N14,SC_SOFTWARE_WRAP_MODE_V_Tweak_N14).y==3;
}
#else
{
l9_78=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N14)!=0);
}
#endif
float l9_79=l9_70;
float l9_80=l9_77;
sc_ClampUV(l9_79,Tweak_N14UvMinMax.y,Tweak_N14UvMinMax.w,l9_78,l9_80);
l9_72=l9_80;
l9_71=vec2(l9_76,l9_79);
}
#else
{
l9_72=1.0;
l9_71=vec2(l9_68,l9_70);
}
#endif
vec2 l9_81=sc_TransformUV(l9_71,(int(SC_USE_UV_TRANSFORM_Tweak_N14)!=0),Tweak_N14Transform);
float l9_82=l9_81.x;
float l9_83=l9_72;
sc_SoftwareWrapLate(l9_82,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N14,SC_SOFTWARE_WRAP_MODE_V_Tweak_N14).x,l9_66,l9_83);
float l9_84=l9_81.y;
float l9_85=l9_83;
sc_SoftwareWrapLate(l9_84,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N14,SC_SOFTWARE_WRAP_MODE_V_Tweak_N14).y,l9_66,l9_85);
float l9_86=l9_85;
vec3 l9_87=sc_SamplingCoordsViewToGlobal(vec2(l9_82,l9_84),Tweak_N14Layout,Tweak_N14GetStereoViewIndex());
vec4 l9_88=texture(Tweak_N14,l9_87.xy,0.0);
vec4 l9_89;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N14)
{
l9_89=mix(Tweak_N14BorderColor,l9_88,vec4(l9_86));
}
#else
{
l9_89=l9_88;
}
#endif
l9_41=l9_89;
}
#endif
vec3 l9_90=mix(l9_2.xyz,l9_34.xyz,vec3(1.0-l9_41.x));
vec4 l9_91=vec4(l9_90.x,l9_90.y,l9_90.z,vec4(0.0).w);
l9_91.w=Port_Value2_N001;
#if (sc_BlendMode_AlphaTest)
{
if (Port_Value2_N001<alphaTestThreshold)
{
discard;
}
}
#endif
#if (ENABLE_STIPPLE_PATTERN_TEST)
{
if (Port_Value2_N001<((mod(dot(floor(mod(gl_FragCoord.xy,vec2(4.0))),vec2(4.0,1.0))*9.0,16.0)+1.0)/17.0))
{
discard;
}
}
#endif
vec4 l9_92;
#if (sc_ProjectiveShadowsCaster)
{
float l9_93;
#if (((sc_BlendMode_Normal||sc_BlendMode_AlphaToCoverage)||sc_BlendMode_PremultipliedAlphaHardware)||sc_BlendMode_PremultipliedAlphaAuto)
{
l9_93=Port_Value2_N001;
}
#else
{
float l9_94;
#if (sc_BlendMode_PremultipliedAlpha)
{
l9_94=clamp(Port_Value2_N001*2.0,0.0,1.0);
}
#else
{
float l9_95;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_95=clamp(dot(l9_91.xyz,vec3(Port_Value2_N001)),0.0,1.0);
}
#else
{
float l9_96;
#if (sc_BlendMode_AlphaTest)
{
l9_96=1.0;
}
#else
{
float l9_97;
#if (sc_BlendMode_Multiply)
{
l9_97=(1.0-dot(l9_91.xyz,vec3(0.33333001)))*Port_Value2_N001;
}
#else
{
float l9_98;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_98=(1.0-clamp(dot(l9_91.xyz,vec3(1.0)),0.0,1.0))*Port_Value2_N001;
}
#else
{
float l9_99;
#if (sc_BlendMode_ColoredGlass)
{
l9_99=clamp(dot(l9_91.xyz,vec3(1.0)),0.0,1.0)*Port_Value2_N001;
}
#else
{
float l9_100;
#if (sc_BlendMode_Add)
{
l9_100=clamp(dot(l9_91.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_101;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_101=clamp(dot(l9_91.xyz,vec3(1.0)),0.0,1.0)*Port_Value2_N001;
}
#else
{
float l9_102;
#if (sc_BlendMode_Screen)
{
l9_102=dot(l9_91.xyz,vec3(0.33333001))*Port_Value2_N001;
}
#else
{
float l9_103;
#if (sc_BlendMode_Min)
{
l9_103=1.0-clamp(dot(l9_91.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_104;
#if (sc_BlendMode_Max)
{
l9_104=clamp(dot(l9_91.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
l9_104=1.0;
}
#endif
l9_103=l9_104;
}
#endif
l9_102=l9_103;
}
#endif
l9_101=l9_102;
}
#endif
l9_100=l9_101;
}
#endif
l9_99=l9_100;
}
#endif
l9_98=l9_99;
}
#endif
l9_97=l9_98;
}
#endif
l9_96=l9_97;
}
#endif
l9_95=l9_96;
}
#endif
l9_94=l9_95;
}
#endif
l9_93=l9_94;
}
#endif
l9_92=vec4(mix(sc_ShadowColor.xyz,sc_ShadowColor.xyz*l9_91.xyz,vec3(sc_ShadowColor.w)),sc_ShadowDensity*l9_93);
}
#else
{
vec4 l9_105;
#if (sc_RenderAlphaToColor)
{
l9_105=vec4(Port_Value2_N001);
}
#else
{
vec4 l9_106;
#if (sc_BlendMode_Custom)
{
vec4 l9_107;
#if (sc_FramebufferFetch)
{
l9_107=sc_readFragData0_Platform();
}
#else
{
vec2 l9_108=sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw);
vec4 l9_109;
#if (sc_ScreenTextureLayout==2)
{
l9_109=texture(sc_ScreenTextureArrSC,sc_SamplingCoordsViewToGlobal(l9_108,sc_ScreenTextureLayout,sc_ScreenTextureGetStereoViewIndex()),0.0);
}
#else
{
l9_109=texture(sc_ScreenTexture,sc_SamplingCoordsViewToGlobal(l9_108,sc_ScreenTextureLayout,sc_ScreenTextureGetStereoViewIndex()).xy,0.0);
}
#endif
l9_107=l9_109;
}
#endif
vec3 l9_110=mix(l9_107.xyz,definedBlend(l9_107.xyz,l9_91.xyz).xyz,vec3(Port_Value2_N001));
vec4 l9_111=vec4(l9_110.x,l9_110.y,l9_110.z,vec4(0.0).w);
l9_111.w=1.0;
l9_106=l9_111;
}
#else
{
vec4 l9_112;
#if (sc_Voxelization)
{
l9_112=vec4(varScreenPos.xyz,1.0);
}
#else
{
vec4 l9_113;
#if (sc_OutputBounds)
{
float l9_114=clamp(abs(gl_FragCoord.z),0.0,1.0);
l9_113=vec4(l9_114,1.0-l9_114,1.0,1.0);
}
#else
{
vec4 l9_115;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_115=vec4(mix(vec3(1.0),l9_91.xyz,vec3(Port_Value2_N001)),Port_Value2_N001);
}
#else
{
vec4 l9_116;
#if (sc_BlendMode_Screen||sc_BlendMode_PremultipliedAlphaAuto)
{
float l9_117;
#if (sc_BlendMode_PremultipliedAlphaAuto)
{
l9_117=clamp(Port_Value2_N001,0.0,1.0);
}
#else
{
l9_117=Port_Value2_N001;
}
#endif
l9_116=vec4(l9_91.xyz*l9_117,l9_117);
}
#else
{
l9_116=l9_91;
}
#endif
l9_115=l9_116;
}
#endif
l9_113=l9_115;
}
#endif
l9_112=l9_113;
}
#endif
l9_106=l9_112;
}
#endif
l9_105=l9_106;
}
#endif
l9_92=l9_105;
}
#endif
vec4 l9_118;
if (l9_35)
{
vec4 l9_119;
if (l9_37)
{
l9_119=l9_38;
}
else
{
l9_119=vec4(0.0);
}
l9_118=l9_119;
}
else
{
l9_118=l9_92;
}
vec4 l9_120=sc_OutputMotionVectorIfNeeded(max(l9_118,vec4(0.0)));
vec4 l9_121=clamp(l9_120,vec4(0.0),vec4(1.0));
#if (sc_OITDepthBoundsPass)
{
#if (sc_OITDepthBoundsPass)
{
float l9_122=clamp(viewSpaceDepth()/1000.0,0.0,1.0);
sc_writeFragData0Internal(vec4(max(0.0,1.0-(l9_122-0.0039215689)),min(1.0,l9_122+0.0039215689),0.0,0.0),sc_UniformConstants.x,sc_ShaderCacheConstant);
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
vec2 l9_123=sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture(sc_OITFrontDepthTexture,l9_123).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_124=encodeDepth(viewSpaceDepth(),texture(sc_OITFilteredDepthBoundsTexture,l9_123).xy);
float l9_125=packValue(l9_124);
int l9_132=int(l9_121.w*255.0);
float l9_133=packValue(l9_132);
sc_writeFragData0Internal(vec4(packValue(l9_124),packValue(l9_124),packValue(l9_124),packValue(l9_124)),sc_UniformConstants.x,sc_ShaderCacheConstant);
sc_writeFragData1(vec4(l9_125,packValue(l9_124),packValue(l9_124),packValue(l9_124)));
sc_writeFragData2(vec4(l9_133,packValue(l9_132),packValue(l9_132),packValue(l9_132)));
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
vec2 l9_136=sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture(sc_OITFrontDepthTexture,l9_136).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_137[8];
int l9_138[8];
int l9_139=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_139<8)
{
l9_137[l9_139]=0;
l9_138[l9_139]=0;
l9_139++;
continue;
}
else
{
break;
}
}
int l9_140;
#if (sc_OITMaxLayers8)
{
l9_140=2;
}
#else
{
l9_140=1;
}
#endif
int l9_141=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_141<l9_140)
{
vec4 l9_142;
vec4 l9_143;
vec4 l9_144;
if (l9_141==0)
{
l9_144=texture(sc_OITAlpha0,l9_136);
l9_143=texture(sc_OITDepthLow0,l9_136);
l9_142=texture(sc_OITDepthHigh0,l9_136);
}
else
{
l9_144=vec4(0.0);
l9_143=vec4(0.0);
l9_142=vec4(0.0);
}
vec4 l9_145;
vec4 l9_146;
vec4 l9_147;
if (l9_141==1)
{
l9_147=texture(sc_OITAlpha1,l9_136);
l9_146=texture(sc_OITDepthLow1,l9_136);
l9_145=texture(sc_OITDepthHigh1,l9_136);
}
else
{
l9_147=l9_144;
l9_146=l9_143;
l9_145=l9_142;
}
if (any(notEqual(l9_145,vec4(0.0)))||any(notEqual(l9_146,vec4(0.0))))
{
int l9_148[8]=l9_137;
unpackValues(l9_145.w,l9_141,l9_148);
unpackValues(l9_145.z,l9_141,l9_148);
unpackValues(l9_145.y,l9_141,l9_148);
unpackValues(l9_145.x,l9_141,l9_148);
unpackValues(l9_146.w,l9_141,l9_148);
unpackValues(l9_146.z,l9_141,l9_148);
unpackValues(l9_146.y,l9_141,l9_148);
unpackValues(l9_146.x,l9_141,l9_148);
int l9_157[8]=l9_138;
unpackValues(l9_147.w,l9_141,l9_157);
unpackValues(l9_147.z,l9_141,l9_157);
unpackValues(l9_147.y,l9_141,l9_157);
unpackValues(l9_147.x,l9_141,l9_157);
}
l9_141++;
continue;
}
else
{
break;
}
}
vec4 l9_162=texture(sc_OITFilteredDepthBoundsTexture,l9_136);
vec2 l9_163=l9_162.xy;
int l9_164;
#if (sc_SkinBonesCount>0)
{
l9_164=encodeDepth(((1.0-l9_162.x)*1000.0)+getDepthOrderingEpsilon(),l9_163);
}
#else
{
l9_164=0;
}
#endif
int l9_165=encodeDepth(viewSpaceDepth(),l9_163);
vec4 l9_166;
l9_166=l9_121*l9_121.w;
vec4 l9_167;
int l9_168=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_168<8)
{
int l9_169=l9_137[l9_168];
int l9_170=l9_165-l9_164;
bool l9_171=l9_169<l9_170;
bool l9_172;
if (l9_171)
{
l9_172=l9_137[l9_168]>0;
}
else
{
l9_172=l9_171;
}
if (l9_172)
{
vec3 l9_173=l9_166.xyz*(1.0-(float(l9_138[l9_168])/255.0));
l9_167=vec4(l9_173.x,l9_173.y,l9_173.z,l9_166.w);
}
else
{
l9_167=l9_166;
}
l9_166=l9_167;
l9_168++;
continue;
}
else
{
break;
}
}
sc_writeFragData0Internal(l9_166,sc_UniformConstants.x,sc_ShaderCacheConstant);
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
sc_writeFragData0Internal(l9_121,sc_UniformConstants.x,sc_ShaderCacheConstant);
}
#endif
}
#else
{
sc_writeFragData0Internal(l9_120,sc_UniformConstants.x,sc_ShaderCacheConstant);
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
