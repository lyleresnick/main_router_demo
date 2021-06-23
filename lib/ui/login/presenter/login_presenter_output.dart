import 'login_view_model.dart';

abstract class LoginPresenterOutput {}
class ShowModel extends LoginPresenterOutput { final LoginViewModel viewModel; ShowModel(this.viewModel);}
class ShowError extends LoginPresenterOutput { final String description; ShowError(this.description);}

