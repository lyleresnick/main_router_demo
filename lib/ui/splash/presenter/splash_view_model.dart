import 'package:main_router_demo/ui/splash/use_case/splash_presentation_model.dart';

class SplashViewModel {
  final String? errorMessage;
  final bool isWaiting;

  SplashViewModel.fromPresentation(SplashPresentationModel model)
      : errorMessage = model.errorMessage, isWaiting = model.isWaiting;
}
