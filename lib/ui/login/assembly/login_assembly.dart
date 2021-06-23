import 'package:main_router_demo/repo/factory/repository.dart';
import 'package:main_router_demo/ui/common/app_state.dart';
import 'package:main_router_demo/ui/login/presenter/login_presenter.dart';
import 'package:main_router_demo/ui/login/router/login_router.dart';
import 'package:main_router_demo/ui/login/use_case/login_use_case.dart';
import 'package:main_router_demo/ui/login/view/login_scene.dart';

class LoginAssembly {

    final LoginScene scene;

    LoginAssembly._({required this.scene});

    factory LoginAssembly(LoginRouter router) {

        final useCase = LoginUseCase(Repository.repository, AppState.instance);
        final presenter = LoginPresenter(useCase, router);
        final scene = LoginScene(presenter);

        return LoginAssembly._(scene: scene);
    }
}