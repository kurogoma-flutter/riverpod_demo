import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final todoListPageViewModel = ChangeNotifierProvider<TodoListPageViewModel>(
    (ref) => TodoListPageViewModel());

class TodoListPageViewModel extends ChangeNotifier {
  TodoListPageViewModel();

  // 状態管理する変数

  // メソッド
  Future<QuerySnapshot> fetchTodoList() async {
    return await FirebaseFirestore.instance.collection('todos').get();
  }
}
