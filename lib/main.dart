import 'package:flutter/material.dart';
// import 'package:my_flutter_app/providers/home.dart';
import 'package:my_flutter_app/screens/home.dart';
// import 'package:provider/provider.dart';

void main() {
  // runApp(
  //    MultiProvider(
  //     providers: [
  //       ChangeNotifierProvider(create: (_) => HomeProvider()),
  //     ],
  //     child: MyApp(),
  //   ),
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App ZX',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Test APP'),
    );
  }
}
