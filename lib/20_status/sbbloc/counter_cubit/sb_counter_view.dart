/*
 * @Author: wangtianji
 * @Date: 2021-08-02 17:19:31
 * @LastEditTime: 2021-08-02 17:46:23
 * @LastEditors: wangtianji
 * @Description: 
 * @FilePath: /sbflutter/lib/20_status/sbbloc/counter_cubit/sb_counter_view.dart
 */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/sb_counter_cubit_cubit.dart';

class SBCounterView extends StatelessWidget {
  // const SBCounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text("Counter")),
      body: Center(
        child: BlocBuilder<SbCounterCubitCubit, int>(
          builder: (context, state) {
            return Text("$state", style: textTheme.headline2);
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
              key: const Key('counterView_increment_floatingActionButton'),
              child: const Icon(Icons.add),
              onPressed: () {
                return context.read<SbCounterCubitCubit>().increment();
              }),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('counterView_decrement_floatingActionButton'),
            child: const Icon(Icons.remove),
            onPressed: () => context.read<SbCounterCubitCubit>().decrement(),
          ),
        ],
      ),
    );
  }
}
