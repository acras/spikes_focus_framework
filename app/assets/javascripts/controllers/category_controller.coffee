Spikes.CategoryController = Ember.ObjectController.extend
  destroy: ->
    category = @get('content')
    transaction = category.get('transaction')
    category.deleteRecord()
    transaction.commit()

  save: ->
    category = @get('content')
    transaction = category.get('transaction')
    transaction.commit()
