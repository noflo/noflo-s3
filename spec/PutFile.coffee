noflo = require 'noflo'
chai = require 'chai' unless chai
PutFile = require '../components/PutFile.coffee'

describe 'PutFile component', ->
  c = null
  path = null
  key = null
  client = null
  url = null
  beforeEach ->
    c = PutFile.getComponent()
    path = noflo.internalSocket.createSocket()
    key = noflo.internalSocket.createSocket()
    client = noflo.internalSocket.createSocket()
    url = noflo.internalSocket.createSocket()
    c.inPorts.path.attach path
    c.inPorts.key.attach key
    c.inPorts.client.attach client
    c.outPorts.url.attach url

  describe 'when instantiated', ->
    it 'should have a path port', ->
      chai.expect(c.inPorts.path).to.be.an 'object'
    it 'should have a url port', ->
      chai.expect(c.outPorts.url).to.be.an 'object'
