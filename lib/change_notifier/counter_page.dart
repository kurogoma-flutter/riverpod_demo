import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'counter_page_view_model.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final viewModel = ref.watch(counterPageViewModel);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ChangeNotifierProvider'),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${viewModel.count}',
              style: const TextStyle(fontSize: 40),
            ),
            SizedBox(height: size.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => viewModel.decrement(),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: const Text('-1'),
                ),
                ElevatedButton(
                  onPressed: () => viewModel.reset(),
                  style: ElevatedButton.styleFrom(primary: Colors.grey),
                  child: const Text('reset'),
                ),
                ElevatedButton(
                  onPressed: () => viewModel.increment(),
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                  child: const Text('+1'),
                ),
                ElevatedButton(
                  onPressed: () => viewModel.incrementNotNotice(),
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  child: const Text('+1 ?'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
