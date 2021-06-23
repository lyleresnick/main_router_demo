import 'package:main_router_demo/repo/factory/repository.dart';
import 'package:main_router_demo/ui/common/starter_bloc.dart';

import 'splash_use_case_output.dart';

class SplashUseCase with StarterBloc<SplashUseCaseOutput> {

    final Repository _repository;

    SplashUseCase(this._repository);
}
