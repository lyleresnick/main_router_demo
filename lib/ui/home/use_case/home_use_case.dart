import 'package:main_router_demo/repo/factory/repository.dart';
import 'package:main_router_demo/ui/common/app_state.dart';
import 'package:main_router_demo/ui/common/starter_bloc.dart';
import 'package:main_router_demo/ui/home/use_case/home_presentation_model.dart';

import 'home_use_case_output.dart';

class HomeUseCase with StarterBloc<HomeUseCaseOutput> {
  final Repository _repository;
  final AppState _appState;

  HomeUseCase(this._repository, this._appState) {
    final currentUser = _appState.currentUser;
    if (currentUser == null)
      streamAdd(PresentError("currentUser must not be null"));
    else
      streamAdd(PresentModel(HomePresentationModel(name: currentUser.name)));
  }
}
