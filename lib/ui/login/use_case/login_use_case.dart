import 'package:main_router_demo/repo/factory/repository.dart';
import 'package:main_router_demo/ui/common/app_state.dart';
import 'package:main_router_demo/ui/common/starter_bloc.dart';
import 'package:main_router_demo/ui/login/use_case/login_presentation_model.dart';

import 'login_use_case_output.dart';

class LoginUseCase with StarterBloc<LoginUseCaseOutput> {
  final Repository _repository;
  final AppState _appState;

  String? _userName;
  bool get _isSubmitEnabled => _userName != null && _userName != "";

  LoginUseCase(this._repository, this._appState) {
    _refreshPresentation();
  }

  void eventUserNameChanged(String userName) {
    _userName = userName;
    _refreshPresentation();
  }

  void eventSubmitted() {
    final currentUser = _appState.currentUser;
    if (currentUser == null)
      streamAdd(PresentError("currentUser must not be null"));
    else {
      if (_userName == currentUser.name) streamAdd(PresentSubmitted());
    }
  }

  void eventClearUser() async {
    _appState.currentUser = null;
    await _repository.userManager.clear();
    streamAdd(PresentCurrentUserCleared());

  }

  _refreshPresentation({
    String? errorMessage,
    isWaiting = false,
  }) {
    streamAdd(PresentModel(LoginPresentationModel(
      isSubmitEnabled: _isSubmitEnabled,
      isWaiting: isWaiting,
      errorMessage: errorMessage,
    )));
  }
}
