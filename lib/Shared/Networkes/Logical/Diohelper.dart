
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/usermodel.dart';

class Diohelper{

  static SharedPreferences? Preerences ;

 static  init() async {
    Preerences= await SharedPreferences.getInstance();

  }

 static Future<bool>SaveData({
  required String key,
  required dynamic value,
})async{
    if(value is String) return await Preerences!.setString(key, value);
     else if(value is bool) return await Preerences!.setBool(key, value);
     else  if(value is int) return await Preerences!.setInt(key, value);
     else  return await Preerences!.setDouble(key, value);


  }

 static dynamic GetData({
  required String key,
}){
    return  Preerences!.get(key);
  }

  static Future<bool> RemoveData({
  required String key,
}){
   return Preerences!.remove(key);
  }

}