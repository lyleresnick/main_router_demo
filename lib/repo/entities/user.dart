
class User {
  final bool onBoardingComplete;
  final String name;

  User(
      {required this.onBoardingComplete,
        required this.name});

  static User? fromJson(Map<String, dynamic> json) {
    try {
      final onBoardingComplete = json['onBoardingComplete'] as bool?;
      if (onBoardingComplete == null) throw FormatException();
      final name = json['name'] as String?;
      if (name == null) throw FormatException();

      return User(
        onBoardingComplete: onBoardingComplete,
        name: name,
      );
    } catch (e) {
      return null;
    }
  }

  Map<String, dynamic> toJson() {
    var json = Map<String, dynamic>();
    json['onBoardingComplete'] = onBoardingComplete;
    json['name'] = name;
    return json;
  }

  }
