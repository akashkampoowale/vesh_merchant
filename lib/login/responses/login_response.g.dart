// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      uProfilePic: json['uProfilePic'] as String,
      uVerification: json['uVerification'] as String,
      uToken: json['uToken'] as String,
      uid: json['uid'] as String,
      comment: json['comment'] as String,
      uMobile: json['uMobile'] as String,
      uEmail: json['uEmail'] as String,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'uToken': instance.uToken,
      'uid': instance.uid,
      'comment': instance.comment,
      'uMobile': instance.uMobile,
      'uEmail': instance.uEmail,
      'uVerification': instance.uVerification,
      'uProfilePic': instance.uProfilePic,
    };
