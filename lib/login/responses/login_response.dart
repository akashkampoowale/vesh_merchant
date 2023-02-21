import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()

class LoginResponse{
  @JsonKey(name:'uToken')
  final String uToken;
  @JsonKey(name: 'uid')
  final String uid;
  @JsonKey(name: 'comment')
  final String comment;
  @JsonKey(name: 'uMobile')
  final String uMobile;
  @JsonKey(name: 'uEmail')
  final String uEmail;
  @JsonKey(name: 'uVerification')
  final String uVerification;
  @JsonKey(name: 'uProfilePic')
  final String uProfilePic;

  LoginResponse({required this.uProfilePic, required this.uVerification, required this.uToken,required this.uid,required this.comment,required this.uMobile, required this.uEmail});

  factory LoginResponse.fromJson(Map<String,dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic>toJson() => _$LoginResponseToJson(this);



}