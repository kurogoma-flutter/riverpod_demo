import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final todoPageViewModel =
    ChangeNotifierProvider<TodoPageViewModel>((ref) => TodoPageViewModel());

class TodoPageViewModel extends ChangeNotifier {
  TodoPageViewModel();

  // 状態管理する変数
  int count = 0;

  // メソッド
  void increment() {
    count++;
    notifyListeners();
  }

  void incrementNotNotice() {
    count++;
  }

  void decrement() {
    count--;
    notifyListeners();
  }

  void reset() {
    count = 0;
    notifyListeners();
  }
}
