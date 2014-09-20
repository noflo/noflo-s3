noflo = require 'noflo'

exports.getComponent = ->
  c = new noflo.Component
  c.description = 'Upload a file to S3'
  c.icon = 'cloud-upload'
  c.inPorts.add 'path',
    datatype: 'string'
    description: 'Local file path to upload'
    required: yes
  c.inPorts.add 'key',
    datatype: 'string'
    description: 'File key on S3'
    required: yes
  c.inPorts.add 'client',
    datatype: 'object'
    description: 'S3 client instance'
    required: yes
  c.outPorts.add 'url',
    datatype: 'string'
  c.outPorts.add 'error',
    datatype: 'object'

  noflo.helpers.WirePattern c,
    in: ['path', 'key']
    params: 'client'
    out: 'url'
    async: true
    forwardGroups: true
  , (data, groups, out, callback) ->
    client.putFile data.path, data.key, (err, response) ->
      return callback err if err
      out.send client.http data.key
      do callback

  c
