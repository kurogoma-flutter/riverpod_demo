import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/future/todo_future_page_view_model.dart';

class TodoFuturePage extends ConsumerWidget {
  const TodoFuturePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    AsyncValue todos = ref.watch(todoFutureProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureProvider'),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: todos.when(
          data: (todo) => RefreshIndicator(
            onRefresh: () async {
              return await ref.refresh(todoFutureProvider);
            },
            child: ListView.builder(
              itemCount: todo.docs.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(todo.docs[index]['text']),
                  subtitle: Text(todo.docs[index]['id']),
                ),
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
