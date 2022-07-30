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
            pinned: true,
            flexibleSpace: const FlexibleSpaceBar(
              title:  Text("OllyScroll"),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
                child: FutureBuilder(
                    future: ApiService.fetchAlbum(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Center(child: album(snapshot.data));
                      }

                      return const CircularProgressIndicator();
                    })),
          )
        ],
      ),
    );
  }
}


