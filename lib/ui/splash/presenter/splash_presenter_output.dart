import 'splash_view_model.dart';

abstract class SplashPresenterOutput {}
class ShowNotFound extends SplashPresenterOutput{}
class ShowModel extends SplashPresenterOutput { final SplashViewModel viewModel; ShowModel(this.viewModel);}

