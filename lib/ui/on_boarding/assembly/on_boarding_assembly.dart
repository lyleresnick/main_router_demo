import 'package:main_router_demo/repo/factory/repository.dart';
import 'package:main_router_demo/ui/common/app_state.dart';
import 'package:main_router_demo/ui/on_boarding/presenter/on_boarding_presenter.dart';
import 'package:main_router_demo/ui/on_boarding/router/on_boarding_router.dart';
import 'package:main_router_demo/ui/on_boarding/use_case/on_boarding_use_case.dart';
import 'package:main_router_demo/ui/on_boarding/view/on_boarding_scene.dart';

class OnBoardingAssembly {

    final OnBoardingScene scene;

    OnBoardingAssembly._({required this.scene});

    factory OnBoardingAssembly(OnBoardingRouter router) {

        final useCase = OnBoardingUseCase(Repository.repository, AppState.instance);
        final presenter = OnBoardingPresenter(useCase, router);
        final scene = OnBoardingScene(presenter);

        return OnBoardingAssembly._(scene: scene);
    }
}