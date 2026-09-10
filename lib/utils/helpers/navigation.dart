import 'package:flutter/material.dart';
void pushToScreen(BuildContext context, String routeName,[Map<String,dynamic>? args]) {
  Navigator.pushNamed(context,routeName,arguments: args );
}
void popAndNavigateToScreen(BuildContext context, String routeName,[Map<String,dynamic>? args]) {
  Navigator.pushReplacementNamed(context, routeName,arguments: args);
}
void popAllAndNavigateToScreen(BuildContext context, String routeName,[Map<String,dynamic>? args]) {
  Navigator.pushNamedAndRemoveUntil(
    context,
    routeName,
    arguments: args,
        (route) {
      return false;
    },
  );
}
void popAllScreenUntil(BuildContext context, String routeName) {
  Navigator.of(context).popUntil((route) {
    print(route.settings.name);
    // Keep popping until reaching the route where the target screen is NOT the current screen
    return route.settings.name == routeName;
  });
}


