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
  del ['source/primer.css']

gulp.task 'build:primer', ->
  gulp.src 'source/_styles/primer.scss'
  .pipe sass
    includePaths: 'bower_components/primer-css/scss'
  .pipe gulp.dest 'source'

gulp.task 'build:styles', ['build:primer'], ->
  gulp.src 'source/_styles/simpleblock.less'
  .pipe less()
  .pipe addSrc 'source/primer.css'
  .pipe addSrc 'bower_components/primer-markdown/dist/user-content.css'
  .pipe order ['primer.css', 'user-content.css', 'simpleblock.css']
  .pipe minifyCSS()
  .pipe concat 'styles.css'
  .pipe gulp.dest 'source'

gulp.task 'build', ['build:styles']

gulp.task 'watch', ->
  gulp.watch 'source/_styles/*.less', ['build:styles']
