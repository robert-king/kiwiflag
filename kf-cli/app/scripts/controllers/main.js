'use strict';

angular.module('kfCliApp')
  .controller('MainCtrl', function ($scope, gapi) {
    $scope.flags = [
      {"author_website":"www.example.com","author_fb":"www.facebook.com","author_g_plus":"www.google.com/plus","author_location":"","author_name":"rob","author_twitter":"www.twitter.com","datetime":"2014-11-01T02:28:24.175000","down_votes":"0","img_link":"http://placehold.it/500x100","up_votes":"10"},
      {"author_fb":"","author_g_plus":"","author_location":"","author_name":"rob2","author_twitter":"","datetime":"2014-11-01T02:28:24.175000","down_votes":"0","img_link":"http://placehold.it/500x100","up_votes":"0"},
      {"author_fb":"","author_g_plus":"","author_location":"","author_name":"rob3","author_twitter":"","datetime":"2014-11-01T02:28:24.175000","down_votes":"0","img_link":"http://placehold.it/500x100","up_votes":"0"}
    ];
    $scope.order = 'new ';
    gapi.load('flags').then(function(){
      gapi.client.flags.flags().then(function(r){
        //$scope.flags = r.items;
      });
    }, function(e) {console.log(e);});

  });
