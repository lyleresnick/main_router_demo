import 'on_boarding_presentation_model.dart';

abstract class OnBoardingUseCaseOutput {}
class PresentModel extends OnBoardingUseCaseOutput { final OnBoardingPresentationModel model; PresentModel(this.model);}
class PresentError extends OnBoardingUseCaseOutput { final String description; PresentError(this.description);}

