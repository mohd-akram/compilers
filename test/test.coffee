assert = require 'assert'
Ajv = (require 'ajv').default
addFormats = require 'ajv-formats'
indent = require 'indent-string'

describe 'COMPILERS', ->
  COMPILERS = null

  before -> { COMPILERS } = require '../src/compilers'

  it 'should be valid', ->
    ajv = new Ajv verbose: true
    addFormats ajv

    valid = ajv.validate
      type: 'array'
      items:
        type: 'object'
        properties:
          name:
            type: 'string'
          source:
            type: 'string'
          target:
            type: 'string'
          type:
            type: 'string'
          url:
            type: 'string'
            format: 'uri'
        required: ['name', 'source', 'target', 'type', 'url']
      , COMPILERS

    assert.ok valid, ajv.errors?.map (error) ->
      "#{error.message}\n\n#{indent (JSON.stringify error.data, null, 2), 6}\n"

  it 'should be sorted', ->
    compilers = COMPILERS.slice().sort (a, b) ->
      [aType, bType] = [a.type.toLowerCase(), b.type.toLowerCase()]
      [aName, bName] = [a.name.toLowerCase(), b.name.toLowerCase()]
      if aType is bType then (if aName < bName then -1 else 1)
      else if aType < bType then -1 else 1

    assert.deepEqual COMPILERS, compilers
