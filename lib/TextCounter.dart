import 'package:flutter/material.dart';
import 'package:flutter_state_management/Counter2.dart';
import 'package:provider/provider.dart';
import 'package:flutter_state_management/Counter.dart';

class TextCounter extends StatelessWidget {
  const TextCounter({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        StreamProvider<int>(
          create: (context) => Counter().countForOneMinute(),
          initialData: 0,
          child: Column(
            children: [
              Consumer<int>(
                builder: (context, int count, _) {
                  return Text(
                    count.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              )
            ],
          ),
        ),
        Text(
          context.watch<Counter>().count.toString(),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          context.watch<Counter2>().count.toString(),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
    
    /*return FutureProvider<String>(
      create: (context) => Counter().fetchName,
      initialData: '',
      child: Column(
        children: [
          Text(
            context.select((Counter counter) => counter.count.toString()),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Consumer<String>(
            builder: (context, String name, _) {
              return Text(
                name,
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }
          ),
        ],
      ),
    ); */
    
    /*return Column(
      children: [
        Text(
          context.select((Counter counter) => counter.count.toString()),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );*/

    /*return Column(
      children: [
        Selector<Counter, int>(
          selector: (context, counter) => counter.count,
          builder: (context, int count, child) {
            return Text(
              count.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            );
          },
        )
      ],
    );*/

    /*return Consumer<Counter>(builder: (context, counter, _) {
      return Column(
        children: [
          Text(
            //Provider.of<Counter>(context).count.toString(), //alternativa
            //context.watch<Counter>().count.toString(), //alternativa
            counter.count.toString(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            counter.add.toString(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            counter.multiply.toString(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      );
    });*/

  }

}