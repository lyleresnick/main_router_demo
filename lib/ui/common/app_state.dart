import 'package:main_router_demo/repo/entities/user.dart';

class AppState {

    AppState._();

    static final instance = AppState._();
    User? currentUser;
}