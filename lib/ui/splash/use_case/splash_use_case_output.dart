import 'splash_presentation_model.dart';

abstract class SplashUseCaseOutput {}
class PresentNotFound extends SplashUseCaseOutput{}
class PresentModel extends SplashUseCaseOutput { final SplashPresentationModel model; PresentModel(this.model);}

