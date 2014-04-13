library flags_controller;

import 'package:angular/angular.dart';

import 'tooltip/tooltip_directive.dart';
import 'service/recipe.dart';
import 'service/query_service.dart';
import 'package:angular_dart_demo/login_controller.dart';


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
  String upload_url;
  UploadController(LoginController lc) {
    print('in upload ctrl');
    lc.kf.flagsapi.uploadurl().then((r)=>upload_url = r.s);
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
  String flag_link;
  FlagViewer(RouteProvider routeProvider, LoginController lc) {
    print('in flag viewer ctrl');
    var urlsafe_flagkey = routeProvider.parameters['urlsafe_flagkey'];
    lc.kf.flagsapi.flag(s:urlsafe_flagkey).then((r)=>flag_link=r.s);
  }
}