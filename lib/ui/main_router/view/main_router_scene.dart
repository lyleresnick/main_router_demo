import 'package:flutter/material.dart';
import 'package:main_router_demo/ui/common/bloc_builder.dart';
import 'package:main_router_demo/ui/common/bloc_provider.dart';
import 'package:main_router_demo/ui/common/programming_error.dart';
import 'package:main_router_demo/ui/home/assembly/home_assembly.dart';
import 'package:main_router_demo/ui/login/assembly/login_assembly.dart';
import 'package:main_router_demo/ui/main_router/assembly/main_router_assembly.dart';
import 'package:main_router_demo/ui/main_router/presenter/main_router_presenter.dart';
import 'package:main_router_demo/ui/main_router/presenter/main_router_presenter_output.dart';
import 'package:main_router_demo/ui/on_boarding/assembly/on_boarding_assembly.dart';
import 'package:main_router_demo/ui/register/assembly/register_assembly.dart';
import 'package:main_router_demo/ui/splash/assembly/splash_assembly.dart';

class MainRouterScene extends StatelessWidget {
  final MainRouterPresenter presenter;
  static const pageTransitionDuration = const Duration(milliseconds: 400);

  MainRouterScene(this.presenter);

  factory MainRouterScene.assembled() {
    return MainRouterAssembly().scene;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainRouterPresenter, MainRouterPresenterOutput>(
        bloc: presenter,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              color: Colors.grey,
            );
          }
          return AnimatedSwitcher(
            duration: pageTransitionDuration,
            child: _childFromData(snapshot.data!),
          );
        });
  }

  // ignore: missing_return
  Widget _childFromData(MainRouterPresenterOutput data) {
    switch (data.runtimeType) {
      case ShowSplash:
        return SplashAssembly(presenter).scene;
      case ShowRegister:
        return RegisterAssembly(presenter).scene;
      case ShowLogin:
        return LoginAssembly(presenter).scene;
      case ShowHome:
        return HomeAssembly(presenter).scene;
      case ShowOnBoarding:
        return OnBoardingAssembly(presenter).scene;
      case ShowError:
        return ProgrammingError("Error: ${(data as ShowError).description}");
      default:
        assert(false, 'Invalid route: ${data.runtimeType}');
        return ProgrammingError('Invalid route: ${data.runtimeType}');
    }
  }
}
