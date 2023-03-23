import 'package:flutter/material.dart';
import 'package:ws_trail/test_samples/ui_test/ui_test.dart';

void main() {
  runApp(LaunchApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Work Shop",
      home: Scaffold(

        appBar: AppBar(
          title: Text("demo app", style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),

        body: Center(
            child: Text('Topics',)),

        floatingActionButton: FloatingActionButton(
          child: Text("Marvel"),
          onPressed: ()=> {

          },
        ),
      ),
    );
  }
}



class LaunchApp extends StatelessWidget {
  const LaunchApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        body: UITestWidget(title: appTitle, message: "test"),
      ),
    );
  }
}





