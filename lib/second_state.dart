import 'package:flutter/material.dart';
import 'package:flutter_card/counter_logic.dart';
import 'package:flutter_card/main.dart';
import 'package:provider/provider.dart';


class SecondStateScreen extends StatefulWidget {
  @override
  State<SecondStateScreen> createState() => _SecondStateScreenState();
}

class _SecondStateScreenState extends State<SecondStateScreen> {
  // const SimpleStateScreen({super.key});
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Simple State Screen"),
        actions: [

          IconButton(
            onPressed: () {
              context.read<CounterLogic>().decrementCounter();
              debugPrint("counter: $_counter");
            },
            icon:const Icon(Icons.remove),
          ),
          IconButton(
            onPressed: () {
              context.read<CounterLogic>().incrementCounter();
              debugPrint("counter: $_counter");
            },
            icon:const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Text(
          "counter: ${context.watch<CounterLogic>().counter}",
          style:const TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}