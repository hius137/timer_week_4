import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_week_4/timer/timer_cubit.dart';
import 'package:timer_week_4/timer/timer_state.dart';
import 'package:timer_week_4/utils/app_image.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  late TimerCubit _timerCubit;

  @override
  void initState() {
    super.initState();
    _timerCubit = BlocProvider.of(context);
    _timerCubit.startRunTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade50, Colors.blue.shade500],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<TimerCubit, TimerState>(buildWhen: (previous, current) {
              return previous.time != current.time;
            }, // previous: trạng thái trước, current: trạng thái sau
                builder: (context, state) {
              return Text(
                state.time <= 9 ? '00:0${state.time}' : '00:${state.time}',
                style: const TextStyle(fontSize: 40, color: Colors.white),
              );
            }),
            const SizedBox(height: 30),
            BlocBuilder<TimerCubit, TimerState>(builder: (context, state) {
              return state.isSuccess
                  ? Center(
                      child: FloatingActionButton(
                        onPressed: () {
                          _timerCubit.replayTime();
                        },
                        child: state.isReplay
                            ? Image(
                                color: Colors.white,
                                image: AssetImage(AppImage.icReplay),
                                width: 20,
                                height: 20,
                              )
                            : Image(
                                color: Colors.white,
                                image: AssetImage(AppImage.icPlay),
                                width: 20,
                                height: 20,
                              ),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            state.isPlay
                                ? _timerCubit.pauseTime()
                                : _timerCubit.startRunTime();
                          },
                          child: state.isPlay
                              ? Image(
                                  color: Colors.white,
                                  image: AssetImage(AppImage.icPause),
                                  width: 20,
                                  height: 20,
                                )
                              : Image(
                                  color: Colors.white,
                                  image: AssetImage(AppImage.icPlay),
                                  width: 20,
                                  height: 20,
                                ),
                        ),
                        const SizedBox(width: 50),
                        FloatingActionButton(
                          onPressed: () {
                            _timerCubit.replayTime();
                          },
                          child: state.isReplay
                              ? Image(
                                  color: Colors.white,
                                  image: AssetImage(AppImage.icReplay),
                                  width: 20,
                                  height: 20,
                                )
                              : Image(
                                  color: Colors.white,
                                  image: AssetImage(AppImage.icPlay),
                                  width: 20,
                                  height: 20,
                                ),
                        ),
                      ],
                    );
            }),
          ],
        ),
      ),
    );
  }
}
