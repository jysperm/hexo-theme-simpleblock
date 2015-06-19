gulp = require 'gulp'
flatten = require 'gulp-flatten'
filter = require 'gulp-filter'
minifyJs = require 'gulp-uglify'
minifyCSS = require 'gulp-minify-css'
coffee = require 'gulp-coffee'
bower = require 'main-bower-files'
order = require 'gulp-order'
concat = require 'gulp-concat'
less = require 'gulp-less'

gulp.task 'vendor', ->
  jsFilter = filter("**/*.js")
  cssFilter = filter("**/*.css")
  fontFilter = filter(["**/*.eot","**/*.svg","**/*.ttf","**/*.woff"])

  gulp.src bower()
  .pipe flatten()
  .pipe jsFilter
  .pipe order [
    '**/jquery.js'
    '**/*.js'
  ]
  .pipe concat 'vendor.js'
  .pipe minifyJs()
  .pipe gulp.dest 'source'
  .pipe jsFilter.restore()

  .pipe cssFilter
  .pipe concat 'vendor.css'
  .pipe minifyCSS()
  .pipe gulp.dest 'source'
  .pipe cssFilter.restore()

  .pipe fontFilter
  .pipe gulp.dest 'source'

gulp.task 'theme.js', ->
  gulp.src 'source/script/*.coffee'
  .pipe coffee()
  .pipe concat 'theme.js'
  .pipe minifyJs()
  .pipe gulp.dest 'source'

gulp.task 'theme.css', ->
  gulp.src 'source/style/*.less'
  .pipe less()
  .pipe concat 'theme.css'
  .pipe minifyCSS()
  .pipe gulp.dest 'source'

gulp.task 'default', ['vendor', 'theme.js', 'theme.css']

gulp.task 'watch', ->
  gulp.watch 'source/script/*', ['theme.js']
  gulp.watch 'source/style/*', ['theme.css']
