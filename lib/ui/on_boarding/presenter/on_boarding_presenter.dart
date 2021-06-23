import 'package:main_router_demo/ui/on_boarding/router/on_boarding_router.dart';
import 'package:main_router_demo/ui/on_boarding/use_case/on_boarding_use_case.dart';
import 'package:main_router_demo/ui/on_boarding/use_case/on_boarding_use_case_output.dart';
import 'package:main_router_demo/ui/common/starter_bloc.dart';

import 'on_boarding_presenter_output.dart';
import 'on_boarding_view_model.dart';

class OnBoardingPresenter with StarterBloc<OnBoardingPresenterOutput> {
  final OnBoardingUseCase _useCase;
  final OnBoardingRouter _router;

  OnBoardingPresenter(this._useCase, this._router) {
    _useCase.stream.listen((event) {
      if (event is PresentModel)
        streamAdd(ShowModel(OnBoardingViewModel.fromPresentation(event.model)));
       else if (event is PresentError) {
          streamAdd(ShowError(event.description));
      } else {
        assert(false, "unknown event $event");
        return null;
      }
    });
  }

  void eventDone() {
    _router.routeOnBoardingCompleted();
  }

  void dispose() {
    _useCase.dispose();
    super.dispose();
  }
}
