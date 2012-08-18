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
        connectOutlets: (router) ->
          applicationController = router.get('applicationController')
          applicationController.connectOutlet('products', Spikes.Product.find())

      new: Ember.Route.extend
        route: '/new'
        connectOutlets: (router) ->
          applicationController = router.get('applicationController')
          applicationController.connectOutlet('newProduct', Ember.Object.create())
