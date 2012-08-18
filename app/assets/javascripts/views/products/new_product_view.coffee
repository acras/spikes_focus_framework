Spikes.NewProductView = Ember.View.extend
  templateName: 'products/new'
  submit: (event) ->
    event.preventDefault()
    @get('controller').createProduct()
