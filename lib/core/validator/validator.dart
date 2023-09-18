import 'dart:async';

abstract class Validator<T> {
  FutureOr<bool> validate(T t);
}
