import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_manager/bloc/user_bloc.dart';
import 'package:password_manager/database/auth.dart';
import 'package:password_manager/lokal_storage/service.dart';
import 'package:password_manager/model/user_model.dart';
import 'package:password_manager/router/page_router.dart';

class HomePage extends StatelessWidget {
  final Service service = Service();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserBloc(service)..add(LoadUsersEvent()),
      child: Scaffold(
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
        drawer: _buildDrawer(context),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.errorMessage != null) {
              return Center(child: Text("Error: ${state.errorMessage}"));
            } else if (state.users.isEmpty) {
              return const Center(child: Text("No application found."));
            } else {
              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  return Dismissible(
                    key: Key(user.appName ?? index.toString()),
                    direction: DismissDirection.horizontal,
                    onDismissed: (direction) {
                      context.read<UserBloc>().add(DeleteUserEvent(index));
                    },
                    child: Card(
                      color: Theme.of(context).colorScheme.primary,
                      child: ListTile(
                        title: Text(
                          user.appMail ?? "No Email",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary),
                        ),
                        subtitle: Text(
                          user.appPassword ?? "No Password",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary),
                        ),
                        leading: CircleAvatar(
                          child: Image.asset("assets/logo.png"),
                        ),
                        trailing: Text(
                          user.appName ?? "No App Name",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            _showAddUserDialog(context);
          },
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width / 5),
          Image.asset("assets/logo.png"),
          SizedBox(height: MediaQuery.of(context).size.width / 10),
          const Divider(indent: 25, endIndent: 25),
          SizedBox(height: MediaQuery.of(context).size.width / 8),
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
          SizedBox(height: MediaQuery.of(context).size.width / 10),
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
          SizedBox(height: MediaQuery.of(context).size.width / 1.7),
          ElevatedButton(
              onPressed: () async {
                await signOutUser();
                router.pushReplacement("/loginPage");
              },
              child: const Text("S I G N  O U T"))
        ],
      ),
    );
  }

  void _showAddUserDialog(BuildContext context) {
    final appMailController = TextEditingController();
    final appPasswordController = TextEditingController();
    final appController = TextEditingController();

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
              SizedBox(height: MediaQuery.of(context).size.width / 12),
              TextField(
                decoration: const InputDecoration(hintText: "Password"),
                controller: appPasswordController,
              ),
              SizedBox(height: MediaQuery.of(context).size.width / 12),
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
                  final newUser = UserModel(
                    null,
                    appMailController.text,
                    appPasswordController.text,
                    appController.text,
                    null,
                    null,
                  );
                  context.read<UserBloc>().add(AddUserEvent(newUser));

                  appMailController.clear();
                  appPasswordController.clear();
                  appController.clear();
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.add)),
          ],
        );
      },
    );
  }
}
