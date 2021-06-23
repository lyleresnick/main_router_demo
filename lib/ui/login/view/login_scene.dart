import 'package:flutter/material.dart';
import 'package:main_router_demo/ui/common/bloc_builder.dart';
import 'package:main_router_demo/ui/common/buttons.dart';
import 'package:main_router_demo/ui/common/full_screen_loading_indicator.dart';
import 'package:main_router_demo/ui/common/programming_error.dart';
import 'package:main_router_demo/ui/login/presenter/login_presenter.dart';
import 'package:main_router_demo/ui/login/presenter/login_presenter_output.dart';

class LoginScene extends StatelessWidget {
  final LoginPresenter _presenter;

  LoginScene(this._presenter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SafeArea(
        child: BlocBuilder<LoginPresenter, LoginPresenterOutput>(
            bloc: _presenter,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return FullScreenLoadingIndicator();
              }
              final data = snapshot.data;
              if (data is ShowModel) {
                final viewModel = data.viewModel;
                return Container(
                    color: Colors.redAccent,
                    padding: EdgeInsets.all(8),
                    child: Center(
                        child: Column(children: [
                      Text("User Name:"),
                      TextField(
                        onChanged: _presenter.eventUserNameChanged,
                      ),
                      SizedBox(height: 64),
                      PrimaryButton(
                          text: "Submit",
                          onPressed: _presenter.eventSubmitted,
                          enabled: viewModel.isSubmitEnabled),
                      SizedBox(height: 8),
                      SecondaryButton(
                          text: "Clear Current User",
                          onPressed: _presenter.eventClearUser)
                    ])));
              } else if (data is ShowError) {
                  assert(false, "Error:  ${data.description}");
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
