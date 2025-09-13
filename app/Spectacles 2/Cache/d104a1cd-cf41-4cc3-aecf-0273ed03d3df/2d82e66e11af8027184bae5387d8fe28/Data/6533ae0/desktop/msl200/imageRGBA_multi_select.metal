#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
#ifdef alpha_channel
#undef alpha_channel
#endif
#ifdef red_channel
#undef red_channel
#endif
#ifdef green_channel
#undef green_channel
#endif
#ifdef blue_channel
#undef blue_channel
#endif
namespace SNAP_VS {
int sc_GetStereoViewIndex()
{
return 0;
}
}
#ifndef sc_TextureRenderingLayout_Regular
#define sc_TextureRenderingLayout_Regular 0
#define sc_TextureRenderingLayout_StereoInstancedClipped 1
#define sc_TextureRenderingLayout_StereoMultiview 2
#endif
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
//output vec4 FragColor0 0
//output vec4 FragColor1 1
//output vec4 FragColor2 2
//output vec4 FragColor3 3
//sampler sampler baseTexSmpSC 0:22
//sampler sampler intensityTextureSmpSC 0:23
//sampler sampler sc_RayTracingHitCasterIdAndBarycentricSmpSC 0:27
//sampler sampler sc_RayTracingRayDirectionSmpSC 0:28
//sampler sampler sc_ScreenTextureSmpSC 0:30
//texture texture2D baseTex 0:4:0:22
//texture texture2D intensityTexture 0:5:0:23
//texture utexture2D sc_RayTracingHitCasterIdAndBarycentric 0:16:0:27
//texture texture2D sc_RayTracingRayDirection 0:17:0:28
//texture texture2D sc_ScreenTexture 0:19:0:30
//ubo float sc_BonesUBO 0:3:96 {
//sc_Bone_t sc_Bones 0:[1]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 0:33:4624 {
//float4 sc_Time 1376
//float4 sc_UniformConstants 1392
//float4x4 sc_ViewProjectionMatrixArray 1680:[2]:64
//float4x4 sc_ModelViewMatrixArray 1936:[2]:64
//float4x4 sc_ProjectionMatrixArray 2384:[2]:64
//float4x4 sc_ProjectionMatrixInverseArray 2512:[2]:64
//float4x4 sc_ViewMatrixArray 2640:[2]:64
//float4x4 sc_PrevFrameViewProjectionMatrixArray 2896:[2]:64
//float4x4 sc_ModelMatrix 3024
//float4x4 sc_ModelMatrixInverse 3088
//float3x3 sc_NormalMatrix 3152
//float4x4 sc_PrevFrameModelMatrix 3248
//float4 sc_CurrentRenderTargetDims 3456
//sc_Camera_t sc_Camera 3472
//float3 sc_Camera.position 0
//float sc_Camera.aspect 16
//float2 sc_Camera.clipPlanes 24
//float sc_ShadowDensity 3504
//float4 sc_ShadowColor 3520
//float4x4 sc_ProjectorMatrix 3536
//float4 weights0 3616
//float4 weights1 3632
//float4 sc_StereoClipPlanes 3664:[2]:16
//float2 sc_TAAJitterOffset 3704
//uint4 sc_RayTracingCasterConfiguration 3824
//uint4 sc_RayTracingCasterOffsetPNTC 3840
//uint4 sc_RayTracingCasterOffsetTexture 3856
//uint4 sc_RayTracingCasterFormatPNTC 3872
//uint4 sc_RayTracingCasterFormatTexture 3888
//float4 voxelization_params_0 3952
//float4 voxelization_params_frustum_lrbt 3968
//float4 voxelization_params_frustum_nf 3984
//float3 voxelization_params_camera_pos 4000
//float4x4 sc_ModelMatrixVoxelization 4016
//float correctedIntensity 4080
//float3x3 intensityTextureTransform 4144
//float4 intensityTextureUvMinMax 4192
//float4 intensityTextureBorderColor 4208
//int PreviewEnabled 4372
//float alphaTestThreshold 4380
//bool alpha_channel 4384
//bool red_channel 4388
//bool green_channel 4392
//bool blue_channel 4396
//float3x3 baseTexTransform 4448
//float4 baseTexUvMinMax 4496
//float4 baseTexBorderColor 4512
//float Port_Input1_N010 4528
//float Port_Value2_N013 4532
//float Port_Input1_N009 4536
//float Port_Input1_N035 4540
//float Port_Value1_N036 4544
//float Port_Input1_N046 4548
//float Port_Input1_N051 4552
//float Port_Input1_N034 4556
//float Port_Value1_N043 4560
//float Port_Input1_N052 4564
//float Port_Input1_N053 4568
//float4 Port_Default_N055 4576
//float4 Port_Default_N050 4592
//float depthRef 4608
//}
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
//spec_const bool BLEND_MODE_COLOR_BURN 2 0
//spec_const bool BLEND_MODE_COLOR_DODGE 3 0
//spec_const bool BLEND_MODE_COLOR 4 0
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
//spec_const bool SC_USE_CLAMP_TO_BORDER_baseTex 31 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 32 0
//spec_const bool SC_USE_UV_MIN_MAX_baseTex 33 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 34 0
//spec_const bool SC_USE_UV_TRANSFORM_baseTex 35 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 36 0
//spec_const bool UseViewSpaceDepthVariant 37 1
//spec_const bool baseTexHasSwappedViews 38 0
//spec_const bool intensityTextureHasSwappedViews 39 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 40 0
//spec_const bool sc_BlendMode_Add 41 0
//spec_const bool sc_BlendMode_AlphaTest 42 0
//spec_const bool sc_BlendMode_AlphaToCoverage 43 0
//spec_const bool sc_BlendMode_ColoredGlass 44 0
//spec_const bool sc_BlendMode_Custom 45 0
//spec_const bool sc_BlendMode_Max 46 0
//spec_const bool sc_BlendMode_Min 47 0
//spec_const bool sc_BlendMode_MultiplyOriginal 48 0
//spec_const bool sc_BlendMode_Multiply 49 0
//spec_const bool sc_BlendMode_Normal 50 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 51 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 52 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 53 0
//spec_const bool sc_BlendMode_Screen 54 0
//spec_const bool sc_DepthOnly 55 0
//spec_const bool sc_FramebufferFetch 56 0
//spec_const bool sc_MotionVectorsPass 57 0
//spec_const bool sc_OITCompositingPass 58 0
//spec_const bool sc_OITDepthBoundsPass 59 0
//spec_const bool sc_OITDepthGatherPass 60 0
//spec_const bool sc_OutputBounds 61 0
//spec_const bool sc_ProjectiveShadowsCaster 62 0
//spec_const bool sc_ProjectiveShadowsReceiver 63 0
//spec_const bool sc_RayTracingCasterForceOpaque 64 0
//spec_const bool sc_RenderAlphaToColor 65 0
//spec_const bool sc_ScreenTextureHasSwappedViews 66 0
//spec_const bool sc_TAAEnabled 67 0
//spec_const bool sc_VertexBlendingUseNormals 68 0
//spec_const bool sc_VertexBlending 69 0
//spec_const bool sc_Voxelization 70 0
//spec_const int SC_SOFTWARE_WRAP_MODE_U_baseTex 71 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 72 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_baseTex 73 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 74 -1
//spec_const int baseTexLayout 75 0
//spec_const int intensityTextureLayout 76 0
//spec_const int sc_DepthBufferMode 77 0
//spec_const int sc_RenderingSpace 78 -1
//spec_const int sc_ScreenTextureLayout 79 0
//spec_const int sc_ShaderCacheConstant 80 0
//spec_const int sc_SkinBonesCount 81 0
//spec_const int sc_StereoRenderingMode 82 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 83 0
//SG_REFLECTION_END
constant bool BLEND_MODE_AVERAGE [[function_constant(0)]];
constant bool BLEND_MODE_AVERAGE_tmp = is_function_constant_defined(BLEND_MODE_AVERAGE) ? BLEND_MODE_AVERAGE : false;
constant bool BLEND_MODE_BRIGHT [[function_constant(1)]];
constant bool BLEND_MODE_BRIGHT_tmp = is_function_constant_defined(BLEND_MODE_BRIGHT) ? BLEND_MODE_BRIGHT : false;
constant bool BLEND_MODE_COLOR_BURN [[function_constant(2)]];
constant bool BLEND_MODE_COLOR_BURN_tmp = is_function_constant_defined(BLEND_MODE_COLOR_BURN) ? BLEND_MODE_COLOR_BURN : false;
constant bool BLEND_MODE_COLOR_DODGE [[function_constant(3)]];
constant bool BLEND_MODE_COLOR_DODGE_tmp = is_function_constant_defined(BLEND_MODE_COLOR_DODGE) ? BLEND_MODE_COLOR_DODGE : false;
constant bool BLEND_MODE_COLOR [[function_constant(4)]];
constant bool BLEND_MODE_COLOR_tmp = is_function_constant_defined(BLEND_MODE_COLOR) ? BLEND_MODE_COLOR : false;
constant bool BLEND_MODE_DARKEN [[function_constant(5)]];
constant bool BLEND_MODE_DARKEN_tmp = is_function_constant_defined(BLEND_MODE_DARKEN) ? BLEND_MODE_DARKEN : false;
constant bool BLEND_MODE_DIFFERENCE [[function_constant(6)]];
constant bool BLEND_MODE_DIFFERENCE_tmp = is_function_constant_defined(BLEND_MODE_DIFFERENCE) ? BLEND_MODE_DIFFERENCE : false;
constant bool BLEND_MODE_DIVIDE [[function_constant(7)]];
constant bool BLEND_MODE_DIVIDE_tmp = is_function_constant_defined(BLEND_MODE_DIVIDE) ? BLEND_MODE_DIVIDE : false;
constant bool BLEND_MODE_DIVISION [[function_constant(8)]];
constant bool BLEND_MODE_DIVISION_tmp = is_function_constant_defined(BLEND_MODE_DIVISION) ? BLEND_MODE_DIVISION : false;
constant bool BLEND_MODE_EXCLUSION [[function_constant(9)]];
constant bool BLEND_MODE_EXCLUSION_tmp = is_function_constant_defined(BLEND_MODE_EXCLUSION) ? BLEND_MODE_EXCLUSION : false;
constant bool BLEND_MODE_FORGRAY [[function_constant(10)]];
constant bool BLEND_MODE_FORGRAY_tmp = is_function_constant_defined(BLEND_MODE_FORGRAY) ? BLEND_MODE_FORGRAY : false;
constant bool BLEND_MODE_HARD_GLOW [[function_constant(11)]];
constant bool BLEND_MODE_HARD_GLOW_tmp = is_function_constant_defined(BLEND_MODE_HARD_GLOW) ? BLEND_MODE_HARD_GLOW : false;
constant bool BLEND_MODE_HARD_LIGHT [[function_constant(12)]];
constant bool BLEND_MODE_HARD_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_HARD_LIGHT) ? BLEND_MODE_HARD_LIGHT : false;
constant bool BLEND_MODE_HARD_MIX [[function_constant(13)]];
constant bool BLEND_MODE_HARD_MIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_MIX) ? BLEND_MODE_HARD_MIX : false;
constant bool BLEND_MODE_HARD_PHOENIX [[function_constant(14)]];
constant bool BLEND_MODE_HARD_PHOENIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_PHOENIX) ? BLEND_MODE_HARD_PHOENIX : false;
constant bool BLEND_MODE_HARD_REFLECT [[function_constant(15)]];
constant bool BLEND_MODE_HARD_REFLECT_tmp = is_function_constant_defined(BLEND_MODE_HARD_REFLECT) ? BLEND_MODE_HARD_REFLECT : false;
constant bool BLEND_MODE_HUE [[function_constant(16)]];
constant bool BLEND_MODE_HUE_tmp = is_function_constant_defined(BLEND_MODE_HUE) ? BLEND_MODE_HUE : false;
constant bool BLEND_MODE_INTENSE [[function_constant(17)]];
constant bool BLEND_MODE_INTENSE_tmp = is_function_constant_defined(BLEND_MODE_INTENSE) ? BLEND_MODE_INTENSE : false;
constant bool BLEND_MODE_LIGHTEN [[function_constant(18)]];
constant bool BLEND_MODE_LIGHTEN_tmp = is_function_constant_defined(BLEND_MODE_LIGHTEN) ? BLEND_MODE_LIGHTEN : false;
constant bool BLEND_MODE_LINEAR_LIGHT [[function_constant(19)]];
constant bool BLEND_MODE_LINEAR_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_LINEAR_LIGHT) ? BLEND_MODE_LINEAR_LIGHT : false;
constant bool BLEND_MODE_LUMINOSITY [[function_constant(20)]];
constant bool BLEND_MODE_LUMINOSITY_tmp = is_function_constant_defined(BLEND_MODE_LUMINOSITY) ? BLEND_MODE_LUMINOSITY : false;
constant bool BLEND_MODE_NEGATION [[function_constant(21)]];
constant bool BLEND_MODE_NEGATION_tmp = is_function_constant_defined(BLEND_MODE_NEGATION) ? BLEND_MODE_NEGATION : false;
constant bool BLEND_MODE_NOTBRIGHT [[function_constant(22)]];
constant bool BLEND_MODE_NOTBRIGHT_tmp = is_function_constant_defined(BLEND_MODE_NOTBRIGHT) ? BLEND_MODE_NOTBRIGHT : false;
constant bool BLEND_MODE_OVERLAY [[function_constant(23)]];
constant bool BLEND_MODE_OVERLAY_tmp = is_function_constant_defined(BLEND_MODE_OVERLAY) ? BLEND_MODE_OVERLAY : false;
constant bool BLEND_MODE_PIN_LIGHT [[function_constant(24)]];
constant bool BLEND_MODE_PIN_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_PIN_LIGHT) ? BLEND_MODE_PIN_LIGHT : false;
constant bool BLEND_MODE_REALISTIC [[function_constant(25)]];
constant bool BLEND_MODE_REALISTIC_tmp = is_function_constant_defined(BLEND_MODE_REALISTIC) ? BLEND_MODE_REALISTIC : false;
constant bool BLEND_MODE_SATURATION [[function_constant(26)]];
constant bool BLEND_MODE_SATURATION_tmp = is_function_constant_defined(BLEND_MODE_SATURATION) ? BLEND_MODE_SATURATION : false;
constant bool BLEND_MODE_SOFT_LIGHT [[function_constant(27)]];
constant bool BLEND_MODE_SOFT_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_SOFT_LIGHT) ? BLEND_MODE_SOFT_LIGHT : false;
constant bool BLEND_MODE_SUBTRACT [[function_constant(28)]];
constant bool BLEND_MODE_SUBTRACT_tmp = is_function_constant_defined(BLEND_MODE_SUBTRACT) ? BLEND_MODE_SUBTRACT : false;
constant bool BLEND_MODE_VIVID_LIGHT [[function_constant(29)]];
constant bool BLEND_MODE_VIVID_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_VIVID_LIGHT) ? BLEND_MODE_VIVID_LIGHT : false;
constant bool ENABLE_STIPPLE_PATTERN_TEST [[function_constant(30)]];
constant bool ENABLE_STIPPLE_PATTERN_TEST_tmp = is_function_constant_defined(ENABLE_STIPPLE_PATTERN_TEST) ? ENABLE_STIPPLE_PATTERN_TEST : false;
constant bool SC_USE_CLAMP_TO_BORDER_baseTex [[function_constant(31)]];
constant bool SC_USE_CLAMP_TO_BORDER_baseTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_baseTex) ? SC_USE_CLAMP_TO_BORDER_baseTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(32)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_baseTex [[function_constant(33)]];
constant bool SC_USE_UV_MIN_MAX_baseTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_baseTex) ? SC_USE_UV_MIN_MAX_baseTex : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(34)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_baseTex [[function_constant(35)]];
constant bool SC_USE_UV_TRANSFORM_baseTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_baseTex) ? SC_USE_UV_TRANSFORM_baseTex : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(36)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool UseViewSpaceDepthVariant [[function_constant(37)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool baseTexHasSwappedViews [[function_constant(38)]];
constant bool baseTexHasSwappedViews_tmp = is_function_constant_defined(baseTexHasSwappedViews) ? baseTexHasSwappedViews : false;
constant bool intensityTextureHasSwappedViews [[function_constant(39)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(40)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(41)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(42)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(43)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(44)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(45)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(46)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(47)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(48)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(49)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(50)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(51)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(52)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(53)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(54)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_DepthOnly [[function_constant(55)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_FramebufferFetch [[function_constant(56)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_MotionVectorsPass [[function_constant(57)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(58)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(59)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(60)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_OutputBounds [[function_constant(61)]];
constant bool sc_OutputBounds_tmp = is_function_constant_defined(sc_OutputBounds) ? sc_OutputBounds : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(62)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(63)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_RayTracingCasterForceOpaque [[function_constant(64)]];
constant bool sc_RayTracingCasterForceOpaque_tmp = is_function_constant_defined(sc_RayTracingCasterForceOpaque) ? sc_RayTracingCasterForceOpaque : false;
constant bool sc_RenderAlphaToColor [[function_constant(65)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(66)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_TAAEnabled [[function_constant(67)]];
constant bool sc_TAAEnabled_tmp = is_function_constant_defined(sc_TAAEnabled) ? sc_TAAEnabled : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(68)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(69)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant bool sc_Voxelization [[function_constant(70)]];
constant bool sc_Voxelization_tmp = is_function_constant_defined(sc_Voxelization) ? sc_Voxelization : false;
constant int SC_SOFTWARE_WRAP_MODE_U_baseTex [[function_constant(71)]];
constant int SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_baseTex) ? SC_SOFTWARE_WRAP_MODE_U_baseTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(72)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_baseTex [[function_constant(73)]];
constant int SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_baseTex) ? SC_SOFTWARE_WRAP_MODE_V_baseTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(74)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int baseTexLayout [[function_constant(75)]];
constant int baseTexLayout_tmp = is_function_constant_defined(baseTexLayout) ? baseTexLayout : 0;
constant int intensityTextureLayout [[function_constant(76)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int sc_DepthBufferMode [[function_constant(77)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_RenderingSpace [[function_constant(78)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(79)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_ShaderCacheConstant [[function_constant(80)]];
constant int sc_ShaderCacheConstant_tmp = is_function_constant_defined(sc_ShaderCacheConstant) ? sc_ShaderCacheConstant : 0;
constant int sc_SkinBonesCount [[function_constant(81)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(82)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(83)]];
constant int sc_StereoRendering_IsClipDistanceEnabled_tmp = is_function_constant_defined(sc_StereoRendering_IsClipDistanceEnabled) ? sc_StereoRendering_IsClipDistanceEnabled : 0;

namespace SNAP_VS {
struct sc_Vertex_t
{
float4 position;
float3 normal;
float3 tangent;
float2 texture0;
float2 texture1;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float shaderComplexityValue;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
uint4 sc_RayTracingCasterConfiguration;
uint4 sc_RayTracingCasterOffsetPNTC;
uint4 sc_RayTracingCasterOffsetTexture;
uint4 sc_RayTracingCasterFormatPNTC;
uint4 sc_RayTracingCasterFormatTexture;
float4 sc_RayTracingRayDirectionSize;
float4 sc_RayTracingRayDirectionDims;
float4 sc_RayTracingRayDirectionView;
float4 voxelization_params_0;
float4 voxelization_params_frustum_lrbt;
float4 voxelization_params_frustum_nf;
float3 voxelization_params_camera_pos;
float4x4 sc_ModelMatrixVoxelization;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed[32];
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
int alpha_channel;
int red_channel;
int green_channel;
int blue_channel;
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
float Port_Input1_N010;
float Port_Value2_N013;
float Port_Input1_N009;
float Port_Input1_N035;
float Port_Value1_N036;
float Port_Input1_N046;
float Port_Input1_N051;
float Port_Input1_N034;
float Port_Value1_N043;
float Port_Input1_N052;
float Port_Input1_N053;
float4 Port_Default_N055;
float4 Port_Default_N050;
float depthRef;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct sc_RayTracingCasterIndexBuffer_obj
{
uint sc_RayTracingCasterTriangles[1];
};
struct sc_RayTracingCasterVertexBuffer_obj
{
float sc_RayTracingCasterVertices[1];
};
struct sc_RayTracingCasterNonAnimatedVertexBuffer_obj
{
float sc_RayTracingCasterNonAnimatedVertices[1];
};
struct sc_Set0
{
const device sc_RayTracingCasterIndexBuffer_obj* sc_RayTracingCasterIndexBuffer [[id(0)]];
const device sc_RayTracingCasterVertexBuffer_obj* sc_RayTracingCasterVertexBuffer [[id(1)]];
const device sc_RayTracingCasterNonAnimatedVertexBuffer_obj* sc_RayTracingCasterNonAnimatedVertexBuffer [[id(2)]];
constant sc_Bones_obj* sc_BonesUBO [[id(3)]];
texture2d<float> baseTex [[id(4)]];
texture2d<float> intensityTexture [[id(5)]];
texture2d<uint> sc_RayTracingHitCasterIdAndBarycentric [[id(16)]];
texture2d<float> sc_RayTracingRayDirection [[id(17)]];
texture2d<float> sc_ScreenTexture [[id(19)]];
sampler baseTexSmpSC [[id(22)]];
sampler intensityTextureSmpSC [[id(23)]];
sampler sc_RayTracingHitCasterIdAndBarycentricSmpSC [[id(27)]];
sampler sc_RayTracingRayDirectionSmpSC [[id(28)]];
sampler sc_ScreenTextureSmpSC [[id(30)]];
constant userUniformsObj* UserUniforms [[id(33)]];
};
struct main_vert_out
{
float3 varPos [[user(locn0)]];
float3 varNormal [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varPackedTex [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
float4 gl_Position [[position]];
};
struct main_vert_in
{
float4 position [[attribute(0)]];
float3 normal [[attribute(1)]];
float4 tangent [[attribute(2)]];
float2 texture0 [[attribute(3)]];
float2 texture1 [[attribute(4)]];
float4 boneData [[attribute(5)]];
float3 blendShape0Pos [[attribute(6)]];
float3 blendShape1Pos [[attribute(7)]];
float3 blendShape2Pos [[attribute(8)]];
float3 blendShape3Pos [[attribute(9)]];
float3 blendShape4Pos [[attribute(10)]];
float3 blendShape5Pos [[attribute(11)]];
float3 blendShape0Normal [[attribute(12)]];
float3 blendShape1Normal [[attribute(13)]];
float3 blendShape2Normal [[attribute(14)]];
float3 positionNext [[attribute(15)]];
float3 positionPrevious [[attribute(16)]];
float4 strandProperties [[attribute(17)]];
float4 color [[attribute(18)]];
};
vertex main_vert_out main_vert(main_vert_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],uint gl_InstanceIndex [[instance_id]])
{
main_vert_out out={};
if ((*sc_set0.UserUniforms).sc_RayTracingCasterConfiguration.x!=0u)
{
float4 param=float4(in.position.xy,(*sc_set0.UserUniforms).depthRef+(1e-10*in.position.z),1.0+(1e-10*in.position.w));
if (sc_ShaderCacheConstant_tmp!=0)
{
param.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_0=param;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_1=dot(l9_0,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_2=l9_1;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_2;
}
}
float4 l9_3=float4(param.x,-param.y,(param.z*0.5)+(param.w*0.5),param.w);
out.gl_Position=l9_3;
return out;
}
out.PreviewVertexColor=float4(0.5);
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=float4(0.5);
PreviewInfo.Saved=false;
out.PreviewVertexSaved=0.0;
sc_Vertex_t l9_5;
l9_5.position=in.position;
l9_5.normal=in.normal;
l9_5.tangent=in.tangent.xyz;
l9_5.texture0=in.texture0;
l9_5.texture1=in.texture1;
sc_Vertex_t l9_6=l9_5;
sc_Vertex_t param_1=l9_6;
if ((int(sc_Voxelization_tmp)!=0))
{
sc_Vertex_t l9_7=param_1;
param_1=l9_7;
}
sc_Vertex_t l9_8=param_1;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_9=l9_8;
float3 l9_10=in.blendShape0Pos;
float3 l9_11=in.blendShape0Normal;
float l9_12=(*sc_set0.UserUniforms).weights0.x;
sc_Vertex_t l9_13=l9_9;
float3 l9_14=l9_10;
float l9_15=l9_12;
float3 l9_16=l9_13.position.xyz+(l9_14*l9_15);
l9_13.position=float4(l9_16.x,l9_16.y,l9_16.z,l9_13.position.w);
l9_9=l9_13;
l9_9.normal+=(l9_11*l9_12);
l9_8=l9_9;
sc_Vertex_t l9_17=l9_8;
float3 l9_18=in.blendShape1Pos;
float3 l9_19=in.blendShape1Normal;
float l9_20=(*sc_set0.UserUniforms).weights0.y;
sc_Vertex_t l9_21=l9_17;
float3 l9_22=l9_18;
float l9_23=l9_20;
float3 l9_24=l9_21.position.xyz+(l9_22*l9_23);
l9_21.position=float4(l9_24.x,l9_24.y,l9_24.z,l9_21.position.w);
l9_17=l9_21;
l9_17.normal+=(l9_19*l9_20);
l9_8=l9_17;
sc_Vertex_t l9_25=l9_8;
float3 l9_26=in.blendShape2Pos;
float3 l9_27=in.blendShape2Normal;
float l9_28=(*sc_set0.UserUniforms).weights0.z;
sc_Vertex_t l9_29=l9_25;
float3 l9_30=l9_26;
float l9_31=l9_28;
float3 l9_32=l9_29.position.xyz+(l9_30*l9_31);
l9_29.position=float4(l9_32.x,l9_32.y,l9_32.z,l9_29.position.w);
l9_25=l9_29;
l9_25.normal+=(l9_27*l9_28);
l9_8=l9_25;
}
else
{
sc_Vertex_t l9_33=l9_8;
float3 l9_34=in.blendShape0Pos;
float l9_35=(*sc_set0.UserUniforms).weights0.x;
float3 l9_36=l9_33.position.xyz+(l9_34*l9_35);
l9_33.position=float4(l9_36.x,l9_36.y,l9_36.z,l9_33.position.w);
l9_8=l9_33;
sc_Vertex_t l9_37=l9_8;
float3 l9_38=in.blendShape1Pos;
float l9_39=(*sc_set0.UserUniforms).weights0.y;
float3 l9_40=l9_37.position.xyz+(l9_38*l9_39);
l9_37.position=float4(l9_40.x,l9_40.y,l9_40.z,l9_37.position.w);
l9_8=l9_37;
sc_Vertex_t l9_41=l9_8;
float3 l9_42=in.blendShape2Pos;
float l9_43=(*sc_set0.UserUniforms).weights0.z;
float3 l9_44=l9_41.position.xyz+(l9_42*l9_43);
l9_41.position=float4(l9_44.x,l9_44.y,l9_44.z,l9_41.position.w);
l9_8=l9_41;
sc_Vertex_t l9_45=l9_8;
float3 l9_46=in.blendShape3Pos;
float l9_47=(*sc_set0.UserUniforms).weights0.w;
float3 l9_48=l9_45.position.xyz+(l9_46*l9_47);
l9_45.position=float4(l9_48.x,l9_48.y,l9_48.z,l9_45.position.w);
l9_8=l9_45;
sc_Vertex_t l9_49=l9_8;
float3 l9_50=in.blendShape4Pos;
float l9_51=(*sc_set0.UserUniforms).weights1.x;
float3 l9_52=l9_49.position.xyz+(l9_50*l9_51);
l9_49.position=float4(l9_52.x,l9_52.y,l9_52.z,l9_49.position.w);
l9_8=l9_49;
sc_Vertex_t l9_53=l9_8;
float3 l9_54=in.blendShape5Pos;
float l9_55=(*sc_set0.UserUniforms).weights1.y;
float3 l9_56=l9_53.position.xyz+(l9_54*l9_55);
l9_53.position=float4(l9_56.x,l9_56.y,l9_56.z,l9_53.position.w);
l9_8=l9_53;
}
}
param_1=l9_8;
sc_Vertex_t l9_57=param_1;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_58=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_58=float4(1.0,fract(in.boneData.yzw));
l9_58.x-=dot(l9_58.yzw,float3(1.0));
}
float4 l9_59=l9_58;
float4 l9_60=l9_59;
int l9_61=int(in.boneData.x);
int l9_62=int(in.boneData.y);
int l9_63=int(in.boneData.z);
int l9_64=int(in.boneData.w);
int l9_65=l9_61;
float4 l9_66=l9_57.position;
float3 l9_67=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_68=l9_65;
float4 l9_69=(*sc_set0.sc_BonesUBO).sc_Bones[l9_68].boneMatrix[0];
float4 l9_70=(*sc_set0.sc_BonesUBO).sc_Bones[l9_68].boneMatrix[1];
float4 l9_71=(*sc_set0.sc_BonesUBO).sc_Bones[l9_68].boneMatrix[2];
float4 l9_72[3];
l9_72[0]=l9_69;
l9_72[1]=l9_70;
l9_72[2]=l9_71;
l9_67=float3(dot(l9_66,l9_72[0]),dot(l9_66,l9_72[1]),dot(l9_66,l9_72[2]));
}
else
{
l9_67=l9_66.xyz;
}
float3 l9_73=l9_67;
float3 l9_74=l9_73;
float l9_75=l9_60.x;
int l9_76=l9_62;
float4 l9_77=l9_57.position;
float3 l9_78=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_79=l9_76;
float4 l9_80=(*sc_set0.sc_BonesUBO).sc_Bones[l9_79].boneMatrix[0];
float4 l9_81=(*sc_set0.sc_BonesUBO).sc_Bones[l9_79].boneMatrix[1];
float4 l9_82=(*sc_set0.sc_BonesUBO).sc_Bones[l9_79].boneMatrix[2];
float4 l9_83[3];
l9_83[0]=l9_80;
l9_83[1]=l9_81;
l9_83[2]=l9_82;
l9_78=float3(dot(l9_77,l9_83[0]),dot(l9_77,l9_83[1]),dot(l9_77,l9_83[2]));
}
else
{
l9_78=l9_77.xyz;
}
float3 l9_84=l9_78;
float3 l9_85=l9_84;
float l9_86=l9_60.y;
int l9_87=l9_63;
float4 l9_88=l9_57.position;
float3 l9_89=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_90=l9_87;
float4 l9_91=(*sc_set0.sc_BonesUBO).sc_Bones[l9_90].boneMatrix[0];
float4 l9_92=(*sc_set0.sc_BonesUBO).sc_Bones[l9_90].boneMatrix[1];
float4 l9_93=(*sc_set0.sc_BonesUBO).sc_Bones[l9_90].boneMatrix[2];
float4 l9_94[3];
l9_94[0]=l9_91;
l9_94[1]=l9_92;
l9_94[2]=l9_93;
l9_89=float3(dot(l9_88,l9_94[0]),dot(l9_88,l9_94[1]),dot(l9_88,l9_94[2]));
}
else
{
l9_89=l9_88.xyz;
}
float3 l9_95=l9_89;
float3 l9_96=l9_95;
float l9_97=l9_60.z;
int l9_98=l9_64;
float4 l9_99=l9_57.position;
float3 l9_100=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_101=l9_98;
float4 l9_102=(*sc_set0.sc_BonesUBO).sc_Bones[l9_101].boneMatrix[0];
float4 l9_103=(*sc_set0.sc_BonesUBO).sc_Bones[l9_101].boneMatrix[1];
float4 l9_104=(*sc_set0.sc_BonesUBO).sc_Bones[l9_101].boneMatrix[2];
float4 l9_105[3];
l9_105[0]=l9_102;
l9_105[1]=l9_103;
l9_105[2]=l9_104;
l9_100=float3(dot(l9_99,l9_105[0]),dot(l9_99,l9_105[1]),dot(l9_99,l9_105[2]));
}
else
{
l9_100=l9_99.xyz;
}
float3 l9_106=l9_100;
float3 l9_107=(((l9_74*l9_75)+(l9_85*l9_86))+(l9_96*l9_97))+(l9_106*l9_60.w);
l9_57.position=float4(l9_107.x,l9_107.y,l9_107.z,l9_57.position.w);
int l9_108=l9_61;
float3x3 l9_109=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_108].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_108].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_108].normalMatrix[2].xyz));
float3x3 l9_110=l9_109;
float3x3 l9_111=l9_110;
int l9_112=l9_62;
float3x3 l9_113=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_112].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_112].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_112].normalMatrix[2].xyz));
float3x3 l9_114=l9_113;
float3x3 l9_115=l9_114;
int l9_116=l9_63;
float3x3 l9_117=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_116].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_116].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_116].normalMatrix[2].xyz));
float3x3 l9_118=l9_117;
float3x3 l9_119=l9_118;
int l9_120=l9_64;
float3x3 l9_121=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_120].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_120].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_120].normalMatrix[2].xyz));
float3x3 l9_122=l9_121;
float3x3 l9_123=l9_122;
l9_57.normal=((((l9_111*l9_57.normal)*l9_60.x)+((l9_115*l9_57.normal)*l9_60.y))+((l9_119*l9_57.normal)*l9_60.z))+((l9_123*l9_57.normal)*l9_60.w);
l9_57.tangent=((((l9_111*l9_57.tangent)*l9_60.x)+((l9_115*l9_57.tangent)*l9_60.y))+((l9_119*l9_57.tangent)*l9_60.z))+((l9_123*l9_57.tangent)*l9_60.w);
}
param_1=l9_57;
if (sc_RenderingSpace_tmp==3)
{
out.varPos=float3(0.0);
out.varNormal=param_1.normal;
out.varTangent=float4(param_1.tangent.x,param_1.tangent.y,param_1.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==4)
{
out.varPos=float3(0.0);
out.varNormal=param_1.normal;
out.varTangent=float4(param_1.tangent.x,param_1.tangent.y,param_1.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
out.varPos=param_1.position.xyz;
out.varNormal=param_1.normal;
out.varTangent=float4(param_1.tangent.x,param_1.tangent.y,param_1.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
out.varPos=((*sc_set0.UserUniforms).sc_ModelMatrix*param_1.position).xyz;
out.varNormal=(*sc_set0.UserUniforms).sc_NormalMatrix*param_1.normal;
float3 l9_124=(*sc_set0.UserUniforms).sc_NormalMatrix*param_1.tangent;
out.varTangent=float4(l9_124.x,l9_124.y,l9_124.z,out.varTangent.w);
}
}
}
}
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
param_1.texture0.x=1.0-param_1.texture0.x;
}
out.varColor=in.color;
sc_Vertex_t v=param_1;
float3 WorldPosition=out.varPos;
float3 WorldNormal=out.varNormal;
float3 WorldTangent=out.varTangent.xyz;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
WorldPosition=out.varPos;
WorldNormal=out.varNormal;
WorldTangent=out.varTangent.xyz;
}
sc_Vertex_t param_2=v;
float3 param_3=WorldPosition;
float3 param_4=WorldNormal;
float3 param_5=WorldTangent;
float4 param_6=v.position;
out.varPos=param_3;
out.varNormal=normalize(param_4);
float3 l9_125=normalize(param_5);
out.varTangent=float4(l9_125.x,l9_125.y,l9_125.z,out.varTangent.w);
out.varTangent.w=in.tangent.w;
if ((int(UseViewSpaceDepthVariant_tmp)!=0)&&(((int(sc_OITDepthGatherPass_tmp)!=0)||(int(sc_OITCompositingPass_tmp)!=0))||(int(sc_OITDepthBoundsPass_tmp)!=0)))
{
float4 l9_126=param_2.position;
float4 l9_127=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
int l9_128=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_128=0;
}
else
{
l9_128=gl_InstanceIndex%2;
}
int l9_129=l9_128;
l9_127=(*sc_set0.UserUniforms).sc_ProjectionMatrixInverseArray[l9_129]*l9_126;
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_130=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_130=0;
}
else
{
l9_130=gl_InstanceIndex%2;
}
int l9_131=l9_130;
l9_127=(*sc_set0.UserUniforms).sc_ViewMatrixArray[l9_131]*l9_126;
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_132=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_132=0;
}
else
{
l9_132=gl_InstanceIndex%2;
}
int l9_133=l9_132;
l9_127=(*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_133]*l9_126;
}
else
{
l9_127=l9_126;
}
}
}
float4 l9_134=l9_127;
out.varViewSpaceDepth=-l9_134.z;
}
float4 l9_135=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
l9_135=param_6;
}
else
{
if (sc_RenderingSpace_tmp==4)
{
int l9_136=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_136=0;
}
else
{
l9_136=gl_InstanceIndex%2;
}
int l9_137=l9_136;
l9_135=((*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_137]*param_2.position)*float4(1.0/(*sc_set0.UserUniforms).sc_Camera.aspect,1.0,1.0,1.0);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_138=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_138=0;
}
else
{
l9_138=gl_InstanceIndex%2;
}
int l9_139=l9_138;
l9_135=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_139]*float4(out.varPos,1.0);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_140=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_140=0;
}
else
{
l9_140=gl_InstanceIndex%2;
}
int l9_141=l9_140;
l9_135=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_141]*float4(out.varPos,1.0);
}
}
}
}
out.varPackedTex=float4(param_2.texture0,param_2.texture1);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float4 l9_142=param_2.position;
float4 l9_143=l9_142;
if (sc_RenderingSpace_tmp==1)
{
l9_143=(*sc_set0.UserUniforms).sc_ModelMatrix*l9_142;
}
float4 l9_144=(*sc_set0.UserUniforms).sc_ProjectorMatrix*l9_143;
float2 l9_145=((l9_144.xy/float2(l9_144.w))*0.5)+float2(0.5);
out.varShadowTex=l9_145;
}
float4 l9_146=l9_135;
if (sc_DepthBufferMode_tmp==1)
{
int l9_147=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_147=0;
}
else
{
l9_147=gl_InstanceIndex%2;
}
int l9_148=l9_147;
if ((*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_148][2].w!=0.0)
{
float l9_149=2.0/log2((*sc_set0.UserUniforms).sc_Camera.clipPlanes.y+1.0);
l9_146.z=((log2(fast::max((*sc_set0.UserUniforms).sc_Camera.clipPlanes.x,1.0+l9_146.w))*l9_149)-1.0)*l9_146.w;
}
}
float4 l9_150=l9_146;
l9_135=l9_150;
float4 l9_151=l9_135;
if ((int(sc_TAAEnabled_tmp)!=0))
{
float2 l9_152=l9_151.xy+((*sc_set0.UserUniforms).sc_TAAJitterOffset*l9_151.w);
l9_151=float4(l9_152.x,l9_152.y,l9_151.z,l9_151.w);
}
float4 l9_153=l9_151;
l9_135=l9_153;
float4 l9_154=l9_135;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_154.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_155=l9_154;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_156=dot(l9_155,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_157=l9_156;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_157;
}
}
float4 l9_158=float4(l9_154.x,-l9_154.y,(l9_154.z*0.5)+(l9_154.w*0.5),l9_154.w);
out.gl_Position=l9_158;
if ((int(sc_Voxelization_tmp)!=0))
{
sc_Vertex_t l9_159=param_2;
sc_Vertex_t l9_160=l9_159;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_161=l9_160;
float3 l9_162=in.blendShape0Pos;
float3 l9_163=in.blendShape0Normal;
float l9_164=(*sc_set0.UserUniforms).weights0.x;
sc_Vertex_t l9_165=l9_161;
float3 l9_166=l9_162;
float l9_167=l9_164;
float3 l9_168=l9_165.position.xyz+(l9_166*l9_167);
l9_165.position=float4(l9_168.x,l9_168.y,l9_168.z,l9_165.position.w);
l9_161=l9_165;
l9_161.normal+=(l9_163*l9_164);
l9_160=l9_161;
sc_Vertex_t l9_169=l9_160;
float3 l9_170=in.blendShape1Pos;
float3 l9_171=in.blendShape1Normal;
float l9_172=(*sc_set0.UserUniforms).weights0.y;
sc_Vertex_t l9_173=l9_169;
float3 l9_174=l9_170;
float l9_175=l9_172;
float3 l9_176=l9_173.position.xyz+(l9_174*l9_175);
l9_173.position=float4(l9_176.x,l9_176.y,l9_176.z,l9_173.position.w);
l9_169=l9_173;
l9_169.normal+=(l9_171*l9_172);
l9_160=l9_169;
sc_Vertex_t l9_177=l9_160;
float3 l9_178=in.blendShape2Pos;
float3 l9_179=in.blendShape2Normal;
float l9_180=(*sc_set0.UserUniforms).weights0.z;
sc_Vertex_t l9_181=l9_177;
float3 l9_182=l9_178;
float l9_183=l9_180;
float3 l9_184=l9_181.position.xyz+(l9_182*l9_183);
l9_181.position=float4(l9_184.x,l9_184.y,l9_184.z,l9_181.position.w);
l9_177=l9_181;
l9_177.normal+=(l9_179*l9_180);
l9_160=l9_177;
}
else
{
sc_Vertex_t l9_185=l9_160;
float3 l9_186=in.blendShape0Pos;
float l9_187=(*sc_set0.UserUniforms).weights0.x;
float3 l9_188=l9_185.position.xyz+(l9_186*l9_187);
l9_185.position=float4(l9_188.x,l9_188.y,l9_188.z,l9_185.position.w);
l9_160=l9_185;
sc_Vertex_t l9_189=l9_160;
float3 l9_190=in.blendShape1Pos;
float l9_191=(*sc_set0.UserUniforms).weights0.y;
float3 l9_192=l9_189.position.xyz+(l9_190*l9_191);
l9_189.position=float4(l9_192.x,l9_192.y,l9_192.z,l9_189.position.w);
l9_160=l9_189;
sc_Vertex_t l9_193=l9_160;
float3 l9_194=in.blendShape2Pos;
float l9_195=(*sc_set0.UserUniforms).weights0.z;
float3 l9_196=l9_193.position.xyz+(l9_194*l9_195);
l9_193.position=float4(l9_196.x,l9_196.y,l9_196.z,l9_193.position.w);
l9_160=l9_193;
sc_Vertex_t l9_197=l9_160;
float3 l9_198=in.blendShape3Pos;
float l9_199=(*sc_set0.UserUniforms).weights0.w;
float3 l9_200=l9_197.position.xyz+(l9_198*l9_199);
l9_197.position=float4(l9_200.x,l9_200.y,l9_200.z,l9_197.position.w);
l9_160=l9_197;
sc_Vertex_t l9_201=l9_160;
float3 l9_202=in.blendShape4Pos;
float l9_203=(*sc_set0.UserUniforms).weights1.x;
float3 l9_204=l9_201.position.xyz+(l9_202*l9_203);
l9_201.position=float4(l9_204.x,l9_204.y,l9_204.z,l9_201.position.w);
l9_160=l9_201;
sc_Vertex_t l9_205=l9_160;
float3 l9_206=in.blendShape5Pos;
float l9_207=(*sc_set0.UserUniforms).weights1.y;
float3 l9_208=l9_205.position.xyz+(l9_206*l9_207);
l9_205.position=float4(l9_208.x,l9_208.y,l9_208.z,l9_205.position.w);
l9_160=l9_205;
}
}
l9_159=l9_160;
sc_Vertex_t l9_209=l9_159;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_210=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_210=float4(1.0,fract(in.boneData.yzw));
l9_210.x-=dot(l9_210.yzw,float3(1.0));
}
float4 l9_211=l9_210;
float4 l9_212=l9_211;
int l9_213=int(in.boneData.x);
int l9_214=int(in.boneData.y);
int l9_215=int(in.boneData.z);
int l9_216=int(in.boneData.w);
int l9_217=l9_213;
float4 l9_218=l9_209.position;
float3 l9_219=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_220=l9_217;
float4 l9_221=(*sc_set0.sc_BonesUBO).sc_Bones[l9_220].boneMatrix[0];
float4 l9_222=(*sc_set0.sc_BonesUBO).sc_Bones[l9_220].boneMatrix[1];
float4 l9_223=(*sc_set0.sc_BonesUBO).sc_Bones[l9_220].boneMatrix[2];
float4 l9_224[3];
l9_224[0]=l9_221;
l9_224[1]=l9_222;
l9_224[2]=l9_223;
l9_219=float3(dot(l9_218,l9_224[0]),dot(l9_218,l9_224[1]),dot(l9_218,l9_224[2]));
}
else
{
l9_219=l9_218.xyz;
}
float3 l9_225=l9_219;
float3 l9_226=l9_225;
float l9_227=l9_212.x;
int l9_228=l9_214;
float4 l9_229=l9_209.position;
float3 l9_230=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_231=l9_228;
float4 l9_232=(*sc_set0.sc_BonesUBO).sc_Bones[l9_231].boneMatrix[0];
float4 l9_233=(*sc_set0.sc_BonesUBO).sc_Bones[l9_231].boneMatrix[1];
float4 l9_234=(*sc_set0.sc_BonesUBO).sc_Bones[l9_231].boneMatrix[2];
float4 l9_235[3];
l9_235[0]=l9_232;
l9_235[1]=l9_233;
l9_235[2]=l9_234;
l9_230=float3(dot(l9_229,l9_235[0]),dot(l9_229,l9_235[1]),dot(l9_229,l9_235[2]));
}
else
{
l9_230=l9_229.xyz;
}
float3 l9_236=l9_230;
float3 l9_237=l9_236;
float l9_238=l9_212.y;
int l9_239=l9_215;
float4 l9_240=l9_209.position;
float3 l9_241=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_242=l9_239;
float4 l9_243=(*sc_set0.sc_BonesUBO).sc_Bones[l9_242].boneMatrix[0];
float4 l9_244=(*sc_set0.sc_BonesUBO).sc_Bones[l9_242].boneMatrix[1];
float4 l9_245=(*sc_set0.sc_BonesUBO).sc_Bones[l9_242].boneMatrix[2];
float4 l9_246[3];
l9_246[0]=l9_243;
l9_246[1]=l9_244;
l9_246[2]=l9_245;
l9_241=float3(dot(l9_240,l9_246[0]),dot(l9_240,l9_246[1]),dot(l9_240,l9_246[2]));
}
else
{
l9_241=l9_240.xyz;
}
float3 l9_247=l9_241;
float3 l9_248=l9_247;
float l9_249=l9_212.z;
int l9_250=l9_216;
float4 l9_251=l9_209.position;
float3 l9_252=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_253=l9_250;
float4 l9_254=(*sc_set0.sc_BonesUBO).sc_Bones[l9_253].boneMatrix[0];
float4 l9_255=(*sc_set0.sc_BonesUBO).sc_Bones[l9_253].boneMatrix[1];
float4 l9_256=(*sc_set0.sc_BonesUBO).sc_Bones[l9_253].boneMatrix[2];
float4 l9_257[3];
l9_257[0]=l9_254;
l9_257[1]=l9_255;
l9_257[2]=l9_256;
l9_252=float3(dot(l9_251,l9_257[0]),dot(l9_251,l9_257[1]),dot(l9_251,l9_257[2]));
}
else
{
l9_252=l9_251.xyz;
}
float3 l9_258=l9_252;
float3 l9_259=(((l9_226*l9_227)+(l9_237*l9_238))+(l9_248*l9_249))+(l9_258*l9_212.w);
l9_209.position=float4(l9_259.x,l9_259.y,l9_259.z,l9_209.position.w);
int l9_260=l9_213;
float3x3 l9_261=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_260].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_260].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_260].normalMatrix[2].xyz));
float3x3 l9_262=l9_261;
float3x3 l9_263=l9_262;
int l9_264=l9_214;
float3x3 l9_265=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_264].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_264].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_264].normalMatrix[2].xyz));
float3x3 l9_266=l9_265;
float3x3 l9_267=l9_266;
int l9_268=l9_215;
float3x3 l9_269=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_268].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_268].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_268].normalMatrix[2].xyz));
float3x3 l9_270=l9_269;
float3x3 l9_271=l9_270;
int l9_272=l9_216;
float3x3 l9_273=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_272].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_272].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_272].normalMatrix[2].xyz));
float3x3 l9_274=l9_273;
float3x3 l9_275=l9_274;
l9_209.normal=((((l9_263*l9_209.normal)*l9_212.x)+((l9_267*l9_209.normal)*l9_212.y))+((l9_271*l9_209.normal)*l9_212.z))+((l9_275*l9_209.normal)*l9_212.w);
l9_209.tangent=((((l9_263*l9_209.tangent)*l9_212.x)+((l9_267*l9_209.tangent)*l9_212.y))+((l9_271*l9_209.tangent)*l9_212.z))+((l9_275*l9_209.tangent)*l9_212.w);
}
l9_159=l9_209;
float l9_276=(*sc_set0.UserUniforms).voxelization_params_0.y;
float l9_277=(*sc_set0.UserUniforms).voxelization_params_0.z;
float l9_278=(*sc_set0.UserUniforms).voxelization_params_0.w;
float l9_279=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.x;
float l9_280=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.y;
float l9_281=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.z;
float l9_282=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.w;
float l9_283=(*sc_set0.UserUniforms).voxelization_params_frustum_nf.x;
float l9_284=(*sc_set0.UserUniforms).voxelization_params_frustum_nf.y;
float3 l9_285=(*sc_set0.UserUniforms).voxelization_params_camera_pos;
float l9_286=l9_276/l9_277;
int l9_287=gl_InstanceIndex;
int l9_288=l9_287;
l9_159.position=(*sc_set0.UserUniforms).sc_ModelMatrixVoxelization*l9_159.position;
float3 l9_289=l9_159.position.xyz;
float3 l9_290=float3(float(l9_288%int(l9_278))*l9_276,float(l9_288/int(l9_278))*l9_276,(float(l9_288)*l9_286)+l9_283);
float3 l9_291=l9_289+l9_290;
float4 l9_292=float4(l9_291-l9_285,1.0);
float l9_293=l9_279;
float l9_294=l9_280;
float l9_295=l9_281;
float l9_296=l9_282;
float l9_297=l9_283;
float l9_298=l9_284;
float4x4 l9_299=float4x4(float4(2.0/(l9_294-l9_293),0.0,0.0,(-(l9_294+l9_293))/(l9_294-l9_293)),float4(0.0,2.0/(l9_296-l9_295),0.0,(-(l9_296+l9_295))/(l9_296-l9_295)),float4(0.0,0.0,(-2.0)/(l9_298-l9_297),(-(l9_298+l9_297))/(l9_298-l9_297)),float4(0.0,0.0,0.0,1.0));
float4x4 l9_300=l9_299;
float4 l9_301=l9_300*l9_292;
l9_301.w=1.0;
out.varScreenPos=l9_301;
float4 l9_302=l9_301*1.0;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_302.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_303=l9_302;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_304=dot(l9_303,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_305=l9_304;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_305;
}
}
float4 l9_306=float4(l9_302.x,-l9_302.y,(l9_302.z*0.5)+(l9_302.w*0.5),l9_302.w);
out.gl_Position=l9_306;
param_2=l9_159;
}
else
{
if ((int(sc_OutputBounds_tmp)!=0))
{
sc_Vertex_t l9_307=param_2;
sc_Vertex_t l9_308=l9_307;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_309=l9_308;
float3 l9_310=in.blendShape0Pos;
float3 l9_311=in.blendShape0Normal;
float l9_312=(*sc_set0.UserUniforms).weights0.x;
sc_Vertex_t l9_313=l9_309;
float3 l9_314=l9_310;
float l9_315=l9_312;
float3 l9_316=l9_313.position.xyz+(l9_314*l9_315);
l9_313.position=float4(l9_316.x,l9_316.y,l9_316.z,l9_313.position.w);
l9_309=l9_313;
l9_309.normal+=(l9_311*l9_312);
l9_308=l9_309;
sc_Vertex_t l9_317=l9_308;
float3 l9_318=in.blendShape1Pos;
float3 l9_319=in.blendShape1Normal;
float l9_320=(*sc_set0.UserUniforms).weights0.y;
sc_Vertex_t l9_321=l9_317;
float3 l9_322=l9_318;
float l9_323=l9_320;
float3 l9_324=l9_321.position.xyz+(l9_322*l9_323);
l9_321.position=float4(l9_324.x,l9_324.y,l9_324.z,l9_321.position.w);
l9_317=l9_321;
l9_317.normal+=(l9_319*l9_320);
l9_308=l9_317;
sc_Vertex_t l9_325=l9_308;
float3 l9_326=in.blendShape2Pos;
float3 l9_327=in.blendShape2Normal;
float l9_328=(*sc_set0.UserUniforms).weights0.z;
sc_Vertex_t l9_329=l9_325;
float3 l9_330=l9_326;
float l9_331=l9_328;
float3 l9_332=l9_329.position.xyz+(l9_330*l9_331);
l9_329.position=float4(l9_332.x,l9_332.y,l9_332.z,l9_329.position.w);
l9_325=l9_329;
l9_325.normal+=(l9_327*l9_328);
l9_308=l9_325;
}
else
{
sc_Vertex_t l9_333=l9_308;
float3 l9_334=in.blendShape0Pos;
float l9_335=(*sc_set0.UserUniforms).weights0.x;
float3 l9_336=l9_333.position.xyz+(l9_334*l9_335);
l9_333.position=float4(l9_336.x,l9_336.y,l9_336.z,l9_333.position.w);
l9_308=l9_333;
sc_Vertex_t l9_337=l9_308;
float3 l9_338=in.blendShape1Pos;
float l9_339=(*sc_set0.UserUniforms).weights0.y;
float3 l9_340=l9_337.position.xyz+(l9_338*l9_339);
l9_337.position=float4(l9_340.x,l9_340.y,l9_340.z,l9_337.position.w);
l9_308=l9_337;
sc_Vertex_t l9_341=l9_308;
float3 l9_342=in.blendShape2Pos;
float l9_343=(*sc_set0.UserUniforms).weights0.z;
float3 l9_344=l9_341.position.xyz+(l9_342*l9_343);
l9_341.position=float4(l9_344.x,l9_344.y,l9_344.z,l9_341.position.w);
l9_308=l9_341;
sc_Vertex_t l9_345=l9_308;
float3 l9_346=in.blendShape3Pos;
float l9_347=(*sc_set0.UserUniforms).weights0.w;
float3 l9_348=l9_345.position.xyz+(l9_346*l9_347);
l9_345.position=float4(l9_348.x,l9_348.y,l9_348.z,l9_345.position.w);
l9_308=l9_345;
sc_Vertex_t l9_349=l9_308;
float3 l9_350=in.blendShape4Pos;
float l9_351=(*sc_set0.UserUniforms).weights1.x;
float3 l9_352=l9_349.position.xyz+(l9_350*l9_351);
l9_349.position=float4(l9_352.x,l9_352.y,l9_352.z,l9_349.position.w);
l9_308=l9_349;
sc_Vertex_t l9_353=l9_308;
float3 l9_354=in.blendShape5Pos;
float l9_355=(*sc_set0.UserUniforms).weights1.y;
float3 l9_356=l9_353.position.xyz+(l9_354*l9_355);
l9_353.position=float4(l9_356.x,l9_356.y,l9_356.z,l9_353.position.w);
l9_308=l9_353;
}
}
l9_307=l9_308;
sc_Vertex_t l9_357=l9_307;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_358=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_358=float4(1.0,fract(in.boneData.yzw));
l9_358.x-=dot(l9_358.yzw,float3(1.0));
}
float4 l9_359=l9_358;
float4 l9_360=l9_359;
int l9_361=int(in.boneData.x);
int l9_362=int(in.boneData.y);
int l9_363=int(in.boneData.z);
int l9_364=int(in.boneData.w);
int l9_365=l9_361;
float4 l9_366=l9_357.position;
float3 l9_367=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_368=l9_365;
float4 l9_369=(*sc_set0.sc_BonesUBO).sc_Bones[l9_368].boneMatrix[0];
float4 l9_370=(*sc_set0.sc_BonesUBO).sc_Bones[l9_368].boneMatrix[1];
float4 l9_371=(*sc_set0.sc_BonesUBO).sc_Bones[l9_368].boneMatrix[2];
float4 l9_372[3];
l9_372[0]=l9_369;
l9_372[1]=l9_370;
l9_372[2]=l9_371;
l9_367=float3(dot(l9_366,l9_372[0]),dot(l9_366,l9_372[1]),dot(l9_366,l9_372[2]));
}
else
{
l9_367=l9_366.xyz;
}
float3 l9_373=l9_367;
float3 l9_374=l9_373;
float l9_375=l9_360.x;
int l9_376=l9_362;
float4 l9_377=l9_357.position;
float3 l9_378=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_379=l9_376;
float4 l9_380=(*sc_set0.sc_BonesUBO).sc_Bones[l9_379].boneMatrix[0];
float4 l9_381=(*sc_set0.sc_BonesUBO).sc_Bones[l9_379].boneMatrix[1];
float4 l9_382=(*sc_set0.sc_BonesUBO).sc_Bones[l9_379].boneMatrix[2];
float4 l9_383[3];
l9_383[0]=l9_380;
l9_383[1]=l9_381;
l9_383[2]=l9_382;
l9_378=float3(dot(l9_377,l9_383[0]),dot(l9_377,l9_383[1]),dot(l9_377,l9_383[2]));
}
else
{
l9_378=l9_377.xyz;
}
float3 l9_384=l9_378;
float3 l9_385=l9_384;
float l9_386=l9_360.y;
int l9_387=l9_363;
float4 l9_388=l9_357.position;
float3 l9_389=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_390=l9_387;
float4 l9_391=(*sc_set0.sc_BonesUBO).sc_Bones[l9_390].boneMatrix[0];
float4 l9_392=(*sc_set0.sc_BonesUBO).sc_Bones[l9_390].boneMatrix[1];
float4 l9_393=(*sc_set0.sc_BonesUBO).sc_Bones[l9_390].boneMatrix[2];
float4 l9_394[3];
l9_394[0]=l9_391;
l9_394[1]=l9_392;
l9_394[2]=l9_393;
l9_389=float3(dot(l9_388,l9_394[0]),dot(l9_388,l9_394[1]),dot(l9_388,l9_394[2]));
}
else
{
l9_389=l9_388.xyz;
}
float3 l9_395=l9_389;
float3 l9_396=l9_395;
float l9_397=l9_360.z;
int l9_398=l9_364;
float4 l9_399=l9_357.position;
float3 l9_400=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_401=l9_398;
float4 l9_402=(*sc_set0.sc_BonesUBO).sc_Bones[l9_401].boneMatrix[0];
float4 l9_403=(*sc_set0.sc_BonesUBO).sc_Bones[l9_401].boneMatrix[1];
float4 l9_404=(*sc_set0.sc_BonesUBO).sc_Bones[l9_401].boneMatrix[2];
float4 l9_405[3];
l9_405[0]=l9_402;
l9_405[1]=l9_403;
l9_405[2]=l9_404;
l9_400=float3(dot(l9_399,l9_405[0]),dot(l9_399,l9_405[1]),dot(l9_399,l9_405[2]));
}
else
{
l9_400=l9_399.xyz;
}
float3 l9_406=l9_400;
float3 l9_407=(((l9_374*l9_375)+(l9_385*l9_386))+(l9_396*l9_397))+(l9_406*l9_360.w);
l9_357.position=float4(l9_407.x,l9_407.y,l9_407.z,l9_357.position.w);
int l9_408=l9_361;
float3x3 l9_409=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_408].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_408].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_408].normalMatrix[2].xyz));
float3x3 l9_410=l9_409;
float3x3 l9_411=l9_410;
int l9_412=l9_362;
float3x3 l9_413=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_412].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_412].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_412].normalMatrix[2].xyz));
float3x3 l9_414=l9_413;
float3x3 l9_415=l9_414;
int l9_416=l9_363;
float3x3 l9_417=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_416].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_416].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_416].normalMatrix[2].xyz));
float3x3 l9_418=l9_417;
float3x3 l9_419=l9_418;
int l9_420=l9_364;
float3x3 l9_421=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_420].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_420].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_420].normalMatrix[2].xyz));
float3x3 l9_422=l9_421;
float3x3 l9_423=l9_422;
l9_357.normal=((((l9_411*l9_357.normal)*l9_360.x)+((l9_415*l9_357.normal)*l9_360.y))+((l9_419*l9_357.normal)*l9_360.z))+((l9_423*l9_357.normal)*l9_360.w);
l9_357.tangent=((((l9_411*l9_357.tangent)*l9_360.x)+((l9_415*l9_357.tangent)*l9_360.y))+((l9_419*l9_357.tangent)*l9_360.z))+((l9_423*l9_357.tangent)*l9_360.w);
}
l9_307=l9_357;
float3 l9_424=(*sc_set0.UserUniforms).voxelization_params_camera_pos;
float2 l9_425=((l9_307.position.xy/float2(l9_307.position.w))*0.5)+float2(0.5);
out.varPackedTex=float4(l9_425.x,l9_425.y,out.varPackedTex.z,out.varPackedTex.w);
l9_307.position=(*sc_set0.UserUniforms).sc_ModelMatrixVoxelization*l9_307.position;
float3 l9_426=l9_307.position.xyz-l9_424;
l9_307.position=float4(l9_426.x,l9_426.y,l9_426.z,l9_307.position.w);
out.varPos=l9_307.position.xyz;
out.varNormal=normalize(l9_307.normal);
float l9_427=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.x;
float l9_428=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.y;
float l9_429=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.z;
float l9_430=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.w;
float l9_431=(*sc_set0.UserUniforms).voxelization_params_frustum_nf.x;
float l9_432=(*sc_set0.UserUniforms).voxelization_params_frustum_nf.y;
float l9_433=l9_427;
float l9_434=l9_428;
float l9_435=l9_429;
float l9_436=l9_430;
float l9_437=l9_431;
float l9_438=l9_432;
float4x4 l9_439=float4x4(float4(2.0/(l9_434-l9_433),0.0,0.0,(-(l9_434+l9_433))/(l9_434-l9_433)),float4(0.0,2.0/(l9_436-l9_435),0.0,(-(l9_436+l9_435))/(l9_436-l9_435)),float4(0.0,0.0,(-2.0)/(l9_438-l9_437),(-(l9_438+l9_437))/(l9_438-l9_437)),float4(0.0,0.0,0.0,1.0));
float4x4 l9_440=l9_439;
float4 l9_441=float4(0.0);
float3 l9_442=(l9_440*l9_307.position).xyz;
l9_441=float4(l9_442.x,l9_442.y,l9_442.z,l9_441.w);
l9_441.w=1.0;
out.varScreenPos=l9_441;
float4 l9_443=l9_441*1.0;
float4 l9_444=l9_443;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_444.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_445=l9_444;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_446=dot(l9_445,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_447=l9_446;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_447;
}
}
float4 l9_448=float4(l9_444.x,-l9_444.y,(l9_444.z*0.5)+(l9_444.w*0.5),l9_444.w);
out.gl_Position=l9_448;
param_2=l9_307;
}
}
v=param_2;
if (PreviewInfo.Saved)
{
out.PreviewVertexColor=float4(PreviewInfo.Color.xyz,1.0);
out.PreviewVertexSaved=1.0;
}
return out;
}
} // VERTEX SHADER


