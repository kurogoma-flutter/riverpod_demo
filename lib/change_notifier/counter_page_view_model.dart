import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final counterPageViewModel = ChangeNotifierProvider<CounterPageViewModel>(
    (ref) => CounterPageViewModel());

class CounterPageViewModel extends ChangeNotifier {
  CounterPageViewModel();

  // 状態管理する変数
  int count = 0;

  // メソッド

  /// [count]の値を1増やす
  void increment() {
    count++;
    notifyListeners();
  }

  /// [count]の値を1増やす（通知しない）
  void incrementNotNotice() {
    count++;
  }

  /// [count]の値を1減らす
  void decrement() {
    count--;
    notifyListeners();
  }

  /// [count]の値を0にする
  void reset() {
    count = 0;
    notifyListeners();
  }
}
