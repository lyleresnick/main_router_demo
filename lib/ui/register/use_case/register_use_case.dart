import 'package:main_router_demo/repo/entities/user.dart';
import 'package:main_router_demo/repo/factory/repository.dart';
import 'package:main_router_demo/repo/managers/result.dart';
import 'package:main_router_demo/repo/managers/user_manager.dart';
import 'package:main_router_demo/ui/common/app_state.dart';
import 'package:main_router_demo/ui/common/starter_bloc.dart';
import 'package:main_router_demo/ui/register/use_case/register_presentation_model.dart';

import 'register_use_case_output.dart';

class RegisterUseCase with StarterBloc<RegisterUseCaseOutput> {
  final Repository _repository;
  final AppState _appState;
  String? _userName;


  bool get _isSubmitEnabled => _userName != null && _userName != "";

  RegisterUseCase(this._repository, this._appState) {
    _refreshPresentation();
  }

  void eventUserNameChanged(String userName) {
    _userName = userName;
    _refreshPresentation();
  }

  void eventSubmitted() async {
    final result = await _repository.userManager.create(_userName!);
    if ( result is UserSuccessResult) {
      _appState.currentUser = result.data;
      streamAdd(PresentSubmitted());
    }
    // this will never happen
    //else
  }

  _refreshPresentation() {
    streamAdd(PresentModel(RegisterPresentationModel(
      isSubmitEnabled: _isSubmitEnabled,
    )));
  }
}
