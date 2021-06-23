import 'package:main_router_demo/repo/entities/user.dart';
import 'package:main_router_demo/repo/managers/result.dart';

enum  UserSemanticEvent {
  notFound,
}

typedef UserResult = Result<User, UserSemanticEvent>;
typedef UserSuccessResult = SuccessResult<User, UserSemanticEvent>;
typedef UserFailureResult = FailureResult<User, UserSemanticEvent>;
typedef UserSemanticResult = SemanticErrorResult<User, UserSemanticEvent>;

abstract class UserManager {
  Future<UserResult> fetch();
  Future<UserResult> create(String name);
  Future<UserResult> update(bool onBoarded);
  Future<void> clear();
}

