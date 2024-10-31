import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      shape: BoxShape.circle),
                  child: Icon(Icons.person, size: MediaQuery.of(context).size.width/4,),
                ),
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
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width / 9, right: MediaQuery.of(context).size.width / 9),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text("Name"),
                     Text("bilal ahmet"),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 12,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text("Mail"),
                    Text("bilal@gmail.com")
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
