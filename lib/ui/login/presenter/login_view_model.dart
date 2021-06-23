import 'package:main_router_demo/ui/login/use_case/login_presentation_model.dart';

class LoginViewModel {
  final String? errorMessage;
  final bool isWaiting;
  final bool isSubmitEnabled;

  LoginViewModel.fromPresentation(LoginPresentationModel model)
      : isSubmitEnabled = model.isSubmitEnabled, errorMessage = model.errorMessage, isWaiting = model.isWaiting;
}
