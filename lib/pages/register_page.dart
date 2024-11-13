import 'package:flutter/material.dart';
import 'package:password_manager/database/auth.dart';
import 'package:password_manager/router/page_router.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
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
                        width: 3, color: Theme.of(context).colorScheme.primary),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: "Name"),
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
                        width: 3, color: Theme.of(context).colorScheme.primary),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextFormField(
                      controller: mailController,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: "E-mail"),
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
                        width: 3, color: Theme.of(context).colorScheme.primary),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: "Password"),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 7,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary),
                    onPressed: () async {
                      await signUpUser(
                          mailController.text, passwordController.text);
                      router.push("/loginPage");
                    },
                    child: const Text("Sign up")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
