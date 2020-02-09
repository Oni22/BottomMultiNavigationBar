import 'package:bottommultinavigationbar/src/page_navigator.dart';
import 'package:flutter/material.dart';


class BottomMultiNavigationBar extends StatefulWidget {
  
  final List<PageNavigator> pageNavigators;
  final int index;
  final Function(int index) onIndexChanged;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final Color backgroundColor;
  final double selectedFontSize;
  final double unselectedFontSize;
  final TextStyle selectedLabelStyle;
  final IconThemeData selectedIconTheme;
  final bool showSelectedLabels;
  final bool showUnselectedLabels;
  final Color fixedColor;
  final double elevation;
  final double iconSize;
  final IconThemeData unselectedIconTheme;
  final TextStyle unselectedLabelStyle;
  final BottomNavigationBarType type;
  
  BottomMultiNavigationBar({
    Key key,
    @required this.pageNavigators,
    @required this.index,
    this.onIndexChanged,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.backgroundColor,
    this.selectedFontSize,
    this.elevation,
    this.fixedColor,
    this.iconSize,
    this.selectedIconTheme,
    this.selectedLabelStyle,
    this.showSelectedLabels,
    this.showUnselectedLabels,
    this.type,
    this.unselectedFontSize,
    this.unselectedIconTheme,
    this.unselectedLabelStyle
    }) : super();

  @override
  _BottomMultiNavigationBarState createState() => _BottomMultiNavigationBarState();
}

class _BottomMultiNavigationBarState extends State<BottomMultiNavigationBar> {

  List<BottomNavigationBarItem> _bottomNavigationBarItems = [];

  @override
  void initState() {
    super.initState();
    _setUpNavigationBar();
  }

  void _setUpNavigationBar() {
    for(int i = 0; i < widget.pageNavigators.length;i++) {
        _bottomNavigationBarItems.add(BottomNavigationBarItem(
          backgroundColor: widget.pageNavigators[i].backgroundColor,
          activeIcon: widget.pageNavigators[i].activeIcon,
          title: Text(widget.pageNavigators[i].bottomNavigationText),
          icon: widget.pageNavigators[i].bottomNavigationIcon
        ));
    }
  }

  Widget _buildOffstageNavigation(int index) {
    return Offstage(
      offstage: widget.index != index,
      child: Navigator(
        initialRoute: widget.pageNavigators[index].initialRoute ?? "/",
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
              return _buildOffstageNavigation(index);
          }).toList()
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: widget.backgroundColor
          ),
          child: BottomNavigationBar(
            selectedItemColor: widget.selectedItemColor,
            unselectedItemColor: widget.unselectedItemColor,
            currentIndex: widget.index,
            selectedFontSize: widget.selectedFontSize ?? 14.0,
            selectedLabelStyle: widget.selectedLabelStyle,
            selectedIconTheme: widget.selectedIconTheme,
            showSelectedLabels: widget.showUnselectedLabels,
            showUnselectedLabels: widget.showUnselectedLabels,
            backgroundColor: widget.backgroundColor,
            fixedColor: widget.fixedColor,
            elevation: widget.elevation ?? 8.0,
            iconSize: widget.iconSize ?? 24.0,
            unselectedFontSize: widget.unselectedFontSize ?? 12.0,
            unselectedIconTheme: widget.unselectedIconTheme,
            unselectedLabelStyle: widget.unselectedLabelStyle,
            type: widget.type ?? BottomNavigationBarType.fixed,
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
