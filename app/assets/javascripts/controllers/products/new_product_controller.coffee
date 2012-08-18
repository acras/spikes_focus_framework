Spikes.NewProductController = Ember.ObjectController.extend
  createProduct: ->
    content = @get('content')
    product = Spikes.Product.createRecord
      name: content.get('name')
      description: content.get('description')
      price: content.get('price')

    product.store.commit()
    @set('content', Ember.Object.create())
    Spikes.Product.find()
