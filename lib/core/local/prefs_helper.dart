import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper{
   static late SharedPreferences sharedPreferences;

    //3shan ml2esh al sharedPreferences b null
    static Future<void>init()async{
      sharedPreferences=await SharedPreferences.getInstance();
    }

    //func btdef al token
    static setToken(String token){
      sharedPreferences.setString("token", token);
    }

    // w func btrg3 al token
    static String getToken(){
     return sharedPreferences.getString("token")??"";
    }

    static clearToken(){
      sharedPreferences.remove("token");
    }
}