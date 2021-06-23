import 'home_presentation_model.dart';

abstract class HomeUseCaseOutput {}
class PresentNotFound extends HomeUseCaseOutput{}
class PresentModel extends HomeUseCaseOutput { final HomePresentationModel model; PresentModel(this.model);}

class PresentError extends HomeUseCaseOutput {
    final String description;
    PresentError(this.description);
}
