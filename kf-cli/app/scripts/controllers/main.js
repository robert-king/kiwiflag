'use strict';

angular.module('kfCliApp')
  .controller('MainCtrl', function ($scope, gapi) {
        $scope.upload_url = '';
    gapi.load('flags').then(function(){
      gapi.client.flags.upload_url().then(function(r){
        $scope.upload_url = r.s;
      });
    }, function(e) {console.log(e);});

  });
