import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Func {
  static String convertName(Key? key) {
    String strReturn = key.toString();
    strReturn = strReturn.replaceAll("[<'", "");
    strReturn = strReturn.replaceAll("'>]", "");
    return strReturn;
  }

  static GoRoute addGoRouter(Widget modules,
      {bool isSubModule = true, String? pathParams}) {
    String strName = Func.convertName(modules.key);
    String strPath = strName;
    if (!isSubModule) strPath = "/$strPath";
    if (pathParams != null) strPath += pathParams;
    return GoRoute(
      name: strName,
      path: strPath,
      pageBuilder: (context, state) {
        return effectTransitionFade(state, modules);
      },
    );
  }

  static GoRoute addGoRouterParent(Widget modules, List<GoRoute> submodules) {
    String strName = Func.convertName(modules.key);
    String strPath = (strName == 'home') ? "" : "/$strName";
    return GoRoute(
        name: strName,
        path: strPath,
        pageBuilder: (context, state) => effectTransitionFade(state, modules),
        routes: submodules);
  }

  static CustomTransitionPage effectTransitionFade(GoRouterState state, Widget child) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      // transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
                    begin: const Offset(0, 0.05), end: const Offset(0, 0))
                .animate(CurvedAnimation(
                    parent: animation, curve: Curves.easeInOutCirc)),
            child: child,
          ),
        );
      },
    );
  }
}
