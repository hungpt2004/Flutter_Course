import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/cubit/counter_cubit.dart';

class CounterCubitPage extends StatelessWidget {
  const CounterCubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          //CUBIT and INTEGER
          //COUNT is INT VARIABLE
          builder: (context, count) {
            return Text('${count}');
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().increment();
            },
            child: Text("Increment", style: TextStyle(fontSize: 10),),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().decrement();
            },
            child: Text("Decrement", style: TextStyle(fontSize: 10),),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().reset();
            },
            child: Text("Reset", style: TextStyle(fontSize: 10),),
          )
        ],
      ),
    );
  }
}
