Spikes.Product = DS.Model.extend
  name: DS.attr('string'),
  description: DS.attr('string')
  price: DS.attr('string')
  createdAt: DS.attr('date')
  category: DS.belongsTo('Spikes.Category')
