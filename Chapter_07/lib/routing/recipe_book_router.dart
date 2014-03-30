library recipe_book_routing;

import 'package:angular/angular.dart';

void recipeBookRouteInitializer(Router router, RouteViewFactory views) {
  views.configure({
      'flags': ngRoute(
          path: '/flags',
          view: 'view/flags.html'),
      'upload': ngRoute(
          path: '/upload',
          view: 'view/upload.html'),
      'discus': ngRoute(
          path: '/discus',
          view: 'view/discus.html'),
      'about': ngRoute(
          path: '/about',
          view: 'view/about.html'),


//    'recipe': ngRoute(
//        path: '/recipe/:recipeId',
//        mount: {
//          'view': ngRoute(
//              path: '/view',
//              view: 'view/viewRecipe.html'),
//          'edit': ngRoute(
//              path: '/edit',
//              view: 'view/editRecipe.html'),
//          'view_default': ngRoute(
//              defaultRoute: true,
//              enter: (RouteEnterEvent e) =>
//                  router.go('view', {},
//                      startingFrom: router.root.findRoute('recipe'),
//                      replace: true))
//        })
  });
}