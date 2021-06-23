import 'package:main_router_demo/ui/common/starter_bloc.dart';
import 'package:main_router_demo/ui/home/router/home_router.dart';
import 'package:main_router_demo/ui/login/router/login_router.dart';
import 'package:main_router_demo/ui/main_router/use_case/main_router_use_case.dart';
import 'package:main_router_demo/ui/main_router/use_case/main_router_use_case_output.dart';
import 'package:main_router_demo/ui/on_boarding/router/on_boarding_router.dart';
import 'package:main_router_demo/ui/register/router/register_router.dart';
import 'package:main_router_demo/ui/splash/router/splash_router.dart';

import 'main_router_presenter_output.dart';

class MainRouterPresenter with StarterBloc<MainRouterPresenterOutput>
    implements SplashRouter, RegisterRouter, OnBoardingRouter, HomeRouter, LoginRouter {
  MainRouterUseCase _useCase;

  MainRouterPresenter(this._useCase) {
    _useCase.stream.listen((event) {
      if (event is PresentSplash)
        streamAdd(ShowSplash());
      else if (event is PresentLogin)
        streamAdd(ShowLogin());
      else if (event is PresentOnBoarding)
        streamAdd(ShowOnBoarding());
      else if (event is PresentHome)
        streamAdd(ShowHome());
      else if (event is PresentRegister)
        streamAdd(ShowRegister());
      else if (event is PresentError)
        streamAdd(ShowError(event.description));
      else {
        assert(false, "unknown event $event");
        return null;
      }
    });
  }

  @override
  void dispose() {
    _useCase.dispose();
    super.dispose();
  }

  @override
  void routeRegistrationComplete() {
    streamAdd(ShowOnBoarding());
  }

  @override
  void routeOnBoardingCompleted() {
    _useCase.eventOnBoardingCompleted();
  }

  // LoginRouter

  @override
  void routeLoginCompleted() {
    _useCase.eventLoginCompleted();
  }

  @override
  void routeCurrentUserCleared() {
    streamAdd(ShowRegister());
  }

}
