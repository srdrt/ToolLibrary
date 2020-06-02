'use strict';

angular.module('primeapps')

    .controller('DefaultController', ['$scope', '$http',
        function ($scope, $http) {

            $http.post(appConfigs.apiUrl + '/api/sample/get_all_users', {}).then(function (response) {
                $scope.users = response.data;
            });

        }]);
