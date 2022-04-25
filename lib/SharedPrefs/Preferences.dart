
import 'package:shared_preferences/shared_preferences.dart';

 class Preferences
{
  static Future<void> setUser(String val)async
  {
    final pref=await SharedPreferences.getInstance();
    pref.setString("user", val);
  }

  static Future<String> getUser()async
  {
    final pref=await SharedPreferences.getInstance();
    return pref.getString("user") ?? '';
  }
}