library login_controller;


//HOWTO CREATE CLIENT:
//rob:discovery_api_dart_client_generator robertking$ dart bin/generate.dart -u http://localhost:8080/_ah/api/discovery/v1/apis/kiwiflag/v1/rest -o kiwiflag_api_client
//Library kiwiflag_v1_api_client generated successfully.
//rob:discovery_api_dart_client_generator robertking$ mv kiwiflag_api_client/<whats it called> ~/src/personal/kiwiflag/<whats it called>
//then do a PUB GET in that api client folder.
//then do a PUB GET on this app.


import 'package:angular/angular.dart';
import 'package:google_kiwiflag_v1_api/kiwiflag_v1_api_browser.dart';
import "package:google_oauth2_client/google_oauth2_browser.dart";

//import 'tooltip/tooltip_directive.dart';
//import 'service/recipe.dart';
//import 'service/query_service.dart';

@NgController(
    selector: '[login-control]',
    publishAs: 'login_ctrl')
class LoginController {
  GoogleOAuth2 auth;
  KiwiFlag kf;
  String login_state = 'loading-user'; // states = needs-user, loading-user, has-user, needs-hapara

  final CLIENT_ID = '394062384276-9qour2katafat0u9064b3a1gsrdbspm9.apps.googleusercontent.com';
  final SCOPES = ["https://www.googleapis.com/auth/userinfo.email"];

  void set_user(token) {
    print('setting user..');
    print(token);
    login_state = 'has-user';
  }

  void do_login() {
    print('doing login..');
    login_state = 'loading-user';
    //auth.logout();
    print(auth);
    auth.login(immediate:false).then((token) => print(":)")).catchError((e) => login_state='needs-user');
  }

//  static const String LOADING_MESSAGE = "Loading recipe book...";
//  static const String ERROR_MESSAGE = """Sorry! The cook stepped out of the
//kitchen and took the recipe book with him!""";
//
//  Http _http;
//  QueryService _queryService;
//  QueryService get queryService => _queryService;
//
//  // Determine the initial load state of the app
//  String message = LOADING_MESSAGE;
//  bool recipesLoaded = false;
//  bool categoriesLoaded = false;
//
//  // Data objects that are loaded from the server side via json
//  List _categories = [];
//  get categories => _categories;
//  Map<String, Recipe> _recipeMap = {};
//  get recipeMap => _recipeMap;
//  get allRecipes => _recipeMap.values.toList();
//
//  // Filter box
//  Map<String, bool> categoryFilterMap = {};
//  String nameFilter = "";

  LoginController() {//Http this._http, QueryService this._queryService) {
      print("login controller constructor..");

      // Initialize the OAuth2 Client
      auth = new GoogleOAuth2(
          CLIENT_ID,
          SCOPES,
          tokenLoaded:(token) => set_user(token),
          autoLogin: true
      ); //would be nice to set hp= to restrict domain.
      if (login_state != 'has-user') {
        login_state = 'needs-user';
      }
      // Initialize the client library with our OAuth2 Client
      print('making client');
      kf = new Kiwiflag(auth);
      kf.makeAuthRequests = false;


    //_loadData();
  }
//
//  Recipe selectedRecipe;
//
//  void selectRecipe(Recipe recipe) {
//    selectedRecipe = recipe;
//  }
//
//  // Tooltip
//  static final tooltip = new Expando<TooltipModel>();
//  TooltipModel tooltipForRecipe(Recipe recipe) {
//    if (tooltip[recipe] == null) {
//      tooltip[recipe] = new TooltipModel(recipe.imgUrl,
//          "I don't have a picture of these recipes, "
//          "so here's one of my cat instead!",
//          80);
//    }
//    return tooltip[recipe]; // recipe.tooltip
//  }
//
//  void _loadData() {
//    _queryService.getAllRecipes()
//      .then((Map<String, Recipe> allRecipes) {
//        _recipeMap = allRecipes;
//        recipesLoaded = true;
//      },
//      onError: (Object obj) {
//        recipesLoaded = false;
//        message = ERROR_MESSAGE;
//      });
//
//    _queryService.getAllCategories()
//      .then((List<String> allCategories) {
//        _categories = allCategories;
//        for (String category in _categories) {
//          categoryFilterMap[category] = false;
//        }
//        categoriesLoaded = true;
//      },
//      onError: (Object obj) {
//        categoriesLoaded = false;
//        message = ERROR_MESSAGE;
//      });
//  }
}