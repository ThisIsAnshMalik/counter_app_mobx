import 'package:counter_app_mobx/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
        primarySwatch: Colors.blue,
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
  final counter = Counter();
  @override
  Widget build(BuildContext context) {
    debugPrint(counter.value.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Observer(builder: ((context) {
              return Text(
                "${counter.value}",
                style: Theme.of(context).textTheme.headline4,
              );
            }))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          counter.increment();
          debugPrint(counter.value.toString());
        }),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
