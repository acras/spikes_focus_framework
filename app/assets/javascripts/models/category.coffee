Spikes.Category = DS.Model.extend
  name: DS.attr('string')
  products: DS.hasMany('Spikes.Product')
