import 'dart:async';
import 'dart:core';
import 'dart:io';
import './repository.dart' deferred as hello;

void main() async {
  final sub = getStream().listen(print, onDone: () => print('done'));
  await Future.delayed(Duration(seconds: 2), () => sub.cancel());
  // Добавление событий в Stream
  final streamController = StreamController<int>();
  streamController.sink.add(1);
  streamController.add(1);
  streamController.sink.add(3);
}

Stream<int> getStream() {
  final stream = Stream.periodic(
    Duration(seconds: 1),
    (count) => count++,
  );
  return stream;
}
/*
class A {
  A(Map<String, int> a) : value = a['a']!;

  final int value;

  factory A.h() {
    return A(1);
  }

  void hello() {}
}
*/