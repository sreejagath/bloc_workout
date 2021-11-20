//StreamBasic
Stream<int> boatStream() async* {
  for (int i = 1; i <= 10; i++) {
    print('SENT boat no:' + i.toString());
    await Future.delayed(Duration(seconds: 2));
    yield i;
  }
}

void main() async {
  Stream<int> stream = boatStream();
  stream.listen((data) => print('RECEIVED boat no:' + data.toString()));
}

