import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

typedef SlideEffect<T> = ({
  VoidCallback clear,
  ValueSetter<Future<T>> mutate,
  AsyncSnapshot<T?> snapshot,
});

SlideEffect<T> useSideEffect<T>({bool preserveSate = true}) {
  final effect = useState<Future<T>?>(null);
  final snapshot = useFuture(effect.value, preserveState: preserveSate);
  void clear() => effect.value = null;
  void mutate(Future<T> future) => effect.value = future;
  return (clear: clear, mutate: mutate, snapshot: snapshot);
}
