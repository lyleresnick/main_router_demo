import 'package:main_router_demo/repo/factory/repository.dart';
import 'package:main_router_demo/ui/common/app_state.dart';
import 'package:main_router_demo/ui/register/presenter/register_presenter.dart';
import 'package:main_router_demo/ui/register/router/register_router.dart';
import 'package:main_router_demo/ui/register/use_case/register_use_case.dart';
import 'package:main_router_demo/ui/register/view/register_scene.dart';

class RegisterAssembly {

    final RegisterScene scene;

    RegisterAssembly._({required this.scene});

    factory RegisterAssembly(RegisterRouter router) {

        final useCase = RegisterUseCase(Repository.repository, AppState.instance);
        final presenter = RegisterPresenter(useCase, router);
        final scene = RegisterScene(presenter);

        return RegisterAssembly._(scene: scene);
    }
}