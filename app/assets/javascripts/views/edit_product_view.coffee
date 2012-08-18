Spikes.EditProductView = Ember.View.extend
  templateName: 'edit_product'
  submit: (event) ->
    event.preventDefault()
    @get('controller').save()
