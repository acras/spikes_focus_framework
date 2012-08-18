Spikes.ProductView = Ember.View.extend
  templateName: 'product'
  tagName: 'tr'

  change: ->
    controller = Spikes.router.get('productController')
    controller.set('content', @get('product'))
    controller.save()

  validated: (->
    Ember.run.next =>
      properties = @$().find('td').map((i, el) -> $(el).data('property'))
      errors = @get('product').get('errors')
      window.e = errors

      for property in properties
        $el = @$().find("td[data-property=#{property}]")
        $el.tooltip('hide')
        $el.data('tooltip', null)

        if errors.hasOwnProperty(property)
          $el.tooltip
            title: errors.get(property)
            trigger: 'manual'
          $el.tooltip('show')
  ).observes('product.errors')
