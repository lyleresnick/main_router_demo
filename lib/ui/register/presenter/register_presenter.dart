import 'package:main_router_demo/ui/register/router/register_router.dart';
import 'package:main_router_demo/ui/register/use_case/register_use_case.dart';
import 'package:main_router_demo/ui/register/use_case/register_use_case_output.dart';
import 'package:main_router_demo/ui/common/starter_bloc.dart';

import 'register_presenter_output.dart';
import 'register_view_model.dart';

class RegisterPresenter with StarterBloc<RegisterPresenterOutput> {
  final RegisterUseCase _useCase;
  final RegisterRouter _router;

  RegisterPresenter(this._useCase, this._router) {
    _useCase.stream.listen((event) {
      if (event is PresentSubmitted) {
        _router.routeRegistrationComplete();
      } else if (event is PresentModel) {
        streamAdd(ShowModel(RegisterViewModel.fromPresentation(event.model)));
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

  void dispose() {
    _useCase.dispose();
    super.dispose();
  }
}
