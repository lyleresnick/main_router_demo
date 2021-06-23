import 'package:main_router_demo/repo/factory/repository.dart';
import 'package:main_router_demo/ui/splash/presenter/splash_presenter.dart';
import 'package:main_router_demo/ui/splash/router/splash_router.dart';
import 'package:main_router_demo/ui/splash/use_case/splash_use_case.dart';
import 'package:main_router_demo/ui/splash/view/splash_scene.dart';

class SplashAssembly {

    final SplashScene scene;

    SplashAssembly._({required this.scene});

    factory SplashAssembly(SplashRouter router) {

        final useCase = SplashUseCase(Repository.repository);
        final presenter = SplashPresenter(useCase, router);
        final scene = SplashScene(presenter);

        return SplashAssembly._(scene: scene);
    }
}