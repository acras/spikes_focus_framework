Spikes.EditProductView = Ember.View.extend
  templateName: 'products/edit'
  submit: (event) ->
    event.preventDefault()
    @get('controller').save()
    Spikes.router.transitionTo('index')
