/* import 'package:flutter/material.dart';
import 'package:password_manager/database/auth.dart';
import 'package:password_manager/database/strorage.dart';
import 'package:password_manager/router/page_router.dart';

class DatabaseTransfer extends StatelessWidget {
  const DatabaseTransfer({super.key});

  @override
  Widget build(BuildContext context) {
        String mail = "bilal@gmail.com";
    String password = "123456";
    String appName = "instagram";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: const Text("Save password"),
        actions: [
          IconButton(onPressed: () async{await signOutUser(); router.push("/loginPage");}, icon: const Icon(Icons.logout))
        ],
      ),
      body: FutureBuilder(future: getInfotmation(), builder: (context, snapshot) {
        List<Map<String, dynamic>> document = snapshot.data!;
        return ListView.builder(itemCount: document.length, itemBuilder: (context, index) {
          var data = document[index];
          return ListTile(
            title: Text(data["mail"]),
            subtitle: Text(data["password"]),
            trailing: Text(data["appName"]),
          );
        },);
      },),

      floatingActionButton: FloatingActionButton(onPressed: () async{
        await saveInformation(mail, password, appName);
      },),
    );
  }
} */