noflo = require 'noflo'
chai = require 'chai' unless chai
GetFile = require '../components/GetFile.coffee'

describe 'GetFile component', ->
  c = null
  path = null
  key = null
  client = null
  url = null
  beforeEach ->
    c = GetFile.getComponent()
    key = noflo.internalSocket.createSocket()
    client = noflo.internalSocket.createSocket()
    out = noflo.internalSocket.createSocket()
    c.inPorts.key.attach key
    c.inPorts.client.attach client
    c.outPorts.out.attach out

  describe 'when instantiated', ->
    it 'should have a "key" inport', ->
      chai.expect(c.inPorts.key).to.be.an 'object'
    it 'should have a "out" outport', ->
      chai.expect(c.outPorts.out).to.be.an 'object'
