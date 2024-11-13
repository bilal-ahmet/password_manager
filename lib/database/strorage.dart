
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> saveInformation(String mail, String password, String appName) async{
  try{
    await FirebaseFirestore.instance.collection("appInformation").add({
      "appName" : appName,
      "mail" : mail,
      "password" : password,
    });
  }
  catch(e){
    print(e);
  }
}

/* Future<List<Map<String, dynamic>>> getInfotmation() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('appInformation').get();
      return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      print(e);
      return [];
    }} */