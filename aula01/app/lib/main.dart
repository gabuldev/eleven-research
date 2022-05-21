import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var count = 0;
  var notificationKey = GlobalKey<NotificationState>();

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      notificationKey.currentState!.update();
    });
    super.initState();
  }

  void sum() {
    count++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Notification()],
      ),
      body: ListView.builder(
          itemCount: count,
          itemBuilder: (_, index) => Card(
                child: ListTile(
                  title: Text("$index"),
                ),
              )),
      floatingActionButton: FloatingActionButton(onPressed: sum),
    );
  }
}

class Notification extends StatefulWidget {
  const Notification({
    Key? key,
  }) : super(key: key);

  @override
  State<Notification> createState() => NotificationState();
}

class NotificationState extends State<Notification> {
  var count = 0;

  void update() {
    count++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: Colors.red,
          radius: 10,
          child: Text(
            "$count",
            style: const TextStyle(fontSize: 12),
          ),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
      ],
    );
  }
}
