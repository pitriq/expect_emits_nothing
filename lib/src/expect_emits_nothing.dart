import 'package:test/test.dart';

Future<void> expectEmitsNothing<T>({
  required Stream<T> stream,
  required Future<void> Function() act,
}) async {
  final emitted = <T>[];
  final subscription = stream.listen((status) => emitted.add(status));
  await act.call();
  subscription.cancel();
  await Future<void>.delayed(Duration.zero);
  expect(emitted, []);
}
