import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.black,
            radius: 25,
          ),
          Container(
            padding: const EdgeInsets.only(left: 15),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("abc"),
                Text("Xyz"),
              ],
            ),
          )
        ],
      )),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
