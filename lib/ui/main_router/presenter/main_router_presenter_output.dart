abstract class MainRouterPresenterOutput  {}

class ShowSplash extends MainRouterPresenterOutput {}

class ShowLogin extends MainRouterPresenterOutput {}

class ShowRegister extends MainRouterPresenterOutput {}

class ShowHome extends MainRouterPresenterOutput {}

class ShowOnBoarding extends MainRouterPresenterOutput {}

class ShowError extends MainRouterPresenterOutput { final String description; ShowError(this.description);}
