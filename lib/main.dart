// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

//Stream Basic
// Stream<int> boatStream() async* {
//   for (int i = 1; i <= 10; i++) {
//     print('SENT boat no:' + i.toString());
//     await Future.delayed(const Duration(seconds: 2));
//     yield i;
//   }
// }

// void main() async {
//   Stream<int> stream = boatStream();
//   stream.listen((data) => print('RECEIVED boat no:' + data.toString()));
// }

//Cubit Basic

// class CounterCubit extends Cubit<int> {
//   CounterCubit() : super(0);
//   void increment() {
//     emit(state + 1);
//   }

//   void decrement() {
//     emit(state - 1);
//   }
// }

// void main() {
//   final cubit = CounterCubit();
//  }
// Bloc for counter increment

// enum CounterEvent { increment, decrement }

// class CounterCubit extends Bloc<CounterEvent,int> {
//   /// {@macro counter_cubit}
//   CounterCubit() : super(0);

//   /// Add 1 to the current state.
//   void increment() => emit(state + 1);

//   /// Subtract 1 from the current state.
//   void decrement() => emit(state - 1);
// }

// void main() async {
//   final cubit = CounterCubit();
//   print(cubit.state);
//   cubit.increment();
//   print(cubit.state);
//   cubit.decrement();
//   print(cubit.state);
//   cubit.increment();
//   print(cubit.state);
//   cubit.increment();
//   print(cubit.state);
//   cubit.decrement();
//   print(cubit.state);
//   cubit.increment();
//   print(cubit.state);
//   cubit.increment();
//   cubit.decrement();
//   print(cubit.state);
//   cubit.decrement();
//   print(cubit.state);
//   cubit.close();
// }

// Bloc for counter increment
import 'package:equatable/equatable.dart';

enum CounterEvents { increment, decrement }

abstract class CounterEvent {}

class Increment extends CounterEvent {}

class Decrement extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc(int initialState) : super(initialState) {
    on<Increment>((event, emit) => emit(state + 1));
    on<Decrement>((event, emit) => emit(state - 1));
  }
}

Future<void> main() async {
  print('----------BLOC----------');

  /// Create a `CounterBloc` instance.
  final bloc = CounterBloc(0);

  /// Access the state of the `bloc` via `state`.
  print(bloc.state);

  /// Interact with the `bloc` to trigger `state` changes.
  bloc.add(Increment());

  /// Wait for next iteration of the event-loop
  /// to ensure event has been processed.
  await Future<void>.delayed(Duration.zero);

  /// Access the new `state`.
  print(bloc.state);

  bloc.add(Decrement());

  await Future<void>.delayed(Duration.zero);

  print(bloc.state);

  bloc.add(Increment());

  /// Wait for next iteration of the event-loop
  /// to ensure event has been processed.
  await Future<void>.delayed(Duration.zero);

  /// Access the new `state`.
  print(bloc.state);
  bloc.add(Increment());

  /// Wait for next iteration of the event-loop
  /// to ensure event has been processed.
  await Future<void>.delayed(Duration.zero);

  /// Access the new `state`.
  print(bloc.state);

  bloc.add(Decrement());

  /// Wait for next iteration of the event-loop
  /// to ensure event has been processed.
  await Future<void>.delayed(Duration.zero);

  /// Access the new `state`.
  print(bloc.state);
  bloc.add(Increment());

  /// Wait for next iteration of the event-loop
  /// to ensure event has been processed.
  await Future<void>.delayed(Duration.zero);

  /// Access the new `state`.
  print(bloc.state);

  bloc.add(Increment());

  /// Wait for next iteration of the event-loop
  /// to ensure event has been processed.
  await Future<void>.delayed(Duration.zero);
  print(bloc.state);
  bloc.add(Decrement());
  await Future<void>.delayed(Duration.zero);
  print(bloc.state);
  bloc.add(Increment());

  /// Wait for next iteration of the event-loop
  /// to ensure event has been processed.
  await Future<void>.delayed(Duration.zero);

  /// Access the new `state`.
  print(bloc.state);

  /// Close the `bloc` when it is no longer needed.
  await bloc.close();
}
