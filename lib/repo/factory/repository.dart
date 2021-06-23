
import 'package:main_router_demo/repo/factory/persistent_repository.dart';
import 'package:main_router_demo/repo/managers/user_manager.dart';
// import 'test_repository.dart';

enum _Implementation {
    test,
    networked
}

abstract class Repository {
    UserManager get userManager;

    static final gatewayImplementation = _Implementation.networked;

    static Repository? _repository;

    static get repository {
        if(_repository != null) return _repository;
        switch(gatewayImplementation) {
        // case _Implementation.test:
        //     _repository = TestRepository();
        //     break;
        case _Implementation.networked:
            _repository =  PersistentRepository();
            break;
        }
        return _repository;
    }
}