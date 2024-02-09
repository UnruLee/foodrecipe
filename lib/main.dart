import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project Food Recipe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Food Recipe'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_horiz),
              onPressed: () {
                // print here
              },
            )
          ],
        ),
        body: Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: const Column(
              children: [
                TextHeader(),
              ],
            )));
  }
}

class TextHeader extends StatelessWidget {
  const TextHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Text(
        'How to make french toast',
        softWrap: true,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 26.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ]);
  }
}
