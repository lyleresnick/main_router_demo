import 'package:flutter/material.dart';
import 'package:main_router_demo/ui/common/full_screen_loading_indicator.dart';
import 'package:main_router_demo/ui/splash/presenter/splash_presenter.dart';

class SplashScene extends StatelessWidget {
  final SplashPresenter _presenter;

  SplashScene(this._presenter);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue,child: FullScreenLoadingIndicator());
  }
}
