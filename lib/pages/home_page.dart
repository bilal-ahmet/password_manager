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
  TextEditingController appMailController = TextEditingController();
  TextEditingController appPasswordController = TextEditingController();
  TextEditingController appController = TextEditingController();

  UserModel? user = UserModel(null, null, null, null, null, null);

  Service service = Service();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: const Text("LockWord"),
        actions: [
          IconButton(
              onPressed: () {
                router.push("/profilPage");
              },
              icon: const Icon(Icons.person)),
          IconButton(
              onPressed: () async {
                await signOutUser();
                router.pushReplacement("/loginPage");
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
              height: MediaQuery.of(context).size.width / 1.7,
            ),
            /* TextButton(
                onPressed: () {
                  router.push("/databaseTransfer");
                },
                child: Text(
                  "SAVE PASSWORD",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                )),*/
            ElevatedButton(
                onPressed: () async {
                  await signOutUser();
                  router.pushReplacement("/loginPage");
                },
                child: const Text("S I G N  O U T"))
          ],
        ),
      ),
      body: FutureBuilder<List<UserModel>>(
        future: service.getAllUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No application found."));
          } else {
            var users = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Dismissible(
                    key: Key(users[index].appName ?? index.toString()),
                    direction: DismissDirection.horizontal,
                    onDismissed: (direction) async {
                      await service.deleteUser(index);

                      setState(() {
                        users.removeAt(index);
                      });
                    },
                    child: users[index].appMail == null ? const Center(child: Text("no app found"),) : Card(
                      color: Theme.of(context).colorScheme.primary,
                      child: ListTile(
                        title: Text(
                          users[index].appMail ?? "No Email",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary),
                        ),
                        subtitle: Text(
                          users[index].appPassword ?? "No Password",
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
                      controller: appMailController,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 12,
                    ),
                    TextField(
                      decoration: const InputDecoration(hintText: "Password"),
                      controller: appPasswordController,
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
                        user = user?.copyWith(
                            appMail: appMailController.text,
                            appPassword: appPasswordController.text,
                            appName: appController.text);

                        await service.addUser(user!);

                        appMailController.clear();
                        appPasswordController.clear();
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
