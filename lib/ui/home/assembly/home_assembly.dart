import 'package:main_router_demo/repo/factory/repository.dart';
import 'package:main_router_demo/ui/common/app_state.dart';
import 'package:main_router_demo/ui/home/presenter/home_presenter.dart';
import 'package:main_router_demo/ui/home/router/home_router.dart';
import 'package:main_router_demo/ui/home/use_case/home_use_case.dart';
import 'package:main_router_demo/ui/home/view/home_scene.dart';

class HomeAssembly {

    final HomeScene scene;

    HomeAssembly._({required this.scene});

    factory HomeAssembly(HomeRouter router) {

        final useCase = HomeUseCase(Repository.repository, AppState.instance);
        final presenter = HomePresenter(useCase, router);
        final scene = HomeScene(presenter);

        return HomeAssembly._(scene: scene);
    }
}