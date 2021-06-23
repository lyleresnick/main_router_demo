import 'package:main_router_demo/ui/on_boarding/use_case/on_boarding_presentation_model.dart';

class OnBoardingViewModel {
  final String name;

  OnBoardingViewModel.fromPresentation(OnBoardingPresentationModel model)
      : name = model.name;
}
