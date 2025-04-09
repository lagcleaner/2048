sealed class Result<S, E extends Exception> {
  const Result();
  bool get isSuccess => false;
  bool get isFailure => false;
  S? get value;
}

final class Success<S, E extends Exception> extends Result<S, E> {
  const Success(this.value);

  @override
  final S value;
}

final class Failure<S, E extends Exception> extends Result<S, E> {
  const Failure(this.exception);
  final Exception exception;

  @override
  S? get value => null;
}
