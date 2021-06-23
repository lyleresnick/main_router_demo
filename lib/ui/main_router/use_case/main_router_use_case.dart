import 'dart:async';

import 'package:main_router_demo/repo/managers/user_manager.dart';
import 'package:main_router_demo/ui/common/app_state.dart';
import 'package:main_router_demo/ui/common/starter_bloc.dart';
import 'package:main_router_demo/repo/factory/repository.dart';
import 'main_router_use_case_output.dart';

class MainRouterUseCase with StarterBloc<MainRouterUseCaseOutput> {
  final Repository _repository;
  final AppState _appState;

  MainRouterUseCase(this._repository, this._appState) {
    initialize();
  }

  Future<void> initialize() async {
    streamAdd(PresentSplash());
    late MainRouterUseCaseOutput nextPresentation;
    final result = await _repository.userManager.fetch();
    if (result is UserSuccessResult) {
      _appState.currentUser = result.data;
      nextPresentation = PresentLogin();
    } else if (result is UserSemanticResult) {
      switch(result.reason) {
        case UserSemanticEvent.notFound:
        nextPresentation = PresentRegister();
        break;
      }
    }
    else if (result is UserFailureResult)
      nextPresentation = PresentError("${result.description}");

    Timer(Duration(seconds: 3), () => streamAdd(nextPresentation));
  }

  void eventOnBoardingCompleted() async {
    final result = await _repository.userManager.update(true);
    if (result is UserSuccessResult) {
      _appState.currentUser = result.data;
      streamAdd(PresentHome());
    }
    // else always returns success
  }

  void eventLoginCompleted() async {
    final currentUser = _appState.currentUser;
    if (currentUser != null) {
      if (currentUser.onBoardingComplete)
        streamAdd(PresentHome());
      else
        streamAdd(PresentOnBoarding());
    } else {
      streamAdd(PresentError("currentUser must not be null"));
    }
  }
}
