import 'package:main_router_demo/ui/register/use_case/register_presentation_model.dart';

class RegisterViewModel {
  final bool isSubmitEnabled;

  RegisterViewModel.fromPresentation(RegisterPresentationModel model)
      : isSubmitEnabled = model.isSubmitEnabled;
}
