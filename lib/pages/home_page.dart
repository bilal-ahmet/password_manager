import 'package:flutter/material.dart';
import 'package:password_manager/database/auth.dart';
import 'package:password_manager/lokal_storage/service.dart';
import 'package:password_manager/model/user_model.dart';
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

  UserModel user = UserModel(null, null, null, null, null, null);

  Service service = Service();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: const Text("LockWord"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
          IconButton(
              onPressed: () async {
                await signOutUser();
                router.push("/loginPage");
              },
              icon: const Icon(Icons.logout))
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
                  "PROFILE",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.width / 10,
            ),
            TextButton(
                onPressed: () {
                  router.push("/themePage");
                },
                child: Text(
                  "THEME",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.width / 10,
            ),
            TextButton(
                onPressed: () {
                  router.push("/databaseTransfer");
                },
                child: Text(
                  "SAVE PASSWORD",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.width / 4,
            ),
            ElevatedButton(
                onPressed: () {}, child: const Text("S I G N  O U T"))
          ],
        ),
      ),
      body: FutureBuilder<List<UserModel>>(
        future: service.getAllUser(), // Hive'dan kullanıcıları al
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No users found."));
          } else {
            var users = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Dismissible(
                    key: Key(users[index].email ?? index.toString()),
                    direction: DismissDirection.horizontal,
                    onDismissed: (direction) async {
                      await service.deleteUser(index);

                      setState(() {
                        users.removeAt(index);
                      });
                    },
                    child: Card(
                      color: Theme.of(context).colorScheme.primary,
                      child: ListTile(
                        title: Text(
                          users[index].email ?? "No Email",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary),
                        ),
                        subtitle: Text(
                          users[index].password ?? "No Password",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary),
                        ),
                        leading: CircleAvatar(
                          child: Image.asset("assets/logo.png"),
                        ),
                        trailing: Text(
                          users[index].appName ?? "No App Name",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary),
                        ),
                      ),
                    ));
              },
            );
          }
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
                      onPressed: () async {
                        mailList.add(mailController.text);
                        passwordList.add(passwordController.text);
                        appList.add(appController.text);

                        user = user.copyWith(
                            email: mailController.text,
                            password: passwordController.text,
                            appName: appController.text);

                        await service.addUser(user);

                        mailController.clear();
                        passwordController.clear();
                        appController.clear();

                        setState(() {
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
}
