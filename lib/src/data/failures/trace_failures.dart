//ignore_for_file: prefer-match-file-name

import 'package:hotel/core/failures/failure.dart';

class UnhandledFailure extends Failure {
  const UnhandledFailure(StackTrace T) : super(message: "Unhandled Failure");
}

class ParamsFailure extends Failure {
  const ParamsFailure(StackTrace T) : super(message: 'Invalid params');
}

class ServerFailure extends Failure {
  const ServerFailure(StackTrace T) : super(message: 'Server failure');
}

class BadRequestFailure extends Failure {
  const BadRequestFailure(StackTrace T) : super(message: 'Bad Request Error');
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure(StackTrace T) : super(message: 'Bad Request Error');
}

class ExtraFailure extends Failure {
  const ExtraFailure(StackTrace T) : super(message: 'Bad Request Error');
}

class IncorrectTopicIdFailure extends Failure {
  const IncorrectTopicIdFailure(StackTrace T) : super(message: 'Invalid Topic Id');
}

class IncorrectSectionIdFailure extends Failure {
  const IncorrectSectionIdFailure(StackTrace T) : super(message: 'Invalid Section Id');
}

class IncorrectFavoriteIdFailure extends Failure {
  const IncorrectFavoriteIdFailure(StackTrace T) : super(message: 'Invalid Favorite Id');
}

class IncorrectTopicTitleFailure extends Failure {
  const IncorrectTopicTitleFailure(StackTrace T) : super(message: 'Invalid Topic Title');
}

class IncorrectTopicParamsFailure extends Failure {
  const IncorrectTopicParamsFailure(StackTrace T) : super(message: 'Invalid Topic Parameters');
}
