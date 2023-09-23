import 'package:hotel/core/errors/errors.dart';

class BadRequestError extends Errors {
  const BadRequestError({required super.stackTrace});
}

class UnauthorizedError extends Errors {
  const UnauthorizedError({required super.stackTrace});
}

class ForbiddenError extends Errors {
  const ForbiddenError({required super.stackTrace});
}

class NotFoundError extends Errors {
  const NotFoundError({required super.stackTrace});
}

class InternalServerError extends Errors {
  const InternalServerError({required super.stackTrace});
}

class UndefiendError extends Errors {
  const UndefiendError({required super.stackTrace});
}
