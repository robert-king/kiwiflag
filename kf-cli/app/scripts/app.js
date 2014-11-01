'use strict';

angular
  .module('gapi.client')
  .config(function(gapiProvider) {
    gapiProvider.library('flags', 'v1', 'http://localhost:8080/_ah/api'); //remember http vs https for local vs production
    gapiProvider.library('oauth2', 'v2');

    //2. set auth options to be used later
    gapiProvider.authorization({
//      'client_id': '394062384276-9qour2katafat0u9064b3a1gsrdbspm9.apps.googleusercontent.com',
//      scope: ['https://www.googleapis.com/auth/userinfo.email']
    });
  });

angular
  .module('kfCliApp', [
    'ngSanitize',
    'ngRoute',
    'gapi.client',
    'angularFileUpload'
  ])
  .config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'views/main.html',
        controller: 'MainCtrl'
      })
      .when('/upload', {
        templateUrl: 'views/upload.html',
        controller: 'UploadflagCtrl'
      })
      .when('/discus', {
        templateUrl: 'views/discus.html',
        controller: 'DiscusController'
      })
      .when('/about', {
        templateUrl: 'views/about.html',
        controller: 'AboutController'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
