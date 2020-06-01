'use strict';

angular.module('primeapps')

    .controller('DefaultController', ['$scope', '$http',
        function ($scope, $http) {
        
            $http.get(appConfigs.apiUrl + '/Sample/GetAllUsers').then(function (response) {
                $scope.users = response.data;
            });
            
        }]);
