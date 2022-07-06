import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'todo_stream_page_view_model.dart';

class TodoStreamPage extends ConsumerWidget {
  const TodoStreamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    AsyncValue todos = ref.watch(todoStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamProvider'),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: todos.when(
          data: (todo) => ListView.builder(
            itemCount: todo.docs.length,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Text(todo.docs[index].data()['text']),
                subtitle: Text(todo.docs[index].data()['id']),
              ),
            ),
          ),
          error: (err, stack) => Text('Error: $err'),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
