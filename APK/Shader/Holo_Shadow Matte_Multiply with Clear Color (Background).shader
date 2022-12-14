//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Holo/Shadow Matte/Multiply with Clear Color (Background)" {
Properties {
_ShadowColor ("Shadow Tint (RGBA)", Color) = (0,0,0,1)
_Alpha ("Alpha Out (for Pokedex)", Range(0, 1)) = 1
[KeywordEnum(Alpha_X_Ambient, RGBA)] _Multiplier ("    Clear Multiplier", Float) = 0
}
SubShader {
 LOD 100
 Tags { "QUEUE" = "Background" "RenderType" = "Opaque" }
 Pass {
  Name "FORWARD"
  LOD 100
  Tags { "LIGHTMODE" = "ForwardBase" "QUEUE" = "Background" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  Blend DstColor Zero, SrcAlpha One
  ZClip Off
  GpuProgramID 4704
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 unity_AmbientEquator;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _ShadowColor;
uniform lowp float _Alpha;
highp vec4 xlat_mutable_ShadowColor;
varying mediump vec3 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying mediump float xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  xlat_mutable_ShadowColor.xyz = _ShadowColor.xyz;
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3.xyz = _glesColor.xyz;
  mediump float tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_4 = (unity_FogParams.x * tmpvar_5.z);
  mediump float tmpvar_6;
  tmpvar_6 = exp2((-(tmpvar_4) * tmpvar_4));
  tmpvar_4 = tmpvar_6;
  tmpvar_3.w = (_glesColor.w * _Alpha);
  xlat_mutable_ShadowColor.w = (_ShadowColor.w * (tmpvar_3.w * tmpvar_6));
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = (((_ShadowColor.xyz * unity_AmbientEquator.xyz) * xlat_mutable_ShadowColor.w) + (1.0 - xlat_mutable_ShadowColor.w));
  tmpvar_7.w = tmpvar_3.w;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  worldNormal_1 = tmpvar_10;
  tmpvar_2 = worldNormal_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_8);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = vec3(0.0, 0.0, 0.0);
}


#endif
#ifdef FRAGMENT
varying highp vec4 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  mediump vec4 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD1;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD3);
  c_1.xyz = (c_1 + vec4(1.0, 1.0, 1.0, 0.0)).xyz;
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 unity_AmbientEquator;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _ShadowColor;
uniform lowp float _Alpha;
highp vec4 xlat_mutable_ShadowColor;
varying mediump vec3 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying mediump float xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  xlat_mutable_ShadowColor.xyz = _ShadowColor.xyz;
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3.xyz = _glesColor.xyz;
  mediump float tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_4 = (unity_FogParams.x * tmpvar_5.z);
  mediump float tmpvar_6;
  tmpvar_6 = exp2((-(tmpvar_4) * tmpvar_4));
  tmpvar_4 = tmpvar_6;
  tmpvar_3.w = (_glesColor.w * _Alpha);
  xlat_mutable_ShadowColor.w = (_ShadowColor.w * (tmpvar_3.w * tmpvar_6));
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = (((_ShadowColor.xyz * unity_AmbientEquator.xyz) * xlat_mutable_ShadowColor.w) + (1.0 - xlat_mutable_ShadowColor.w));
  tmpvar_7.w = tmpvar_3.w;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  worldNormal_1 = tmpvar_10;
  tmpvar_2 = worldNormal_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_8);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = vec3(0.0, 0.0, 0.0);
}


#endif
#ifdef FRAGMENT
varying highp vec4 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  mediump vec4 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD1;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD3);
  c_1.xyz = (c_1 + vec4(1.0, 1.0, 1.0, 0.0)).xyz;
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 unity_AmbientEquator;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _ShadowColor;
uniform lowp float _Alpha;
highp vec4 xlat_mutable_ShadowColor;
varying mediump vec3 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying mediump float xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  xlat_mutable_ShadowColor.xyz = _ShadowColor.xyz;
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3.xyz = _glesColor.xyz;
  mediump float tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_4 = (unity_FogParams.x * tmpvar_5.z);
  mediump float tmpvar_6;
  tmpvar_6 = exp2((-(tmpvar_4) * tmpvar_4));
  tmpvar_4 = tmpvar_6;
  tmpvar_3.w = (_glesColor.w * _Alpha);
  xlat_mutable_ShadowColor.w = (_ShadowColor.w * (tmpvar_3.w * tmpvar_6));
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = (((_ShadowColor.xyz * unity_AmbientEquator.xyz) * xlat_mutable_ShadowColor.w) + (1.0 - xlat_mutable_ShadowColor.w));
  tmpvar_7.w = tmpvar_3.w;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  worldNormal_1 = tmpvar_10;
  tmpvar_2 = worldNormal_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_8);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = vec3(0.0, 0.0, 0.0);
}


