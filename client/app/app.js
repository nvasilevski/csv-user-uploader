angular
  .module('myApp', ['angularFileUpload'])
  .directive('fileUpload', function(FileUploader) {
    return {
      restrict: 'E',
      templateUrl:'components/file_upload.html',
      compile: function() {
        return {
          pre: function(scope, element, attrs) {
            scope.uploader = new FileUploader({url: 'http://localhost:3000/clients/upload'});
          },
        };
      }
    }
  })
;