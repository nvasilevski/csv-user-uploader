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

app.directive('clientsTable', function($resource) {
  let Client = $resource(CONFIG['host'] + '/clients/:id', {id: "@id"}, {'update': { method:'PUT' }});

  Client.prototype.toggleEdit = function(prevPhone){
    console.log(prevPhone);
    if (this.isEditing) {
      Client.update(this);
    }
    return this.isEditing = !this.isEditing;
  }

  Client.prototype.editButtonText = function(){
    return this.isEditing ? 'Save' : 'Edit'
  }

  function transformClients(clients) {
    return clients.map(function(client) {
      return Object.assign(client, {isEditing: false})
    })
  }

  return {
    restrict: 'E',
    templateUrl:'components/clients_table.html',
    compile: function() {
      return {
        pre: function(scope, element, attrs) {
          Client.query(function(data) {
            scope.clients = transformClients(data);
            }, function(err) {
            console.error("Error occured: ", err);
          });
        },
      };
    }
  }
});