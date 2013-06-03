describe 'RubyJS', ->
  it "auto pollutes global", ->
    for method in ['_str', '_arr', '_itr', '_num', '_proc', '_puts', '_truthy', '_falsey', '_inspect']
      expect( window[method]? ).toEqual true

  it "R()", ->
    expect( R( new String("foo") ) ).toEqual(R("foo"))

  xit "R.i_am_feeling_evil", ->
    R.i_am_feeling_evil()
    expect( ['foo', 'bar'].map((el) -> el.reverse()) ).toEqual ['oof', 'rab']

    expect( typeof 5.0.times(->) == 'number').toEqual true


  it "R.proc", ->
    expect( _arr.map(['foo'], R.proc('length')) ).toEqual [3]
    expect( _arr.map([R('foo')], R.proc('size')) ).toEqual [R(3)]

    expect( _arr.map([R('foo')], R.proc('multiply', 2)) ).toEqual [R('foofoo')]

