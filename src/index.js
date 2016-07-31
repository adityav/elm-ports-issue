var Elm = require( './Main' );

// inject bundled Elm app into div#main
var app = Elm.Main.embed( document.getElementById( 'main' ) );


app.ports.sendToJS.subscribe(function(msg) {
    console.log("Got msg:", msg);
    setTimeout(function() {
      app.ports.fromJS.send(msg);
    }, 10);
});
