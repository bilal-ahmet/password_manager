import 'package:hive/hive.dart';
import 'package:password_manager/model/user_model.dart';

class Service {
  
  final String boxName = "UserBox";

  Future<Box<UserModel>> get generalBox async => await Hive.openBox<UserModel>("UserBox");

  /////     CRUD operations     /////
  // create
  Future<void> addUser(UserModel user) async{
    var box = await generalBox;
    await box.add(user);
  }

  // read
  Future<List<UserModel>> getAllUser() async{
    var box = await generalBox;
    return box.values.toList();
  }

  // update
  Future<void> updateDeck(int index, UserModel user) async{
    var box = await generalBox;
    await box.putAt(index, user);
  }

  // delete
  Future<void> deleteUser(int index) async{
    var box = await generalBox;
    await box.deleteAt(index);
  }

}