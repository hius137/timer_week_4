import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_week_4/timer/timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(const TimerState());
  late Timer timer;

  void startRunTime() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      int time = state.time - 1;
      if (state.time > 0) {
        emit(state.copyWith(
          time: time,
          isPlay: true,
        ));
      }
      if (state.time == 0) {
        emit(state.copyWith(
          isPlay: false,
          isSuccess: true,
        ));
      }
    });
  }

  void pauseTime() {
    if (timer.isActive) {
      timer.cancel();
      emit(state.copyWith(
        isPlay: false,
      ));
    }
  }

  void replayTime() {
    emit(state.copyWith(
      time: 60,
      isPlay: true,
      isSuccess: false,
    ));
  }
}
