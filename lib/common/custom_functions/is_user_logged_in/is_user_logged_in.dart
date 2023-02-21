
import 'package:shared_preferences/shared_preferences.dart';

Future isUserLoggedIn() async{

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  if(prefs.getInt('loggedIn') == 1){
    return true;
  }else{
    return false;
  }

}