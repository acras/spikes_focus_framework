Spikes.ApplicationController = Ember.Controller.extend
  isHome: (->
    Spikes.get('menuFlag') is 'home'
  ).property('Spikes.menuFlag')

  isCategories: (->
    Spikes.get('menuFlag') is 'categories'
  ).property('Spikes.menuFlag')

  isProducts: (->
    Spikes.get('menuFlag') is 'products'
  ).property('Spikes.menuFlag')
