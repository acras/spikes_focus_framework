# {{view Ember.TextField name="name" id="name" class="inline-input" valueBinding="product.name"}}
# {{inlineInput "product.name"}}

Ember.Handlebars.registerHelper 'inlineInput', (binding, options) ->
  options.hash['valueBinding'] = binding
  options.hash['class'] = 'inline-input'

  options.hash['change'] =  ->
    options.data.view.change()

  Ember.Handlebars.ViewHelper.helper(this, 'Ember.TextField', options)
