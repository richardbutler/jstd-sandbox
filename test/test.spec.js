require([
  "./test"
],
function( test ) {

  describe( "Thingy", function() {
    
    var $global;
    
    beforeEach(function() {
      $global = $( "<div id='global'></div>" );
      test.test( $global );
      $( "body" ).append( $global );
    });
    
    afterEach(function() {
      $global.remove();
    });
    
    it( "should be test", function() {
      var thing = $( "#global h1" ).text();
      expect( document.getElementById( "global" ) ).not.toBeNull();
      expect( thing ).toEqual( "Test" );
    });
    
  });

});