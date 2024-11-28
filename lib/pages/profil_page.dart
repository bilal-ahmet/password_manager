import 'package:flutter/material.dart';
import 'package:password_manager/lokal_storage/service.dart';

class ProfilPage extends StatelessWidget {
  ProfilPage({super.key});

  Service service = Service();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          "PROFILE",
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width / 9,
                ),
                Container(
                    height: MediaQuery.of(context).size.width / 3,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle),
                    child: Image.asset(
                      "assets/logo.png",
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 9,
                ),
                Divider(
                    indent: MediaQuery.of(context).size.width / 9,
                    endIndent: MediaQuery.of(context).size.width / 9),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 9,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 9,
                right: MediaQuery.of(context).size.width / 9),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Name"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 5,
                    ),
                    FutureBuilder(
                      future: service.getAllUser(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text("${snapshot.error}"),
                          );
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return const Center(
                            child: Text("there is no user"),
                          );
                        } else {
                          return SizedBox(
                            height: MediaQuery.of(context).size.width / 10,
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return Text(
                                  snapshot.data![index].name.toString(),
                                  softWrap: false,
                                );
                              },
                            ),
                          );
                        }
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Mail"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 5,
                    ),
                    FutureBuilder(
                      future: service.getAllUser(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text("error: ${snapshot.error}"),
                          );
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return const Center(
                            child: Text("there is no user"),
                          );
                        } else {
                          return SizedBox(
                            height: MediaQuery.of(context).size.width / 10,
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return Text(
                                  snapshot.data![index].email.toString(),
                                  softWrap: false,
                                );
                              },
                            ),
                          );
                        }
                      },
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
