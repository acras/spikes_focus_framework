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
        newProduct: Ember.Route.transitionTo('new')
        editProduct: Ember.Route.transitionTo('edit')
        connectOutlets: (router) ->
          applicationController = router.get('applicationController')
          applicationController.connectOutlet('products', Spikes.Product.find())

      new: Ember.Route.extend
        route: '/new'
        connectOutlets: (router) ->
          applicationController = router.get('applicationController')
          applicationController.connectOutlet('product', Spikes.Product.createRecord())

      edit: Ember.Route.extend
        route: '/:product_id/edit/'
        connectOutlets: (router, product) ->
          applicationController = router.get('applicationController')
          applicationController.connectOutlet('product', product)

      destroyProduct: (router, event) ->
        product = event.context
        productController = router.get('productController')
        productController.set('content', product)
        productController.destroy() if confirm('Are you sure?')
