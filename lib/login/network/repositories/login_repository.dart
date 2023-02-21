

import 'package:vesh_merchant/login/network/api_services/login_api_service.dart';

class LoginRepository{
var loginApiService = LoginApiService();

login({username,password}){
return loginApiService.login(username, password);
}

}