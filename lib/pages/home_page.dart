import 'package:flutter/material.dart';
import 'package:password_manager/router/page_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> mailList = [];
  List<String> passwordList = [];
  List<String> appList = [];

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController appController = TextEditingController();

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
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width / 5,
            ),
            Image.asset("assets/logo.png"),
            SizedBox(
              height: MediaQuery.of(context).size.width / 10,
            ),
            const Divider(
              indent: 25,
              endIndent: 25,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 8,
            ),
            TextButton(
                onPressed: () {
                  router.push("/profilPage");
                },
                child: Text(
                  "- PROFIL",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.tertiary),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.width / 10,
            ),
            TextButton(
                onPressed: () {
                  router.push("/themePage");
                },
                child: Text(
                  "THEME -",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.tertiary),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.width / 2,
            ),
            ElevatedButton(onPressed: () {}, child: Text("S I G N  O U T"))
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: mailList.length,
        itemBuilder: (context, index) {
          return Card(
            color: Theme.of(context).colorScheme.primary,
            child: ListTile(
              title: Text(
                mailList[index],
                style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
              ),
              subtitle: Text(
                passwordList[index],
                style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
              ),
              leading: CircleAvatar(
                child: Image.asset("assets/logo.png"),
              ),
              trailing: Text(
                appList[index],
                style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(hintText: "E-mail"),
                      controller: mailController,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 12,
                    ),
                    TextField(
                      decoration: const InputDecoration(hintText: "Password"),
                      controller: passwordController,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 12,
                    ),
                    TextField(
                      decoration: const InputDecoration(hintText: "App Name"),
                      controller: appController,
                    )
                  ],
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.cancel)),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          mailAddMethode(mailController.text);
                          passwordAddMethode(passwordController.text);
                          appAddMethode(appController.text);
                          mailController.clear();
                          passwordController.clear();
                          appController.clear();
                          Navigator.pop(context);
                        });
                      },
                      icon: const Icon(Icons.add)),
                ],
              );
            },
          );
        },
      ),
    );
  }

  void mailAddMethode(String name) {
    mailList.add(name);
  }

  void passwordAddMethode(String name) {
    passwordList.add(name);
  }

  void appAddMethode(String name) {
    appList.add(name);
  }
}
