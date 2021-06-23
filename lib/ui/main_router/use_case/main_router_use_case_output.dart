abstract class MainRouterUseCaseOutput {}

class PresentSplash extends MainRouterUseCaseOutput {}

class PresentLogin extends MainRouterUseCaseOutput {}

class PresentRegister extends MainRouterUseCaseOutput {}

class PresentHome extends MainRouterUseCaseOutput {}

class PresentOnBoarding extends MainRouterUseCaseOutput {}

class PresentError extends MainRouterUseCaseOutput {
  final String description;
  PresentError(this.description);
}
