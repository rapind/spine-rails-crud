#= require_tree ./lib
#= require_self
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views

class Admin extends Spine.Controller
  constructor: ->
    super

    # Initialize controllers:
    #  @append(@items = new Admin.Items)
    #  ...

    Spine.Route.setup()

window.Admin = Admin