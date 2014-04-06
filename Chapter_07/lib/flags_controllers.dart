library flags_controller;

import 'package:angular/angular.dart';

import 'tooltip/tooltip_directive.dart';
import 'service/recipe.dart';
import 'service/query_service.dart';


@NgController(
    selector: '[flags]',
    publishAs: 'ctrl')
class FlagsController {
  List<Int> flags = [1,2];
  FlagsController() {
    print('in flags ctrl');
  }

}


@NgController(
    selector: '[upload]',
    publishAs: 'ctrl')
class UploadController {
  var x = "upload..";
  UploadController() {
    print('in upload ctrl');
  }
}



@NgController(
    selector: '[discus]',
    publishAs: 'ctrl')
class DiscusController {
  var z = "sup";
  DiscusController() {
    print('in discus ctrl');
  }

}


@NgController(
    selector: '[about]',
    publishAs: 'ctrl')
class AboutController {
  var y = "yoyo";
  AboutController() {
    print('in about ctrl');
  }

}


@NgController(
    selector: '[flag-viewer]',
    publishAs: 'ctrl')
class FlagViewer {
  String urlsafe_flagkey = "";
  FlagViewer(RouteProvider routeProvider) {
    print('in flag viewer ctrl');
    urlsafe_flagkey = routeProvider.parameters['urlsafe_flagkey'];
  }

}