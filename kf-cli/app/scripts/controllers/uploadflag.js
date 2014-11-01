'use strict';

angular.module('kfCliApp')
  .controller('UploadflagCtrl', function ($scope, gapi, $upload, $http) {
    $scope.uploadUrl = '';
    $scope.formData = {};
    $scope.success = false;
    $scope.missingFile = false;
    $scope.fail = false;
    $scope.myFile = null;

    var refreshUploadUrl = function() {
      gapi.load('flags').then(function(){
        gapi.client.flags.upload_url().then(function(r){
          $scope.uploadUrl = r.s;
        });
      }, function(e) {console.log(e);});
    };

    refreshUploadUrl();

    $scope.uploadFile = function() {
      var url = $scope.uploadUrl;
      $scope.success = false;
      $scope.fail = false;
      $scope.missingFile = false;
      var file = $scope.myFile;
      if (!file) {
        $scope.missingFile = true;
        return;
      }
      $scope.uploadUrl = '';
      var fd = new FormData();
      fd.append('file', file);
      angular.forEach($scope.formData, function(v, k) {
        fd.append(k, v);
      });
      $http.post(url, fd, {
        transformRequest: angular.identity,
        headers: {'Content-Type': undefined}
      })
        .success(function(r){
          console.log('success', r);
          console.log('link', '#/flag-viewer/' + r.flagKey);
          refreshUploadUrl();
          $scope.success = true;
        })
        .error(function(e){
          console.log('error', e);
          refreshUploadUrl();
          $scope.fail = true;
        });
    };
  });
