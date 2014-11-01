'use strict';

/**
 * @ngdoc function
 * @name kfCliApp.controller:AboutcontrollerCtrl
 * @description
 * # AboutcontrollerCtrl
 * Controller of the kfCliApp
 */
angular.module('kfCliApp')
  .controller('AboutcontrollerCtrl', function ($scope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
  });
