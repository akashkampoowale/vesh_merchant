// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success_fail_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessFailResponse _$SuccessFailResponseFromJson(Map<String, dynamic> json) =>
    SuccessFailResponse(
      status: json['status'] as String,
      comment: json['comment'] as String,
      errorCode: json['error_code'] as String,
    );

Map<String, dynamic> _$SuccessFailResponseToJson(
        SuccessFailResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'comment': instance.comment,
      'error_code': instance.errorCode,
    };
