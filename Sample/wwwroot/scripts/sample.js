$http.get(appConfigs.apiUrl + '/Sample/GetAllUsers').then(function (response) {
    mdToast.success('Total User Count: ' + response.data.length);
});