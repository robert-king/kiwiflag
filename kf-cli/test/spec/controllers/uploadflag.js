'use strict';

describe('Controller: UploadflagCtrl', function () {

  // load the controller's module
  beforeEach(module('kfCliApp'));

  var UploadflagCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    UploadflagCtrl = $controller('UploadflagCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
