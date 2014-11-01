'use strict';

describe('Controller: DiscuscontrollerCtrl', function () {

  // load the controller's module
  beforeEach(module('kfCliApp'));

  var DiscuscontrollerCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    DiscuscontrollerCtrl = $controller('DiscuscontrollerCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
