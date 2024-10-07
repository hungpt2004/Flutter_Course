import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/cubit/counter_cubit.dart';
import 'package:flutter_bloc_tutorial/cubit/counter_page.dart';

import 'bloc/bloc.dart';
import 'bloc/home_page.dart';

void main() {
  runApp(const MyApp());
}

//================================================================ BLOC =========================================================================
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter BLoC Example',
//       home: BlocProvider(
//         create: (_) => CounterBloc(),
//         child: const CounterScreen(),
//       ),
//     );
//   }
// }

//=============================================================== CUBIT =========================================================================
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BLoC Example',
      home: BlocProvider(
        create: (_) => CounterCubit(),
        child: const CounterCubitPage(),
      ),
    );
  }
}