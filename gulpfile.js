var gulp = require('gulp');

var imageResize = require('gulp-image-resize');
 
gulp.task('default', function () {
  gulp.src('static/img/food/*')
    .pipe(imageResize({ 
      width : 300,
      height : 275,
      crop : true,
      upscale : false,
      format : 'jpeg'
    })).on('error', errorHandler)
    .pipe(gulp.dest('static/img/thumbnails/food/'));
});

// Handle the error
function errorHandler (error) {
  console.log(error.toString());
  this.emit('end');
}

