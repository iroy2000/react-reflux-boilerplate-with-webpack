# @cjsx React.DOM

# TODO CRAP, please help on adding more unit test :\

jest.dontMock '../src/scripts/components/pages/aboutme'

describe 'App', ->
  it 'should should be a real test', ->
    React = require 'react/addons'
    App = require '../src/scripts/components/pages/aboutme'
    TestUtils = React.addons.TestUtils

    # Render the App component.
    app = <App />
    TestUtils.renderIntoDocument(app)

    # Crap, I should write more example test here :\
    expect(1).toEqual(1)
