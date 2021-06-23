import 'package:flutter/material.dart';
import 'package:main_router_demo/ui/common/bloc_builder.dart';
import 'package:main_router_demo/ui/common/bloc_provider.dart';
import 'package:main_router_demo/ui/common/buttons.dart';
import 'package:main_router_demo/ui/common/full_screen_loading_indicator.dart';
import 'package:main_router_demo/ui/common/page_indicator.dart';
import 'package:main_router_demo/ui/common/programming_error.dart';
import 'package:main_router_demo/ui/on_boarding/presenter/on_boarding_presenter.dart';
import 'package:main_router_demo/ui/on_boarding/presenter/on_boarding_presenter_output.dart';

class OnBoardingScene extends StatelessWidget {
  final OnBoardingPresenter _presenter;
  final _pageIndicatorKey = GlobalKey<PageIndicatorState>();

  OnBoardingScene(this._presenter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OnBoarding"),
      ),
      body: SafeArea(
        child: BlocBuilder<OnBoardingPresenter, OnBoardingPresenterOutput>(
            bloc: _presenter,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return FullScreenLoadingIndicator();
              }
              final data = snapshot.data;
              if (data is ShowModel) {
                final viewModel = data.viewModel;
                return Stack(children: [
                  PageView(
                    controller:
                        PageController(),
                    children: [
                        _PageOne(name: viewModel.name),
                        _PageTwo(name: viewModel.name),
                        _PageThree(name: viewModel.name),
                    ],
                    onPageChanged: (int index) {
                      _pageIndicatorKey.currentState!.index = index;
                    },
                  ),
                  Container(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: PageIndicator(
                          key: _pageIndicatorKey,
                          count: 3,
                        )),
                  )
                ]);
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

class _PageOne extends StatelessWidget {
  final String name;
  _PageOne({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purpleAccent,
      padding: EdgeInsets.all(8),
      child: Center(
        child: Text("Hello, $name"),
      ),
    );
  }
}

class _PageTwo extends StatelessWidget {
  final String name;
  _PageTwo({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.pinkAccent,
        padding: EdgeInsets.all(8),
        child: Center(
          child: Text("Hello again, $name"),
        ));
  }
}

class _PageThree extends StatelessWidget {
  final String name;

  _PageThree({required this.name});

  @override
  Widget build(BuildContext context) {
    final presenter = BlocProvider.of<OnBoardingPresenter>(context);

    return Container(
        color: Colors.deepPurpleAccent,
        padding: EdgeInsets.all(8),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                  children: [
            Text("Hello again $name"),
            SizedBox(height: 64),
            PrimaryButton(
              text: "Done",
              onPressed: presenter!.eventDone,
            ),
          ]),
        ));
  }
}
