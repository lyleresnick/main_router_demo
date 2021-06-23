import 'home_view_model.dart';

abstract class HomePresenterOutput {}
class ShowNotFound extends HomePresenterOutput{}
class ShowModel extends HomePresenterOutput { final HomeViewModel viewModel; ShowModel(this.viewModel);}

class ShowError extends HomePresenterOutput { final String description; ShowError(this.description);}
