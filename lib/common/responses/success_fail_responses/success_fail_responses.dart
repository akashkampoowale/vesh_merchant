import 'package:json_annotation/json_annotation.dart';
import 'package:vesh_merchant/common/state_events/ui_state.dart';
part 'success_fail_responses.g.dart';

@JsonSerializable()

class SuccessFailResponse{
  @JsonKey(name: 'status')
  final String status;
  @JsonKey(name: 'comment')
  final String comment;
  @JsonKey(name: 'error_code')
  final String errorCode;

  SuccessFailResponse({required this.status, required this.comment,required this.errorCode});

  factory SuccessFailResponse.fromJson(Map<String, dynamic> json) => _$SuccessFailResponseFromJson(json);

  Map<String, dynamic>toJson() => _$SuccessFailResponseToJson(this);





}








