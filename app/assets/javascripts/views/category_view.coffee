Spikes.CategoryView = Ember.View.extend
  templateName: 'category'
  tagName: 'tr'
  change: ->
    controller = Spikes.router.get('categoryController')
    controller.set('content', @get('category'))
    controller.save()
