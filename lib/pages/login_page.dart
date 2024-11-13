import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:password_manager/database/auth.dart';
import 'package:password_manager/router/page_router.dart';

class LoginPage extends StatelessWidget {
 LoginPage({super.key});

 TextEditingController mailController = TextEditingController();
 TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration:
              BoxDecoration(color: Theme.of(context).colorScheme.surface),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width / 3,
                ),
                Image.asset(
                  "assets/logo.png",
                  height: MediaQuery.of(context).size.width / 3,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 2.5,
                        color: Theme.of(context).colorScheme.primary),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextFormField(
                      controller: mailController,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "E-mail", hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 9,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 2.5,
                        color: Theme.of(context).colorScheme.primary),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Password", hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary),
                        onPressed: () async{
                          await signInUser(mailController.text, passwordController.text);
                          if(FirebaseAuth.instance.currentUser == null){
                            router.push("/registerPage");
                          }
                          else{
                            router.push("/homePage");
                          }
                        },
                        child: const Text("Sign in")),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 15,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary),
                        onPressed: () {
                          router.push("/registerPage");
                        },
                        child: const Text("Sign up")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
