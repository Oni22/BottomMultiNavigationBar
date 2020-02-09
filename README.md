# bottommultinavigationbar

A bottom multi navigation bar with navigation for each fragment

## Getting Started

### 1. import bottommultinavigationbar

´´´dart 
import 'package:bottommultinavigationbar/bottommultinavigationbar.dart';
´´´

### 2. Create a list of PageNavigators:

´´´dart 
var pages = [
  PageNavigator(
    bottomNavigationIcon: Icon(Icons.ac_unit),
    bottomNavigationText: "Page 1",
    initialRoute: "/page2",
    onGenerateRoute: (settings) {
      if(settings.name == PageNavigator.home)
        return MaterialPageRoute(builder: (_) => Test(test:"Page 1 - 1",index: 0,));
      if(settings.name == "/page2")
        return MaterialPageRoute(builder: (_) => Test(test:"Page 1 - 2",index: 0));
    }
  ),
  PageNavigator(
    bottomNavigationIcon: Icon(Icons.ac_unit),
    bottomNavigationText: "Page 2",
    onGenerateRoute: (settings) {
      if(settings.name == PageNavigator.home)
        return MaterialPageRoute(builder: (_) => Test(test:"Page 2 - 1",index: 1,));
      if(settings.name == "/page2-2")
        return MaterialPageRoute(builder: (_) => Test(test:"Page 2 - 2",index: 1,));
    }
  ),
];
´´´
Be sure that you use "/" in your namings like "/page1". PageNavigator.home represents the home page of the fragment. From there the navigator will navigate to your pages inside of the fragment without leaving the bottom navigation view. With the "initialRoute" attribute you can specify a different start point for each of your fragment.

### 3. Use the BottomMultiNavigationBar Widget

´´´dart
  @override
  Widget build(BuildContext context) {
    return BottomMultiNavigationBar(
      index: myCounter
      pageNavigators: pages,
      onIndexChanged: (index) {
        setState({
          myCounter = index
        })
      },
    );
  }
´´´



