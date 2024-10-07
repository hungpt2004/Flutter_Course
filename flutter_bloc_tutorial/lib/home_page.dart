import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/bloc.dart';
import 'package:flutter_bloc_tutorial/state.dart';

import 'event.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sử dụng BlocBuilder để lắng nghe và hiển thị thay đổi của CounterState
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter BLoC Example'),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Center(
            child: Text(
              'Counter Value: ${state.counterValue}',
              style: const TextStyle(fontSize: 24),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          //Increment Button
          FloatingActionButton(
            onPressed: () {
              // Kích hoạt sự kiện tăng
              context.read<CounterBloc>().add(Increment());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),

          const SizedBox(height: 10),

          //Decrement Button
          FloatingActionButton(
            onPressed: () {
              // Kích hoạt sự kiện giảm
              context.read<CounterBloc>().add(Decrement());
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),


        ],
      ),
    );
  }
}