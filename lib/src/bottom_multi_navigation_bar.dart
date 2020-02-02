import 'package:bottommultinavigationbar/src/page_navigator.dart';
import 'package:flutter/material.dart';


class BottomMultiNavigationBar extends StatefulWidget {
  
  final List<PageNavigator> pageNavigators;
  final int index;
  final Function(int index) onIndexChanged;
  
  const BottomMultiNavigationBar({
    @required this.pageNavigators,
    @required this.index,
    this.onIndexChanged
    });

  @override
  _BottomMultiNavigationBarState createState() => _BottomMultiNavigationBarState();
}

class _BottomMultiNavigationBarState extends State<BottomMultiNavigationBar> {

  List<BottomNavigationBarItem> _bottomNavigationBarItems = [];

  @override
  void initState() {
    super.initState();
    setUpNavigationBar();
  }

  void setUpNavigationBar() {
    for(int i = 0; i < widget.pageNavigators.length;i++) {
        _bottomNavigationBarItems.add(BottomNavigationBarItem(
          title: Text(widget.pageNavigators[i].bottomNavigationText),
          icon: widget.pageNavigators[i].bottomNavigationIcon
        ));
    }
  }

  Widget buildOffstageNavigation(int index) {
    return Offstage(
      offstage: widget.index != index,
      child: Navigator(
        onGenerateRoute: widget.pageNavigators[index].onGenerateRoute,
        key: widget.pageNavigators[index].key,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async { return !await widget.pageNavigators[widget.index].key.currentState.maybePop(); },
      child: Scaffold(
        body: Stack(
          children: widget.pageNavigators.map((page) {
              int index = widget.pageNavigators.indexOf(page);
              return buildOffstageNavigation(index);
          }).toList()
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white
          ),
          child: BottomNavigationBar(
            //selectedItemColor: VidlyCorp.primaryColor,
            //unselectedItemColor: VidlyCorp.darkMode,
            currentIndex: widget.index,
            onTap: (index) {
                widget.onIndexChanged(index);
            },
            items: _bottomNavigationBarItems,
          ),
        )
      ),
    );
  }
}
