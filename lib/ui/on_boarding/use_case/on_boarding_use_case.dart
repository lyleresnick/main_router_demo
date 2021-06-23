import 'package:main_router_demo/repo/entities/user.dart';
import 'package:main_router_demo/repo/factory/repository.dart';
import 'package:main_router_demo/ui/common/app_state.dart';
import 'package:main_router_demo/ui/common/starter_bloc.dart';

import 'on_boarding_presentation_model.dart';
import 'on_boarding_use_case_output.dart';

class OnBoardingUseCase with StarterBloc<OnBoardingUseCaseOutput> {
  final Repository _repository;
  final AppState _appState;
  late String _name;
  OnBoardingUseCase(this._repository, this._appState) {
    final currentUser = _appState.currentUser;
    if (currentUser == null)
      streamAdd(PresentError("currentUser must not be null"));
    else {
      _name = currentUser.name;
      _refreshPresentation();
    }
  }

  _refreshPresentation() {
    streamAdd(PresentModel(OnBoardingPresentationModel(name: _name)));
  }
}
