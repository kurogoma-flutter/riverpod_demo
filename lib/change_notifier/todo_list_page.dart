import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'todo_list_page_view_model.dart';

class TodoListPage extends ConsumerWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(todoListPageViewModel);
    return Scaffold(
      appBar: AppBar(
        title: const Text('TodoList'),
      ),
      body: FutureBuilder(
        future: viewModel.fetchTodoList(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
          if (snapshot.hasData) {
            // 配列にデータをセット
            final List<DocumentSnapshot> documents = snapshot.data!.docs;

            return ListView(
              children: documents
                  .map(
                    (doc) => Card(
                      child: ListTile(
                        title: Text(doc['text']),
                        subtitle: Text(doc['id']),
                      ),
                    ),
                  )
                  .toList(),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
