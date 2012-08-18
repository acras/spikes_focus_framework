Spikes.ProductController = Ember.ObjectController.extend
  destroy: ->
    product = @get('content')
    transaction = product.get('transaction')
    product.deleteRecord()
    transaction.commit()

  save: ->
    product = @get('content')
    transaction = product.get('transaction')
    transaction.commit()