#endif
#ifdef FRAGMENT
varying highp vec4 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  mediump vec4 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD1;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD3);
  c_1.xyz = (c_1 + vec4(1.0, 1.0, 1.0, 0.0)).xyz;
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 unity_AmbientEquator;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _ShadowColor;
uniform lowp float _Alpha;
highp vec4 xlat_mutable_ShadowColor;
varying mediump vec3 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying mediump float xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  xlat_mutable_ShadowColor.xyz = _ShadowColor.xyz;
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3.xyz = _glesColor.xyz;
  mediump float tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_4 = (unity_FogParams.x * tmpvar_5.z);
  mediump float tmpvar_6;
  tmpvar_6 = exp2((-(tmpvar_4) * tmpvar_4));
  tmpvar_4 = tmpvar_6;
  tmpvar_3.w = (_glesColor.w * _Alpha);
  xlat_mutable_ShadowColor.w = (_ShadowColor.w * (tmpvar_3.w * tmpvar_6));
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = (((_ShadowColor.xyz * unity_AmbientEquator.xyz) * xlat_mutable_ShadowColor.w) + (1.0 - xlat_mutable_ShadowColor.w));
  tmpvar_7.w = tmpvar_3.w;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  worldNormal_1 = tmpvar_10;
  tmpvar_2 = worldNormal_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_8);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = vec3(0.0, 0.0, 0.0);
  xlv_TEXCOORD4 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  mediump vec4 tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_2 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD1.w;
  lowp float tmpvar_4;
  highp float lightShadowDataX_5;
  mediump float tmpvar_6;
  tmpvar_6 = _LightShadowData.x;
  lightShadowDataX_5 = tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD4.xy).x > xlv_TEXCOORD4.z)), lightShadowDataX_5);
  tmpvar_4 = tmpvar_7;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD3);
  mediump vec4 tmpvar_8;
  mediump float atten_9;
  atten_9 = tmpvar_4;
  lowp vec4 col_10;
  lowp float mask_11;
  mediump float tmpvar_12;
  tmpvar_12 = (1.0 - atten_9);
  mask_11 = tmpvar_12;
  mediump vec4 tmpvar_13;
  tmpvar_13.xyz = tmpvar_2.xyz;
  tmpvar_13.w = tmpvar_3;
  col_10 = tmpvar_13;
  mediump vec4 tmpvar_14;
  tmpvar_14.w = 0.0;
  tmpvar_14.xyz = vec3(atten_9);
  tmpvar_8 = ((col_10 * mask_11) + tmpvar_14);
  c_1.xyz = (c_1 + tmpvar_8).xyz;
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 unity_AmbientEquator;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _ShadowColor;
uniform lowp float _Alpha;
highp vec4 xlat_mutable_ShadowColor;
varying mediump vec3 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying mediump float xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  xlat_mutable_ShadowColor.xyz = _ShadowColor.xyz;
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3.xyz = _glesColor.xyz;
  mediump float tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_4 = (unity_FogParams.x * tmpvar_5.z);
  mediump float tmpvar_6;
  tmpvar_6 = exp2((-(tmpvar_4) * tmpvar_4));
  tmpvar_4 = tmpvar_6;
  tmpvar_3.w = (_glesColor.w * _Alpha);
  xlat_mutable_ShadowColor.w = (_ShadowColor.w * (tmpvar_3.w * tmpvar_6));
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = (((_ShadowColor.xyz * unity_AmbientEquator.xyz) * xlat_mutable_ShadowColor.w) + (1.0 - xlat_mutable_ShadowColor.w));
  tmpvar_7.w = tmpvar_3.w;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  worldNormal_1 = tmpvar_10;
  tmpvar_2 = worldNormal_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_8);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = vec3(0.0, 0.0, 0.0);
  xlv_TEXCOORD4 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  mediump vec4 tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_2 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD1.w;
  lowp float tmpvar_4;
  highp float lightShadowDataX_5;
  mediump float tmpvar_6;
  tmpvar_6 = _LightShadowData.x;
  lightShadowDataX_5 = tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD4.xy).x > xlv_TEXCOORD4.z)), lightShadowDataX_5);
  tmpvar_4 = tmpvar_7;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD3);
  mediump vec4 tmpvar_8;
  mediump float atten_9;
  atten_9 = tmpvar_4;
  lowp vec4 col_10;
  lowp float mask_11;
  mediump float tmpvar_12;
  tmpvar_12 = (1.0 - atten_9);
  mask_11 = tmpvar_12;
  mediump vec4 tmpvar_13;
  tmpvar_13.xyz = tmpvar_2.xyz;
  tmpvar_13.w = tmpvar_3;
  col_10 = tmpvar_13;
  mediump vec4 tmpvar_14;
  tmpvar_14.w = 0.0;
  tmpvar_14.xyz = vec3(atten_9);
  tmpvar_8 = ((col_10 * mask_11) + tmpvar_14);
  c_1.xyz = (c_1 + tmpvar_8).xyz;
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 unity_AmbientEquator;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _ShadowColor;
uniform lowp float _Alpha;
highp vec4 xlat_mutable_ShadowColor;
varying mediump vec3 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying mediump float xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  xlat_mutable_ShadowColor.xyz = _ShadowColor.xyz;
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3.xyz = _glesColor.xyz;
  mediump float tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_4 = (unity_FogParams.x * tmpvar_5.z);
  mediump float tmpvar_6;
  tmpvar_6 = exp2((-(tmpvar_4) * tmpvar_4));
  tmpvar_4 = tmpvar_6;
  tmpvar_3.w = (_glesColor.w * _Alpha);
  xlat_mutable_ShadowColor.w = (_ShadowColor.w * (tmpvar_3.w * tmpvar_6));
  highp vec4 tmpvar_7;
  tmpvar_7.xyz = (((_ShadowColor.xyz * unity_AmbientEquator.xyz) * xlat_mutable_ShadowColor.w) + (1.0 - xlat_mutable_ShadowColor.w));
  tmpvar_7.w = tmpvar_3.w;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  worldNormal_1 = tmpvar_10;
  tmpvar_2 = worldNormal_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_8);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_6;
  xlv_TEXCOORD3 = vec3(0.0, 0.0, 0.0);
  xlv_TEXCOORD4 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  mediump vec4 tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_2 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD1.w;
  lowp float tmpvar_4;
  highp float lightShadowDataX_5;
  mediump float tmpvar_6;
  tmpvar_6 = _LightShadowData.x;
  lightShadowDataX_5 = tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD4.xy).x > xlv_TEXCOORD4.z)), lightShadowDataX_5);
  tmpvar_4 = tmpvar_7;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD3);
  mediump vec4 tmpvar_8;
  mediump float atten_9;
  atten_9 = tmpvar_4;
  lowp vec4 col_10;
  lowp float mask_11;
  mediump float tmpvar_12;
  tmpvar_12 = (1.0 - atten_9);
  mask_11 = tmpvar_12;
  mediump vec4 tmpvar_13;
  tmpvar_13.xyz = tmpvar_2.xyz;
  tmpvar_13.w = tmpvar_3;
  col_10 = tmpvar_13;
  mediump vec4 tmpvar_14;
  tmpvar_14.w = 0.0;
  tmpvar_14.xyz = vec3(atten_9);
  tmpvar_8 = ((col_10 * mask_11) + tmpvar_14);
  c_1.xyz = (c_1 + tmpvar_8).xyz;
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 unity_AmbientEquator;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _ShadowColor;
uniform lowp float _Alpha;
highp vec4 xlat_mutable_ShadowColor;
varying mediump vec3 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying mediump float xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  xlat_mutable_ShadowColor.xyz = _ShadowColor.xyz;
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_4.xyz = _glesColor.xyz;
  mediump float tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_5 = (unity_FogParams.x * tmpvar_6.z);
  mediump float tmpvar_7;
  tmpvar_7 = exp2((-(tmpvar_5) * tmpvar_5));
  tmpvar_5 = tmpvar_7;
  tmpvar_4.w = (_glesColor.w * _Alpha);
  xlat_mutable_ShadowColor.w = (_ShadowColor.w * (tmpvar_4.w * tmpvar_7));
  highp vec4 tmpvar_8;
  tmpvar_8.xyz = (((_ShadowColor.xyz * unity_AmbientEquator.xyz) * xlat_mutable_ShadowColor.w) + (1.0 - xlat_mutable_ShadowColor.w));
  tmpvar_8.w = tmpvar_4.w;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_11;
  tmpvar_11[0] = unity_WorldToObject[0].xyz;
  tmpvar_11[1] = unity_WorldToObject[1].xyz;
  tmpvar_11[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_glesNormal * tmpvar_11));
  worldNormal_1 = tmpvar_12;
  tmpvar_2 = worldNormal_1;
  highp vec3 lightColor0_13;
  lightColor0_13 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_14;
  lightColor1_14 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_15;
  lightColor2_15 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_16;
  lightColor3_16 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_17;
  lightAttenSq_17 = unity_4LightAtten0;
  highp vec3 normal_18;
  normal_18 = worldNormal_1;
  highp vec3 col_19;
  highp vec4 ndotl_20;
  highp vec4 lengthSq_21;
  highp vec4 tmpvar_22;
  tmpvar_22 = (unity_4LightPosX0 - tmpvar_10.x);
  highp vec4 tmpvar_23;
  tmpvar_23 = (unity_4LightPosY0 - tmpvar_10.y);
  highp vec4 tmpvar_24;
  tmpvar_24 = (unity_4LightPosZ0 - tmpvar_10.z);
  lengthSq_21 = (tmpvar_22 * tmpvar_22);
  lengthSq_21 = (lengthSq_21 + (tmpvar_23 * tmpvar_23));
  lengthSq_21 = (lengthSq_21 + (tmpvar_24 * tmpvar_24));
  highp vec4 tmpvar_25;
  tmpvar_25 = max (lengthSq_21, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_21 = tmpvar_25;
  ndotl_20 = (tmpvar_22 * normal_18.x);
  ndotl_20 = (ndotl_20 + (tmpvar_23 * normal_18.y));
  ndotl_20 = (ndotl_20 + (tmpvar_24 * normal_18.z));
  highp vec4 tmpvar_26;
  tmpvar_26 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_20 * inversesqrt(tmpvar_25)));
  ndotl_20 = tmpvar_26;
  highp vec4 tmpvar_27;
  tmpvar_27 = (tmpvar_26 * (1.0/((1.0 + 
    (tmpvar_25 * lightAttenSq_17)
  ))));
  col_19 = (lightColor0_13 * tmpvar_27.x);
  col_19 = (col_19 + (lightColor1_14 * tmpvar_27.y));
  col_19 = (col_19 + (lightColor2_15 * tmpvar_27.z));
  col_19 = (col_19 + (lightColor3_16 * tmpvar_27.w));
  tmpvar_3 = col_19;
  gl_Position = (glstate_matrix_mvp * tmpvar_9);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_8;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
