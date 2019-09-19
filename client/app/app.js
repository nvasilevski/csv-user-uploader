const CONFIG = {
  host: "http://localhost:3000"
}

var app = angular.module('myApp', ['ngResource', 'angularFileUpload']);
  
app.directive('fileUpload', function(FileUploader) {
  return {
    restrict: 'E',
    templateUrl:'components/file_upload.html',
    compile: function() {
      return {
        pre: function(scope, element, attrs) {
          var uploader = new FileUploader({url: CONFIG['host'] + '/clients/upload'});
          uploader.onAfterAddingFile = function(item, filter, options) {
            if (uploader.queue.length > 1) {
              uploader.queue.splice(0, 1);
            }
          };
          scope.uploader = uploader;
        },
      };
    }
  }
});

app.factory("clients", function($resource) {
  return $resource(CONFIG['host'] + '/clients');
});

app.directive('clientsTable', function(clients) {
  return {
    restrict: 'E',
    templateUrl:'components/clients_table.html',
    compile: function() {
      return {
        pre: function(scope, element, attrs) {
          clients.query(function(data) {
            scope.clients = data;
            }, function(err) {
            console.error("Error occured: ", err);
          });
        },
      };
    }
  }
});