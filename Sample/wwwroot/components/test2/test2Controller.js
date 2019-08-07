'use strict';

angular.module('primeapps')

    .controller('Test2Controller', ['$rootScope', '$scope', '$state', '$http', 'config', 'ModuleService',
        function ($rootScope, $scope, $state, $http, config, ModuleService) {
            $scope.message = 'It works - Test 2!';
        }]);