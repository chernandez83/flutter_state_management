import 'package:flutter/material.dart';

class Counter2 extends ChangeNotifier {
  int _count = 0;

  int get count => _count;
  int get add => _count + _count;
  int get multiply => _count * _count;

  void increment2() {
    _count += 2;
    notifyListeners();
  }

  Future<String> get fetchName {
    final name = Future.delayed(const Duration(seconds: 5), () {
      return 'Batman';
    });

    return name;
  }

  Stream<int> countForOneMinute() async* {
    for(int i = 1; i <= 60; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

}