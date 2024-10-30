import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> appList = [];

  TextEditingController controller = TextEditingController();

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
        itemCount: appList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(appList[index]),
            leading: CircleAvatar(
              child: Text((index + 1).toString()),
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
                title: TextField(
                  controller: controller,
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
                          appAddMethode(controller.text);
                          controller.clear();
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
}
