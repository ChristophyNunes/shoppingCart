import 'package:flutter/material.dart';
//import 'package:flutter_modular/flutter_modular.dart';

class PageRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  void _sendScreenView(PageRoute<dynamic> route) {
    var screenName = route.settings.name;
    // debugPrint('screenName $screenName');
    // debugPrint("#####");
    // debugPrint(screenName);
    debugPrint('ROUTER: $screenName');
    // debugPrint("#####");
    // do something with it, ie. send it to your analytics service collector
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    // debugPrint("didPush -> ");
    super.didPush(route, previousRoute);
    if (route is PageRoute) {
      _sendScreenView(route);
    }
  }

  // void didReplaceB({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
  //   // debugPrint("didReplace -> ");
  //   super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  //   if (newRoute is PageRoute) {
  //     _sendScreenView(newRoute);
  //   }
  // }

  // void didPopB(Route<dynamic> route, Route<dynamic> previousRoute) {
  //   // debugPrint("didPop -> ");
  //   super.didPop(route, previousRoute);
  //   if (previousRoute is PageRoute && route is PageRoute) {
  //     _sendScreenView(previousRoute);
  //   }
  // }
}
