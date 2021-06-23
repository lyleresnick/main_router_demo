import 'register_view_model.dart';

abstract class RegisterPresenterOutput {}
class ShowModel extends RegisterPresenterOutput { final RegisterViewModel viewModel; ShowModel(this.viewModel);}

