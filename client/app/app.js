import CONFIG from 'config';

angular
  .module('myApp', ['angularFileUpload'])
  .directive('fileUpload', function(FileUploader) {
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
  })
;