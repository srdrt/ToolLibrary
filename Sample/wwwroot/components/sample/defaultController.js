'use strict';

angular.module('primeapps')

    .controller('DefaultController', ['$scope', '$http',
        function ($scope, $http) {

            $http.post(appConfigs.containerUrl + '/api/sample/get_users', {}).then(function (response) {
                $scope.users = response.data;
            });

        }]);
