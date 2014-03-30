library flags_controller;

import 'package:angular/angular.dart';

//import 'tooltip/tooltip_directive.dart';
//import 'service/recipe.dart';
//import 'service/query_service.dart';

@NgController(
    selector: '[flags]',
    publishAs: 'ctrl')
class FlagsController {
  List<Int> flags = [1,2];
  FlagsController() {
    print('in controller');
  }

}
