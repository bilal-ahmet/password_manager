import 'package:firebase_auth/firebase_auth.dart';

Future<void> signInUser(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    /* if (e.code == "user-not-found") {
      print("Kullanıcı Bulunamadı");
    } else if (e.code == "wrong-password") {
      print("Hatalı Şifre");
    } */

   print(e);
  }
}

Future<void> signUpUser(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    print(e);
  }
}
