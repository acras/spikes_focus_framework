Spikes.Router = Ember.Router.extend
  location: 'hash'

  root: Ember.Route.extend
    index: Ember.Route.extend
      route: '/'
      connectOutlets: (router) ->
        applicationController = router.get('applicationController')
        applicationController.connectOutlet('main')

    products: Ember.Route.extend
      route: '/products'

      index: Ember.Route.extend
        route: '/'
        # newProduct: Ember.Route.transitionTo('new')
        editProduct: Ember.Route.transitionTo('edit')
        connectOutlets: (router) ->
          applicationController = router.get('applicationController')
          applicationController.connectOutlet('products', Spikes.Product.find())

      # new: Ember.Route.extend
      #   route: '/new'
      #   connectOutlets: (router) ->
      #     applicationController = router.get('applicationController')
      #     product = Spikes.Product.createRecord()
      #     productController = router.get('productController')
      #     applicationController.connectOutlet
      #       controller: productController
      #       viewClass: Spikes.EditProductView
      #       context: product

      newProduct: (router, event) ->
        Spikes.Product.createRecord()

      edit: Ember.Route.extend
        route: '/:product_id/edit/'
        connectOutlets: (router, product) ->
          applicationController = router.get('applicationController')
          productController = router.get('productController')
          applicationController.connectOutlet
            controller: productController
            viewClass: Spikes.EditProductView
            context: product

      updateProduct: (router, event) ->
        product = event.context
        productController = router.get('productController')
        productController.set('content', product)
        productController.save()

      destroyProduct: (router, event) ->
        product = event.context
        productController = router.get('productController')
        productController.set('content', product)
        productController.destroy() if confirm('Are you sure?')
