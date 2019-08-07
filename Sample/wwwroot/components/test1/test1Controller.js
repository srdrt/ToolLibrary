'use strict';

angular.module('primeapps')

    .controller('Test1Controller', ['$rootScope', '$scope', '$state', '$http', 'config', 'ModuleService',
        function ($rootScope, $scope, $state, $http, config, ModuleService) {
            $scope.message = 'It works - Test 1!';
        }]);