namespace SNAP_FS {
struct sc_RayTracingHitPayload
{
float3 viewDirWS;
float3 positionWS;
float3 normalWS;
float4 tangentWS;
float4 color;
float2 uv0;
float2 uv1;
float2 uv2;
float2 uv3;
uint2 id;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float2 Surface_UVCoord0;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float shaderComplexityValue;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
uint4 sc_RayTracingCasterConfiguration;
uint4 sc_RayTracingCasterOffsetPNTC;
uint4 sc_RayTracingCasterOffsetTexture;
uint4 sc_RayTracingCasterFormatPNTC;
uint4 sc_RayTracingCasterFormatTexture;
float4 sc_RayTracingRayDirectionSize;
float4 sc_RayTracingRayDirectionDims;
float4 sc_RayTracingRayDirectionView;
float4 voxelization_params_0;
float4 voxelization_params_frustum_lrbt;
float4 voxelization_params_frustum_nf;
float3 voxelization_params_camera_pos;
float4x4 sc_ModelMatrixVoxelization;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed[32];
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
int alpha_channel;
int red_channel;
int green_channel;
int blue_channel;
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
float Port_Input1_N010;
float Port_Value2_N013;
float Port_Input1_N009;
float Port_Input1_N035;
float Port_Value1_N036;
float Port_Input1_N046;
float Port_Input1_N051;
float Port_Input1_N034;
float Port_Value1_N043;
float Port_Input1_N052;
float Port_Input1_N053;
float4 Port_Default_N055;
float4 Port_Default_N050;
float depthRef;
};
struct sc_RayTracingCasterVertexBuffer_obj
{
float sc_RayTracingCasterVertices[1];
};
struct sc_RayTracingCasterNonAnimatedVertexBuffer_obj
{
float sc_RayTracingCasterNonAnimatedVertices[1];
};
struct sc_RayTracingCasterIndexBuffer_obj
{
uint sc_RayTracingCasterTriangles[1];
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct sc_Set0
{
const device sc_RayTracingCasterIndexBuffer_obj* sc_RayTracingCasterIndexBuffer [[id(0)]];
const device sc_RayTracingCasterVertexBuffer_obj* sc_RayTracingCasterVertexBuffer [[id(1)]];
const device sc_RayTracingCasterNonAnimatedVertexBuffer_obj* sc_RayTracingCasterNonAnimatedVertexBuffer [[id(2)]];
constant sc_Bones_obj* sc_BonesUBO [[id(3)]];
texture2d<float> baseTex [[id(4)]];
texture2d<float> intensityTexture [[id(5)]];
texture2d<uint> sc_RayTracingHitCasterIdAndBarycentric [[id(16)]];
texture2d<float> sc_RayTracingRayDirection [[id(17)]];
texture2d<float> sc_ScreenTexture [[id(19)]];
sampler baseTexSmpSC [[id(22)]];
sampler intensityTextureSmpSC [[id(23)]];
sampler sc_RayTracingHitCasterIdAndBarycentricSmpSC [[id(27)]];
sampler sc_RayTracingRayDirectionSmpSC [[id(28)]];
sampler sc_ScreenTextureSmpSC [[id(30)]];
constant userUniformsObj* UserUniforms [[id(33)]];
};
struct main_frag_out
{
float4 FragColor0 [[color(0)]];
float4 FragColor1 [[color(1)]];
float4 FragColor2 [[color(2)]];
float4 FragColor3 [[color(3)]];
};
struct main_frag_in
{
float3 varPos [[user(locn0)]];
float3 varNormal [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varPackedTex [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
sc_RayTracingHitPayload sc_RayTracingEvaluateHitPayload(thread const int2& screenPos,thread texture2d<float> sc_RayTracingRayDirection,thread sampler sc_RayTracingRayDirectionSmpSC,constant userUniformsObj& UserUniforms,const device sc_RayTracingCasterVertexBuffer_obj& sc_RayTracingCasterVertexBuffer,const device sc_RayTracingCasterNonAnimatedVertexBuffer_obj& sc_RayTracingCasterNonAnimatedVertexBuffer,const device sc_RayTracingCasterIndexBuffer_obj& sc_RayTracingCasterIndexBuffer,thread texture2d<uint> sc_RayTracingHitCasterIdAndBarycentric,thread sampler sc_RayTracingHitCasterIdAndBarycentricSmpSC)
{
uint4 idAndBarycentric=sc_RayTracingHitCasterIdAndBarycentric.read(uint2(screenPos),0);
sc_RayTracingHitPayload rhp;
rhp.id=idAndBarycentric.xy;
if (rhp.id.x!=(UserUniforms.sc_RayTracingCasterConfiguration.y&65535u))
{
return rhp;
}
float2 brcVW=float2(as_type<half2>(idAndBarycentric.z|(idAndBarycentric.w<<uint(16))));
float3 brc=float3((1.0-brcVW.x)-brcVW.y,brcVW);
float2 param=sc_RayTracingRayDirection.read(uint2(screenPos),0).xy;
float3 l9_0=float3(param.x,param.y,(1.0-abs(param.x))-abs(param.y));
float l9_1=fast::clamp(-l9_0.z,0.0,1.0);
float l9_2;
if (l9_0.x>=0.0)
{
l9_2=-l9_1;
}
else
{
l9_2=l9_1;
}
float l9_3=l9_2;
float l9_4;
if (l9_0.y>=0.0)
{
l9_4=-l9_1;
}
else
{
l9_4=l9_1;
}
float2 l9_5=l9_0.xy+float2(l9_3,l9_4);
l9_0=float3(l9_5.x,l9_5.y,l9_0.z);
float3 l9_6=normalize(l9_0);
float3 rayDir=l9_6;
rhp.viewDirWS=-rayDir;
uint param_1=rhp.id.y;
uint l9_7=min(param_1,UserUniforms.sc_RayTracingCasterConfiguration.z);
uint l9_8=l9_7*6u;
uint l9_9=l9_8&4294967292u;
uint4 l9_10=(uint4(uint2(sc_RayTracingCasterIndexBuffer.sc_RayTracingCasterTriangles[l9_9/4u]),uint2(sc_RayTracingCasterIndexBuffer.sc_RayTracingCasterTriangles[(l9_9/4u)+1u]))&uint4(65535u,4294967295u,65535u,4294967295u))>>uint4(0u,16u,0u,16u);
uint3 l9_11;
if (l9_8==l9_9)
{
l9_11=l9_10.xyz;
}
else
{
l9_11=l9_10.yzw;
}
uint3 l9_12=l9_11;
uint3 i=l9_12;
if (UserUniforms.sc_RayTracingCasterConfiguration.x==2u)
{
float3 param_2=brc;
uint3 param_3=i;
uint param_4=0u;
uint3 l9_13=uint3((param_3*uint3(6u))+uint3(param_4));
uint l9_14=l9_13.x;
float3 l9_15=float3(sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_14],sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_14+1u],sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_14+2u]);
uint l9_16=l9_13.y;
float3 l9_17=float3(sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_16],sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_16+1u],sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_16+2u]);
uint l9_18=l9_13.z;
float3 l9_19=float3(sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_18],sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_18+1u],sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_18+2u]);
float3 l9_20=((l9_15*param_2.x)+(l9_17*param_2.y))+(l9_19*param_2.z);
rhp.positionWS=l9_20;
}
else
{
float3 param_5=brc;
uint3 param_6=i;
uint3 l9_21=uint3((param_6.x*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetPNTC.x,(param_6.y*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetPNTC.x,(param_6.z*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetPNTC.x);
float3 l9_22=float3(0.0);
if (UserUniforms.sc_RayTracingCasterFormatPNTC.x==5u)
{
uint l9_23=l9_21.x;
float3 l9_24=float3(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_23],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_23+1u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_23+2u]);
uint l9_25=l9_21.y;
float3 l9_26=float3(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_25],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_25+1u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_25+2u]);
uint l9_27=l9_21.z;
float3 l9_28=float3(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_27],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_27+1u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_27+2u]);
l9_22=((l9_24*param_5.x)+(l9_26*param_5.y))+(l9_28*param_5.z);
}
else
{
if (UserUniforms.sc_RayTracingCasterFormatPNTC.x==6u)
{
uint l9_29=l9_21.x;
float3 l9_30=float3(float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_29]))),float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_29+1u]))).x);
uint l9_31=l9_21.y;
float3 l9_32=float3(float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_31]))),float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_31+1u]))).x);
uint l9_33=l9_21.z;
float3 l9_34=float3(float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_33]))),float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_33+1u]))).x);
l9_22=((l9_30*param_5.x)+(l9_32*param_5.y))+(l9_34*param_5.z);
}
else
{
l9_22=float3(1.0,0.0,0.0);
}
}
float3 l9_35=l9_22;
float3 positionOS=l9_35;
rhp.positionWS=(UserUniforms.sc_ModelMatrix*float4(positionOS,1.0)).xyz;
}
if (UserUniforms.sc_RayTracingCasterOffsetPNTC.y>0u)
{
if (UserUniforms.sc_RayTracingCasterConfiguration.x==2u)
{
float3 param_7=brc;
uint3 param_8=i;
uint param_9=3u;
uint3 l9_36=uint3((param_8*uint3(6u))+uint3(param_9));
uint l9_37=l9_36.x;
float3 l9_38=float3(sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_37],sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_37+1u],sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_37+2u]);
uint l9_39=l9_36.y;
float3 l9_40=float3(sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_39],sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_39+1u],sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_39+2u]);
uint l9_41=l9_36.z;
float3 l9_42=float3(sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_41],sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_41+1u],sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_41+2u]);
float3 l9_43=((l9_38*param_7.x)+(l9_40*param_7.y))+(l9_42*param_7.z);
rhp.normalWS=l9_43;
}
else
{
float3 param_10=brc;
uint3 param_11=i;
uint3 l9_44=uint3((param_11.x*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetPNTC.y,(param_11.y*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetPNTC.y,(param_11.z*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetPNTC.y);
float3 l9_45=float3(0.0);
if (UserUniforms.sc_RayTracingCasterFormatPNTC.y==5u)
{
uint l9_46=l9_44.x;
float3 l9_47=float3(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_46],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_46+1u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_46+2u]);
uint l9_48=l9_44.y;
float3 l9_49=float3(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_48],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_48+1u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_48+2u]);
uint l9_50=l9_44.z;
float3 l9_51=float3(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_50],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_50+1u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_50+2u]);
l9_45=((l9_47*param_10.x)+(l9_49*param_10.y))+(l9_51*param_10.z);
}
else
{
if (UserUniforms.sc_RayTracingCasterFormatPNTC.y==6u)
{
uint l9_52=l9_44.x;
float3 l9_53=float3(float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_52]))),float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_52+1u]))).x);
uint l9_54=l9_44.y;
float3 l9_55=float3(float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_54]))),float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_54+1u]))).x);
uint l9_56=l9_44.z;
float3 l9_57=float3(float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_56]))),float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_56+1u]))).x);
l9_45=((l9_53*param_10.x)+(l9_55*param_10.y))+(l9_57*param_10.z);
}
else
{
l9_45=float3(1.0,0.0,0.0);
}
}
float3 l9_58=l9_45;
float3 normalOS=l9_58;
rhp.normalWS=normalize(UserUniforms.sc_NormalMatrix*normalOS);
}
}
else
{
rhp.normalWS=float3(1.0,0.0,0.0);
}
bool l9_59=!(UserUniforms.sc_RayTracingCasterConfiguration.x==2u);
bool l9_60;
if (l9_59)
{
l9_60=UserUniforms.sc_RayTracingCasterOffsetPNTC.z>0u;
}
else
{
l9_60=l9_59;
}
if (l9_60)
{
float3 param_12=brc;
uint3 param_13=i;
uint3 l9_61=uint3((param_13.x*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetPNTC.z,(param_13.y*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetPNTC.z,(param_13.z*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetPNTC.z);
float4 l9_62=float4(0.0);
if (UserUniforms.sc_RayTracingCasterFormatPNTC.z==5u)
{
uint l9_63=l9_61.x;
float4 l9_64=float4(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_63],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_63+1u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_63+2u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_63+3u]);
uint l9_65=l9_61.y;
float4 l9_66=float4(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_65],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_65+1u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_65+2u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_65+3u]);
uint l9_67=l9_61.z;
float4 l9_68=float4(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_67],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_67+1u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_67+2u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_67+3u]);
l9_62=((l9_64*param_12.x)+(l9_66*param_12.y))+(l9_68*param_12.z);
}
else
{
if (UserUniforms.sc_RayTracingCasterFormatPNTC.z==6u)
{
uint l9_69=l9_61.x;
float4 l9_70=float4(float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_69]))),float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_69+1u]))));
uint l9_71=l9_61.y;
float4 l9_72=float4(float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_71]))),float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_71+1u]))));
uint l9_73=l9_61.z;
float4 l9_74=float4(float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_73]))),float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_73+1u]))));
l9_62=((l9_70*param_12.x)+(l9_72*param_12.y))+(l9_74*param_12.z);
}
else
{
if (UserUniforms.sc_RayTracingCasterFormatPNTC.z==2u)
{
uint l9_75=l9_61.x;
uint l9_76=as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_75]);
uint l9_77=l9_76&255u;
uint l9_78=(l9_76>>uint(8))&255u;
uint l9_79=(l9_76>>uint(16))&255u;
uint l9_80=(l9_76>>uint(24))&255u;
float4 l9_81=float4(float(l9_77),float(l9_78),float(l9_79),float(l9_80))/float4(255.0);
uint l9_82=l9_61.y;
uint l9_83=as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_82]);
uint l9_84=l9_83&255u;
uint l9_85=(l9_83>>uint(8))&255u;
uint l9_86=(l9_83>>uint(16))&255u;
uint l9_87=(l9_83>>uint(24))&255u;
float4 l9_88=float4(float(l9_84),float(l9_85),float(l9_86),float(l9_87))/float4(255.0);
uint l9_89=l9_61.z;
uint l9_90=as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_89]);
uint l9_91=l9_90&255u;
uint l9_92=(l9_90>>uint(8))&255u;
uint l9_93=(l9_90>>uint(16))&255u;
uint l9_94=(l9_90>>uint(24))&255u;
float4 l9_95=float4(float(l9_91),float(l9_92),float(l9_93),float(l9_94))/float4(255.0);
l9_62=((l9_81*param_12.x)+(l9_88*param_12.y))+(l9_95*param_12.z);
}
else
{
l9_62=float4(1.0,0.0,0.0,0.0);
}
}
}
float4 l9_96=l9_62;
float4 tangentOS=l9_96;
float3 tangentWS=normalize(UserUniforms.sc_NormalMatrix*tangentOS.xyz);
rhp.tangentWS=float4(tangentWS,tangentOS.w);
}
else
{
rhp.tangentWS=float4(1.0,0.0,0.0,1.0);
}
if (UserUniforms.sc_RayTracingCasterFormatPNTC.w>0u)
{
float3 param_14=brc;
uint3 param_15=i;
uint3 l9_97=uint3((param_15.x*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetPNTC.w,(param_15.y*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetPNTC.w,(param_15.z*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetPNTC.w);
float4 l9_98=float4(0.0);
if (UserUniforms.sc_RayTracingCasterFormatPNTC.w==5u)
{
uint l9_99=l9_97.x;
float4 l9_100=float4(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_99],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_99+1u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_99+2u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_99+3u]);
uint l9_101=l9_97.y;
float4 l9_102=float4(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_101],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_101+1u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_101+2u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_101+3u]);
uint l9_103=l9_97.z;
float4 l9_104=float4(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_103],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_103+1u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_103+2u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_103+3u]);
l9_98=((l9_100*param_14.x)+(l9_102*param_14.y))+(l9_104*param_14.z);
}
else
{
if (UserUniforms.sc_RayTracingCasterFormatPNTC.w==6u)
{
uint l9_105=l9_97.x;
float4 l9_106=float4(float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_105]))),float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_105+1u]))));
uint l9_107=l9_97.y;
float4 l9_108=float4(float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_107]))),float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_107+1u]))));
uint l9_109=l9_97.z;
float4 l9_110=float4(float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_109]))),float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_109+1u]))));
l9_98=((l9_106*param_14.x)+(l9_108*param_14.y))+(l9_110*param_14.z);
}
else
{
if (UserUniforms.sc_RayTracingCasterFormatPNTC.w==2u)
{
uint l9_111=l9_97.x;
uint l9_112=as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_111]);
uint l9_113=l9_112&255u;
uint l9_114=(l9_112>>uint(8))&255u;
uint l9_115=(l9_112>>uint(16))&255u;
uint l9_116=(l9_112>>uint(24))&255u;
float4 l9_117=float4(float(l9_113),float(l9_114),float(l9_115),float(l9_116))/float4(255.0);
uint l9_118=l9_97.y;
uint l9_119=as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_118]);
uint l9_120=l9_119&255u;
uint l9_121=(l9_119>>uint(8))&255u;
uint l9_122=(l9_119>>uint(16))&255u;
uint l9_123=(l9_119>>uint(24))&255u;
float4 l9_124=float4(float(l9_120),float(l9_121),float(l9_122),float(l9_123))/float4(255.0);
uint l9_125=l9_97.z;
uint l9_126=as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_125]);
uint l9_127=l9_126&255u;
uint l9_128=(l9_126>>uint(8))&255u;
uint l9_129=(l9_126>>uint(16))&255u;
uint l9_130=(l9_126>>uint(24))&255u;
float4 l9_131=float4(float(l9_127),float(l9_128),float(l9_129),float(l9_130))/float4(255.0);
l9_98=((l9_117*param_14.x)+(l9_124*param_14.y))+(l9_131*param_14.z);
}
else
{
l9_98=float4(1.0,0.0,0.0,0.0);
}
}
}
float4 l9_132=l9_98;
rhp.color=l9_132;
}
float2 dummyRedBlack=float2(dot(brc,float3(uint3(1u)-(i%uint3(2u)))),0.0);
if (UserUniforms.sc_RayTracingCasterFormatTexture.x>0u)
{
float3 param_16=brc;
uint3 param_17=i;
uint3 l9_133=uint3((param_17.x*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetTexture.x,(param_17.y*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetTexture.x,(param_17.z*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetTexture.x);
float2 l9_134=float2(0.0);
if (UserUniforms.sc_RayTracingCasterFormatTexture.x==5u)
{
uint l9_135=l9_133.x;
float2 l9_136=float2(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_135],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_135+1u]);
uint l9_137=l9_133.y;
float2 l9_138=float2(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_137],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_137+1u]);
uint l9_139=l9_133.z;
float2 l9_140=float2(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_139],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_139+1u]);
l9_134=((l9_136*param_16.x)+(l9_138*param_16.y))+(l9_140*param_16.z);
}
else
{
if (UserUniforms.sc_RayTracingCasterFormatTexture.x==6u)
{
uint l9_141=l9_133.x;
float2 l9_142=float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_141])));
uint l9_143=l9_133.y;
float2 l9_144=float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_143])));
uint l9_145=l9_133.z;
float2 l9_146=float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_145])));
l9_134=((l9_142*param_16.x)+(l9_144*param_16.y))+(l9_146*param_16.z);
}
else
{
l9_134=float2(1.0,0.0);
}
}
float2 l9_147=l9_134;
rhp.uv0=l9_147;
}
else
{
rhp.uv0=dummyRedBlack;
}
if (UserUniforms.sc_RayTracingCasterFormatTexture.y>0u)
{
float3 param_18=brc;
uint3 param_19=i;
uint3 l9_148=uint3((param_19.x*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetTexture.y,(param_19.y*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetTexture.y,(param_19.z*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetTexture.y);
float2 l9_149=float2(0.0);
if (UserUniforms.sc_RayTracingCasterFormatTexture.y==5u)
{
uint l9_150=l9_148.x;
float2 l9_151=float2(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_150],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_150+1u]);
uint l9_152=l9_148.y;
float2 l9_153=float2(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_152],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_152+1u]);
uint l9_154=l9_148.z;
float2 l9_155=float2(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_154],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_154+1u]);
l9_149=((l9_151*param_18.x)+(l9_153*param_18.y))+(l9_155*param_18.z);
}
else
{
if (UserUniforms.sc_RayTracingCasterFormatTexture.y==6u)
{
uint l9_156=l9_148.x;
float2 l9_157=float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_156])));
uint l9_158=l9_148.y;
float2 l9_159=float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_158])));
uint l9_160=l9_148.z;
float2 l9_161=float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_160])));
l9_149=((l9_157*param_18.x)+(l9_159*param_18.y))+(l9_161*param_18.z);
}
else
{
l9_149=float2(1.0,0.0);
}
}
float2 l9_162=l9_149;
rhp.uv1=l9_162;
}
else
{
rhp.uv1=dummyRedBlack;
}
if (UserUniforms.sc_RayTracingCasterFormatTexture.z>0u)
{
float3 param_20=brc;
uint3 param_21=i;
uint3 l9_163=uint3((param_21.x*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetTexture.z,(param_21.y*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetTexture.z,(param_21.z*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetTexture.z);
float2 l9_164=float2(0.0);
if (UserUniforms.sc_RayTracingCasterFormatTexture.z==5u)
{
uint l9_165=l9_163.x;
float2 l9_166=float2(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_165],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_165+1u]);
uint l9_167=l9_163.y;
float2 l9_168=float2(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_167],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_167+1u]);
uint l9_169=l9_163.z;
float2 l9_170=float2(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_169],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_169+1u]);
l9_164=((l9_166*param_20.x)+(l9_168*param_20.y))+(l9_170*param_20.z);
}
else
{
if (UserUniforms.sc_RayTracingCasterFormatTexture.z==6u)
{
uint l9_171=l9_163.x;
float2 l9_172=float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_171])));
uint l9_173=l9_163.y;
float2 l9_174=float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_173])));
uint l9_175=l9_163.z;
float2 l9_176=float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_175])));
l9_164=((l9_172*param_20.x)+(l9_174*param_20.y))+(l9_176*param_20.z);
}
else
{
l9_164=float2(1.0,0.0);
}
}
float2 l9_177=l9_164;
rhp.uv2=l9_177;
}
else
{
rhp.uv2=dummyRedBlack;
}
if (UserUniforms.sc_RayTracingCasterFormatTexture.w>0u)
{
float3 param_22=brc;
uint3 param_23=i;
uint3 l9_178=uint3((param_23.x*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetTexture.w,(param_23.y*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetTexture.w,(param_23.z*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetTexture.w);
float2 l9_179=float2(0.0);
if (UserUniforms.sc_RayTracingCasterFormatTexture.w==5u)
{
uint l9_180=l9_178.x;
float2 l9_181=float2(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_180],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_180+1u]);
uint l9_182=l9_178.y;
float2 l9_183=float2(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_182],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_182+1u]);
uint l9_184=l9_178.z;
float2 l9_185=float2(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_184],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_184+1u]);
l9_179=((l9_181*param_22.x)+(l9_183*param_22.y))+(l9_185*param_22.z);
}
else
{
if (UserUniforms.sc_RayTracingCasterFormatTexture.w==6u)
{
uint l9_186=l9_178.x;
float2 l9_187=float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_186])));
uint l9_188=l9_178.y;
float2 l9_189=float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_188])));
uint l9_190=l9_178.z;
float2 l9_191=float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_190])));
l9_179=((l9_187*param_22.x)+(l9_189*param_22.y))+(l9_191*param_22.z);
}
else
{
l9_179=float2(1.0,0.0);
}
}
float2 l9_192=l9_179;
rhp.uv3=l9_192;
}
else
{
rhp.uv3=dummyRedBlack;
}
return rhp;
}
float transformSingleColor(thread const float& original,thread const float& intMap,thread const float& target)
{
if (((int(BLEND_MODE_REALISTIC_tmp)!=0)||(int(BLEND_MODE_FORGRAY_tmp)!=0))||(int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
return original/pow(1.0-target,intMap);
}
else
{
if ((int(BLEND_MODE_DIVISION_tmp)!=0))
{
return original/(1.0-target);
}
else
{
if ((int(BLEND_MODE_BRIGHT_tmp)!=0))
{
return original/pow(1.0-target,2.0-(2.0*original));
}
}
}
return 0.0;
}
float3 transformColor(thread const float& yValue,thread const float3& original,thread const float3& target,thread const float& weight,thread const float& intMap)
{
if ((int(BLEND_MODE_INTENSE_tmp)!=0))
{
float3 param=original;
float3 l9_0=param;
float4 l9_1;
if (l9_0.y<l9_0.z)
{
l9_1=float4(l9_0.zy,-1.0,0.66666669);
}
else
{
l9_1=float4(l9_0.yz,0.0,-0.33333334);
}
float4 l9_2=l9_1;
float4 l9_3;
if (l9_0.x<l9_2.x)
{
l9_3=float4(l9_2.xyw,l9_0.x);
}
else
{
l9_3=float4(l9_0.x,l9_2.yzx);
}
float4 l9_4=l9_3;
float l9_5=l9_4.x-fast::min(l9_4.w,l9_4.y);
float l9_6=abs(((l9_4.w-l9_4.y)/((6.0*l9_5)+1e-07))+l9_4.z);
float l9_7=l9_4.x;
float3 l9_8=float3(l9_6,l9_5,l9_7);
float3 l9_9=l9_8;
float l9_10=l9_9.z-(l9_9.y*0.5);
float l9_11=l9_9.y/((1.0-abs((2.0*l9_10)-1.0))+1e-07);
float3 l9_12=float3(l9_9.x,l9_11,l9_10);
float3 hslOrig=l9_12;
float3 res=float3(0.0);
res.x=target.x;
res.y=target.y;
res.z=hslOrig.z;
float3 param_1=res;
float l9_13=param_1.x;
float l9_14=abs((6.0*l9_13)-3.0)-1.0;
float l9_15=2.0-abs((6.0*l9_13)-2.0);
float l9_16=2.0-abs((6.0*l9_13)-4.0);
float3 l9_17=fast::clamp(float3(l9_14,l9_15,l9_16),float3(0.0),float3(1.0));
float3 l9_18=l9_17;
float l9_19=(1.0-abs((2.0*param_1.z)-1.0))*param_1.y;
l9_18=((l9_18-float3(0.5))*l9_19)+float3(param_1.z);
float3 l9_20=l9_18;
res=l9_20;
float3 resColor=mix(original,res,float3(weight));
return resColor;
}
else
{
float3 tmpColor=float3(0.0);
float param_2=yValue;
float param_3=intMap;
float param_4=target.x;
tmpColor.x=transformSingleColor(param_2,param_3,param_4);
float param_5=yValue;
float param_6=intMap;
float param_7=target.y;
tmpColor.y=transformSingleColor(param_5,param_6,param_7);
float param_8=yValue;
float param_9=intMap;
float param_10=target.z;
tmpColor.z=transformSingleColor(param_8,param_9,param_10);
tmpColor=fast::clamp(tmpColor,float3(0.0),float3(1.0));
float3 resColor_1=mix(original,tmpColor,float3(weight));
return resColor_1;
}
}
float3 definedBlend(thread const float3& a,thread const float3& b,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> intensityTexture,thread sampler intensityTextureSmpSC)
{
if ((int(BLEND_MODE_LIGHTEN_tmp)!=0))
{
return fast::max(a,b);
}
else
{
if ((int(BLEND_MODE_DARKEN_tmp)!=0))
{
return fast::min(a,b);
}
else
{
if ((int(BLEND_MODE_DIVIDE_tmp)!=0))
{
return b/a;
}
else
{
if ((int(BLEND_MODE_AVERAGE_tmp)!=0))
{
return (a+b)*0.5;
}
else
{
if ((int(BLEND_MODE_SUBTRACT_tmp)!=0))
{
return fast::max((a+b)-float3(1.0),float3(0.0));
}
else
{
if ((int(BLEND_MODE_DIFFERENCE_tmp)!=0))
{
return abs(a-b);
}
else
{
if ((int(BLEND_MODE_NEGATION_tmp)!=0))
{
return float3(1.0)-abs((float3(1.0)-a)-b);
}
else
{
if ((int(BLEND_MODE_EXCLUSION_tmp)!=0))
{
return (a+b)-((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_OVERLAY_tmp)!=0))
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
float l9_1=l9_0;
float l9_2;
if (a.y<0.5)
{
l9_2=(2.0*a.y)*b.y;
}
else
{
l9_2=1.0-((2.0*(1.0-a.y))*(1.0-b.y));
}
float l9_3=l9_2;
float l9_4;
if (a.z<0.5)
{
l9_4=(2.0*a.z)*b.z;
}
else
{
l9_4=1.0-((2.0*(1.0-a.z))*(1.0-b.z));
}
return float3(l9_1,l9_3,l9_4);
}
else
{
if ((int(BLEND_MODE_SOFT_LIGHT_tmp)!=0))
{
return (((float3(1.0)-(b*2.0))*a)*a)+((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_HARD_LIGHT_tmp)!=0))
{
float l9_5;
if (b.x<0.5)
{
l9_5=(2.0*b.x)*a.x;
}
else
{
l9_5=1.0-((2.0*(1.0-b.x))*(1.0-a.x));
}
float l9_6=l9_5;
float l9_7;
if (b.y<0.5)
{
l9_7=(2.0*b.y)*a.y;
}
else
{
l9_7=1.0-((2.0*(1.0-b.y))*(1.0-a.y));
}
float l9_8=l9_7;
float l9_9;
if (b.z<0.5)
{
l9_9=(2.0*b.z)*a.z;
}
else
{
l9_9=1.0-((2.0*(1.0-b.z))*(1.0-a.z));
}
return float3(l9_6,l9_8,l9_9);
}
else
{
if ((int(BLEND_MODE_COLOR_DODGE_tmp)!=0))
{
float l9_10;
if (b.x==1.0)
{
l9_10=b.x;
}
else
{
l9_10=fast::min(a.x/(1.0-b.x),1.0);
}
float l9_11=l9_10;
float l9_12;
if (b.y==1.0)
{
l9_12=b.y;
}
else
{
l9_12=fast::min(a.y/(1.0-b.y),1.0);
}
float l9_13=l9_12;
float l9_14;
if (b.z==1.0)
{
l9_14=b.z;
}
else
{
l9_14=fast::min(a.z/(1.0-b.z),1.0);
}
return float3(l9_11,l9_13,l9_14);
}
else
{
if ((int(BLEND_MODE_COLOR_BURN_tmp)!=0))
{
float l9_15;
if (b.x==0.0)
{
l9_15=b.x;
}
else
{
l9_15=fast::max(1.0-((1.0-a.x)/b.x),0.0);
}
float l9_16=l9_15;
float l9_17;
if (b.y==0.0)
{
l9_17=b.y;
}
else
{
l9_17=fast::max(1.0-((1.0-a.y)/b.y),0.0);
}
float l9_18=l9_17;
float l9_19;
if (b.z==0.0)
{
l9_19=b.z;
}
else
{
l9_19=fast::max(1.0-((1.0-a.z)/b.z),0.0);
}
return float3(l9_16,l9_18,l9_19);
}
else
{
if ((int(BLEND_MODE_LINEAR_LIGHT_tmp)!=0))
{
float l9_20;
if (b.x<0.5)
{
l9_20=fast::max((a.x+(2.0*b.x))-1.0,0.0);
}
else
{
l9_20=fast::min(a.x+(2.0*(b.x-0.5)),1.0);
}
float l9_21=l9_20;
float l9_22;
if (b.y<0.5)
{
l9_22=fast::max((a.y+(2.0*b.y))-1.0,0.0);
}
else
{
l9_22=fast::min(a.y+(2.0*(b.y-0.5)),1.0);
}
float l9_23=l9_22;
float l9_24;
if (b.z<0.5)
{
l9_24=fast::max((a.z+(2.0*b.z))-1.0,0.0);
}
else
{
l9_24=fast::min(a.z+(2.0*(b.z-0.5)),1.0);
}
return float3(l9_21,l9_23,l9_24);
}
else
{
if ((int(BLEND_MODE_VIVID_LIGHT_tmp)!=0))
{
float l9_25;
if (b.x<0.5)
{
float l9_26;
if ((2.0*b.x)==0.0)
{
l9_26=2.0*b.x;
}
else
{
l9_26=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_25=l9_26;
}
else
{
float l9_27;
if ((2.0*(b.x-0.5))==1.0)
{
l9_27=2.0*(b.x-0.5);
}
else
{
l9_27=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_25=l9_27;
}
float l9_28=l9_25;
float l9_29;
if (b.y<0.5)
{
float l9_30;
if ((2.0*b.y)==0.0)
{
l9_30=2.0*b.y;
}
else
{
l9_30=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_29=l9_30;
}
else
{
float l9_31;
if ((2.0*(b.y-0.5))==1.0)
{
l9_31=2.0*(b.y-0.5);
}
else
{
l9_31=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_29=l9_31;
}
float l9_32=l9_29;
float l9_33;
if (b.z<0.5)
{
float l9_34;
if ((2.0*b.z)==0.0)
{
l9_34=2.0*b.z;
}
else
{
l9_34=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_33=l9_34;
}
else
{
float l9_35;
if ((2.0*(b.z-0.5))==1.0)
{
l9_35=2.0*(b.z-0.5);
}
else
{
l9_35=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_33=l9_35;
}
return float3(l9_28,l9_32,l9_33);
}
else
{
if ((int(BLEND_MODE_PIN_LIGHT_tmp)!=0))
{
float l9_36;
if (b.x<0.5)
{
l9_36=fast::min(a.x,2.0*b.x);
}
else
{
l9_36=fast::max(a.x,2.0*(b.x-0.5));
}
float l9_37=l9_36;
float l9_38;
if (b.y<0.5)
{
l9_38=fast::min(a.y,2.0*b.y);
}
else
{
l9_38=fast::max(a.y,2.0*(b.y-0.5));
}
float l9_39=l9_38;
float l9_40;
if (b.z<0.5)
{
l9_40=fast::min(a.z,2.0*b.z);
}
else
{
l9_40=fast::max(a.z,2.0*(b.z-0.5));
}
return float3(l9_37,l9_39,l9_40);
}
else
{
if ((int(BLEND_MODE_HARD_MIX_tmp)!=0))
{
float l9_41;
if (b.x<0.5)
{
float l9_42;
if ((2.0*b.x)==0.0)
{
l9_42=2.0*b.x;
}
else
{
l9_42=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_41=l9_42;
}
else
{
float l9_43;
if ((2.0*(b.x-0.5))==1.0)
{
l9_43=2.0*(b.x-0.5);
}
else
{
l9_43=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_41=l9_43;
}
float l9_44=l9_41;
float l9_45;
if (b.y<0.5)
{
float l9_46;
if ((2.0*b.y)==0.0)
{
l9_46=2.0*b.y;
}
else
{
l9_46=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_45=l9_46;
}
else
{
float l9_47;
if ((2.0*(b.y-0.5))==1.0)
{
l9_47=2.0*(b.y-0.5);
}
else
{
l9_47=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_45=l9_47;
}
float l9_48=l9_45;
float l9_49;
if (b.z<0.5)
{
float l9_50;
if ((2.0*b.z)==0.0)
{
l9_50=2.0*b.z;
}
else
{
l9_50=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_49=l9_50;
}
else
{
float l9_51;
if ((2.0*(b.z-0.5))==1.0)
{
l9_51=2.0*(b.z-0.5);
}
else
{
l9_51=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_49=l9_51;
}
return float3((l9_44<0.5) ? 0.0 : 1.0,(l9_48<0.5) ? 0.0 : 1.0,(l9_49<0.5) ? 0.0 : 1.0);
}
else
{
if ((int(BLEND_MODE_HARD_REFLECT_tmp)!=0))
{
float l9_52;
if (b.x==1.0)
{
l9_52=b.x;
}
else
{
l9_52=fast::min((a.x*a.x)/(1.0-b.x),1.0);
}
float l9_53=l9_52;
float l9_54;
if (b.y==1.0)
{
l9_54=b.y;
}
else
{
l9_54=fast::min((a.y*a.y)/(1.0-b.y),1.0);
}
float l9_55=l9_54;
float l9_56;
if (b.z==1.0)
{
l9_56=b.z;
}
else
{
l9_56=fast::min((a.z*a.z)/(1.0-b.z),1.0);
}
return float3(l9_53,l9_55,l9_56);
}
else
{
if ((int(BLEND_MODE_HARD_GLOW_tmp)!=0))
{
float l9_57;
if (a.x==1.0)
{
l9_57=a.x;
}
else
{
l9_57=fast::min((b.x*b.x)/(1.0-a.x),1.0);
}
float l9_58=l9_57;
float l9_59;
if (a.y==1.0)
{
l9_59=a.y;
}
else
{
l9_59=fast::min((b.y*b.y)/(1.0-a.y),1.0);
}
float l9_60=l9_59;
float l9_61;
if (a.z==1.0)
{
l9_61=a.z;
}
else
{
l9_61=fast::min((b.z*b.z)/(1.0-a.z),1.0);
}
return float3(l9_58,l9_60,l9_61);
}
else
{
if ((int(BLEND_MODE_HARD_PHOENIX_tmp)!=0))
{
return (fast::min(a,b)-fast::max(a,b))+float3(1.0);
}
else
{
if ((int(BLEND_MODE_HUE_tmp)!=0))
{
float3 param=a;
float3 param_1=b;
float3 l9_62=param;
float3 l9_63=l9_62;
float4 l9_64;
if (l9_63.y<l9_63.z)
{
l9_64=float4(l9_63.zy,-1.0,0.66666669);
}
else
{
l9_64=float4(l9_63.yz,0.0,-0.33333334);
}
float4 l9_65=l9_64;
float4 l9_66;
if (l9_63.x<l9_65.x)
{
l9_66=float4(l9_65.xyw,l9_63.x);
}
else
{
l9_66=float4(l9_63.x,l9_65.yzx);
}
float4 l9_67=l9_66;
float l9_68=l9_67.x-fast::min(l9_67.w,l9_67.y);
float l9_69=abs(((l9_67.w-l9_67.y)/((6.0*l9_68)+1e-07))+l9_67.z);
float l9_70=l9_67.x;
float3 l9_71=float3(l9_69,l9_68,l9_70);
float3 l9_72=l9_71;
float l9_73=l9_72.z-(l9_72.y*0.5);
float l9_74=l9_72.y/((1.0-abs((2.0*l9_73)-1.0))+1e-07);
float3 l9_75=float3(l9_72.x,l9_74,l9_73);
float3 l9_76=l9_75;
float3 l9_77=param_1;
float3 l9_78=l9_77;
float4 l9_79;
if (l9_78.y<l9_78.z)
{
l9_79=float4(l9_78.zy,-1.0,0.66666669);
}
else
{
l9_79=float4(l9_78.yz,0.0,-0.33333334);
}
float4 l9_80=l9_79;
float4 l9_81;
if (l9_78.x<l9_80.x)
{
l9_81=float4(l9_80.xyw,l9_78.x);
}
else
{
l9_81=float4(l9_78.x,l9_80.yzx);
}
float4 l9_82=l9_81;
float l9_83=l9_82.x-fast::min(l9_82.w,l9_82.y);
float l9_84=abs(((l9_82.w-l9_82.y)/((6.0*l9_83)+1e-07))+l9_82.z);
float l9_85=l9_82.x;
float3 l9_86=float3(l9_84,l9_83,l9_85);
float3 l9_87=l9_86;
float l9_88=l9_87.z-(l9_87.y*0.5);
float l9_89=l9_87.y/((1.0-abs((2.0*l9_88)-1.0))+1e-07);
float3 l9_90=float3(l9_87.x,l9_89,l9_88);
float3 l9_91=float3(l9_90.x,l9_76.y,l9_76.z);
float l9_92=l9_91.x;
float l9_93=abs((6.0*l9_92)-3.0)-1.0;
float l9_94=2.0-abs((6.0*l9_92)-2.0);
float l9_95=2.0-abs((6.0*l9_92)-4.0);
float3 l9_96=fast::clamp(float3(l9_93,l9_94,l9_95),float3(0.0),float3(1.0));
float3 l9_97=l9_96;
float l9_98=(1.0-abs((2.0*l9_91.z)-1.0))*l9_91.y;
l9_97=((l9_97-float3(0.5))*l9_98)+float3(l9_91.z);
float3 l9_99=l9_97;
float3 l9_100=l9_99;
return l9_100;
}
else
{
if ((int(BLEND_MODE_SATURATION_tmp)!=0))
{
float3 param_2=a;
float3 param_3=b;
float3 l9_101=param_2;
float3 l9_102=l9_101;
float4 l9_103;
if (l9_102.y<l9_102.z)
{
l9_103=float4(l9_102.zy,-1.0,0.66666669);
}
else
{
l9_103=float4(l9_102.yz,0.0,-0.33333334);
}
float4 l9_104=l9_103;
float4 l9_105;
if (l9_102.x<l9_104.x)
{
l9_105=float4(l9_104.xyw,l9_102.x);
}
else
{
l9_105=float4(l9_102.x,l9_104.yzx);
}
float4 l9_106=l9_105;
float l9_107=l9_106.x-fast::min(l9_106.w,l9_106.y);
float l9_108=abs(((l9_106.w-l9_106.y)/((6.0*l9_107)+1e-07))+l9_106.z);
float l9_109=l9_106.x;
float3 l9_110=float3(l9_108,l9_107,l9_109);
float3 l9_111=l9_110;
float l9_112=l9_111.z-(l9_111.y*0.5);
float l9_113=l9_111.y/((1.0-abs((2.0*l9_112)-1.0))+1e-07);
float3 l9_114=float3(l9_111.x,l9_113,l9_112);
float3 l9_115=l9_114;
float l9_116=l9_115.x;
float3 l9_117=param_3;
float3 l9_118=l9_117;
float4 l9_119;
if (l9_118.y<l9_118.z)
{
l9_119=float4(l9_118.zy,-1.0,0.66666669);
}
else
{
l9_119=float4(l9_118.yz,0.0,-0.33333334);
}
float4 l9_120=l9_119;
float4 l9_121;
if (l9_118.x<l9_120.x)
{
l9_121=float4(l9_120.xyw,l9_118.x);
}
else
{
l9_121=float4(l9_118.x,l9_120.yzx);
}
float4 l9_122=l9_121;
float l9_123=l9_122.x-fast::min(l9_122.w,l9_122.y);
float l9_124=abs(((l9_122.w-l9_122.y)/((6.0*l9_123)+1e-07))+l9_122.z);
float l9_125=l9_122.x;
float3 l9_126=float3(l9_124,l9_123,l9_125);
float3 l9_127=l9_126;
float l9_128=l9_127.z-(l9_127.y*0.5);
float l9_129=l9_127.y/((1.0-abs((2.0*l9_128)-1.0))+1e-07);
float3 l9_130=float3(l9_127.x,l9_129,l9_128);
float3 l9_131=float3(l9_116,l9_130.y,l9_115.z);
float l9_132=l9_131.x;
float l9_133=abs((6.0*l9_132)-3.0)-1.0;
float l9_134=2.0-abs((6.0*l9_132)-2.0);
float l9_135=2.0-abs((6.0*l9_132)-4.0);
float3 l9_136=fast::clamp(float3(l9_133,l9_134,l9_135),float3(0.0),float3(1.0));
float3 l9_137=l9_136;
float l9_138=(1.0-abs((2.0*l9_131.z)-1.0))*l9_131.y;
l9_137=((l9_137-float3(0.5))*l9_138)+float3(l9_131.z);
float3 l9_139=l9_137;
float3 l9_140=l9_139;
return l9_140;
}
else
{
if ((int(BLEND_MODE_COLOR_tmp)!=0))
{
float3 param_4=a;
float3 param_5=b;
float3 l9_141=param_5;
float3 l9_142=l9_141;
float4 l9_143;
if (l9_142.y<l9_142.z)
{
l9_143=float4(l9_142.zy,-1.0,0.66666669);
}
else
{
l9_143=float4(l9_142.yz,0.0,-0.33333334);
}
float4 l9_144=l9_143;
float4 l9_145;
if (l9_142.x<l9_144.x)
{
l9_145=float4(l9_144.xyw,l9_142.x);
}
else
{
l9_145=float4(l9_142.x,l9_144.yzx);
}
float4 l9_146=l9_145;
float l9_147=l9_146.x-fast::min(l9_146.w,l9_146.y);
float l9_148=abs(((l9_146.w-l9_146.y)/((6.0*l9_147)+1e-07))+l9_146.z);
float l9_149=l9_146.x;
float3 l9_150=float3(l9_148,l9_147,l9_149);
float3 l9_151=l9_150;
float l9_152=l9_151.z-(l9_151.y*0.5);
float l9_153=l9_151.y/((1.0-abs((2.0*l9_152)-1.0))+1e-07);
float3 l9_154=float3(l9_151.x,l9_153,l9_152);
float3 l9_155=l9_154;
float l9_156=l9_155.x;
float l9_157=l9_155.y;
float3 l9_158=param_4;
float3 l9_159=l9_158;
float4 l9_160;
if (l9_159.y<l9_159.z)
{
l9_160=float4(l9_159.zy,-1.0,0.66666669);
}
else
{
l9_160=float4(l9_159.yz,0.0,-0.33333334);
}
float4 l9_161=l9_160;
float4 l9_162;
if (l9_159.x<l9_161.x)
{
l9_162=float4(l9_161.xyw,l9_159.x);
}
else
{
l9_162=float4(l9_159.x,l9_161.yzx);
}
float4 l9_163=l9_162;
float l9_164=l9_163.x-fast::min(l9_163.w,l9_163.y);
float l9_165=abs(((l9_163.w-l9_163.y)/((6.0*l9_164)+1e-07))+l9_163.z);
float l9_166=l9_163.x;
float3 l9_167=float3(l9_165,l9_164,l9_166);
float3 l9_168=l9_167;
float l9_169=l9_168.z-(l9_168.y*0.5);
float l9_170=l9_168.y/((1.0-abs((2.0*l9_169)-1.0))+1e-07);
float3 l9_171=float3(l9_168.x,l9_170,l9_169);
float3 l9_172=float3(l9_156,l9_157,l9_171.z);
float l9_173=l9_172.x;
float l9_174=abs((6.0*l9_173)-3.0)-1.0;
float l9_175=2.0-abs((6.0*l9_173)-2.0);
float l9_176=2.0-abs((6.0*l9_173)-4.0);
float3 l9_177=fast::clamp(float3(l9_174,l9_175,l9_176),float3(0.0),float3(1.0));
float3 l9_178=l9_177;
float l9_179=(1.0-abs((2.0*l9_172.z)-1.0))*l9_172.y;
l9_178=((l9_178-float3(0.5))*l9_179)+float3(l9_172.z);
float3 l9_180=l9_178;
float3 l9_181=l9_180;
return l9_181;
}
else
{
if ((int(BLEND_MODE_LUMINOSITY_tmp)!=0))
{
float3 param_6=a;
float3 param_7=b;
float3 l9_182=param_6;
float3 l9_183=l9_182;
float4 l9_184;
if (l9_183.y<l9_183.z)
{
l9_184=float4(l9_183.zy,-1.0,0.66666669);
}
else
{
l9_184=float4(l9_183.yz,0.0,-0.33333334);
}
float4 l9_185=l9_184;
float4 l9_186;
if (l9_183.x<l9_185.x)
{
l9_186=float4(l9_185.xyw,l9_183.x);
}
else
{
l9_186=float4(l9_183.x,l9_185.yzx);
}
float4 l9_187=l9_186;
float l9_188=l9_187.x-fast::min(l9_187.w,l9_187.y);
float l9_189=abs(((l9_187.w-l9_187.y)/((6.0*l9_188)+1e-07))+l9_187.z);
float l9_190=l9_187.x;
float3 l9_191=float3(l9_189,l9_188,l9_190);
float3 l9_192=l9_191;
float l9_193=l9_192.z-(l9_192.y*0.5);
float l9_194=l9_192.y/((1.0-abs((2.0*l9_193)-1.0))+1e-07);
float3 l9_195=float3(l9_192.x,l9_194,l9_193);
float3 l9_196=l9_195;
float l9_197=l9_196.x;
float l9_198=l9_196.y;
float3 l9_199=param_7;
float3 l9_200=l9_199;
float4 l9_201;
if (l9_200.y<l9_200.z)
{
l9_201=float4(l9_200.zy,-1.0,0.66666669);
}
else
{
l9_201=float4(l9_200.yz,0.0,-0.33333334);
}
float4 l9_202=l9_201;
float4 l9_203;
if (l9_200.x<l9_202.x)
{
l9_203=float4(l9_202.xyw,l9_200.x);
}
else
{
l9_203=float4(l9_200.x,l9_202.yzx);
}
float4 l9_204=l9_203;
float l9_205=l9_204.x-fast::min(l9_204.w,l9_204.y);
float l9_206=abs(((l9_204.w-l9_204.y)/((6.0*l9_205)+1e-07))+l9_204.z);
float l9_207=l9_204.x;
float3 l9_208=float3(l9_206,l9_205,l9_207);
float3 l9_209=l9_208;
float l9_210=l9_209.z-(l9_209.y*0.5);
float l9_211=l9_209.y/((1.0-abs((2.0*l9_210)-1.0))+1e-07);
float3 l9_212=float3(l9_209.x,l9_211,l9_210);
float3 l9_213=float3(l9_197,l9_198,l9_212.z);
float l9_214=l9_213.x;
float l9_215=abs((6.0*l9_214)-3.0)-1.0;
float l9_216=2.0-abs((6.0*l9_214)-2.0);
float l9_217=2.0-abs((6.0*l9_214)-4.0);
float3 l9_218=fast::clamp(float3(l9_215,l9_216,l9_217),float3(0.0),float3(1.0));
float3 l9_219=l9_218;
float l9_220=(1.0-abs((2.0*l9_213.z)-1.0))*l9_213.y;
l9_219=((l9_219-float3(0.5))*l9_220)+float3(l9_213.z);
float3 l9_221=l9_219;
float3 l9_222=l9_221;
return l9_222;
}
else
{
float3 param_8=a;
float3 param_9=b;
float3 l9_223=param_8;
float l9_224=((0.29899999*l9_223.x)+(0.58700001*l9_223.y))+(0.114*l9_223.z);
float l9_225=l9_224;
float l9_226=1.0;
float l9_227=pow(l9_225,1.0/UserUniforms.correctedIntensity);
int l9_228;
if ((int(intensityTextureHasSwappedViews_tmp)!=0))
{
int l9_229=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_229=0;
}
else
{
l9_229=varStereoViewID;
}
int l9_230=l9_229;
l9_228=1-l9_230;
}
else
{
int l9_231=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_231=0;
}
else
{
l9_231=varStereoViewID;
}
int l9_232=l9_231;
l9_228=l9_232;
}
int l9_233=l9_228;
int l9_234=intensityTextureLayout_tmp;
int l9_235=l9_233;
float2 l9_236=float2(l9_227,0.5);
bool l9_237=(int(SC_USE_UV_TRANSFORM_intensityTexture_tmp)!=0);
float3x3 l9_238=UserUniforms.intensityTextureTransform;
int2 l9_239=int2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp);
bool l9_240=(int(SC_USE_UV_MIN_MAX_intensityTexture_tmp)!=0);
float4 l9_241=UserUniforms.intensityTextureUvMinMax;
bool l9_242=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp)!=0);
float4 l9_243=UserUniforms.intensityTextureBorderColor;
float l9_244=0.0;
bool l9_245=l9_242&&(!l9_240);
float l9_246=1.0;
float l9_247=l9_236.x;
int l9_248=l9_239.x;
if (l9_248==1)
{
l9_247=fract(l9_247);
}
else
{
if (l9_248==2)
{
float l9_249=fract(l9_247);
float l9_250=l9_247-l9_249;
float l9_251=step(0.25,fract(l9_250*0.5));
l9_247=mix(l9_249,1.0-l9_249,fast::clamp(l9_251,0.0,1.0));
}
}
l9_236.x=l9_247;
float l9_252=l9_236.y;
int l9_253=l9_239.y;
if (l9_253==1)
{
l9_252=fract(l9_252);
}
else
{
if (l9_253==2)
{
float l9_254=fract(l9_252);
float l9_255=l9_252-l9_254;
float l9_256=step(0.25,fract(l9_255*0.5));
l9_252=mix(l9_254,1.0-l9_254,fast::clamp(l9_256,0.0,1.0));
}
}
l9_236.y=l9_252;
if (l9_240)
{
bool l9_257=l9_242;
bool l9_258;
if (l9_257)
{
l9_258=l9_239.x==3;
}
else
{
l9_258=l9_257;
}
float l9_259=l9_236.x;
float l9_260=l9_241.x;
float l9_261=l9_241.z;
bool l9_262=l9_258;
float l9_263=l9_246;
float l9_264=fast::clamp(l9_259,l9_260,l9_261);
float l9_265=step(abs(l9_259-l9_264),9.9999997e-06);
l9_263*=(l9_265+((1.0-float(l9_262))*(1.0-l9_265)));
l9_259=l9_264;
l9_236.x=l9_259;
l9_246=l9_263;
bool l9_266=l9_242;
bool l9_267;
if (l9_266)
{
l9_267=l9_239.y==3;
}
else
{
l9_267=l9_266;
}
float l9_268=l9_236.y;
float l9_269=l9_241.y;
float l9_270=l9_241.w;
bool l9_271=l9_267;
float l9_272=l9_246;
float l9_273=fast::clamp(l9_268,l9_269,l9_270);
float l9_274=step(abs(l9_268-l9_273),9.9999997e-06);
l9_272*=(l9_274+((1.0-float(l9_271))*(1.0-l9_274)));
l9_268=l9_273;
l9_236.y=l9_268;
l9_246=l9_272;
}
float2 l9_275=l9_236;
bool l9_276=l9_237;
float3x3 l9_277=l9_238;
if (l9_276)
{
l9_275=float2((l9_277*float3(l9_275,1.0)).xy);
}
float2 l9_278=l9_275;
l9_236=l9_278;
float l9_279=l9_236.x;
int l9_280=l9_239.x;
bool l9_281=l9_245;
float l9_282=l9_246;
if ((l9_280==0)||(l9_280==3))
{
float l9_283=l9_279;
float l9_284=0.0;
float l9_285=1.0;
bool l9_286=l9_281;
float l9_287=l9_282;
float l9_288=fast::clamp(l9_283,l9_284,l9_285);
float l9_289=step(abs(l9_283-l9_288),9.9999997e-06);
l9_287*=(l9_289+((1.0-float(l9_286))*(1.0-l9_289)));
l9_283=l9_288;
l9_279=l9_283;
l9_282=l9_287;
}
l9_236.x=l9_279;
l9_246=l9_282;
float l9_290=l9_236.y;
int l9_291=l9_239.y;
bool l9_292=l9_245;
float l9_293=l9_246;
if ((l9_291==0)||(l9_291==3))
{
float l9_294=l9_290;
float l9_295=0.0;
float l9_296=1.0;
bool l9_297=l9_292;
float l9_298=l9_293;
float l9_299=fast::clamp(l9_294,l9_295,l9_296);
float l9_300=step(abs(l9_294-l9_299),9.9999997e-06);
l9_298*=(l9_300+((1.0-float(l9_297))*(1.0-l9_300)));
l9_294=l9_299;
l9_290=l9_294;
l9_293=l9_298;
}
l9_236.y=l9_290;
l9_246=l9_293;
float2 l9_301=l9_236;
int l9_302=l9_234;
int l9_303=l9_235;
float l9_304=l9_244;
float2 l9_305=l9_301;
int l9_306=l9_302;
int l9_307=l9_303;
float3 l9_308=float3(0.0);
if (l9_306==0)
{
l9_308=float3(l9_305,0.0);
}
else
{
if (l9_306==1)
{
l9_308=float3(l9_305.x,(l9_305.y*0.5)+(0.5-(float(l9_307)*0.5)),0.0);
}
else
{
l9_308=float3(l9_305,float(l9_307));
}
}
float3 l9_309=l9_308;
float3 l9_310=l9_309;
float4 l9_311=intensityTexture.sample(intensityTextureSmpSC,l9_310.xy,bias(l9_304));
float4 l9_312=l9_311;
if (l9_242)
{
l9_312=mix(l9_243,l9_312,float4(l9_246));
}
float4 l9_313=l9_312;
float3 l9_314=l9_313.xyz;
float3 l9_315=l9_314;
float l9_316=16.0;
float l9_317=((((l9_315.x*256.0)+l9_315.y)+(l9_315.z/256.0))/257.00391)*l9_316;
float l9_318=l9_317;
if ((int(BLEND_MODE_FORGRAY_tmp)!=0))
{
l9_318=fast::max(l9_318,1.0);
}
if ((int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
l9_318=fast::min(l9_318,1.0);
}
float l9_319=l9_225;
float3 l9_320=param_8;
float3 l9_321=param_9;
float l9_322=l9_226;
float l9_323=l9_318;
float3 l9_324=transformColor(l9_319,l9_320,l9_321,l9_322,l9_323);
return l9_324;
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
float4 sc_OutputMotionVectorsIfNeeded(thread const float3& surfacePosWorldSpace,thread const float4& finalColor,thread int& varStereoViewID,constant userUniformsObj& UserUniforms)
{
if ((int(sc_MotionVectorsPass_tmp)!=0))
{
float3 param=surfacePosWorldSpace;
int l9_0=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_0=0;
}
else
{
l9_0=varStereoViewID;
}
int l9_1=l9_0;
float4 l9_2=UserUniforms.sc_ViewProjectionMatrixArray[l9_1]*float4(param,1.0);
float2 l9_3=l9_2.xy/float2(l9_2.w);
l9_2=float4(l9_3.x,l9_3.y,l9_2.z,l9_2.w);
int l9_4=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4=0;
}
else
{
l9_4=varStereoViewID;
}
int l9_5=l9_4;
float4 l9_6=((UserUniforms.sc_PrevFrameViewProjectionMatrixArray[l9_5]*UserUniforms.sc_PrevFrameModelMatrix)*UserUniforms.sc_ModelMatrixInverse)*float4(param,1.0);
float2 l9_7=l9_6.xy/float2(l9_6.w);
l9_6=float4(l9_7.x,l9_7.y,l9_6.z,l9_6.w);
float2 l9_8=(l9_2.xy-l9_6.xy)*0.5;
float2 l9_9=l9_8;
float l9_10=(l9_9.x*5.0)+0.5;
float l9_11=floor(l9_10*65535.0);
float l9_12=floor(l9_11*0.00390625);
float2 l9_13=float2(l9_12/255.0,(l9_11-(l9_12*256.0))/255.0);
float l9_14=(l9_9.y*5.0)+0.5;
float l9_15=floor(l9_14*65535.0);
float l9_16=floor(l9_15*0.00390625);
float2 l9_17=float2(l9_16/255.0,(l9_15-(l9_16*256.0))/255.0);
float4 l9_18=float4(l9_13,l9_17);
float4 l9_19=l9_18;
return l9_19;
}
else
{
return finalColor;
}
}
fragment main_frag_out main_frag(main_frag_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],float4 gl_FragCoord [[position]])
{
main_frag_out out={};
if ((int(sc_DepthOnly_tmp)!=0))
{
return out;
}
if ((sc_StereoRenderingMode_tmp==1)&&(sc_StereoRendering_IsClipDistanceEnabled_tmp==0))
{
if (in.varClipDistance<0.0)
{
discard_fragment();
}
}
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=in.PreviewVertexColor;
PreviewInfo.Saved=((in.PreviewVertexSaved*1.0)!=0.0) ? true : false;
float4 FinalColor=float4(1.0);
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
Globals.gTimeDelta=(*sc_set0.UserUniforms).sc_Time.y;
if ((*sc_set0.UserUniforms).sc_RayTracingCasterConfiguration.x!=0u)
{
float4 l9_0=gl_FragCoord;
int2 param=int2(l9_0.xy);
sc_RayTracingHitPayload rhp=sc_RayTracingEvaluateHitPayload(param,sc_set0.sc_RayTracingRayDirection,sc_set0.sc_RayTracingRayDirectionSmpSC,(*sc_set0.UserUniforms),(*sc_set0.sc_RayTracingCasterVertexBuffer),(*sc_set0.sc_RayTracingCasterNonAnimatedVertexBuffer),(*sc_set0.sc_RayTracingCasterIndexBuffer),sc_set0.sc_RayTracingHitCasterIdAndBarycentric,sc_set0.sc_RayTracingHitCasterIdAndBarycentricSmpSC);
if (rhp.id.x!=((*sc_set0.UserUniforms).sc_RayTracingCasterConfiguration.y&65535u))
{
return out;
}
Globals.Surface_UVCoord0=rhp.uv0;
}
else
{
Globals.Surface_UVCoord0=in.varPackedTex.xy;
}
float4 Result_N11=float4(0.0);
float param_1=0.0;
float4 param_2=float4(0.0);
float4 param_3=float4(0.68215501,0.39855,0.51477802,0.0);
ssGlobals param_5=Globals;
float l9_1=0.0;
float l9_2=float((*sc_set0.UserUniforms).alpha_channel!=0);
l9_1=l9_2;
float l9_3=0.0;
float l9_4=float((*sc_set0.UserUniforms).red_channel!=0);
l9_3=l9_4;
float l9_5=0.0;
float l9_6=float((*sc_set0.UserUniforms).green_channel!=0);
l9_5=l9_6;
float l9_7=0.0;
float l9_8=float((*sc_set0.UserUniforms).blue_channel!=0);
l9_7=l9_8;
float l9_9=0.0;
l9_9=(l9_3+l9_5)+l9_7;
float l9_10=0.0;
l9_10=float(l9_9<(*sc_set0.UserUniforms).Port_Input1_N010);
float l9_11=0.0;
float l9_12=l9_1;
bool l9_13=(l9_12*1.0)!=0.0;
bool l9_14;
if (l9_13)
{
l9_14=(l9_10*1.0)!=0.0;
}
else
{
l9_14=l9_13;
}
l9_11=float(l9_14);
param_1=l9_11;
float4 param_4;
if ((param_1*1.0)!=0.0)
{
float4 l9_15=float4(0.0);
int l9_16;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_17=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_17=0;
}
else
{
l9_17=in.varStereoViewID;
}
int l9_18=l9_17;
l9_16=1-l9_18;
}
else
{
int l9_19=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_19=0;
}
else
{
l9_19=in.varStereoViewID;
}
int l9_20=l9_19;
l9_16=l9_20;
}
int l9_21=l9_16;
int l9_22=baseTexLayout_tmp;
int l9_23=l9_21;
float2 l9_24=param_5.Surface_UVCoord0;
bool l9_25=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_26=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_27=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_28=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_29=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_30=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_31=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_32=0.0;
bool l9_33=l9_30&&(!l9_28);
float l9_34=1.0;
float l9_35=l9_24.x;
int l9_36=l9_27.x;
if (l9_36==1)
{
l9_35=fract(l9_35);
}
else
{
if (l9_36==2)
{
float l9_37=fract(l9_35);
float l9_38=l9_35-l9_37;
float l9_39=step(0.25,fract(l9_38*0.5));
l9_35=mix(l9_37,1.0-l9_37,fast::clamp(l9_39,0.0,1.0));
}
}
l9_24.x=l9_35;
float l9_40=l9_24.y;
int l9_41=l9_27.y;
if (l9_41==1)
{
l9_40=fract(l9_40);
}
else
{
if (l9_41==2)
{
float l9_42=fract(l9_40);
float l9_43=l9_40-l9_42;
float l9_44=step(0.25,fract(l9_43*0.5));
l9_40=mix(l9_42,1.0-l9_42,fast::clamp(l9_44,0.0,1.0));
}
}
l9_24.y=l9_40;
if (l9_28)
{
bool l9_45=l9_30;
bool l9_46;
if (l9_45)
{
l9_46=l9_27.x==3;
}
else
{
l9_46=l9_45;
}
float l9_47=l9_24.x;
float l9_48=l9_29.x;
float l9_49=l9_29.z;
bool l9_50=l9_46;
float l9_51=l9_34;
float l9_52=fast::clamp(l9_47,l9_48,l9_49);
float l9_53=step(abs(l9_47-l9_52),9.9999997e-06);
l9_51*=(l9_53+((1.0-float(l9_50))*(1.0-l9_53)));
l9_47=l9_52;
l9_24.x=l9_47;
l9_34=l9_51;
bool l9_54=l9_30;
bool l9_55;
if (l9_54)
{
l9_55=l9_27.y==3;
}
else
{
l9_55=l9_54;
}
float l9_56=l9_24.y;
float l9_57=l9_29.y;
float l9_58=l9_29.w;
bool l9_59=l9_55;
float l9_60=l9_34;
float l9_61=fast::clamp(l9_56,l9_57,l9_58);
float l9_62=step(abs(l9_56-l9_61),9.9999997e-06);
l9_60*=(l9_62+((1.0-float(l9_59))*(1.0-l9_62)));
l9_56=l9_61;
l9_24.y=l9_56;
l9_34=l9_60;
}
float2 l9_63=l9_24;
bool l9_64=l9_25;
float3x3 l9_65=l9_26;
if (l9_64)
{
l9_63=float2((l9_65*float3(l9_63,1.0)).xy);
}
float2 l9_66=l9_63;
l9_24=l9_66;
float l9_67=l9_24.x;
int l9_68=l9_27.x;
bool l9_69=l9_33;
float l9_70=l9_34;
if ((l9_68==0)||(l9_68==3))
{
float l9_71=l9_67;
float l9_72=0.0;
float l9_73=1.0;
bool l9_74=l9_69;
float l9_75=l9_70;
float l9_76=fast::clamp(l9_71,l9_72,l9_73);
float l9_77=step(abs(l9_71-l9_76),9.9999997e-06);
l9_75*=(l9_77+((1.0-float(l9_74))*(1.0-l9_77)));
l9_71=l9_76;
l9_67=l9_71;
l9_70=l9_75;
}
l9_24.x=l9_67;
l9_34=l9_70;
float l9_78=l9_24.y;
int l9_79=l9_27.y;
bool l9_80=l9_33;
float l9_81=l9_34;
if ((l9_79==0)||(l9_79==3))
{
float l9_82=l9_78;
float l9_83=0.0;
float l9_84=1.0;
bool l9_85=l9_80;
float l9_86=l9_81;
float l9_87=fast::clamp(l9_82,l9_83,l9_84);
float l9_88=step(abs(l9_82-l9_87),9.9999997e-06);
l9_86*=(l9_88+((1.0-float(l9_85))*(1.0-l9_88)));
l9_82=l9_87;
l9_78=l9_82;
l9_81=l9_86;
}
l9_24.y=l9_78;
l9_34=l9_81;
float2 l9_89=l9_24;
int l9_90=l9_22;
int l9_91=l9_23;
float l9_92=l9_32;
float2 l9_93=l9_89;
int l9_94=l9_90;
int l9_95=l9_91;
float3 l9_96=float3(0.0);
if (l9_94==0)
{
l9_96=float3(l9_93,0.0);
}
else
{
if (l9_94==1)
{
l9_96=float3(l9_93.x,(l9_93.y*0.5)+(0.5-(float(l9_95)*0.5)),0.0);
}
else
{
l9_96=float3(l9_93,float(l9_95));
}
}
float3 l9_97=l9_96;
float3 l9_98=l9_97;
float4 l9_99=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_98.xy,bias(l9_92));
float4 l9_100=l9_99;
if (l9_30)
{
l9_100=mix(l9_31,l9_100,float4(l9_34));
}
float4 l9_101=l9_100;
l9_15=l9_101;
float l9_102=0.0;
l9_102=l9_15.w;
float4 l9_103=float4(0.0);
float3 l9_104=float3(l9_102);
l9_103=float4(l9_104.x,l9_104.y,l9_104.z,l9_103.w);
l9_103.w=(*sc_set0.UserUniforms).Port_Value2_N013;
param_2=l9_103;
param_4=param_2;
}
else
{
float4 l9_105=float4(0.0);
float l9_106=0.0;
float4 l9_107=float4(0.0);
float4 l9_108=float4(0.68215501,0.39855,0.51477802,0.0);
ssGlobals l9_109=param_5;
float l9_110=0.0;
float l9_111=float((*sc_set0.UserUniforms).red_channel!=0);
l9_110=l9_111;
float l9_112=0.0;
float l9_113=float((*sc_set0.UserUniforms).green_channel!=0);
l9_112=l9_113;
float l9_114=0.0;
float l9_115=float((*sc_set0.UserUniforms).blue_channel!=0);
l9_114=l9_115;
float l9_116=0.0;
l9_116=(l9_110+l9_112)+l9_114;
float l9_117=0.0;
l9_117=float(l9_116>(*sc_set0.UserUniforms).Port_Input1_N009);
l9_106=l9_117;
float4 l9_118;
if ((l9_106*1.0)!=0.0)
{
float l9_119=0.0;
float l9_120=float((*sc_set0.UserUniforms).red_channel!=0);
l9_119=l9_120;
float4 l9_121=float4(0.0);
int l9_122;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_123=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_123=0;
}
else
{
l9_123=in.varStereoViewID;
}
int l9_124=l9_123;
l9_122=1-l9_124;
}
else
{
int l9_125=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_125=0;
}
else
{
l9_125=in.varStereoViewID;
}
int l9_126=l9_125;
l9_122=l9_126;
}
int l9_127=l9_122;
int l9_128=baseTexLayout_tmp;
int l9_129=l9_127;
float2 l9_130=l9_109.Surface_UVCoord0;
bool l9_131=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_132=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_133=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_134=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_135=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_136=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_137=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_138=0.0;
bool l9_139=l9_136&&(!l9_134);
float l9_140=1.0;
float l9_141=l9_130.x;
int l9_142=l9_133.x;
if (l9_142==1)
{
l9_141=fract(l9_141);
}
else
{
if (l9_142==2)
{
float l9_143=fract(l9_141);
float l9_144=l9_141-l9_143;
float l9_145=step(0.25,fract(l9_144*0.5));
l9_141=mix(l9_143,1.0-l9_143,fast::clamp(l9_145,0.0,1.0));
}
}
l9_130.x=l9_141;
float l9_146=l9_130.y;
int l9_147=l9_133.y;
if (l9_147==1)
{
l9_146=fract(l9_146);
}
else
{
if (l9_147==2)
{
float l9_148=fract(l9_146);
float l9_149=l9_146-l9_148;
float l9_150=step(0.25,fract(l9_149*0.5));
l9_146=mix(l9_148,1.0-l9_148,fast::clamp(l9_150,0.0,1.0));
}
}
l9_130.y=l9_146;
if (l9_134)
{
bool l9_151=l9_136;
bool l9_152;
if (l9_151)
{
l9_152=l9_133.x==3;
}
else
{
l9_152=l9_151;
}
float l9_153=l9_130.x;
float l9_154=l9_135.x;
float l9_155=l9_135.z;
bool l9_156=l9_152;
float l9_157=l9_140;
float l9_158=fast::clamp(l9_153,l9_154,l9_155);
float l9_159=step(abs(l9_153-l9_158),9.9999997e-06);
l9_157*=(l9_159+((1.0-float(l9_156))*(1.0-l9_159)));
l9_153=l9_158;
l9_130.x=l9_153;
l9_140=l9_157;
bool l9_160=l9_136;
bool l9_161;
if (l9_160)
{
l9_161=l9_133.y==3;
}
else
{
l9_161=l9_160;
}
float l9_162=l9_130.y;
float l9_163=l9_135.y;
float l9_164=l9_135.w;
bool l9_165=l9_161;
float l9_166=l9_140;
float l9_167=fast::clamp(l9_162,l9_163,l9_164);
float l9_168=step(abs(l9_162-l9_167),9.9999997e-06);
l9_166*=(l9_168+((1.0-float(l9_165))*(1.0-l9_168)));
l9_162=l9_167;
l9_130.y=l9_162;
l9_140=l9_166;
}
float2 l9_169=l9_130;
bool l9_170=l9_131;
float3x3 l9_171=l9_132;
if (l9_170)
{
l9_169=float2((l9_171*float3(l9_169,1.0)).xy);
}
float2 l9_172=l9_169;
l9_130=l9_172;
float l9_173=l9_130.x;
int l9_174=l9_133.x;
bool l9_175=l9_139;
float l9_176=l9_140;
if ((l9_174==0)||(l9_174==3))
{
float l9_177=l9_173;
float l9_178=0.0;
float l9_179=1.0;
bool l9_180=l9_175;
float l9_181=l9_176;
float l9_182=fast::clamp(l9_177,l9_178,l9_179);
float l9_183=step(abs(l9_177-l9_182),9.9999997e-06);
l9_181*=(l9_183+((1.0-float(l9_180))*(1.0-l9_183)));
l9_177=l9_182;
l9_173=l9_177;
l9_176=l9_181;
}
l9_130.x=l9_173;
l9_140=l9_176;
float l9_184=l9_130.y;
int l9_185=l9_133.y;
bool l9_186=l9_139;
float l9_187=l9_140;
if ((l9_185==0)||(l9_185==3))
{
float l9_188=l9_184;
float l9_189=0.0;
float l9_190=1.0;
bool l9_191=l9_186;
float l9_192=l9_187;
float l9_193=fast::clamp(l9_188,l9_189,l9_190);
float l9_194=step(abs(l9_188-l9_193),9.9999997e-06);
l9_192*=(l9_194+((1.0-float(l9_191))*(1.0-l9_194)));
l9_188=l9_193;
l9_184=l9_188;
l9_187=l9_192;
}
l9_130.y=l9_184;
l9_140=l9_187;
float2 l9_195=l9_130;
int l9_196=l9_128;
int l9_197=l9_129;
float l9_198=l9_138;
float2 l9_199=l9_195;
int l9_200=l9_196;
int l9_201=l9_197;
float3 l9_202=float3(0.0);
if (l9_200==0)
{
l9_202=float3(l9_199,0.0);
}
else
{
if (l9_200==1)
{
l9_202=float3(l9_199.x,(l9_199.y*0.5)+(0.5-(float(l9_201)*0.5)),0.0);
}
else
{
l9_202=float3(l9_199,float(l9_201));
}
}
float3 l9_203=l9_202;
float3 l9_204=l9_203;
float4 l9_205=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_204.xy,bias(l9_198));
float4 l9_206=l9_205;
if (l9_136)
{
l9_206=mix(l9_137,l9_206,float4(l9_140));
}
float4 l9_207=l9_206;
l9_121=l9_207;
float l9_208=0.0;
float l9_209=0.0;
float l9_210=0.0;
float4 l9_211=l9_121;
float l9_212=l9_211.x;
float l9_213=l9_211.y;
float l9_214=l9_211.z;
l9_208=l9_212;
l9_209=l9_213;
l9_210=l9_214;
float l9_215=0.0;
l9_215=l9_119*l9_208;
float l9_216=0.0;
float l9_217=float((*sc_set0.UserUniforms).green_channel!=0);
l9_216=l9_217;
float l9_218=0.0;
l9_218=l9_216*l9_209;
float l9_219=0.0;
float l9_220=float((*sc_set0.UserUniforms).blue_channel!=0);
l9_219=l9_220;
float l9_221=0.0;
l9_221=l9_210*l9_219;
float l9_222=0.0;
float l9_223=0.0;
float l9_224=(*sc_set0.UserUniforms).Port_Value1_N036;
float l9_225=0.0;
ssGlobals l9_226=l9_109;
float l9_227=0.0;
float l9_228=float((*sc_set0.UserUniforms).alpha_channel!=0);
l9_227=l9_228;
float l9_229=0.0;
l9_229=float(l9_227==(*sc_set0.UserUniforms).Port_Input1_N035);
l9_223=l9_229;
float l9_230;
if ((l9_223*1.0)!=0.0)
{
l9_230=l9_224;
}
else
{
float4 l9_231=float4(0.0);
int l9_232;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_233=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_233=0;
}
else
{
l9_233=in.varStereoViewID;
}
int l9_234=l9_233;
l9_232=1-l9_234;
}
else
{
int l9_235=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_235=0;
}
else
{
l9_235=in.varStereoViewID;
}
int l9_236=l9_235;
l9_232=l9_236;
}
int l9_237=l9_232;
int l9_238=baseTexLayout_tmp;
int l9_239=l9_237;
float2 l9_240=l9_226.Surface_UVCoord0;
bool l9_241=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_242=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_243=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_244=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_245=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_246=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_247=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_248=0.0;
bool l9_249=l9_246&&(!l9_244);
float l9_250=1.0;
float l9_251=l9_240.x;
int l9_252=l9_243.x;
if (l9_252==1)
{
l9_251=fract(l9_251);
}
else
{
if (l9_252==2)
{
float l9_253=fract(l9_251);
float l9_254=l9_251-l9_253;
float l9_255=step(0.25,fract(l9_254*0.5));
l9_251=mix(l9_253,1.0-l9_253,fast::clamp(l9_255,0.0,1.0));
}
}
l9_240.x=l9_251;
float l9_256=l9_240.y;
int l9_257=l9_243.y;
if (l9_257==1)
{
l9_256=fract(l9_256);
}
else
{
if (l9_257==2)
{
float l9_258=fract(l9_256);
float l9_259=l9_256-l9_258;
float l9_260=step(0.25,fract(l9_259*0.5));
l9_256=mix(l9_258,1.0-l9_258,fast::clamp(l9_260,0.0,1.0));
}
}
l9_240.y=l9_256;
if (l9_244)
{
bool l9_261=l9_246;
bool l9_262;
if (l9_261)
{
l9_262=l9_243.x==3;
}
else
{
l9_262=l9_261;
}
float l9_263=l9_240.x;
float l9_264=l9_245.x;
float l9_265=l9_245.z;
bool l9_266=l9_262;
float l9_267=l9_250;
float l9_268=fast::clamp(l9_263,l9_264,l9_265);
float l9_269=step(abs(l9_263-l9_268),9.9999997e-06);
l9_267*=(l9_269+((1.0-float(l9_266))*(1.0-l9_269)));
l9_263=l9_268;
l9_240.x=l9_263;
l9_250=l9_267;
bool l9_270=l9_246;
bool l9_271;
if (l9_270)
{
l9_271=l9_243.y==3;
}
else
{
l9_271=l9_270;
}
float l9_272=l9_240.y;
float l9_273=l9_245.y;
float l9_274=l9_245.w;
bool l9_275=l9_271;
float l9_276=l9_250;
float l9_277=fast::clamp(l9_272,l9_273,l9_274);
float l9_278=step(abs(l9_272-l9_277),9.9999997e-06);
l9_276*=(l9_278+((1.0-float(l9_275))*(1.0-l9_278)));
l9_272=l9_277;
l9_240.y=l9_272;
l9_250=l9_276;
}
float2 l9_279=l9_240;
bool l9_280=l9_241;
float3x3 l9_281=l9_242;
if (l9_280)
{
l9_279=float2((l9_281*float3(l9_279,1.0)).xy);
}
float2 l9_282=l9_279;
l9_240=l9_282;
float l9_283=l9_240.x;
int l9_284=l9_243.x;
bool l9_285=l9_249;
float l9_286=l9_250;
if ((l9_284==0)||(l9_284==3))
{
float l9_287=l9_283;
float l9_288=0.0;
float l9_289=1.0;
bool l9_290=l9_285;
float l9_291=l9_286;
float l9_292=fast::clamp(l9_287,l9_288,l9_289);
float l9_293=step(abs(l9_287-l9_292),9.9999997e-06);
l9_291*=(l9_293+((1.0-float(l9_290))*(1.0-l9_293)));
l9_287=l9_292;
l9_283=l9_287;
l9_286=l9_291;
}
l9_240.x=l9_283;
l9_250=l9_286;
float l9_294=l9_240.y;
int l9_295=l9_243.y;
bool l9_296=l9_249;
float l9_297=l9_250;
if ((l9_295==0)||(l9_295==3))
{
float l9_298=l9_294;
float l9_299=0.0;
float l9_300=1.0;
bool l9_301=l9_296;
float l9_302=l9_297;
float l9_303=fast::clamp(l9_298,l9_299,l9_300);
float l9_304=step(abs(l9_298-l9_303),9.9999997e-06);
l9_302*=(l9_304+((1.0-float(l9_301))*(1.0-l9_304)));
l9_298=l9_303;
l9_294=l9_298;
l9_297=l9_302;
}
l9_240.y=l9_294;
l9_250=l9_297;
float2 l9_305=l9_240;
int l9_306=l9_238;
int l9_307=l9_239;
float l9_308=l9_248;
float2 l9_309=l9_305;
int l9_310=l9_306;
int l9_311=l9_307;
float3 l9_312=float3(0.0);
if (l9_310==0)
{
l9_312=float3(l9_309,0.0);
}
else
{
if (l9_310==1)
{
l9_312=float3(l9_309.x,(l9_309.y*0.5)+(0.5-(float(l9_311)*0.5)),0.0);
}
else
{
l9_312=float3(l9_309,float(l9_311));
}
}
float3 l9_313=l9_312;
float3 l9_314=l9_313;
float4 l9_315=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_314.xy,bias(l9_308));
float4 l9_316=l9_315;
if (l9_246)
{
l9_316=mix(l9_247,l9_316,float4(l9_250));
}
float4 l9_317=l9_316;
l9_231=l9_317;
float l9_318=0.0;
float4 l9_319=l9_231;
float l9_320=l9_319.w;
l9_318=l9_320;
l9_225=l9_318;
l9_230=l9_225;
}
l9_222=l9_230;
float4 l9_321=float4(0.0);
l9_321.x=l9_215;
l9_321.y=l9_218;
l9_321.z=l9_221;
l9_321.w=l9_222;
l9_107=l9_321;
l9_118=l9_107;
}
else
{
float4 l9_322=float4(0.0);
float l9_323=0.0;
float4 l9_324=float4(0.0);
float4 l9_325=(*sc_set0.UserUniforms).Port_Default_N050;
ssGlobals l9_326=l9_109;
float l9_327=0.0;
float l9_328=float((*sc_set0.UserUniforms).red_channel!=0);
l9_327=l9_328;
float l9_329=0.0;
float l9_330=float((*sc_set0.UserUniforms).green_channel!=0);
l9_329=l9_330;
float l9_331=0.0;
float l9_332=float((*sc_set0.UserUniforms).blue_channel!=0);
l9_331=l9_332;
float l9_333=0.0;
l9_333=(l9_327+l9_329)+l9_331;
float l9_334=0.0;
l9_334=float(l9_333==(*sc_set0.UserUniforms).Port_Input1_N046);
l9_323=l9_334;
float4 l9_335;
if ((l9_323*1.0)!=0.0)
{
float4 l9_336=float4(0.0);
float l9_337=0.0;
float4 l9_338=float4(0.0);
float4 l9_339=float4(0.0);
ssGlobals l9_340=l9_326;
float l9_341=0.0;
float l9_342=float((*sc_set0.UserUniforms).red_channel!=0);
l9_341=l9_342;
float l9_343=0.0;
l9_343=float(l9_341==(*sc_set0.UserUniforms).Port_Input1_N051);
l9_337=l9_343;
float4 l9_344;
if ((l9_337*1.0)!=0.0)
{
float4 l9_345=float4(0.0);
int l9_346;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_347=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_347=0;
}
else
{
l9_347=in.varStereoViewID;
}
int l9_348=l9_347;
l9_346=1-l9_348;
}
else
{
int l9_349=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_349=0;
}
else
{
l9_349=in.varStereoViewID;
}
int l9_350=l9_349;
l9_346=l9_350;
}
int l9_351=l9_346;
int l9_352=baseTexLayout_tmp;
int l9_353=l9_351;
float2 l9_354=l9_340.Surface_UVCoord0;
bool l9_355=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_356=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_357=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_358=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_359=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_360=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_361=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_362=0.0;
bool l9_363=l9_360&&(!l9_358);
float l9_364=1.0;
float l9_365=l9_354.x;
int l9_366=l9_357.x;
if (l9_366==1)
{
l9_365=fract(l9_365);
}
else
{
if (l9_366==2)
{
float l9_367=fract(l9_365);
float l9_368=l9_365-l9_367;
float l9_369=step(0.25,fract(l9_368*0.5));
l9_365=mix(l9_367,1.0-l9_367,fast::clamp(l9_369,0.0,1.0));
}
}
l9_354.x=l9_365;
float l9_370=l9_354.y;
int l9_371=l9_357.y;
if (l9_371==1)
{
l9_370=fract(l9_370);
}
else
{
if (l9_371==2)
{
float l9_372=fract(l9_370);
float l9_373=l9_370-l9_372;
float l9_374=step(0.25,fract(l9_373*0.5));
l9_370=mix(l9_372,1.0-l9_372,fast::clamp(l9_374,0.0,1.0));
}
}
l9_354.y=l9_370;
if (l9_358)
{
bool l9_375=l9_360;
bool l9_376;
if (l9_375)
{
l9_376=l9_357.x==3;
}
else
{
l9_376=l9_375;
}
float l9_377=l9_354.x;
float l9_378=l9_359.x;
float l9_379=l9_359.z;
bool l9_380=l9_376;
float l9_381=l9_364;
float l9_382=fast::clamp(l9_377,l9_378,l9_379);
float l9_383=step(abs(l9_377-l9_382),9.9999997e-06);
l9_381*=(l9_383+((1.0-float(l9_380))*(1.0-l9_383)));
l9_377=l9_382;
l9_354.x=l9_377;
l9_364=l9_381;
bool l9_384=l9_360;
bool l9_385;
if (l9_384)
{
l9_385=l9_357.y==3;
}
else
{
l9_385=l9_384;
}
float l9_386=l9_354.y;
float l9_387=l9_359.y;
float l9_388=l9_359.w;
bool l9_389=l9_385;
float l9_390=l9_364;
float l9_391=fast::clamp(l9_386,l9_387,l9_388);
float l9_392=step(abs(l9_386-l9_391),9.9999997e-06);
l9_390*=(l9_392+((1.0-float(l9_389))*(1.0-l9_392)));
l9_386=l9_391;
l9_354.y=l9_386;
l9_364=l9_390;
}
float2 l9_393=l9_354;
bool l9_394=l9_355;
float3x3 l9_395=l9_356;
if (l9_394)
{
l9_393=float2((l9_395*float3(l9_393,1.0)).xy);
}
float2 l9_396=l9_393;
l9_354=l9_396;
float l9_397=l9_354.x;
int l9_398=l9_357.x;
bool l9_399=l9_363;
float l9_400=l9_364;
if ((l9_398==0)||(l9_398==3))
{
float l9_401=l9_397;
float l9_402=0.0;
float l9_403=1.0;
bool l9_404=l9_399;
float l9_405=l9_400;
float l9_406=fast::clamp(l9_401,l9_402,l9_403);
float l9_407=step(abs(l9_401-l9_406),9.9999997e-06);
l9_405*=(l9_407+((1.0-float(l9_404))*(1.0-l9_407)));
l9_401=l9_406;
l9_397=l9_401;
l9_400=l9_405;
}
l9_354.x=l9_397;
l9_364=l9_400;
float l9_408=l9_354.y;
int l9_409=l9_357.y;
bool l9_410=l9_363;
float l9_411=l9_364;
if ((l9_409==0)||(l9_409==3))
{
float l9_412=l9_408;
float l9_413=0.0;
float l9_414=1.0;
bool l9_415=l9_410;
float l9_416=l9_411;
float l9_417=fast::clamp(l9_412,l9_413,l9_414);
float l9_418=step(abs(l9_412-l9_417),9.9999997e-06);
l9_416*=(l9_418+((1.0-float(l9_415))*(1.0-l9_418)));
l9_412=l9_417;
l9_408=l9_412;
l9_411=l9_416;
}
l9_354.y=l9_408;
l9_364=l9_411;
float2 l9_419=l9_354;
int l9_420=l9_352;
int l9_421=l9_353;
float l9_422=l9_362;
float2 l9_423=l9_419;
int l9_424=l9_420;
int l9_425=l9_421;
float3 l9_426=float3(0.0);
if (l9_424==0)
{
l9_426=float3(l9_423,0.0);
}
else
{
if (l9_424==1)
{
l9_426=float3(l9_423.x,(l9_423.y*0.5)+(0.5-(float(l9_425)*0.5)),0.0);
}
else
{
l9_426=float3(l9_423,float(l9_425));
}
}
float3 l9_427=l9_426;
float3 l9_428=l9_427;
float4 l9_429=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_428.xy,bias(l9_422));
float4 l9_430=l9_429;
if (l9_360)
{
l9_430=mix(l9_361,l9_430,float4(l9_364));
}
float4 l9_431=l9_430;
l9_345=l9_431;
float l9_432=0.0;
float4 l9_433=l9_345;
float l9_434=l9_433.x;
l9_432=l9_434;
float l9_435=0.0;
float l9_436=0.0;
float l9_437=(*sc_set0.UserUniforms).Port_Value1_N043;
float l9_438=0.0;
ssGlobals l9_439=l9_340;
float l9_440=0.0;
float l9_441=float((*sc_set0.UserUniforms).alpha_channel!=0);
l9_440=l9_441;
float l9_442=0.0;
l9_442=float(l9_440==(*sc_set0.UserUniforms).Port_Input1_N034);
l9_436=l9_442;
float l9_443;
if ((l9_436*1.0)!=0.0)
{
l9_443=l9_437;
}
else
{
float4 l9_444=float4(0.0);
int l9_445;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_446=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_446=0;
}
else
{
l9_446=in.varStereoViewID;
}
int l9_447=l9_446;
l9_445=1-l9_447;
}
else
{
int l9_448=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_448=0;
}
else
{
l9_448=in.varStereoViewID;
}
int l9_449=l9_448;
l9_445=l9_449;
}
int l9_450=l9_445;
int l9_451=baseTexLayout_tmp;
int l9_452=l9_450;
float2 l9_453=l9_439.Surface_UVCoord0;
bool l9_454=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_455=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_456=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_457=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_458=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_459=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_460=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_461=0.0;
bool l9_462=l9_459&&(!l9_457);
float l9_463=1.0;
float l9_464=l9_453.x;
int l9_465=l9_456.x;
if (l9_465==1)
{
l9_464=fract(l9_464);
}
else
{
if (l9_465==2)
{
float l9_466=fract(l9_464);
float l9_467=l9_464-l9_466;
float l9_468=step(0.25,fract(l9_467*0.5));
l9_464=mix(l9_466,1.0-l9_466,fast::clamp(l9_468,0.0,1.0));
}
}
l9_453.x=l9_464;
float l9_469=l9_453.y;
int l9_470=l9_456.y;
if (l9_470==1)
{
l9_469=fract(l9_469);
}
else
{
if (l9_470==2)
{
float l9_471=fract(l9_469);
float l9_472=l9_469-l9_471;
float l9_473=step(0.25,fract(l9_472*0.5));
l9_469=mix(l9_471,1.0-l9_471,fast::clamp(l9_473,0.0,1.0));
}
}
l9_453.y=l9_469;
if (l9_457)
{
bool l9_474=l9_459;
bool l9_475;
if (l9_474)
{
l9_475=l9_456.x==3;
}
else
{
l9_475=l9_474;
}
float l9_476=l9_453.x;
float l9_477=l9_458.x;
float l9_478=l9_458.z;
bool l9_479=l9_475;
float l9_480=l9_463;
float l9_481=fast::clamp(l9_476,l9_477,l9_478);
float l9_482=step(abs(l9_476-l9_481),9.9999997e-06);
l9_480*=(l9_482+((1.0-float(l9_479))*(1.0-l9_482)));
l9_476=l9_481;
l9_453.x=l9_476;
l9_463=l9_480;
bool l9_483=l9_459;
bool l9_484;
if (l9_483)
{
l9_484=l9_456.y==3;
}
else
{
l9_484=l9_483;
}
float l9_485=l9_453.y;
float l9_486=l9_458.y;
float l9_487=l9_458.w;
bool l9_488=l9_484;
float l9_489=l9_463;
float l9_490=fast::clamp(l9_485,l9_486,l9_487);
float l9_491=step(abs(l9_485-l9_490),9.9999997e-06);
l9_489*=(l9_491+((1.0-float(l9_488))*(1.0-l9_491)));
l9_485=l9_490;
l9_453.y=l9_485;
l9_463=l9_489;
}
float2 l9_492=l9_453;
bool l9_493=l9_454;
float3x3 l9_494=l9_455;
if (l9_493)
{
l9_492=float2((l9_494*float3(l9_492,1.0)).xy);
}
float2 l9_495=l9_492;
l9_453=l9_495;
float l9_496=l9_453.x;
int l9_497=l9_456.x;
bool l9_498=l9_462;
float l9_499=l9_463;
if ((l9_497==0)||(l9_497==3))
{
float l9_500=l9_496;
float l9_501=0.0;
float l9_502=1.0;
bool l9_503=l9_498;
float l9_504=l9_499;
float l9_505=fast::clamp(l9_500,l9_501,l9_502);
float l9_506=step(abs(l9_500-l9_505),9.9999997e-06);
l9_504*=(l9_506+((1.0-float(l9_503))*(1.0-l9_506)));
l9_500=l9_505;
l9_496=l9_500;
l9_499=l9_504;
}
l9_453.x=l9_496;
l9_463=l9_499;
float l9_507=l9_453.y;
int l9_508=l9_456.y;
bool l9_509=l9_462;
float l9_510=l9_463;
if ((l9_508==0)||(l9_508==3))
{
float l9_511=l9_507;
float l9_512=0.0;
float l9_513=1.0;
bool l9_514=l9_509;
float l9_515=l9_510;
float l9_516=fast::clamp(l9_511,l9_512,l9_513);
float l9_517=step(abs(l9_511-l9_516),9.9999997e-06);
l9_515*=(l9_517+((1.0-float(l9_514))*(1.0-l9_517)));
l9_511=l9_516;
l9_507=l9_511;
l9_510=l9_515;
}
l9_453.y=l9_507;
l9_463=l9_510;
float2 l9_518=l9_453;
int l9_519=l9_451;
int l9_520=l9_452;
float l9_521=l9_461;
float2 l9_522=l9_518;
int l9_523=l9_519;
int l9_524=l9_520;
float3 l9_525=float3(0.0);
if (l9_523==0)
{
l9_525=float3(l9_522,0.0);
}
else
{
if (l9_523==1)
{
l9_525=float3(l9_522.x,(l9_522.y*0.5)+(0.5-(float(l9_524)*0.5)),0.0);
}
else
{
l9_525=float3(l9_522,float(l9_524));
}
}
float3 l9_526=l9_525;
float3 l9_527=l9_526;
float4 l9_528=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_527.xy,bias(l9_521));
float4 l9_529=l9_528;
if (l9_459)
{
l9_529=mix(l9_460,l9_529,float4(l9_463));
}
float4 l9_530=l9_529;
l9_444=l9_530;
float l9_531=0.0;
float4 l9_532=l9_444;
float l9_533=l9_532.w;
l9_531=l9_533;
l9_438=l9_531;
l9_443=l9_438;
}
l9_435=l9_443;
float4 l9_534=float4(0.0);
l9_534.x=l9_432;
l9_534.y=l9_432;
l9_534.z=l9_432;
l9_534.w=l9_435;
l9_338=l9_534;
l9_344=l9_338;
}
else
{
float4 l9_535=float4(0.0);
float l9_536=0.0;
float4 l9_537=float4(0.0);
float4 l9_538=float4(0.0);
ssGlobals l9_539=l9_340;
float l9_540=0.0;
float l9_541=float((*sc_set0.UserUniforms).green_channel!=0);
l9_540=l9_541;
float l9_542=0.0;
l9_542=float(l9_540==(*sc_set0.UserUniforms).Port_Input1_N052);
l9_536=l9_542;
float4 l9_543;
if ((l9_536*1.0)!=0.0)
{
float4 l9_544=float4(0.0);
int l9_545;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_546=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_546=0;
}
else
{
l9_546=in.varStereoViewID;
}
int l9_547=l9_546;
l9_545=1-l9_547;
}
else
{
int l9_548=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_548=0;
}
else
{
l9_548=in.varStereoViewID;
}
int l9_549=l9_548;
l9_545=l9_549;
}
int l9_550=l9_545;
int l9_551=baseTexLayout_tmp;
int l9_552=l9_550;
float2 l9_553=l9_539.Surface_UVCoord0;
bool l9_554=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_555=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_556=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_557=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_558=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_559=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_560=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_561=0.0;
bool l9_562=l9_559&&(!l9_557);
float l9_563=1.0;
float l9_564=l9_553.x;
int l9_565=l9_556.x;
if (l9_565==1)
{
l9_564=fract(l9_564);
}
else
{
if (l9_565==2)
{
float l9_566=fract(l9_564);
float l9_567=l9_564-l9_566;
float l9_568=step(0.25,fract(l9_567*0.5));
l9_564=mix(l9_566,1.0-l9_566,fast::clamp(l9_568,0.0,1.0));
}
}
l9_553.x=l9_564;
float l9_569=l9_553.y;
int l9_570=l9_556.y;
if (l9_570==1)
{
l9_569=fract(l9_569);
}
else
{
if (l9_570==2)
{
float l9_571=fract(l9_569);
float l9_572=l9_569-l9_571;
float l9_573=step(0.25,fract(l9_572*0.5));
l9_569=mix(l9_571,1.0-l9_571,fast::clamp(l9_573,0.0,1.0));
}
}
l9_553.y=l9_569;
if (l9_557)
{
bool l9_574=l9_559;
bool l9_575;
if (l9_574)
{
l9_575=l9_556.x==3;
}
else
{
l9_575=l9_574;
}
float l9_576=l9_553.x;
float l9_577=l9_558.x;
float l9_578=l9_558.z;
bool l9_579=l9_575;
float l9_580=l9_563;
float l9_581=fast::clamp(l9_576,l9_577,l9_578);
float l9_582=step(abs(l9_576-l9_581),9.9999997e-06);
l9_580*=(l9_582+((1.0-float(l9_579))*(1.0-l9_582)));
l9_576=l9_581;
l9_553.x=l9_576;
l9_563=l9_580;
bool l9_583=l9_559;
bool l9_584;
if (l9_583)
{
l9_584=l9_556.y==3;
}
else
{
l9_584=l9_583;
}
float l9_585=l9_553.y;
float l9_586=l9_558.y;
float l9_587=l9_558.w;
bool l9_588=l9_584;
float l9_589=l9_563;
float l9_590=fast::clamp(l9_585,l9_586,l9_587);
float l9_591=step(abs(l9_585-l9_590),9.9999997e-06);
l9_589*=(l9_591+((1.0-float(l9_588))*(1.0-l9_591)));
l9_585=l9_590;
l9_553.y=l9_585;
l9_563=l9_589;
}
float2 l9_592=l9_553;
bool l9_593=l9_554;
float3x3 l9_594=l9_555;
if (l9_593)
{
l9_592=float2((l9_594*float3(l9_592,1.0)).xy);
}
float2 l9_595=l9_592;
l9_553=l9_595;
float l9_596=l9_553.x;
int l9_597=l9_556.x;
bool l9_598=l9_562;
float l9_599=l9_563;
if ((l9_597==0)||(l9_597==3))
{
float l9_600=l9_596;
float l9_601=0.0;
float l9_602=1.0;
bool l9_603=l9_598;
float l9_604=l9_599;
float l9_605=fast::clamp(l9_600,l9_601,l9_602);
float l9_606=step(abs(l9_600-l9_605),9.9999997e-06);
l9_604*=(l9_606+((1.0-float(l9_603))*(1.0-l9_606)));
l9_600=l9_605;
l9_596=l9_600;
l9_599=l9_604;
}
l9_553.x=l9_596;
l9_563=l9_599;
float l9_607=l9_553.y;
int l9_608=l9_556.y;
bool l9_609=l9_562;
float l9_610=l9_563;
if ((l9_608==0)||(l9_608==3))
{
float l9_611=l9_607;
float l9_612=0.0;
float l9_613=1.0;
bool l9_614=l9_609;
float l9_615=l9_610;
float l9_616=fast::clamp(l9_611,l9_612,l9_613);
float l9_617=step(abs(l9_611-l9_616),9.9999997e-06);
l9_615*=(l9_617+((1.0-float(l9_614))*(1.0-l9_617)));
l9_611=l9_616;
l9_607=l9_611;
l9_610=l9_615;
}
l9_553.y=l9_607;
l9_563=l9_610;
float2 l9_618=l9_553;
int l9_619=l9_551;
int l9_620=l9_552;
float l9_621=l9_561;
float2 l9_622=l9_618;
int l9_623=l9_619;
int l9_624=l9_620;
float3 l9_625=float3(0.0);
if (l9_623==0)
{
l9_625=float3(l9_622,0.0);
}
else
{
if (l9_623==1)
{
l9_625=float3(l9_622.x,(l9_622.y*0.5)+(0.5-(float(l9_624)*0.5)),0.0);
}
else
{
l9_625=float3(l9_622,float(l9_624));
}
}
float3 l9_626=l9_625;
float3 l9_627=l9_626;
float4 l9_628=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_627.xy,bias(l9_621));
float4 l9_629=l9_628;
if (l9_559)
{
l9_629=mix(l9_560,l9_629,float4(l9_563));
}
float4 l9_630=l9_629;
l9_544=l9_630;
float l9_631=0.0;
float4 l9_632=l9_544;
float l9_633=l9_632.y;
l9_631=l9_633;
float l9_634=0.0;
float l9_635=0.0;
float l9_636=(*sc_set0.UserUniforms).Port_Value1_N043;
float l9_637=0.0;
ssGlobals l9_638=l9_539;
float l9_639=0.0;
float l9_640=float((*sc_set0.UserUniforms).alpha_channel!=0);
l9_639=l9_640;
float l9_641=0.0;
l9_641=float(l9_639==(*sc_set0.UserUniforms).Port_Input1_N034);
l9_635=l9_641;
float l9_642;
if ((l9_635*1.0)!=0.0)
{
l9_642=l9_636;
}
else
{
float4 l9_643=float4(0.0);
int l9_644;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_645=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_645=0;
}
else
{
l9_645=in.varStereoViewID;
}
int l9_646=l9_645;
l9_644=1-l9_646;
}
else
{
int l9_647=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_647=0;
}
else
{
l9_647=in.varStereoViewID;
}
int l9_648=l9_647;
l9_644=l9_648;
}
int l9_649=l9_644;
int l9_650=baseTexLayout_tmp;
int l9_651=l9_649;
float2 l9_652=l9_638.Surface_UVCoord0;
bool l9_653=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_654=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_655=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_656=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_657=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_658=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_659=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_660=0.0;
bool l9_661=l9_658&&(!l9_656);
float l9_662=1.0;
float l9_663=l9_652.x;
int l9_664=l9_655.x;
if (l9_664==1)
{
l9_663=fract(l9_663);
}
else
{
if (l9_664==2)
{
float l9_665=fract(l9_663);
float l9_666=l9_663-l9_665;
float l9_667=step(0.25,fract(l9_666*0.5));
l9_663=mix(l9_665,1.0-l9_665,fast::clamp(l9_667,0.0,1.0));
}
}
l9_652.x=l9_663;
float l9_668=l9_652.y;
int l9_669=l9_655.y;
if (l9_669==1)
{
l9_668=fract(l9_668);
}
else
{
if (l9_669==2)
{
float l9_670=fract(l9_668);
float l9_671=l9_668-l9_670;
float l9_672=step(0.25,fract(l9_671*0.5));
l9_668=mix(l9_670,1.0-l9_670,fast::clamp(l9_672,0.0,1.0));
}
}
l9_652.y=l9_668;
if (l9_656)
{
bool l9_673=l9_658;
bool l9_674;
if (l9_673)
{
l9_674=l9_655.x==3;
}
else
{
l9_674=l9_673;
}
float l9_675=l9_652.x;
float l9_676=l9_657.x;
float l9_677=l9_657.z;
bool l9_678=l9_674;
float l9_679=l9_662;
float l9_680=fast::clamp(l9_675,l9_676,l9_677);
float l9_681=step(abs(l9_675-l9_680),9.9999997e-06);
l9_679*=(l9_681+((1.0-float(l9_678))*(1.0-l9_681)));
l9_675=l9_680;
l9_652.x=l9_675;
l9_662=l9_679;
bool l9_682=l9_658;
bool l9_683;
if (l9_682)
{
l9_683=l9_655.y==3;
}
else
{
l9_683=l9_682;
}
float l9_684=l9_652.y;
float l9_685=l9_657.y;
float l9_686=l9_657.w;
bool l9_687=l9_683;
float l9_688=l9_662;
float l9_689=fast::clamp(l9_684,l9_685,l9_686);
float l9_690=step(abs(l9_684-l9_689),9.9999997e-06);
l9_688*=(l9_690+((1.0-float(l9_687))*(1.0-l9_690)));
l9_684=l9_689;
l9_652.y=l9_684;
l9_662=l9_688;
}
float2 l9_691=l9_652;
bool l9_692=l9_653;
float3x3 l9_693=l9_654;
if (l9_692)
{
l9_691=float2((l9_693*float3(l9_691,1.0)).xy);
}
float2 l9_694=l9_691;
l9_652=l9_694;
float l9_695=l9_652.x;
int l9_696=l9_655.x;
bool l9_697=l9_661;
float l9_698=l9_662;
if ((l9_696==0)||(l9_696==3))
{
float l9_699=l9_695;
float l9_700=0.0;
float l9_701=1.0;
bool l9_702=l9_697;
float l9_703=l9_698;
float l9_704=fast::clamp(l9_699,l9_700,l9_701);
float l9_705=step(abs(l9_699-l9_704),9.9999997e-06);
l9_703*=(l9_705+((1.0-float(l9_702))*(1.0-l9_705)));
l9_699=l9_704;
l9_695=l9_699;
l9_698=l9_703;
}
l9_652.x=l9_695;
l9_662=l9_698;
float l9_706=l9_652.y;
int l9_707=l9_655.y;
bool l9_708=l9_661;
float l9_709=l9_662;
if ((l9_707==0)||(l9_707==3))
{
float l9_710=l9_706;
float l9_711=0.0;
float l9_712=1.0;
bool l9_713=l9_708;
float l9_714=l9_709;
float l9_715=fast::clamp(l9_710,l9_711,l9_712);
float l9_716=step(abs(l9_710-l9_715),9.9999997e-06);
l9_714*=(l9_716+((1.0-float(l9_713))*(1.0-l9_716)));
l9_710=l9_715;
l9_706=l9_710;
l9_709=l9_714;
}
l9_652.y=l9_706;
l9_662=l9_709;
float2 l9_717=l9_652;
int l9_718=l9_650;
int l9_719=l9_651;
float l9_720=l9_660;
float2 l9_721=l9_717;
int l9_722=l9_718;
int l9_723=l9_719;
float3 l9_724=float3(0.0);
if (l9_722==0)
{
l9_724=float3(l9_721,0.0);
}
else
{
if (l9_722==1)
{
l9_724=float3(l9_721.x,(l9_721.y*0.5)+(0.5-(float(l9_723)*0.5)),0.0);
}
else
{
l9_724=float3(l9_721,float(l9_723));
}
}
float3 l9_725=l9_724;
float3 l9_726=l9_725;
float4 l9_727=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_726.xy,bias(l9_720));
float4 l9_728=l9_727;
if (l9_658)
{
l9_728=mix(l9_659,l9_728,float4(l9_662));
}
float4 l9_729=l9_728;
l9_643=l9_729;
float l9_730=0.0;
float4 l9_731=l9_643;
float l9_732=l9_731.w;
l9_730=l9_732;
l9_637=l9_730;
l9_642=l9_637;
}
l9_634=l9_642;
float4 l9_733=float4(0.0);
l9_733.x=l9_631;
l9_733.y=l9_631;
l9_733.z=l9_631;
l9_733.w=l9_634;
l9_537=l9_733;
l9_543=l9_537;
}
else
{
float4 l9_734=float4(0.0);
float l9_735=0.0;
float4 l9_736=float4(0.0);
float4 l9_737=(*sc_set0.UserUniforms).Port_Default_N055;
ssGlobals l9_738=l9_539;
float l9_739=0.0;
float l9_740=float((*sc_set0.UserUniforms).blue_channel!=0);
l9_739=l9_740;
float l9_741=0.0;
l9_741=float(l9_739==(*sc_set0.UserUniforms).Port_Input1_N053);
l9_735=l9_741;
float4 l9_742;
if ((l9_735*1.0)!=0.0)
{
float4 l9_743=float4(0.0);
int l9_744;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_745=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_745=0;
}
else
{
l9_745=in.varStereoViewID;
}
int l9_746=l9_745;
l9_744=1-l9_746;
}
else
{
int l9_747=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_747=0;
}
else
{
l9_747=in.varStereoViewID;
}
int l9_748=l9_747;
l9_744=l9_748;
}
int l9_749=l9_744;
int l9_750=baseTexLayout_tmp;
int l9_751=l9_749;
float2 l9_752=l9_738.Surface_UVCoord0;
bool l9_753=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_754=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_755=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_756=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_757=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_758=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_759=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_760=0.0;
bool l9_761=l9_758&&(!l9_756);
float l9_762=1.0;
float l9_763=l9_752.x;
int l9_764=l9_755.x;
if (l9_764==1)
{
l9_763=fract(l9_763);
}
else
{
if (l9_764==2)
{
float l9_765=fract(l9_763);
float l9_766=l9_763-l9_765;
float l9_767=step(0.25,fract(l9_766*0.5));
l9_763=mix(l9_765,1.0-l9_765,fast::clamp(l9_767,0.0,1.0));
}
}
l9_752.x=l9_763;
float l9_768=l9_752.y;
int l9_769=l9_755.y;
if (l9_769==1)
{
l9_768=fract(l9_768);
}
else
{
if (l9_769==2)
{
float l9_770=fract(l9_768);
float l9_771=l9_768-l9_770;
float l9_772=step(0.25,fract(l9_771*0.5));
l9_768=mix(l9_770,1.0-l9_770,fast::clamp(l9_772,0.0,1.0));
}
}
l9_752.y=l9_768;
if (l9_756)
{
bool l9_773=l9_758;
bool l9_774;
if (l9_773)
{
l9_774=l9_755.x==3;
}
else
{
l9_774=l9_773;
}
float l9_775=l9_752.x;
float l9_776=l9_757.x;
float l9_777=l9_757.z;
bool l9_778=l9_774;
float l9_779=l9_762;
float l9_780=fast::clamp(l9_775,l9_776,l9_777);
float l9_781=step(abs(l9_775-l9_780),9.9999997e-06);
l9_779*=(l9_781+((1.0-float(l9_778))*(1.0-l9_781)));
l9_775=l9_780;
l9_752.x=l9_775;
l9_762=l9_779;
bool l9_782=l9_758;
bool l9_783;
if (l9_782)
{
l9_783=l9_755.y==3;
}
else
{
l9_783=l9_782;
}
float l9_784=l9_752.y;
float l9_785=l9_757.y;
float l9_786=l9_757.w;
bool l9_787=l9_783;
float l9_788=l9_762;
float l9_789=fast::clamp(l9_784,l9_785,l9_786);
float l9_790=step(abs(l9_784-l9_789),9.9999997e-06);
l9_788*=(l9_790+((1.0-float(l9_787))*(1.0-l9_790)));
l9_784=l9_789;
l9_752.y=l9_784;
l9_762=l9_788;
}
float2 l9_791=l9_752;
bool l9_792=l9_753;
float3x3 l9_793=l9_754;
if (l9_792)
{
l9_791=float2((l9_793*float3(l9_791,1.0)).xy);
}
float2 l9_794=l9_791;
l9_752=l9_794;
float l9_795=l9_752.x;
int l9_796=l9_755.x;
bool l9_797=l9_761;
float l9_798=l9_762;
if ((l9_796==0)||(l9_796==3))
{
float l9_799=l9_795;
float l9_800=0.0;
float l9_801=1.0;
bool l9_802=l9_797;
float l9_803=l9_798;
float l9_804=fast::clamp(l9_799,l9_800,l9_801);
float l9_805=step(abs(l9_799-l9_804),9.9999997e-06);
l9_803*=(l9_805+((1.0-float(l9_802))*(1.0-l9_805)));
l9_799=l9_804;
l9_795=l9_799;
l9_798=l9_803;
}
l9_752.x=l9_795;
l9_762=l9_798;
float l9_806=l9_752.y;
int l9_807=l9_755.y;
bool l9_808=l9_761;
float l9_809=l9_762;
if ((l9_807==0)||(l9_807==3))
{
float l9_810=l9_806;
float l9_811=0.0;
float l9_812=1.0;
bool l9_813=l9_808;
float l9_814=l9_809;
float l9_815=fast::clamp(l9_810,l9_811,l9_812);
float l9_816=step(abs(l9_810-l9_815),9.9999997e-06);
l9_814*=(l9_816+((1.0-float(l9_813))*(1.0-l9_816)));
l9_810=l9_815;
l9_806=l9_810;
l9_809=l9_814;
}
l9_752.y=l9_806;
l9_762=l9_809;
float2 l9_817=l9_752;
int l9_818=l9_750;
int l9_819=l9_751;
float l9_820=l9_760;
float2 l9_821=l9_817;
int l9_822=l9_818;
int l9_823=l9_819;
float3 l9_824=float3(0.0);
if (l9_822==0)
{
l9_824=float3(l9_821,0.0);
}
else
{
if (l9_822==1)
{
l9_824=float3(l9_821.x,(l9_821.y*0.5)+(0.5-(float(l9_823)*0.5)),0.0);
}
else
{
l9_824=float3(l9_821,float(l9_823));
}
}
float3 l9_825=l9_824;
float3 l9_826=l9_825;
float4 l9_827=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_826.xy,bias(l9_820));
float4 l9_828=l9_827;
if (l9_758)
{
l9_828=mix(l9_759,l9_828,float4(l9_762));
}
float4 l9_829=l9_828;
l9_743=l9_829;
float l9_830=0.0;
float4 l9_831=l9_743;
float l9_832=l9_831.z;
l9_830=l9_832;
float l9_833=0.0;
float l9_834=0.0;
float l9_835=(*sc_set0.UserUniforms).Port_Value1_N043;
float l9_836=0.0;
ssGlobals l9_837=l9_738;
float l9_838=0.0;
float l9_839=float((*sc_set0.UserUniforms).alpha_channel!=0);
l9_838=l9_839;
float l9_840=0.0;
l9_840=float(l9_838==(*sc_set0.UserUniforms).Port_Input1_N034);
l9_834=l9_840;
float l9_841;
if ((l9_834*1.0)!=0.0)
{
l9_841=l9_835;
}
else
{
float4 l9_842=float4(0.0);
int l9_843;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_844=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_844=0;
}
else
{
l9_844=in.varStereoViewID;
}
int l9_845=l9_844;
l9_843=1-l9_845;
}
else
{
int l9_846=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_846=0;
}
else
{
l9_846=in.varStereoViewID;
}
int l9_847=l9_846;
l9_843=l9_847;
}
int l9_848=l9_843;
int l9_849=baseTexLayout_tmp;
int l9_850=l9_848;
float2 l9_851=l9_837.Surface_UVCoord0;
bool l9_852=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_853=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_854=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_855=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_856=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_857=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_858=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_859=0.0;
bool l9_860=l9_857&&(!l9_855);
float l9_861=1.0;
float l9_862=l9_851.x;
int l9_863=l9_854.x;
if (l9_863==1)
{
l9_862=fract(l9_862);
}
else
{
if (l9_863==2)
{
float l9_864=fract(l9_862);
float l9_865=l9_862-l9_864;
float l9_866=step(0.25,fract(l9_865*0.5));
l9_862=mix(l9_864,1.0-l9_864,fast::clamp(l9_866,0.0,1.0));
}
}
l9_851.x=l9_862;
float l9_867=l9_851.y;
int l9_868=l9_854.y;
if (l9_868==1)
{
l9_867=fract(l9_867);
}
else
{
if (l9_868==2)
{
float l9_869=fract(l9_867);
float l9_870=l9_867-l9_869;
float l9_871=step(0.25,fract(l9_870*0.5));
l9_867=mix(l9_869,1.0-l9_869,fast::clamp(l9_871,0.0,1.0));
}
}
l9_851.y=l9_867;
if (l9_855)
{
bool l9_872=l9_857;
bool l9_873;
if (l9_872)
{
l9_873=l9_854.x==3;
}
else
{
l9_873=l9_872;
}
float l9_874=l9_851.x;
float l9_875=l9_856.x;
float l9_876=l9_856.z;
bool l9_877=l9_873;
float l9_878=l9_861;
float l9_879=fast::clamp(l9_874,l9_875,l9_876);
float l9_880=step(abs(l9_874-l9_879),9.9999997e-06);
l9_878*=(l9_880+((1.0-float(l9_877))*(1.0-l9_880)));
l9_874=l9_879;
l9_851.x=l9_874;
l9_861=l9_878;
bool l9_881=l9_857;
bool l9_882;
if (l9_881)
{
l9_882=l9_854.y==3;
}
else
{
l9_882=l9_881;
}
float l9_883=l9_851.y;
float l9_884=l9_856.y;
float l9_885=l9_856.w;
bool l9_886=l9_882;
float l9_887=l9_861;
float l9_888=fast::clamp(l9_883,l9_884,l9_885);
float l9_889=step(abs(l9_883-l9_888),9.9999997e-06);
l9_887*=(l9_889+((1.0-float(l9_886))*(1.0-l9_889)));
l9_883=l9_888;
l9_851.y=l9_883;
l9_861=l9_887;
}
float2 l9_890=l9_851;
bool l9_891=l9_852;
float3x3 l9_892=l9_853;
if (l9_891)
{
l9_890=float2((l9_892*float3(l9_890,1.0)).xy);
}
float2 l9_893=l9_890;
l9_851=l9_893;
float l9_894=l9_851.x;
int l9_895=l9_854.x;
bool l9_896=l9_860;
float l9_897=l9_861;
if ((l9_895==0)||(l9_895==3))
{
float l9_898=l9_894;
float l9_899=0.0;
float l9_900=1.0;
bool l9_901=l9_896;
float l9_902=l9_897;
float l9_903=fast::clamp(l9_898,l9_899,l9_900);
float l9_904=step(abs(l9_898-l9_903),9.9999997e-06);
l9_902*=(l9_904+((1.0-float(l9_901))*(1.0-l9_904)));
l9_898=l9_903;
l9_894=l9_898;
l9_897=l9_902;
}
l9_851.x=l9_894;
l9_861=l9_897;
float l9_905=l9_851.y;
int l9_906=l9_854.y;
bool l9_907=l9_860;
float l9_908=l9_861;
if ((l9_906==0)||(l9_906==3))
{
float l9_909=l9_905;
float l9_910=0.0;
float l9_911=1.0;
bool l9_912=l9_907;
float l9_913=l9_908;
float l9_914=fast::clamp(l9_909,l9_910,l9_911);
float l9_915=step(abs(l9_909-l9_914),9.9999997e-06);
l9_913*=(l9_915+((1.0-float(l9_912))*(1.0-l9_915)));
l9_909=l9_914;
l9_905=l9_909;
l9_908=l9_913;
}
l9_851.y=l9_905;
l9_861=l9_908;
float2 l9_916=l9_851;
int l9_917=l9_849;
int l9_918=l9_850;
float l9_919=l9_859;
float2 l9_920=l9_916;
int l9_921=l9_917;
int l9_922=l9_918;
float3 l9_923=float3(0.0);
if (l9_921==0)
{
l9_923=float3(l9_920,0.0);
}
else
{
if (l9_921==1)
{
l9_923=float3(l9_920.x,(l9_920.y*0.5)+(0.5-(float(l9_922)*0.5)),0.0);
}
else
{
l9_923=float3(l9_920,float(l9_922));
}
}
float3 l9_924=l9_923;
float3 l9_925=l9_924;
float4 l9_926=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_925.xy,bias(l9_919));
float4 l9_927=l9_926;
if (l9_857)
{
l9_927=mix(l9_858,l9_927,float4(l9_861));
}
float4 l9_928=l9_927;
l9_842=l9_928;
float l9_929=0.0;
float4 l9_930=l9_842;
float l9_931=l9_930.w;
l9_929=l9_931;
l9_836=l9_929;
l9_841=l9_836;
}
l9_833=l9_841;
float4 l9_932=float4(0.0);
l9_932.x=l9_830;
l9_932.y=l9_830;
l9_932.z=l9_830;
l9_932.w=l9_833;
l9_736=l9_932;
l9_742=l9_736;
}
else
{
l9_742=l9_737;
}
l9_734=l9_742;
l9_538=l9_734;
l9_543=l9_538;
}
l9_535=l9_543;
l9_339=l9_535;
l9_344=l9_339;
}
l9_336=l9_344;
l9_324=l9_336;
l9_335=l9_324;
}
else
{
l9_335=l9_325;
}
l9_322=l9_335;
l9_108=l9_322;
l9_118=l9_108;
}
l9_105=l9_118;
param_3=l9_105;
param_4=param_3;
}
Result_N11=param_4;
FinalColor=Result_N11;
float param_6=FinalColor.w;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (param_6<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_933=gl_FragCoord;
float2 l9_934=floor(mod(l9_933.xy,float2(4.0)));
float l9_935=(mod(dot(l9_934,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (param_6<l9_935)
{
discard_fragment();
}
}
if ((*sc_set0.UserUniforms).sc_RayTracingCasterConfiguration.x!=0u)
{
float4 param_7=FinalColor;
if ((int(sc_RayTracingCasterForceOpaque_tmp)!=0))
{
param_7.w=1.0;
}
float4 l9_936=fast::max(param_7,float4(0.0));
float4 param_8=l9_936;
if (sc_ShaderCacheConstant_tmp!=0)
{
param_8.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.FragColor0=param_8;
return out;
}
float4 param_9=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_937=param_9;
float4 l9_938=l9_937;
float l9_939=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_939=l9_938.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_939=fast::clamp(l9_938.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_939=fast::clamp(dot(l9_938.xyz,float3(l9_938.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_939=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_939=(1.0-dot(l9_938.xyz,float3(0.33333001)))*l9_938.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_939=(1.0-fast::clamp(dot(l9_938.xyz,float3(1.0)),0.0,1.0))*l9_938.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_939=fast::clamp(dot(l9_938.xyz,float3(1.0)),0.0,1.0)*l9_938.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_939=fast::clamp(dot(l9_938.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_939=fast::clamp(dot(l9_938.xyz,float3(1.0)),0.0,1.0)*l9_938.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_939=dot(l9_938.xyz,float3(0.33333001))*l9_938.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_939=1.0-fast::clamp(dot(l9_938.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_939=fast::clamp(dot(l9_938.xyz,float3(1.0)),0.0,1.0);
}
}
}
}
}
}
}
}
}
}
}
}
float l9_940=l9_939;
float l9_941=l9_940;
float l9_942=(*sc_set0.UserUniforms).sc_ShadowDensity*l9_941;
float3 l9_943=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_937.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float4 l9_944=float4(l9_943.x,l9_943.y,l9_943.z,l9_942);
param_9=l9_944;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_9=float4(param_9.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_945=param_9;
float4 l9_946=float4(0.0);
float4 l9_947=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_948=out.FragColor0;
float4 l9_949=l9_948;
l9_947=l9_949;
}
else
{
float4 l9_950=gl_FragCoord;
float2 l9_951=l9_950.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_952=l9_951;
float2 l9_953=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_954=1;
int l9_955=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_955=0;
}
else
{
l9_955=in.varStereoViewID;
}
int l9_956=l9_955;
int l9_957=l9_956;
float3 l9_958=float3(l9_952,0.0);
int l9_959=l9_954;
int l9_960=l9_957;
if (l9_959==1)
{
l9_958.y=((2.0*l9_958.y)+float(l9_960))-1.0;
}
float2 l9_961=l9_958.xy;
l9_953=l9_961;
}
else
{
l9_953=l9_952;
}
float2 l9_962=l9_953;
float2 l9_963=l9_962;
float2 l9_964=l9_963;
float2 l9_965=l9_964;
float l9_966=0.0;
int l9_967;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_968=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_968=0;
}
else
{
l9_968=in.varStereoViewID;
}
int l9_969=l9_968;
l9_967=1-l9_969;
}
else
{
int l9_970=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_970=0;
}
else
{
l9_970=in.varStereoViewID;
}
int l9_971=l9_970;
l9_967=l9_971;
}
int l9_972=l9_967;
float2 l9_973=l9_965;
int l9_974=sc_ScreenTextureLayout_tmp;
int l9_975=l9_972;
float l9_976=l9_966;
float2 l9_977=l9_973;
int l9_978=l9_974;
int l9_979=l9_975;
float3 l9_980=float3(0.0);
if (l9_978==0)
{
l9_980=float3(l9_977,0.0);
}
else
{
if (l9_978==1)
{
l9_980=float3(l9_977.x,(l9_977.y*0.5)+(0.5-(float(l9_979)*0.5)),0.0);
}
else
{
l9_980=float3(l9_977,float(l9_979));
}
}
float3 l9_981=l9_980;
float3 l9_982=l9_981;
float4 l9_983=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_982.xy,bias(l9_976));
float4 l9_984=l9_983;
float4 l9_985=l9_984;
l9_947=l9_985;
}
float4 l9_986=l9_947;
float3 l9_987=l9_986.xyz;
float3 l9_988=l9_987;
float3 l9_989=l9_945.xyz;
float3 l9_990=definedBlend(l9_988,l9_989,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_946=float4(l9_990.x,l9_990.y,l9_990.z,l9_946.w);
float3 l9_991=mix(l9_987,l9_946.xyz,float3(l9_945.w));
l9_946=float4(l9_991.x,l9_991.y,l9_991.z,l9_946.w);
l9_946.w=1.0;
float4 l9_992=l9_946;
param_9=l9_992;
}
else
{
if ((int(sc_Voxelization_tmp)!=0))
{
float4 l9_993=float4(in.varScreenPos.xyz,1.0);
param_9=l9_993;
}
else
{
if ((int(sc_OutputBounds_tmp)!=0))
{
float4 l9_994=gl_FragCoord;
float l9_995=fast::clamp(abs(l9_994.z),0.0,1.0);
float4 l9_996=float4(l9_995,1.0-l9_995,1.0,1.0);
param_9=l9_996;
}
else
{
float4 l9_997=param_9;
float4 l9_998=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_998=float4(mix(float3(1.0),l9_997.xyz,float3(l9_997.w)),l9_997.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_999=l9_997.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_999=fast::clamp(l9_999,0.0,1.0);
}
l9_998=float4(l9_997.xyz*l9_999,l9_999);
}
else
{
l9_998=l9_997;
}
}
float4 l9_1000=l9_998;
param_9=l9_1000;
}
}
}
}
}
float4 l9_1001=param_9;
FinalColor=l9_1001;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
if (PreviewInfo.Saved)
{
FinalColor=float4(PreviewInfo.Color);
}
else
{
FinalColor=float4(0.0);
}
}
float4 l9_1002=float4(0.0);
l9_1002=float4(0.0);
float4 l9_1003=l9_1002;
float4 Cost=l9_1003;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float3 param_10=in.varPos;
float4 param_11=FinalColor;
FinalColor=sc_OutputMotionVectorsIfNeeded(param_10,param_11,in.varStereoViewID,(*sc_set0.UserUniforms));
float4 param_12=FinalColor;
float4 l9_1004=param_12;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_1004.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.FragColor0=l9_1004;
return out;
}
} // FRAGMENT SHADER