varying highp vec4 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  mediump vec4 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD1;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD3);
  c_1.xyz = (c_1 + vec4(1.0, 1.0, 1.0, 0.0)).xyz;
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 unity_AmbientEquator;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _ShadowColor;
uniform lowp float _Alpha;
highp vec4 xlat_mutable_ShadowColor;
varying mediump vec3 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying mediump float xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  xlat_mutable_ShadowColor.xyz = _ShadowColor.xyz;
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_4.xyz = _glesColor.xyz;
  mediump float tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_5 = (unity_FogParams.x * tmpvar_6.z);
  mediump float tmpvar_7;
  tmpvar_7 = exp2((-(tmpvar_5) * tmpvar_5));
  tmpvar_5 = tmpvar_7;
  tmpvar_4.w = (_glesColor.w * _Alpha);
  xlat_mutable_ShadowColor.w = (_ShadowColor.w * (tmpvar_4.w * tmpvar_7));
  highp vec4 tmpvar_8;
  tmpvar_8.xyz = (((_ShadowColor.xyz * unity_AmbientEquator.xyz) * xlat_mutable_ShadowColor.w) + (1.0 - xlat_mutable_ShadowColor.w));
  tmpvar_8.w = tmpvar_4.w;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_11;
  tmpvar_11[0] = unity_WorldToObject[0].xyz;
  tmpvar_11[1] = unity_WorldToObject[1].xyz;
  tmpvar_11[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_glesNormal * tmpvar_11));
  worldNormal_1 = tmpvar_12;
  tmpvar_2 = worldNormal_1;
  highp vec3 lightColor0_13;
  lightColor0_13 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_14;
  lightColor1_14 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_15;
  lightColor2_15 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_16;
  lightColor3_16 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_17;
  lightAttenSq_17 = unity_4LightAtten0;
  highp vec3 normal_18;
  normal_18 = worldNormal_1;
  highp vec3 col_19;
  highp vec4 ndotl_20;
  highp vec4 lengthSq_21;
  highp vec4 tmpvar_22;
  tmpvar_22 = (unity_4LightPosX0 - tmpvar_10.x);
  highp vec4 tmpvar_23;
  tmpvar_23 = (unity_4LightPosY0 - tmpvar_10.y);
  highp vec4 tmpvar_24;
  tmpvar_24 = (unity_4LightPosZ0 - tmpvar_10.z);
  lengthSq_21 = (tmpvar_22 * tmpvar_22);
  lengthSq_21 = (lengthSq_21 + (tmpvar_23 * tmpvar_23));
  lengthSq_21 = (lengthSq_21 + (tmpvar_24 * tmpvar_24));
  highp vec4 tmpvar_25;
  tmpvar_25 = max (lengthSq_21, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_21 = tmpvar_25;
  ndotl_20 = (tmpvar_22 * normal_18.x);
  ndotl_20 = (ndotl_20 + (tmpvar_23 * normal_18.y));
  ndotl_20 = (ndotl_20 + (tmpvar_24 * normal_18.z));
  highp vec4 tmpvar_26;
  tmpvar_26 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_20 * inversesqrt(tmpvar_25)));
  ndotl_20 = tmpvar_26;
  highp vec4 tmpvar_27;
  tmpvar_27 = (tmpvar_26 * (1.0/((1.0 + 
    (tmpvar_25 * lightAttenSq_17)
  ))));
  col_19 = (lightColor0_13 * tmpvar_27.x);
  col_19 = (col_19 + (lightColor1_14 * tmpvar_27.y));
  col_19 = (col_19 + (lightColor2_15 * tmpvar_27.z));
  col_19 = (col_19 + (lightColor3_16 * tmpvar_27.w));
  tmpvar_3 = col_19;
  gl_Position = (glstate_matrix_mvp * tmpvar_9);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_8;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
