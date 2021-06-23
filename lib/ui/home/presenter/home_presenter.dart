import 'package:main_router_demo/ui/home/router/home_router.dart';
import 'package:main_router_demo/ui/home/use_case/home_use_case.dart';
import 'package:main_router_demo/ui/home/use_case/home_use_case_output.dart';
import 'package:main_router_demo/ui/common/starter_bloc.dart';

import 'home_presenter_output.dart';
import 'home_view_model.dart';

class HomePresenter with StarterBloc<HomePresenterOutput> {
  final HomeUseCase _useCase;
  final HomeRouter _router;

  HomePresenter(this._useCase, this._router) {
    _useCase.stream.listen((event) {
      if (event is PresentNotFound) {
        streamAdd(ShowNotFound());
      } else if (event is PresentModel) {
        streamAdd(ShowModel(HomeViewModel.fromPresentation(event.model)));
      } else {
        assert(false, "unknown event $event");
        return null;
      }
    });
  }

  void dispose() {
    _useCase.dispose();
    super.dispose();
  }
}
