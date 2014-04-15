library recipe_book_routing;

import 'package:angular/angular.dart';

void recipeBookRouteInitializer(Router router, RouteViewFactory views) {
  views.configure({
      'flags': ngRoute(
          defaultRoute: true,
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
    'flag-viewer': ngRoute(
        path: '/flag-viewer/:urlsafe_flagkey',
        mount: {
          'view': ngRoute(
              path: '/view',
              view: 'view/flag-viewer.html'),
          'edit': ngRoute(
              path: '/edit',
              view: 'view/flag-viewer.html'),
          'view_default': ngRoute(
              defaultRoute: true,
              enter: (RouteEnterEvent e) =>
                  router.go('view', {}, //Warning - backend redirects to this (hard coded) default route after uploading flag.
                      startingFrom: router.root.findRoute('flag-viewer'),
                      replace: true))
        })
  });
}