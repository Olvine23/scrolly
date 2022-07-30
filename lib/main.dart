// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:scrolly/services/services.dart';
import 'package:scrolly/widgets/album_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        errorColor: Colors.red,
        primarySwatch: Colors.brown,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ignore: prefer_const_constructors
          SliverAppBar(
            expandedHeight: 250,
            backgroundColor: Colors.amber,
            pinned: true,
            flexibleSpace: const FlexibleSpaceBar(
              title:  Text("OllyScroll"),
            ),
          ),
          SliverAppBar(
            expandedHeight: 250,
            backgroundColor: Colors.red,
            pinned: false,
            floating: true,
            snap: true,
            flexibleSpace: const FlexibleSpaceBar(
              title:  Text("OllyScroll"),
            ),
          ),
          SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Card(
                margin: const EdgeInsets.all(15),
                child: Container(
                  color: Colors.blue[100 * (index % 9 + 1)],
                  height: 80,
                  alignment: Alignment.center,
                  child: Text(
                    "Item $index",
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
              );
            },
            childCount: 1000, // 1000 list items
          ),
        ),
        ],
      ),
    );
  }
}


