import 'package:flutter/material.dart';
import 'package:flutter_state_management/Counter.dart';
import 'package:flutter_state_management/Counter2.dart';
import 'package:flutter_state_management/TextCounter.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (BuildContext context) => Counter()),
          ChangeNotifierProvider(create: (BuildContext context) => Counter2())
        ],
        child: const MyHomePage(title: 'Flutter Demo Home Page')
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            TextCounter(),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () =>  context.read<Counter>().increment(), //Provider.of<Counter>(context, listen: false).increment(), //alternativa
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: FloatingActionButton(
              onPressed: () =>  context.read<Counter2>().increment2(), //Provider.of<Counter>(context, listen: false).increment(), //alternativa
              tooltip: 'Increment',
              child: const Stack(
                children: [
                  Icon(Icons.add),
                  Positioned(
                    left: 5,
                    bottom: 5,
                    child: Icon(Icons.add,),
                  ),
                ],
              ),
            ),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
