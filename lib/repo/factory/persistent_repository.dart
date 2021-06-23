import 'package:main_router_demo/repo/managers/persistent_user_manager.dart';
import 'package:main_router_demo/repo/managers/user_manager.dart';
import 'package:main_router_demo/repo/factory/repository.dart';

class PersistentRepository extends Repository {
    UserManager _userManager;

  PersistentRepository()
   :_userManager = PersistentUserManager()
   ;

  @override get userManager => _userManager;
}
