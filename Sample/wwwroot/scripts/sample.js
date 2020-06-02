$http.post(appConfigs.apiUrl + '/sample/get_users', {}).then(function (response) {
    mdToast.success('Total User Count: ' + response.data.length);
});