assert = require 'assert'
Ajv = require 'ajv'
indent = require 'indent-string'

describe 'COMPILERS', ->
  COMPILERS = null

  before -> { COMPILERS } = require '..'

  it 'should be a valid list', ->
    ajv = new Ajv verbose: true

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
            format: 'url'
        required: ['name', 'source', 'target', 'type', 'url']
      , COMPILERS

    assert.ok valid, ajv.errors?.map (error) ->
      "#{error.message}\n\n#{indent (JSON.stringify error.data, null, 2), 6}\n"
