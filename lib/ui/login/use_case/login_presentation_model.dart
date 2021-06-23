

class LoginPresentationModel {
  final String? errorMessage;
  final bool isWaiting;
  final bool isSubmitEnabled;

  LoginPresentationModel({required this.isSubmitEnabled, this.errorMessage, this.isWaiting = false});
}
