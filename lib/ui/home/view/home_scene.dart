import 'package:flutter/material.dart';
import 'package:main_router_demo/ui/common/bloc_builder.dart';
import 'package:main_router_demo/ui/common/full_screen_loading_indicator.dart';
import 'package:main_router_demo/ui/common/programming_error.dart';
import 'package:main_router_demo/ui/home/presenter/home_presenter.dart';
import 'package:main_router_demo/ui/home/presenter/home_presenter_output.dart';

class HomeScene extends StatelessWidget {
  final HomePresenter _presenter;

  HomeScene(this._presenter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SafeArea(
        child: BlocBuilder<HomePresenter, HomePresenterOutput>(
            bloc: _presenter,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return FullScreenLoadingIndicator();
              }
              final data = snapshot.data;
              if (data is ShowModel) {
                final viewModel = data.viewModel;
                return Container(
                    color: Colors.greenAccent,
                    padding: EdgeInsets.all(8),
                    child:
                        Center(child: Text("${viewModel.name}, you are home")));
              } else if (data is ShowError) {
                return ProgrammingError("Error:  ${data.description}");
              } else {
                assert(false, "unknown event $data");
                return ProgrammingError("unknown event $data");
              }
            }),
      ),
    );
  }
}
