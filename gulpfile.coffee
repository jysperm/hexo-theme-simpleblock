minifyCSS = require 'gulp-minify-css'
concat = require 'gulp-concat'
addSrc = require 'gulp-add-src'
order = require 'gulp-order'
shell = require 'gulp-shell'
less = require 'gulp-less'
gulp = require 'gulp'
del = require 'del'

gulp.task 'clean', ->
  del ['source/**', '!_source/**']

gulp.task 'build:styles', ->
  gulp.src 'source/_source/*.less'
  .pipe less()
  .pipe minifyCSS()
  .pipe addSrc 'bower_components/primer-css/css/primer.css'
  .pipe order ['primer.css', '*']
  .pipe concat 'styles.css'
  .pipe gulp.dest 'source'

gulp.task 'build:statics', ->
  gulp.src [
    'source/_source/*.svg'
    'source/_source/*.png'
  ]
  .pipe gulp.dest 'source'

gulp.task 'build', ['build:styles', 'build:statics']

gulp.task 'watch', ->
  gulp.watch 'source/_source/*.less', ['build:styles']
