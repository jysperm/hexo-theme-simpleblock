var jade = require('jade');
var marked =  require('marked');

hexo.extend.helper.register('formatArray', function(array) {
  if (array && array.length !== undefined) {
    return array;
  } else if (array) {
    return [array];
  } else {
    return [];
  }
});

hexo.extend.helper.register('renderJade', function(source) {
  return jade.render(source);
});

hexo.extend.helper.register('renderMarkdown', function(source) {
  return marked(source);
});

hexo.extend.helper.register('commentKey', function(post) {
  var commentKey = post.raw.match(/comment_key: ?(.*)/);
  var duoshuoId = post.raw.match(/duoshuo_id: ?(.*)/);
  var permalink = post.raw.match(/permalink: ?(.*)/);

  return (commentKey && commentKey[1]) || (duoshuoId && duoshuoId[1]) || (permalink && permalink[1]);
});

hexo.extend.helper.register('sourceOfPost', function(post, sourceUrl) {
  return sourceUrl + encodeURIComponent(post.source);
});

hexo.extend.helper.register('fixPaginator', function(html) {
  return html.replace(/\/\//g, '/');
});
