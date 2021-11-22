part of 'counter_cubit.dart';

class CounterState {
  late int counterValue;
  late bool? isIncremented;
  CounterState({
    required this.counterValue,
    this.isIncremented,
  });
}
