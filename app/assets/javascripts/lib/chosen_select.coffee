Ember.ChosenSelect = Ember.Select.extend
  didInsertElement: ->
    @_super()
    @$().chosen()
    # Assumes optionLabelPath is something like "content.name"
    @addObserver(@get("optionLabelPath").replace(/^content/, "content.@each"), -> @contentDidChange())
  contentDidChange: ->
    # 2 ticks until DOM update
    Em.run.next(this, (-> Em.run.next(this, (-> @$().trigger("liszt:updated")))))
