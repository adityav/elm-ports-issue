# Elm Ports issue

any **port** module in Elm has a dependency to `Json.Decode` as it uses decoders specified in that module for js-elm communications.

So if the project's port module has:

* Name beginning with a letter before J, and
* does not have a declared dependency on Json.Decode

Then the elm compiler will emit the port module code before `Json.Decode` which causes all decoders to be `Undefined`. This results in all user defined incoming ports to stop throw exceptions.

# SSCCE Summary
* This SSCCE sends a string ("hi Elm! been a long time!") on init.
* renders text "waiting for JS to respond" on page
* JS replies back with the string after a 10 ms (index.js L10)
* Expected response is that the echoed string will show up on the screen. Instead we get an `Uncaught TypeError: Cannot read property 'tag' of undefined` in the console.

# Run Instructions

Install dependencies

```
npm install && elm package install
npm start
```

Navigate to `http://localhost:8080/` and open the console. you should see the error `Uncaught TypeError: Cannot read property 'tag' of undefined` show up.

# Hackish solution
simply add this line in the imports of port module. 

`import Json.Decode exposing (..)`

# structure
AppPorts.elm - contains port defn. Uncomment line 10 to see the expected behaviour

