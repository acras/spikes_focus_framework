Spikes.ProductView = Ember.View.extend
  templateName: 'products/show'
  tagName: 'tr'
  change: ->
    controller = Spikes.router.get('productController')
    controller.set('content', @get('product'))
    controller.save()
