import 'login_presentation_model.dart';

abstract class LoginUseCaseOutput {}

class PresentSubmitted extends LoginUseCaseOutput {}

class PresentModel extends LoginUseCaseOutput {
  final LoginPresentationModel model;
  PresentModel(this.model);
}

class PresentError extends LoginUseCaseOutput {
  final String description;
  PresentError(this.description);
}

class PresentCurrentUserCleared extends LoginUseCaseOutput {}
