import 'package:main_router_demo/ui/home/use_case/home_presentation_model.dart';

class HomeViewModel {
  final String name;

  HomeViewModel.fromPresentation(HomePresentationModel model)
      : name = model.name;
}
