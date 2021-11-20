import 'package:bloc/bloc.dart';

//Stream Basic
Stream<int> boatStream() async* {
  for (int i = 1; i <= 10; i++) {
    print('SENT boat no:' + i.toString());
    await Future.delayed(Duration(seconds: 2));
    yield i;
  }
}

// void main() async {
//   Stream<int> stream = boatStream();
//   stream.listen((data) => print('RECEIVED boat no:' + data.toString()));
// }

//Cubit Basic

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  void increment() {
    emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  }
}

void main() {
  final cubit = CounterCubit();
  print(cubit.state);
  cubit.increment();
  print(cubit.state);
  cubit.decrement();
  print(cubit.state);
  cubit.increment();
  print(cubit.state);
  cubit.increment();
  print(cubit.state);
  cubit.decrement();
  print(cubit.state);
  cubit.increment();
  print(cubit.state);
  cubit.increment();
  cubit.decrement();
  print(cubit.state);
  cubit.decrement();
  print(cubit.state);
  cubit.close();
}
