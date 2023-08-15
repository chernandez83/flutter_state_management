import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_state_management/Counter.dart';

class TextCounter extends StatelessWidget {
  const TextCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.watch<Counter>().count.toString(),
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }

}