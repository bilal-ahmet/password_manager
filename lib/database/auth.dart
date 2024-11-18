import 'package:firebase_auth/firebase_auth.dart';

Future<void> signInUser(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
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

Future<void> signOutUser() async{
  FirebaseAuth.instance.signOut();
}
