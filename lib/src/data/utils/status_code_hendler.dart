import 'package:dartz/dartz.dart';
import 'package:hotel/src/data/data_errors/data_errors.dart';

class StatusCodeHandler {
  static Unit check(String code) {
    switch (code) {
      case '200':
        return unit;
      case '400':
        throw const BadRequestError(stackTrace: StackTrace.empty);
      case '401':
        throw const UnauthorizedError(stackTrace: StackTrace.empty);
      case '403':
        throw const ForbiddenError(stackTrace: StackTrace.empty);
      case '404':
        throw const NotFoundError(stackTrace: StackTrace.empty);
      case '500':
        throw const InternalServerError(stackTrace: StackTrace.empty);
      default:
        throw const UndefiendError(stackTrace: StackTrace.empty);
    }
  }
}
