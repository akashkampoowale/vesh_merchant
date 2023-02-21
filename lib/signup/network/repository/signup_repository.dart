
import 'package:vesh_merchant/signup/network/api_service/signup_api_service.dart';

class SignupRepository{
  var signupApiService = SignupApiService();

  signup({email,mobile,password,filepath,display_name}) async{

    return signupApiService.signup(email: email,password: password,mobile: mobile,filepath: filepath,display_name: display_name);

  }

}