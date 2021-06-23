import 'register_presentation_model.dart';

abstract class RegisterUseCaseOutput {}
class PresentSubmitted extends RegisterUseCaseOutput{}
class PresentModel extends RegisterUseCaseOutput { final RegisterPresentationModel model; PresentModel(this.model);}
class PresentError extends RegisterUseCaseOutput { final String description; PresentError(this.description);}

