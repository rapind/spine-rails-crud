class Admin.Article extends Spine.Model
  @configure 'Article', 'title', 'body'
  @extend Spine.Model.Ajax

  @url: '/admin/articles'