cp.mypagearticles = {
  id: undefined,
  isArticlesLoaded: false,
  loadedLastArticleId: -1,
  init: function () {
    cp.mypagearticles.id = cp.el['#container'].data('id') || undefined;
    cp.el['articlelist'].show();
    var pageCache;
    if (typeof Storage !== 'undefined') {
      var previouspageCache = sessionStorage.getItem('previouspage');
      if (previouspageCache && previouspageCache.indexOf('/community?id=') !== -1) {
        pageCache = cp.fn.getPageCache(location);
      }
    }
    if (pageCache) {
      cp.mypagearticles.isArticlesLoaded = false;
      cp.el['articlelist'].html(pageCache.html);
      cp.mypagearticles.loadedLastArticleId = pageCache.loadedLastArticleId;
      cp.mypagearticles.isArticlesLoaded = true;
    } else {
      cp.mypagearticles.loadArticles(true, function (result) {
        cp.mypagearticles.appendArticles(result.articles);
      });
    }
    $(window).on('scroll', function () {
      cp.mypagearticles.scrollArticles();
    });
  },
  scrollArticles: function () {
    var scrollTop = $(window).scrollTop();
    var remainingHeight = $(document).height() - $(window).height();
    if (scrollTop < remainingHeight - 300) {
      return;
    }
    if (!cp.mypagearticles.isArticlesLoaded) {
      return;
    }
    cp.mypagearticles.loadArticles(false, function (result) {
      cp.mypagearticles.appendArticles(result.articles);
    });
  },
  loadArticles: function (isClear, callback) {
    cp.mypagearticles.isArticlesLoaded = false;
    if (isClear) {
      cp.mypagearticles.loadedLastArticleId = -1;
      cp.el['articlelist'].empty();
      var $loading = $('<div></div>').addClass('loading').appendTo(cp.el['articlelist']);
      $('<img>').attr('src', '/images/community.loading.svg').appendTo($loading);
    }
    cp.el['articlelist'].find('div.loading').show();
    var params = {
      boardId: cp.mypagearticles.id
    };
    if (cp.mypagearticles.loadedLastArticleId > -1) {
      params.beforeId = cp.mypagearticles.loadedLastArticleId;
    }
    $.ajax({
      url: window._apiServerUrl + '/find/articles',
      type: 'POST',
      dataType: 'json',
      data: params,
      xhrFields: { withCredentials: true },
      success: function (response) {
        if (response.status === 'success') {
          callback(response.result);
        } else {
          cp.mypagearticles.appendError('글을 불러올 수 없습니다.', 'back');
        }
      }
    });
  },
  appendArticles: function (articles) {
    if (!articles.length) {
      if (cp.mypagearticles.loadedLastArticleId === -1) {
        var $ol = $('<ol></ol>').addClass('group');
        $li = $('<li></li>').addClass('empty').html('아직 글이 하나도 없습니다.').appendTo($ol);
        $ol.insertBefore(cp.el['articlelist'].find('div.loading'));
      }
      cp.el['articlelist'].find('div.loading').hide();
      return;
    }
    var $ol = $('<ol></ol>').addClass('group');
    _.each(articles, function (article) {
      var communityUrl = '/community?id=' + article.community.id;
      var url = '/community?id=' + article.community.id + '&boardId=' + article.boardId + '&articleId=' + article.id;
      var time = cp.fn.formatRelativeDate(article.createdAt);
      var text = article.text;
      var $li = $('<li></li>').appendTo($ol);
      var $community = $('<a></a>').addClass('community').attr('href', communityUrl).html(article.community.name).appendTo($li);
      var $article = $('<a></a>').addClass('article').attr('href', url).appendTo($li);
      var $profile = $('<p></p>').addClass('profile').appendTo($article);
      $('<img>').addClass('picture').attr('src', article.user.picture).appendTo($profile);
      var $nickname = $('<span></span>').addClass('nickname').addClass(article.user.type).html(article.user.nickname).appendTo($profile);
      $('<time></time>').html(time).appendTo($profile);
      $('<hr>').appendTo($article);
      $('<p></p>').addClass('text short').html(text).appendTo($article);
      var $status = $('<p></p>').addClass('status').appendTo($article);
      $('<span></span>').addClass('votecount').html(article.posvote).appendTo($status);
      $('<span></span>').addClass('commentcount').html(article.commentCount).appendTo($status);
      var $attach = $('<p></p>').addClass('attach').appendTo($article);
      if (article.attaches && article.attaches.length > 0) {
        $('<span></span>').addClass('attachcount').html(article.attaches.length).appendTo($attach);
      }
      $('<hr>').appendTo($article);
    });
    $ol.insertBefore(cp.el['articlelist'].find('div.loading'));
    cp.el['articlelist'].find('div.loading').hide();
    cp.mypagearticles.loadedLastArticleId = _.last(articles).id;
    cp.mypagearticles.isArticlesLoaded = true;
    cp.fn.setPageCache(location, {
      loadedLastArticleId: cp.mypagearticles.loadedLastArticleId,
      html: cp.el['articlelist'].html()
    });
  },
  appendError: function (message, action) {
    cp.el['#container'].children(':visible').hide();
    var $error = $('<div></div>').addClass('error');
    $('<p></p>').html(message).appendTo($error);
    if (action === 'back') {
      $('<a></a>').addClass('button').attr('href', 'javascript: history.go(-1);').text('돌아가기').appendTo($error);
    }
    $error.appendTo(cp.el['#container']);
  }
};

$().ready(function () {
  cp.el['#container'] = $('#container');
  cp.el['articlelist'] = cp.el['#container'].find('div.articlelist');
  cp.mypagearticles.init();
});
