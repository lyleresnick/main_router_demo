import 'package:main_router_demo/ui/login/router/login_router.dart';
import 'package:main_router_demo/ui/login/use_case/login_use_case.dart';
import 'package:main_router_demo/ui/login/use_case/login_use_case_output.dart';
import 'package:main_router_demo/ui/common/starter_bloc.dart';

import 'login_presenter_output.dart';
import 'login_view_model.dart';

class LoginPresenter with StarterBloc<LoginPresenterOutput> {
  final LoginUseCase _useCase;
  final LoginRouter _router;

  LoginPresenter(this._useCase, this._router) {
    _useCase.stream.listen((event) {
      if (event is PresentSubmitted) {
        _router.routeLoginCompleted();
      } else if (event is PresentModel)
        streamAdd(ShowModel(LoginViewModel.fromPresentation(event.model)));
      else if (event is PresentCurrentUserCleared)
        _router.routeCurrentUserCleared();
      else if (event is PresentError) {
        streamAdd(ShowError(event.description));
      } else {
        assert(false, "unknown event $event");
        return null;
      }
    });
  }

  void eventUserNameChanged(String userName) {
    _useCase.eventUserNameChanged(userName);
  }

  void eventSubmitted() {
    _useCase.eventSubmitted();
  }

  void eventClearUser() {
    _useCase.eventClearUser();
  }

  void dispose() {
    _useCase.dispose();
    super.dispose();
  }
}
