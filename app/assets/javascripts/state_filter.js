(function(){

  var app = angular.module('statusChecker', ['angularjs-datetime-picker']);

  app.controller('StateFilter', ["$scope", "$http",  function ($scope, $http) {
    $scope.resource_type = ''
    $scope.time = ''
    $scope.resource_id = ''
    $scope.resource_types = ['Product', 'Order', 'Invoice']
    $scope.resource_ids = []
        
    $scope.updateResourceId = function(){
      params = { resource_type: $scope.resource_type }
      $http({url: '/resource_ids.json', method: "GET", params: params}).success(function(data){
        $scope.resource_ids = data
      });
    }

    $scope.getState = function(){
      params =  { resource_type: $scope.resource_type, 
                  resource_id: $scope.resource_id, 
                  time: new Date($scope.time)
                }
      $http({url: '/store_resources/state.json', method: "GET", params: params}).success(function(data){
        $scope.populate_result(data)
      });
    }

    $scope.populate_result = function(data){
      ui = ''
      $.each(data, function(key, val){
        ui = ui + '<tr><td>'+key+'</td><td>'+ val+'</td></tr>'
      })
      $('tbody#result').html(ui)
    }

  }]);  

})();  