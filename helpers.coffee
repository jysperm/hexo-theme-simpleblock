jade = require 'jade'
marked = require 'marked'

module.exports = (hexo) ->
  hexo.extend.helper.register 'formatArray', (array) ->
    if array.length
      return array
    else if array
      return [array]
    else
      return []

  hexo.extend.helper.register 'renderJade', (source) ->
    return jade.render source

  hexo.extend.helper.register 'renderMarkdown', (source) ->
    return marked source

  hexo.extend.helper.register 'duoshuoKey', (post) ->
    duoshuo_id = post.raw.match /duoshuo_id: ?(.*)/

    if duoshuo_id
      return duoshuo_id[1]

    post_permalink = post.raw.match /permalink: ?(.*)/

    if post_permalink
      return post_permalink[1]

  hexo.extend.helper.register 'sourceOfPost', (post, source_url) ->
    return source_url + encodeURIComponent(post.source)

  hexo.extend.helper.register 'fixPaginator', (html) ->
    return html.replace /\/\//g, '/'
