noflo = require 'noflo'
knox = require 'knox'

exports.getComponent = ->
  c = new noflo.Component
  c.description = 'Create a client for an S3 bucket'
  c.inPorts.add 'key',
    datatype: 'string'
    description: 'Amazon API key'
    required: yes
  c.inPorts.add 'secret',
    datatype: 'string'
    description: 'Amazon API secret'
    required: yes
  c.inPorts.add 'bucket',
    datatype: 'string'
    description: 'S3 bucket name'
    required: yes
  c.inPorts.add 'region',
    datatype: 'string'
    description: 'AWS region'
    required: yes
  c.outPorts.add 'client',
    datatype: 'object'
    description: 'S3 client instance'

  noflo.helpers.WirePattern c,
    in: 'bucket'
    params: [
      'key'
      'secret'
      'region'
    ]
    out: 'client'
    forwardGroups: true
    async: true
  , (data, groups, out, callback) ->
    client = knox.createClient
      key: c.params.key
      secret: c.params.secret
      bucket: data
      region: c.params.region
    out.send client
    do callback
