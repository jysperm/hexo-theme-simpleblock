minifyCSS = require 'gulp-minify-css'
concat = require 'gulp-concat'
addSrc = require 'gulp-add-src'
order = require 'gulp-order'
shell = require 'gulp-shell'
less = require 'gulp-less'
gulp = require 'gulp'
sass = require 'gulp-sass'
del = require 'del'

gulp.task 'clean', ->
  del ['source/**', '!_source/**']

gulp.task 'build:primer', ->
  gulp.src 'source/_source/primer.scss'
  .pipe sass
    includePaths: 'bower_components/primer-css/scss'
  .pipe gulp.dest 'source'

gulp.task 'build:styles', ->
  gulp.src 'source/_source/simpleblock.less'
  .pipe less()
  .pipe addSrc 'source/primer.css'
  .pipe addSrc 'bower_components/primer-markdown/dist/user-content.css'
  .pipe order ['primer.css', 'user-content.css', 'simpleblock.css']
  .pipe minifyCSS()
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
