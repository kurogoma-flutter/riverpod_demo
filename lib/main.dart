// Package
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/change_notifier/todo_list_page.dart';
import 'package:riverpod_demo/future/todo_future_page.dart';
// Project
import 'change_notifier/counter_page.dart';
import 'firebase_options.dart';
import 'stream/todo_stream_page.dart';

// primarySwatchをカスタムしたい場合
const MaterialColor customSwatch = MaterialColor(
  0xFF3300FF,
  <int, Color>{
    50: Color(0xFF3300FF),
    100: Color(0xFF3300FF),
    200: Color(0xFF3300FF),
    300: Color(0xFF3300FF),
    400: Color(0xFF3300FF),
    500: Color(0xFF3300FF),
    600: Color(0xFF3300FF),
    700: Color(0xFF3300FF),
    800: Color(0xFF3300FF),
    900: Color(0xFF3300FF),
  },
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: customSwatch,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 252, 255),
      appBar: AppBar(
        title: const Text('Riverpodサンプル'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: size.height * 0.15), // 上下30%の余白
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: size.height * 0.12,
                width: size.height * 0.12, // 高さと合わせるため
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                      'https://user-images.githubusercontent.com/67848399/177473238-cfe6333a-d8b0-4385-94d0-d5be87604394.png',
                      fit: BoxFit.cover),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CounterPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('ChangeNotifierProvider'),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TodoStreamPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('StreamProvider'),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TodoFuturePage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('FutureProvider'),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TodoListPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('ChangeNotifier - Future'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
