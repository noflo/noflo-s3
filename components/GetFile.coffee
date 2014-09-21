noflo = require 'noflo'

exports.getComponent = ->
  c = new noflo.Component
  c.description = 'Download a file from S3'
  c.icon = 'cloud-download'
  c.inPorts.add 'key',
    datatype: 'string'
    description: 'File key on S3'
    required: yes
  c.inPorts.add 'client',
    datatype: 'object'
    description: 'S3 client instance'
    required: yes
  c.outPorts.add 'out',
    datatype: 'string'
  c.outPorts.add 'error',
    datatype: 'object'

  noflo.helpers.WirePattern c,
    in: 'key'
    params: 'client'
    out: 'out'
    async: true
    forwardGroups: true
  , (data, groups, out, callback) ->
    client.getFile data, (err, response) ->
      return callback err if err
      out.send response
      do callback

  c
