
import 'package:hive/hive.dart';
import 'package:hive_task2/model/user_model.dart';

class HiveDB{

  // Database ga ma`lumotlarni saqlash
  var box = Hive.box("pdp_online");
  void storeUser(User user) async{
    box.put("user", user.toJson());
  }

  //Database dan ma`lumotlarni o`qib olish
  User loadUser(){
    var user = new User.fromJson(box.get("user"));
    return user;
  }

  // Database dan ma`lumotni o`chirib tashlah
  void removeUser(){
    box.delete("user");
  }
}