varying highp vec4 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  mediump vec4 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD1;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD3);
  c_1.xyz = (c_1 + vec4(1.0, 1.0, 1.0, 0.0)).xyz;
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 unity_AmbientEquator;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _ShadowColor;
uniform lowp float _Alpha;
highp vec4 xlat_mutable_ShadowColor;
varying mediump vec3 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying mediump float xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  xlat_mutable_ShadowColor.xyz = _ShadowColor.xyz;
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_4.xyz = _glesColor.xyz;
  mediump float tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_5 = (unity_FogParams.x * tmpvar_6.z);
  mediump float tmpvar_7;
  tmpvar_7 = exp2((-(tmpvar_5) * tmpvar_5));
  tmpvar_5 = tmpvar_7;
  tmpvar_4.w = (_glesColor.w * _Alpha);
  xlat_mutable_ShadowColor.w = (_ShadowColor.w * (tmpvar_4.w * tmpvar_7));
  highp vec4 tmpvar_8;
  tmpvar_8.xyz = (((_ShadowColor.xyz * unity_AmbientEquator.xyz) * xlat_mutable_ShadowColor.w) + (1.0 - xlat_mutable_ShadowColor.w));
  tmpvar_8.w = tmpvar_4.w;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_11;
  tmpvar_11[0] = unity_WorldToObject[0].xyz;
  tmpvar_11[1] = unity_WorldToObject[1].xyz;
  tmpvar_11[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_glesNormal * tmpvar_11));
  worldNormal_1 = tmpvar_12;
  tmpvar_2 = worldNormal_1;
  highp vec3 lightColor0_13;
  lightColor0_13 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_14;
  lightColor1_14 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_15;
  lightColor2_15 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_16;
  lightColor3_16 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_17;
  lightAttenSq_17 = unity_4LightAtten0;
  highp vec3 normal_18;
  normal_18 = worldNormal_1;
  highp vec3 col_19;
  highp vec4 ndotl_20;
  highp vec4 lengthSq_21;
  highp vec4 tmpvar_22;
  tmpvar_22 = (unity_4LightPosX0 - tmpvar_10.x);
  highp vec4 tmpvar_23;
  tmpvar_23 = (unity_4LightPosY0 - tmpvar_10.y);
  highp vec4 tmpvar_24;
  tmpvar_24 = (unity_4LightPosZ0 - tmpvar_10.z);
  lengthSq_21 = (tmpvar_22 * tmpvar_22);
  lengthSq_21 = (lengthSq_21 + (tmpvar_23 * tmpvar_23));
  lengthSq_21 = (lengthSq_21 + (tmpvar_24 * tmpvar_24));
  highp vec4 tmpvar_25;
  tmpvar_25 = max (lengthSq_21, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_21 = tmpvar_25;
  ndotl_20 = (tmpvar_22 * normal_18.x);
  ndotl_20 = (ndotl_20 + (tmpvar_23 * normal_18.y));
  ndotl_20 = (ndotl_20 + (tmpvar_24 * normal_18.z));
  highp vec4 tmpvar_26;
  tmpvar_26 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_20 * inversesqrt(tmpvar_25)));
  ndotl_20 = tmpvar_26;
  highp vec4 tmpvar_27;
  tmpvar_27 = (tmpvar_26 * (1.0/((1.0 + 
    (tmpvar_25 * lightAttenSq_17)
  ))));
  col_19 = (lightColor0_13 * tmpvar_27.x);
  col_19 = (col_19 + (lightColor1_14 * tmpvar_27.y));
  col_19 = (col_19 + (lightColor2_15 * tmpvar_27.z));
  col_19 = (col_19 + (lightColor3_16 * tmpvar_27.w));
  tmpvar_3 = col_19;
  gl_Position = (glstate_matrix_mvp * tmpvar_9);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_8;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
