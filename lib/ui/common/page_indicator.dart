import 'package:flutter/material.dart';

class PageIndicator extends StatefulWidget {

  final int count;
  final int initialPage;
  PageIndicator({Key? key, required this.count, this.initialPage = 0}) : super(key: key);
  @override
  State<StatefulWidget> createState() => PageIndicatorState();
}

class PageIndicatorState extends State<PageIndicator> {

  late int _currentPageIndex;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = widget.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 35),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          for (int i = 0; i < widget.count; i++)
            _indicator(i == _currentPageIndex)
        ],
      ),
    );
  }

  set index(index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
          color: isActive ? Colors.black54 : Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

}




