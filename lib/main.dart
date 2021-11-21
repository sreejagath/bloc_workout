// // ignore_for_file: avoid_print

// import 'dart:async';

// import 'package:flutter_bloc/flutter_bloc.dart';

// //Stream Basic
// // Stream<int> boatStream() async* {
// //   for (int i = 1; i <= 10; i++) {
// //     print('SENT boat no:' + i.toString());
// //     await Future.delayed(const Duration(seconds: 2));
// //     yield i;
// //   }
// // }

// // void main() async {
// //   Stream<int> stream = boatStream();
// //   stream.listen((data) => print('RECEIVED boat no:' + data.toString()));
// // }

// //Cubit Basic

// // class CounterCubit extends Cubit<int> {
// //   CounterCubit() : super(0);
// //   void increment() {
// //     emit(state + 1);
// //   }

// //   void decrement() {
// //     emit(state - 1);
// //   }
// // }

// // void main() {
// //   final cubit = CounterCubit();
// //  }
// // Bloc for counter increment

// // enum CounterEvent { increment, decrement }

// // class CounterCubit extends Bloc<CounterEvent,int> {
// //   /// {@macro counter_cubit}
// //   CounterCubit() : super(0);

// //   /// Add 1 to the current state.
// //   void increment() => emit(state + 1);

// //   /// Subtract 1 from the current state.
// //   void decrement() => emit(state - 1);
// // }

// // void main() async {
// //   final cubit = CounterCubit();
// //   print(cubit.state);
// //   cubit.increment();
// //   print(cubit.state);
// //   cubit.decrement();
// //   print(cubit.state);
// //   cubit.increment();
// //   print(cubit.state);
// //   cubit.increment();
// //   print(cubit.state);
// //   cubit.decrement();
// //   print(cubit.state);
// //   cubit.increment();
// //   print(cubit.state);
// //   cubit.increment();
// //   cubit.decrement();
// //   print(cubit.state);
// //   cubit.decrement();
// //   print(cubit.state);
// //   cubit.close();
// // }

// // Bloc for counter increment
// import 'package:equatable/equatable.dart';

// enum CounterEvents { increment, decrement }

// abstract class CounterEvent {}

// class Increment extends CounterEvent {}

// class Decrement extends CounterEvent {}

// class CounterBloc extends Bloc<CounterEvent, int> {
//   CounterBloc(int initialState) : super(initialState) {
//     on<Increment>((event, emit) => emit(state + 1));
//     on<Decrement>((event, emit) => emit(state - 1));
//   }
// }

// Future<void> main() async {
//   print('----------BLOC----------');

//   /// Create a `CounterBloc` instance.
//   final bloc = CounterBloc(0);

//   /// Access the state of the `bloc` via `state`.
//   print(bloc.state);

//   /// Interact with the `bloc` to trigger `state` changes.
//   bloc.add(Increment());

//   /// Wait for next iteration of the event-loop
//   /// to ensure event has been processed.
//   await Future<void>.delayed(Duration.zero);

//   /// Access the new `state`.
//   print(bloc.state);

//   bloc.add(Decrement());

//   await Future<void>.delayed(Duration.zero);

//   print(bloc.state);

//   bloc.add(Increment());

//   /// Wait for next iteration of the event-loop
//   /// to ensure event has been processed.
//   await Future<void>.delayed(Duration.zero);

//   /// Access the new `state`.
//   print(bloc.state);
//   bloc.add(Increment());

//   /// Wait for next iteration of the event-loop
//   /// to ensure event has been processed.
//   await Future<void>.delayed(Duration.zero);

//   /// Access the new `state`.
//   print(bloc.state);

//   bloc.add(Decrement());

//   /// Wait for next iteration of the event-loop
//   /// to ensure event has been processed.
//   await Future<void>.delayed(Duration.zero);

//   /// Access the new `state`.
//   print(bloc.state);
//   bloc.add(Increment());

//   /// Wait for next iteration of the event-loop
//   /// to ensure event has been processed.
//   await Future<void>.delayed(Duration.zero);

//   /// Access the new `state`.
//   print(bloc.state);

//   bloc.add(Increment());

//   /// Wait for next iteration of the event-loop
//   /// to ensure event has been processed.
//   await Future<void>.delayed(Duration.zero);
//   print(bloc.state);
//   bloc.add(Decrement());
//   await Future<void>.delayed(Duration.zero);
//   print(bloc.state);
//   bloc.add(Increment());

//   /// Wait for next iteration of the event-loop
//   /// to ensure event has been processed.
//   await Future<void>.delayed(Duration.zero);

//   /// Access the new `state`.
//   print(bloc.state);

//   /// Close the `bloc` when it is no longer needed.
//   await bloc.close();
// }

import 'package:bloc_workout/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text(widget.title)),
        body: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
                // Column is also a layout widget. It takes a list of children and
                // arranges them vertically. By default, it sizes itself to fit its
                // children horizontally, and tries to be as tall as its parent.
                //
                // Invoke "debug painting" (press "p" in the console, choose the
                // "Toggle Debug Paint" action from the Flutter Inspector in Android
                // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
                // to see the wireframe for each widget.
                //
                // Column has various properties to control how it sizes itself and
                // how it positions its children. Here we use mainAxisAlignment to
                // center the children vertically; the main axis here is the vertical
                // axis because Columns are vertical (the cross axis would be
                // horizontal).
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Text('You have pushed the button this many times:'),
              Text('$_counter', style: Theme.of(context).textTheme.headline4)
            ])),
        floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons
                .add)) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
