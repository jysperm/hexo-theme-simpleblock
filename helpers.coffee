module.exports = (hexo) ->
  hexo.extend.helper.register 'duoshuoKey', (post) ->
    duoshuo_id = post.raw.match /duoshuo_id: ?(.*)/

    if duoshuo_id
      return duoshuo_id[1]

    post_permalink = post.raw.match /permalink: ?(.*)/

    if post_permalink
      return post_permalink[1]

  hexo.extend.helper.register 'sourceOfPost', (post) ->
    path = post.source.replace(/#/m, '%23').replace(/\ /m, '%20')
    return "https://github.com/jysperm/meta/tree/master/blog/source/#{path}"

  hexo.extend.helper.register 'fixPaginator', (html) ->
    return html.replace /\/\//m, '/'
