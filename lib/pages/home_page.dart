import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> appList = [];
  List<String> passwordList = [];

  TextEditingController appController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: appList.length,
        itemBuilder: (context, index) {
          return Card(
            color: Theme.of(context).colorScheme.primary,
            child: ListTile(
              title: Text(
                appList[index],
                style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
              ),
              subtitle: Text(
                passwordList[index],
                style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
              ),
              leading: CircleAvatar(
                child: Text(
                  (index + 1).toString(),
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.tertiary),
                ),
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
                      controller: appController,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 9,
                    ),
                    TextField(
                      controller: passwordController,
                    ),
                  ],
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.delete)),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          appAddMethode(appController.text);
                          passwordAddMethode(passwordController.text);
                          appController.clear();
                          passwordController.clear();
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

  void appAddMethode(String name) {
    appList.add(name);
  }

  void passwordAddMethode(String name) {
    passwordList.add(name);
  }
}