varying highp vec4 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  mediump vec4 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD1;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD3);
  c_1.xyz = (c_1 + vec4(1.0, 1.0, 1.0, 0.0)).xyz;
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 unity_AmbientEquator;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _ShadowColor;
uniform lowp float _Alpha;
highp vec4 xlat_mutable_ShadowColor;
varying mediump vec3 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying mediump float xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  xlat_mutable_ShadowColor.xyz = _ShadowColor.xyz;
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_4.xyz = _glesColor.xyz;
  mediump float tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_5 = (unity_FogParams.x * tmpvar_6.z);
  mediump float tmpvar_7;
  tmpvar_7 = exp2((-(tmpvar_5) * tmpvar_5));
  tmpvar_5 = tmpvar_7;
  tmpvar_4.w = (_glesColor.w * _Alpha);
  xlat_mutable_ShadowColor.w = (_ShadowColor.w * (tmpvar_4.w * tmpvar_7));
  highp vec4 tmpvar_8;
  tmpvar_8.xyz = (((_ShadowColor.xyz * unity_AmbientEquator.xyz) * xlat_mutable_ShadowColor.w) + (1.0 - xlat_mutable_ShadowColor.w));
  tmpvar_8.w = tmpvar_4.w;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_10;
  tmpvar_10 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_11;
  tmpvar_11[0] = unity_WorldToObject[0].xyz;
  tmpvar_11[1] = unity_WorldToObject[1].xyz;
  tmpvar_11[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_glesNormal * tmpvar_11));
  worldNormal_1 = tmpvar_12;
  tmpvar_2 = worldNormal_1;
  highp vec3 lightColor0_13;
  lightColor0_13 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_14;
  lightColor1_14 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_15;
  lightColor2_15 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_16;
  lightColor3_16 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_17;
  lightAttenSq_17 = unity_4LightAtten0;
  highp vec3 normal_18;
  normal_18 = worldNormal_1;
  highp vec3 col_19;
  highp vec4 ndotl_20;
  highp vec4 lengthSq_21;
  highp vec4 tmpvar_22;
  tmpvar_22 = (unity_4LightPosX0 - tmpvar_10.x);
  highp vec4 tmpvar_23;
  tmpvar_23 = (unity_4LightPosY0 - tmpvar_10.y);
  highp vec4 tmpvar_24;
  tmpvar_24 = (unity_4LightPosZ0 - tmpvar_10.z);
  lengthSq_21 = (tmpvar_22 * tmpvar_22);
  lengthSq_21 = (lengthSq_21 + (tmpvar_23 * tmpvar_23));
  lengthSq_21 = (lengthSq_21 + (tmpvar_24 * tmpvar_24));
  highp vec4 tmpvar_25;
  tmpvar_25 = max (lengthSq_21, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_21 = tmpvar_25;
  ndotl_20 = (tmpvar_22 * normal_18.x);
  ndotl_20 = (ndotl_20 + (tmpvar_23 * normal_18.y));
  ndotl_20 = (ndotl_20 + (tmpvar_24 * normal_18.z));
  highp vec4 tmpvar_26;
  tmpvar_26 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_20 * inversesqrt(tmpvar_25)));
  ndotl_20 = tmpvar_26;
  highp vec4 tmpvar_27;
  tmpvar_27 = (tmpvar_26 * (1.0/((1.0 + 
    (tmpvar_25 * lightAttenSq_17)
  ))));
  col_19 = (lightColor0_13 * tmpvar_27.x);
  col_19 = (col_19 + (lightColor1_14 * tmpvar_27.y));
  col_19 = (col_19 + (lightColor2_15 * tmpvar_27.z));
  col_19 = (col_19 + (lightColor3_16 * tmpvar_27.w));
  tmpvar_3 = col_19;
  gl_Position = (glstate_matrix_mvp * tmpvar_9);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_8;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = (unity_WorldToShadow[0] * tmpvar_10);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  mediump vec4 tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_2 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD1.w;
  lowp float tmpvar_4;
  highp float lightShadowDataX_5;
  mediump float tmpvar_6;
  tmpvar_6 = _LightShadowData.x;
  lightShadowDataX_5 = tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD4.xy).x > xlv_TEXCOORD4.z)), lightShadowDataX_5);
  tmpvar_4 = tmpvar_7;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD3);
  mediump vec4 tmpvar_8;
  mediump float atten_9;
  atten_9 = tmpvar_4;
  lowp vec4 col_10;
  lowp float mask_11;
  mediump float tmpvar_12;
  tmpvar_12 = (1.0 - atten_9);
  mask_11 = tmpvar_12;
  mediump vec4 tmpvar_13;
  tmpvar_13.xyz = tmpvar_2.xyz;
  tmpvar_13.w = tmpvar_3;
  col_10 = tmpvar_13;
  mediump vec4 tmpvar_14;
  tmpvar_14.w = 0.0;
  tmpvar_14.xyz = vec3(atten_9);
  tmpvar_8 = ((col_10 * mask_11) + tmpvar_14);
  c_1.xyz = (c_1 + tmpvar_8).xyz;
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 unity_AmbientEquator;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _ShadowColor;
uniform lowp float _Alpha;
highp vec4 xlat_mutable_ShadowColor;
varying mediump vec3 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying mediump float xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  xlat_mutable_ShadowColor.xyz = _ShadowColor.xyz;
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_4.xyz = _glesColor.xyz;
  mediump float tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_5 = (unity_FogParams.x * tmpvar_6.z);
  mediump float tmpvar_7;
  tmpvar_7 = exp2((-(tmpvar_5) * tmpvar_5));
  tmpvar_5 = tmpvar_7;
  tmpvar_4.w = (_glesColor.w * _Alpha);
  xlat_mutable_ShadowColor.w = (_ShadowColor.w * (tmpvar_4.w * tmpvar_7));
  highp vec4 tmpvar_8;
  tmpvar_8.xyz = (((_ShadowColor.xyz * unity_AmbientEquator.xyz) * xlat_mutable_ShadowColor.w) + (1.0 - xlat_mutable_ShadowColor.w));
  tmpvar_8.w = tmpvar_4.w;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_10;
  tmpvar_10 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_11;
  tmpvar_11[0] = unity_WorldToObject[0].xyz;
  tmpvar_11[1] = unity_WorldToObject[1].xyz;
  tmpvar_11[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_glesNormal * tmpvar_11));
  worldNormal_1 = tmpvar_12;
  tmpvar_2 = worldNormal_1;
  highp vec3 lightColor0_13;
  lightColor0_13 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_14;
  lightColor1_14 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_15;
  lightColor2_15 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_16;
  lightColor3_16 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_17;
  lightAttenSq_17 = unity_4LightAtten0;
  highp vec3 normal_18;
  normal_18 = worldNormal_1;
  highp vec3 col_19;
  highp vec4 ndotl_20;
  highp vec4 lengthSq_21;
  highp vec4 tmpvar_22;
  tmpvar_22 = (unity_4LightPosX0 - tmpvar_10.x);
  highp vec4 tmpvar_23;
  tmpvar_23 = (unity_4LightPosY0 - tmpvar_10.y);
  highp vec4 tmpvar_24;
  tmpvar_24 = (unity_4LightPosZ0 - tmpvar_10.z);
  lengthSq_21 = (tmpvar_22 * tmpvar_22);
  lengthSq_21 = (lengthSq_21 + (tmpvar_23 * tmpvar_23));
  lengthSq_21 = (lengthSq_21 + (tmpvar_24 * tmpvar_24));
  highp vec4 tmpvar_25;
  tmpvar_25 = max (lengthSq_21, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_21 = tmpvar_25;
  ndotl_20 = (tmpvar_22 * normal_18.x);
  ndotl_20 = (ndotl_20 + (tmpvar_23 * normal_18.y));
  ndotl_20 = (ndotl_20 + (tmpvar_24 * normal_18.z));
  highp vec4 tmpvar_26;
  tmpvar_26 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_20 * inversesqrt(tmpvar_25)));
  ndotl_20 = tmpvar_26;
  highp vec4 tmpvar_27;
  tmpvar_27 = (tmpvar_26 * (1.0/((1.0 + 
    (tmpvar_25 * lightAttenSq_17)
  ))));
  col_19 = (lightColor0_13 * tmpvar_27.x);
  col_19 = (col_19 + (lightColor1_14 * tmpvar_27.y));
  col_19 = (col_19 + (lightColor2_15 * tmpvar_27.z));
  col_19 = (col_19 + (lightColor3_16 * tmpvar_27.w));
  tmpvar_3 = col_19;
  gl_Position = (glstate_matrix_mvp * tmpvar_9);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_8;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = (unity_WorldToShadow[0] * tmpvar_10);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  mediump vec4 tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_2 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD1.w;
  lowp float tmpvar_4;
  highp float lightShadowDataX_5;
  mediump float tmpvar_6;
  tmpvar_6 = _LightShadowData.x;
  lightShadowDataX_5 = tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD4.xy).x > xlv_TEXCOORD4.z)), lightShadowDataX_5);
  tmpvar_4 = tmpvar_7;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD3);
  mediump vec4 tmpvar_8;
  mediump float atten_9;
  atten_9 = tmpvar_4;
  lowp vec4 col_10;
  lowp float mask_11;
  mediump float tmpvar_12;
  tmpvar_12 = (1.0 - atten_9);
  mask_11 = tmpvar_12;
  mediump vec4 tmpvar_13;
  tmpvar_13.xyz = tmpvar_2.xyz;
  tmpvar_13.w = tmpvar_3;
  col_10 = tmpvar_13;
  mediump vec4 tmpvar_14;
  tmpvar_14.w = 0.0;
  tmpvar_14.xyz = vec3(atten_9);
  tmpvar_8 = ((col_10 * mask_11) + tmpvar_14);
  c_1.xyz = (c_1 + tmpvar_8).xyz;
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 unity_AmbientEquator;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _ShadowColor;
uniform lowp float _Alpha;
highp vec4 xlat_mutable_ShadowColor;
varying mediump vec3 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying mediump float xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  xlat_mutable_ShadowColor.xyz = _ShadowColor.xyz;
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_4.xyz = _glesColor.xyz;
  mediump float tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_5 = (unity_FogParams.x * tmpvar_6.z);
  mediump float tmpvar_7;
  tmpvar_7 = exp2((-(tmpvar_5) * tmpvar_5));
  tmpvar_5 = tmpvar_7;
  tmpvar_4.w = (_glesColor.w * _Alpha);
  xlat_mutable_ShadowColor.w = (_ShadowColor.w * (tmpvar_4.w * tmpvar_7));
  highp vec4 tmpvar_8;
  tmpvar_8.xyz = (((_ShadowColor.xyz * unity_AmbientEquator.xyz) * xlat_mutable_ShadowColor.w) + (1.0 - xlat_mutable_ShadowColor.w));
  tmpvar_8.w = tmpvar_4.w;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_10;
  tmpvar_10 = (unity_ObjectToWorld * _glesVertex);
  highp mat3 tmpvar_11;
  tmpvar_11[0] = unity_WorldToObject[0].xyz;
  tmpvar_11[1] = unity_WorldToObject[1].xyz;
  tmpvar_11[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_glesNormal * tmpvar_11));
  worldNormal_1 = tmpvar_12;
  tmpvar_2 = worldNormal_1;
  highp vec3 lightColor0_13;
  lightColor0_13 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_14;
  lightColor1_14 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_15;
  lightColor2_15 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_16;
  lightColor3_16 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_17;
  lightAttenSq_17 = unity_4LightAtten0;
  highp vec3 normal_18;
  normal_18 = worldNormal_1;
  highp vec3 col_19;
  highp vec4 ndotl_20;
  highp vec4 lengthSq_21;
  highp vec4 tmpvar_22;
  tmpvar_22 = (unity_4LightPosX0 - tmpvar_10.x);
  highp vec4 tmpvar_23;
  tmpvar_23 = (unity_4LightPosY0 - tmpvar_10.y);
  highp vec4 tmpvar_24;
  tmpvar_24 = (unity_4LightPosZ0 - tmpvar_10.z);
  lengthSq_21 = (tmpvar_22 * tmpvar_22);
  lengthSq_21 = (lengthSq_21 + (tmpvar_23 * tmpvar_23));
  lengthSq_21 = (lengthSq_21 + (tmpvar_24 * tmpvar_24));
  highp vec4 tmpvar_25;
  tmpvar_25 = max (lengthSq_21, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_21 = tmpvar_25;
  ndotl_20 = (tmpvar_22 * normal_18.x);
  ndotl_20 = (ndotl_20 + (tmpvar_23 * normal_18.y));
  ndotl_20 = (ndotl_20 + (tmpvar_24 * normal_18.z));
  highp vec4 tmpvar_26;
  tmpvar_26 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_20 * inversesqrt(tmpvar_25)));
  ndotl_20 = tmpvar_26;
  highp vec4 tmpvar_27;
  tmpvar_27 = (tmpvar_26 * (1.0/((1.0 + 
    (tmpvar_25 * lightAttenSq_17)
  ))));
  col_19 = (lightColor0_13 * tmpvar_27.x);
  col_19 = (col_19 + (lightColor1_14 * tmpvar_27.y));
  col_19 = (col_19 + (lightColor2_15 * tmpvar_27.z));
  col_19 = (col_19 + (lightColor3_16 * tmpvar_27.w));
  tmpvar_3 = col_19;
  gl_Position = (glstate_matrix_mvp * tmpvar_9);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_8;
  xlv_TEXCOORD2 = tmpvar_7;
  xlv_TEXCOORD3 = tmpvar_3;
  xlv_TEXCOORD4 = (unity_WorldToShadow[0] * tmpvar_10);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  mediump vec4 tmpvar_2;
  lowp float tmpvar_3;
  tmpvar_2 = xlv_TEXCOORD1;
  tmpvar_3 = xlv_TEXCOORD1.w;
  lowp float tmpvar_4;
  highp float lightShadowDataX_5;
  mediump float tmpvar_6;
  tmpvar_6 = _LightShadowData.x;
  lightShadowDataX_5 = tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD4.xy).x > xlv_TEXCOORD4.z)), lightShadowDataX_5);
  tmpvar_4 = tmpvar_7;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD3);
  mediump vec4 tmpvar_8;
  mediump float atten_9;
  atten_9 = tmpvar_4;
  lowp vec4 col_10;
  lowp float mask_11;
  mediump float tmpvar_12;
  tmpvar_12 = (1.0 - atten_9);
  mask_11 = tmpvar_12;
  mediump vec4 tmpvar_13;
  tmpvar_13.xyz = tmpvar_2.xyz;
  tmpvar_13.w = tmpvar_3;
  col_10 = tmpvar_13;
  mediump vec4 tmpvar_14;
  tmpvar_14.w = 0.0;
  tmpvar_14.xyz = vec3(atten_9);
  tmpvar_8 = ((col_10 * mask_11) + tmpvar_14);
  c_1.xyz = (c_1 + tmpvar_8).xyz;
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
}
}
 Pass {
  Name "SHADOWCASTER"
  LOD 100
  Tags { "LIGHTMODE" = "SHADOWCASTER" "QUEUE" = "Background" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  Blend DstColor Zero, SrcAlpha One
  ZClip Off
  GpuProgramID 113029
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_DEPTH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 unity_LightShadowBias;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 unity_AmbientEquator;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _ShadowColor;
uniform lowp float _Alpha;
highp vec4 xlat_mutable_ShadowColor;
varying highp vec4 xlv_TEXCOORD1;
varying mediump float xlv_TEXCOORD2;
void main ()
{
  xlat_mutable_ShadowColor.xyz = _ShadowColor.xyz;
  lowp vec4 tmpvar_1;
  tmpvar_1.xyz = _glesColor.xyz;
  mediump float tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_2 = (unity_FogParams.x * tmpvar_3.z);
  mediump float tmpvar_4;
  tmpvar_4 = exp2((-(tmpvar_2) * tmpvar_2));
  tmpvar_2 = tmpvar_4;
  tmpvar_1.w = (_glesColor.w * _Alpha);
  xlat_mutable_ShadowColor.w = (_ShadowColor.w * (tmpvar_1.w * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = (((_ShadowColor.xyz * unity_AmbientEquator.xyz) * xlat_mutable_ShadowColor.w) + (1.0 - xlat_mutable_ShadowColor.w));
  tmpvar_5.w = tmpvar_1.w;
  highp vec3 vertex_6;
  vertex_6 = _glesVertex.xyz;
  highp vec4 clipPos_7;
  if ((unity_LightShadowBias.z != 0.0)) {
    highp vec4 tmpvar_8;
    tmpvar_8.w = 1.0;
    tmpvar_8.xyz = vertex_6;
    highp vec3 tmpvar_9;
    tmpvar_9 = (unity_ObjectToWorld * tmpvar_8).xyz;
    highp mat3 tmpvar_10;
    tmpvar_10[0] = unity_WorldToObject[0].xyz;
    tmpvar_10[1] = unity_WorldToObject[1].xyz;
    tmpvar_10[2] = unity_WorldToObject[2].xyz;
    highp vec3 tmpvar_11;
    tmpvar_11 = normalize((_glesNormal * tmpvar_10));
    highp float tmpvar_12;
    tmpvar_12 = dot (tmpvar_11, normalize((_WorldSpaceLightPos0.xyz - 
      (tmpvar_9 * _WorldSpaceLightPos0.w)
    )));
    highp vec4 tmpvar_13;
    tmpvar_13.w = 1.0;
    tmpvar_13.xyz = (tmpvar_9 - (tmpvar_11 * (unity_LightShadowBias.z * 
      sqrt((1.0 - (tmpvar_12 * tmpvar_12)))
    )));
    clipPos_7 = (unity_MatrixVP * tmpvar_13);
  } else {
    highp vec4 tmpvar_14;
    tmpvar_14.w = 1.0;
    tmpvar_14.xyz = vertex_6;
    clipPos_7 = (glstate_matrix_mvp * tmpvar_14);
  };
  highp vec4 clipPos_15;
  clipPos_15.xyw = clipPos_7.xyw;
  clipPos_15.z = (clipPos_7.z + clamp ((unity_LightShadowBias.x / clipPos_7.w), 0.0, 1.0));
  clipPos_15.z = mix (clipPos_15.z, max (clipPos_15.z, -(clipPos_7.w)), unity_LightShadowBias.y);
  gl_Position = clipPos_15;
  xlv_TEXCOORD1 = tmpvar_5;
  xlv_TEXCOORD2 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 unity_LightShadowBias;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 unity_AmbientEquator;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _ShadowColor;
uniform lowp float _Alpha;
highp vec4 xlat_mutable_ShadowColor;
varying highp vec4 xlv_TEXCOORD1;
varying mediump float xlv_TEXCOORD2;
void main ()
{
  xlat_mutable_ShadowColor.xyz = _ShadowColor.xyz;
  lowp vec4 tmpvar_1;
  tmpvar_1.xyz = _glesColor.xyz;
  mediump float tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_2 = (unity_FogParams.x * tmpvar_3.z);
  mediump float tmpvar_4;
  tmpvar_4 = exp2((-(tmpvar_2) * tmpvar_2));
  tmpvar_2 = tmpvar_4;
  tmpvar_1.w = (_glesColor.w * _Alpha);
  xlat_mutable_ShadowColor.w = (_ShadowColor.w * (tmpvar_1.w * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = (((_ShadowColor.xyz * unity_AmbientEquator.xyz) * xlat_mutable_ShadowColor.w) + (1.0 - xlat_mutable_ShadowColor.w));
  tmpvar_5.w = tmpvar_1.w;
  highp vec3 vertex_6;
  vertex_6 = _glesVertex.xyz;
  highp vec4 clipPos_7;
  if ((unity_LightShadowBias.z != 0.0)) {
    highp vec4 tmpvar_8;
    tmpvar_8.w = 1.0;
    tmpvar_8.xyz = vertex_6;
    highp vec3 tmpvar_9;
    tmpvar_9 = (unity_ObjectToWorld * tmpvar_8).xyz;
    highp mat3 tmpvar_10;
    tmpvar_10[0] = unity_WorldToObject[0].xyz;
    tmpvar_10[1] = unity_WorldToObject[1].xyz;
    tmpvar_10[2] = unity_WorldToObject[2].xyz;
    highp vec3 tmpvar_11;
    tmpvar_11 = normalize((_glesNormal * tmpvar_10));
    highp float tmpvar_12;
    tmpvar_12 = dot (tmpvar_11, normalize((_WorldSpaceLightPos0.xyz - 
      (tmpvar_9 * _WorldSpaceLightPos0.w)
    )));
    highp vec4 tmpvar_13;
    tmpvar_13.w = 1.0;
    tmpvar_13.xyz = (tmpvar_9 - (tmpvar_11 * (unity_LightShadowBias.z * 
      sqrt((1.0 - (tmpvar_12 * tmpvar_12)))
    )));
    clipPos_7 = (unity_MatrixVP * tmpvar_13);
  } else {
    highp vec4 tmpvar_14;
    tmpvar_14.w = 1.0;
    tmpvar_14.xyz = vertex_6;
    clipPos_7 = (glstate_matrix_mvp * tmpvar_14);
  };
  highp vec4 clipPos_15;
  clipPos_15.xyw = clipPos_7.xyw;
  clipPos_15.z = (clipPos_7.z + clamp ((unity_LightShadowBias.x / clipPos_7.w), 0.0, 1.0));
  clipPos_15.z = mix (clipPos_15.z, max (clipPos_15.z, -(clipPos_7.w)), unity_LightShadowBias.y);
  gl_Position = clipPos_15;
  xlv_TEXCOORD1 = tmpvar_5;
  xlv_TEXCOORD2 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_DEPTH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 unity_LightShadowBias;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 unity_AmbientEquator;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _ShadowColor;
uniform lowp float _Alpha;
highp vec4 xlat_mutable_ShadowColor;
varying highp vec4 xlv_TEXCOORD1;
varying mediump float xlv_TEXCOORD2;
void main ()
{
  xlat_mutable_ShadowColor.xyz = _ShadowColor.xyz;
  lowp vec4 tmpvar_1;
  tmpvar_1.xyz = _glesColor.xyz;
  mediump float tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_2 = (unity_FogParams.x * tmpvar_3.z);
  mediump float tmpvar_4;
  tmpvar_4 = exp2((-(tmpvar_2) * tmpvar_2));
  tmpvar_2 = tmpvar_4;
  tmpvar_1.w = (_glesColor.w * _Alpha);
  xlat_mutable_ShadowColor.w = (_ShadowColor.w * (tmpvar_1.w * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = (((_ShadowColor.xyz * unity_AmbientEquator.xyz) * xlat_mutable_ShadowColor.w) + (1.0 - xlat_mutable_ShadowColor.w));
  tmpvar_5.w = tmpvar_1.w;
  highp vec3 vertex_6;
  vertex_6 = _glesVertex.xyz;
  highp vec4 clipPos_7;
  if ((unity_LightShadowBias.z != 0.0)) {
    highp vec4 tmpvar_8;
    tmpvar_8.w = 1.0;
    tmpvar_8.xyz = vertex_6;
    highp vec3 tmpvar_9;
    tmpvar_9 = (unity_ObjectToWorld * tmpvar_8).xyz;
    highp mat3 tmpvar_10;
    tmpvar_10[0] = unity_WorldToObject[0].xyz;
    tmpvar_10[1] = unity_WorldToObject[1].xyz;
    tmpvar_10[2] = unity_WorldToObject[2].xyz;
    highp vec3 tmpvar_11;
    tmpvar_11 = normalize((_glesNormal * tmpvar_10));
    highp float tmpvar_12;
    tmpvar_12 = dot (tmpvar_11, normalize((_WorldSpaceLightPos0.xyz - 
      (tmpvar_9 * _WorldSpaceLightPos0.w)
    )));
    highp vec4 tmpvar_13;
    tmpvar_13.w = 1.0;
    tmpvar_13.xyz = (tmpvar_9 - (tmpvar_11 * (unity_LightShadowBias.z * 
      sqrt((1.0 - (tmpvar_12 * tmpvar_12)))
    )));
    clipPos_7 = (unity_MatrixVP * tmpvar_13);
  } else {
    highp vec4 tmpvar_14;
    tmpvar_14.w = 1.0;
    tmpvar_14.xyz = vertex_6;
    clipPos_7 = (glstate_matrix_mvp * tmpvar_14);
  };
  highp vec4 clipPos_15;
  clipPos_15.xyw = clipPos_7.xyw;
  clipPos_15.z = (clipPos_7.z + clamp ((unity_LightShadowBias.x / clipPos_7.w), 0.0, 1.0));
  clipPos_15.z = mix (clipPos_15.z, max (clipPos_15.z, -(clipPos_7.w)), unity_LightShadowBias.y);
  gl_Position = clipPos_15;
  xlv_TEXCOORD1 = tmpvar_5;
  xlv_TEXCOORD2 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_CUBE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 unity_AmbientEquator;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _ShadowColor;
uniform lowp float _Alpha;
highp vec4 xlat_mutable_ShadowColor;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying mediump float xlv_TEXCOORD2;
void main ()
{
  xlat_mutable_ShadowColor.xyz = _ShadowColor.xyz;
  lowp vec4 tmpvar_1;
  tmpvar_1.xyz = _glesColor.xyz;
  mediump float tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_2 = (unity_FogParams.x * tmpvar_3.z);
  mediump float tmpvar_4;
  tmpvar_4 = exp2((-(tmpvar_2) * tmpvar_2));
  tmpvar_2 = tmpvar_4;
  tmpvar_1.w = (_glesColor.w * _Alpha);
  xlat_mutable_ShadowColor.w = (_ShadowColor.w * (tmpvar_1.w * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = (((_ShadowColor.xyz * unity_AmbientEquator.xyz) * xlat_mutable_ShadowColor.w) + (1.0 - xlat_mutable_ShadowColor.w));
  tmpvar_5.w = tmpvar_1.w;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = ((unity_ObjectToWorld * _glesVertex).xyz - _LightPositionRange.xyz);
  gl_Position = (glstate_matrix_mvp * tmpvar_6);
  xlv_TEXCOORD1 = tmpvar_5;
  xlv_TEXCOORD2 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform highp vec4 unity_LightShadowBias;
varying highp vec3 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 enc_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = fract((vec4(1.0, 255.0, 65025.0, 1.658138e+07) * min (
    ((sqrt(dot (xlv_TEXCOORD0, xlv_TEXCOORD0)) + unity_LightShadowBias.x) * _LightPositionRange.w)
  , 0.999)));
  enc_2 = (tmpvar_3 - (tmpvar_3.yzww * 0.003921569));
  tmpvar_1 = enc_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 unity_AmbientEquator;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _ShadowColor;
uniform lowp float _Alpha;
highp vec4 xlat_mutable_ShadowColor;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying mediump float xlv_TEXCOORD2;
void main ()
{
  xlat_mutable_ShadowColor.xyz = _ShadowColor.xyz;
  lowp vec4 tmpvar_1;
  tmpvar_1.xyz = _glesColor.xyz;
  mediump float tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_2 = (unity_FogParams.x * tmpvar_3.z);
  mediump float tmpvar_4;
  tmpvar_4 = exp2((-(tmpvar_2) * tmpvar_2));
  tmpvar_2 = tmpvar_4;
  tmpvar_1.w = (_glesColor.w * _Alpha);
  xlat_mutable_ShadowColor.w = (_ShadowColor.w * (tmpvar_1.w * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = (((_ShadowColor.xyz * unity_AmbientEquator.xyz) * xlat_mutable_ShadowColor.w) + (1.0 - xlat_mutable_ShadowColor.w));
  tmpvar_5.w = tmpvar_1.w;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = ((unity_ObjectToWorld * _glesVertex).xyz - _LightPositionRange.xyz);
  gl_Position = (glstate_matrix_mvp * tmpvar_6);
  xlv_TEXCOORD1 = tmpvar_5;
  xlv_TEXCOORD2 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform highp vec4 unity_LightShadowBias;
varying highp vec3 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 enc_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = fract((vec4(1.0, 255.0, 65025.0, 1.658138e+07) * min (
    ((sqrt(dot (xlv_TEXCOORD0, xlv_TEXCOORD0)) + unity_LightShadowBias.x) * _LightPositionRange.w)
  , 0.999)));
  enc_2 = (tmpvar_3 - (tmpvar_3.yzww * 0.003921569));
  tmpvar_1 = enc_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_CUBE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 unity_AmbientEquator;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _ShadowColor;
uniform lowp float _Alpha;
highp vec4 xlat_mutable_ShadowColor;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying mediump float xlv_TEXCOORD2;
void main ()
{
  xlat_mutable_ShadowColor.xyz = _ShadowColor.xyz;
  lowp vec4 tmpvar_1;
  tmpvar_1.xyz = _glesColor.xyz;
  mediump float tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_2 = (unity_FogParams.x * tmpvar_3.z);
  mediump float tmpvar_4;
  tmpvar_4 = exp2((-(tmpvar_2) * tmpvar_2));
  tmpvar_2 = tmpvar_4;
  tmpvar_1.w = (_glesColor.w * _Alpha);
  xlat_mutable_ShadowColor.w = (_ShadowColor.w * (tmpvar_1.w * tmpvar_4));
  highp vec4 tmpvar_5;
  tmpvar_5.xyz = (((_ShadowColor.xyz * unity_AmbientEquator.xyz) * xlat_mutable_ShadowColor.w) + (1.0 - xlat_mutable_ShadowColor.w));
  tmpvar_5.w = tmpvar_1.w;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = ((unity_ObjectToWorld * _glesVertex).xyz - _LightPositionRange.xyz);
  gl_Position = (glstate_matrix_mvp * tmpvar_6);
  xlv_TEXCOORD1 = tmpvar_5;
  xlv_TEXCOORD2 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform highp vec4 unity_LightShadowBias;
varying highp vec3 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 enc_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = fract((vec4(1.0, 255.0, 65025.0, 1.658138e+07) * min (
    ((sqrt(dot (xlv_TEXCOORD0, xlv_TEXCOORD0)) + unity_LightShadowBias.x) * _LightPositionRange.w)
  , 0.999)));
  enc_2 = (tmpvar_3 - (tmpvar_3.yzww * 0.003921569));
  tmpvar_1 = enc_2;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_CUBE" }
""
}
}
}
}
CustomEditor "CustomMaterialInspector"
}