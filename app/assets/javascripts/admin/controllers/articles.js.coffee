$ = jQuery.sub()
Article = Admin.Article

$.fn.item = ->
  elementID   = $(@).data('id')
  elementID or= $(@).parents('[data-id]').data('id')
  Article.find(elementID)

class New extends Spine.Controller
  events:
    'click [data-type=back]': 'back'
    'submit form': 'submit'

  constructor: ->
    super
    @active @render

  render: ->
    @html @view('articles/new')

  back: ->
    @navigate '/articles'

  submit: (e) ->
    e.preventDefault()
    article = Article.fromForm(e.target).save()
    @navigate '/articles', article.id if article

class Edit extends Spine.Controller
  events:
    'click [data-type=back]': 'back'
    'submit form': 'submit'

  constructor: ->
    super
    @active (params) ->
      @change(params.id)

  change: (id) ->
    @item = Article.find(id)
    @render()

  render: ->
    @html @view('articles/edit')(@item)

  back: ->
    @navigate '/articles'

  submit: (e) ->
    e.preventDefault()
    @item.fromForm(e.target).save()
    @navigate '/articles'

class Show extends Spine.Controller
  events:
    'click [data-type=edit]': 'edit'
    'click [data-type=back]': 'back'

  constructor: ->
    super
    @active (params) ->
      @change(params.id)

  change: (id) ->
    @item = Article.find(id)
    @render()

  render: ->
    @html @view('articles/show')(@item)

  edit: ->
    @navigate '/articles', @item.id, 'edit'

  back: ->
    @navigate '/articles'

class Index extends Spine.Controller
  events:
    'click [data-type=edit]':    'edit'
    'click [data-type=destroy]': 'destroy'
    'click [data-type=show]':    'show'
    'click [data-type=new]':     'new'

  constructor: ->
    super
    Article.bind 'refresh change', @render
    Article.fetch()

  render: =>
    articles = Article.all()
    @html @view('articles/index')(articles: articles)

  edit: (e) ->
    item = $(e.target).item()
    @navigate '/articles', item.id, 'edit'

  destroy: (e) ->
    item = $(e.target).item()
    item.destroy() if confirm('Sure?')

  show: (e) ->
    item = $(e.target).item()
    @navigate '/articles', item.id

  new: ->
    @navigate '/articles/new'

class Admin.Articles extends Spine.Stack
  controllers:
    index: Index
    edit:  Edit
    show:  Show
    new:   New

  routes:
    '/articles/new':      'new'
    '/articles/:id/edit': 'edit'
    '/articles/:id':      'show'
    '/articles':          'index'

  default: 'index'
  className: 'stack articles'