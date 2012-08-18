get = Ember.get

Spikes.RESTAdapter = DS.RESTAdapter.extend
  bulkCommit: false
  plurals:
    category: 'categories'

  createRecord: (store, type, record) ->
    root = @rootForType(type)

    data = {}
    data[root] = record.toJSON()

    @ajax @buildURL(root), "POST",
      data: data
      context: this
      success: (json) ->
        @didCreateRecord(store, type, record, json)
      error: (json) ->
        @validationError(store, type, record, json)

  updateRecord: (store, type, record) ->
    id = get(record, 'id')
    root = @rootForType(type)

    data = {}
    data[root] = record.toJSON()

    @ajax @buildURL(root, id), "PUT",
      data: data
      context: this
      success: (json) ->
        @didUpdateRecord(store, type, record, json)
      error: (json) ->
        @validationError(store, type, record, json)

  didCreateRecord: (store, type, record, json) ->
    @_super(store, type, record, json)
    @didSaveRecord(store, type, record, json)

  didUpdateRecord: (store, type, record, json) ->
    @_super(store, type, record, json)
    @didSaveRecord(store, type, record, json)

  didSaveRecord: (store, type, record, json) ->
    recordErrors = record.get('errors') || Ember.Object.create()

    for error of recordErrors
      recordErrors.set(error, undefined) if recordErrors.hasOwnProperty(error)

    record.set('errors', recordErrors)
    record.notifyPropertyChange('errors')

  validationError: (store, type, record, json) ->
    return unless json.status is 422

    errors = JSON.parse(json.responseText).errors
    recordErrors = record.get('errors') || Ember.Object.create()

    for error of recordErrors
      recordErrors.set(error, undefined) if recordErrors.hasOwnProperty(error)

    for name, description of errors
      recordErrors.set(name, description[0])

    record.stateManager.transitionTo('uncommitted')
    record.set('errors', recordErrors)
    record.notifyPropertyChange('errors')

