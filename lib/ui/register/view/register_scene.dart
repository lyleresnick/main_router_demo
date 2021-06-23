import 'package:flutter/material.dart';
import 'package:main_router_demo/ui/common/bloc_builder.dart';
import 'package:main_router_demo/ui/common/buttons.dart';
import 'package:main_router_demo/ui/common/full_screen_loading_indicator.dart';
import 'package:main_router_demo/ui/common/programming_error.dart';
import 'package:main_router_demo/ui/register/presenter/register_presenter.dart';
import 'package:main_router_demo/ui/register/presenter/register_presenter_output.dart';

class RegisterScene extends StatelessWidget {
  final RegisterPresenter _presenter;

  RegisterScene(this._presenter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: SafeArea(
        child: BlocBuilder<RegisterPresenter, RegisterPresenterOutput>(
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
                    child: Center(
                        child: Column(children: [
                      Text("User Name:"),
                      TextField(
                        onChanged: _presenter.eventUserNameChanged,
                      ),
                      SizedBox(height: 8),
                      PrimaryButton(
                          text: "Submit",
                          onPressed: _presenter.eventSubmitted,
                          enabled: viewModel.isSubmitEnabled)
                    ])));
              } else {
                assert(false, "unknown event $data");
                return ProgrammingError("unknown event $data");
              }
            }),
      ),
    );
  }
}
