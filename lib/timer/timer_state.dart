import 'package:equatable/equatable.dart';

class TimerState extends Equatable {
  final int time;
  final bool isPlay;
  final bool isReplay;
  final bool isSuccess;

  @override
  List<Object?> get props => [
        time,
        isPlay,
        isReplay,
        isSuccess,
      ];

  const TimerState({
    this.time = 60,
    this.isSuccess = false,
    this.isPlay = true,
    this.isReplay = true,
  });

  TimerState copyWith({
    bool? isSuccess,
    bool? isPlay,
    bool? isReplay,
    int? time,
  }) {
    return TimerState(
      time: time ?? this.time,
      isPlay: isPlay ?? this.isPlay,
      isReplay: isReplay ?? this.isReplay,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
