# @cjsx React.DOM

# TODO CRAP, need to dig into how to make this work

jest.dontMock '../src/scripts/components/app'

describe 'App', ->
  it 'should render a <svg> with class "icon-i-roy"', ->
    React = require 'react/addons'
    App = require '../src/scripts/components/app'
    TestUtils = React.addons.TestUtils

    # Render the App component.
    app = <App />
    TestUtils.renderIntoDocument(app)

    # Verify the <svg class="..."> element was created.
    svg = TestUtils.findRenderedDOMComponentWithTag(app, 'svg')
    expect(svg.getDOMNode().className).toContain("icon-i-roy")
