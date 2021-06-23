import 'package:main_router_demo/repo/factory/repository.dart';
import 'package:main_router_demo/ui/common/app_state.dart';
import 'package:main_router_demo/ui/main_router/presenter/main_router_presenter.dart';
import 'package:main_router_demo/ui/main_router/use_case/main_router_use_case.dart';
import 'package:main_router_demo/ui/main_router/view/main_router_scene.dart';

class MainRouterAssembly {
  final MainRouterScene scene;

  MainRouterAssembly._({required this.scene});

  factory MainRouterAssembly() {
    final useCase = MainRouterUseCase(Repository.repository, AppState.instance);
    final presenter = MainRouterPresenter(useCase);
    final scene = MainRouterScene(presenter);

    return MainRouterAssembly._(scene: scene);
  }
}
