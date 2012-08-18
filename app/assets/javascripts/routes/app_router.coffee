Spikes.Router = Ember.Router.extend
  location: 'hash'

  root: Ember.Route.extend
    index: Ember.Route.extend
      route: '/'
      connectOutlets: (router) ->
        Spikes.set('menuFlag', 'home')
        applicationController = router.get('applicationController')
        applicationController.connectOutlet('main')

    categories: Ember.Route.extend
      route: '/categories'
      connectOutlets: -> Spikes.set('menuFlag', 'categories')

      index: Ember.Route.extend
        route: '/'
        connectOutlets: (router) ->
          applicationController = router.get('applicationController')
          applicationController.connectOutlet('categories', Spikes.Category.find())

      newCategory: (router, event) ->
        Spikes.Category.createRecord()

      updateCategory: (router, event) ->
        category = event.context
        categoryController = router.get('categoryController')
        categoryController.set('content', category)
        categoryController.save()

      destroyCategory: (router, event) ->
        category = event.context
        categoryController = router.get('categoryController')
        categoryController.set('content', category)
        categoryController.destroy() if confirm('Are you sure?')

    products: Ember.Route.extend
      route: '/products'
      connectOutlets: -> Spikes.set('menuFlag', 'products')

      index: Ember.Route.extend
        route: '/'
        newProductInWindow: Ember.Route.transitionTo('new')
        editProduct: Ember.Route.transitionTo('edit')
        connectOutlets: (router) ->
          applicationController = router.get('applicationController')
          applicationController.connectOutlet('categories', Spikes.Category.find())
          applicationController.connectOutlet('products', Spikes.Product.find())

      new: Ember.Route.extend
        route: '/new'
        connectOutlets: (router) ->
          applicationController = router.get('applicationController')
          product = Spikes.Product.createRecord()
          productController = router.get('productController')
          applicationController.connectOutlet('categories', Spikes.Category.find())
          applicationController.connectOutlet
            controller: productController
            viewClass: Spikes.EditProductView
            context: product

      newProduct: (router, event) ->
        Spikes.Product.createRecord(createdAt: new Date)
        Ember.run.next ->
          $('table:first tr:last td:first input').focus()

      edit: Ember.Route.extend
        route: '/:product_id/edit/'
        connectOutlets: (router, product) ->
          applicationController = router.get('applicationController')
          productController = router.get('productController')
          applicationController.connectOutlet('categories', Spikes.Category.find())
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
