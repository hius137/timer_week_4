import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_week_4/timer/timer_cubit.dart';
import 'package:timer_week_4/timer/timer_page.dart';


void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<TimerCubit>(
        create: (_) => TimerCubit(),
        child: const TimerPage(),
      ),
    );
  }
}