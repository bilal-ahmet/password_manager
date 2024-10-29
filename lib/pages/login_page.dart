import 'package:flutter/material.dart';
import 'package:password_manager/router/page_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: const Text("LockWord"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration:
              BoxDecoration(color: Theme.of(context).colorScheme.surface),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width / 7,
                ),
                const Center(child: Text("LOCKWORD", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 11,
                ),
                Image.asset(
                  "assets/3d-unlocked.png",
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
                    onPressed: () {
                      router.push("/homePage");
                    },
                    child: const Text("Sign in")),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 15,
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
            ),
          ),
        ),
      ),
    );
  }
}
