import 'package:main_router_demo/ui/splash/router/splash_router.dart';
import 'package:main_router_demo/ui/splash/use_case/splash_use_case.dart';
import 'package:main_router_demo/ui/splash/use_case/splash_use_case_output.dart';
import 'package:main_router_demo/ui/common/starter_bloc.dart';

import 'splash_presenter_output.dart';
import 'splash_view_model.dart';

class SplashPresenter with StarterBloc<SplashPresenterOutput> {
  final SplashUseCase _useCase;
  final SplashRouter _router;

  SplashPresenter(this._useCase, this._router) {
    _useCase.stream.listen((event) {
      if (event is PresentNotFound) {
        streamAdd(ShowNotFound());
      } else if (event is PresentModel) {
        streamAdd(ShowModel(SplashViewModel.fromPresentation(event.model)));
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
