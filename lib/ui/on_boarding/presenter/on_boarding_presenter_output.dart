import 'on_boarding_view_model.dart';

abstract class OnBoardingPresenterOutput {}
class ShowError extends OnBoardingPresenterOutput { final String description; ShowError(this.description);}
class ShowModel extends OnBoardingPresenterOutput { final OnBoardingViewModel viewModel; ShowModel(this.viewModel);}

