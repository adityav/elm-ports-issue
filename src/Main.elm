
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App as App


-- port
import AppPorts exposing (..)

-- MSG
type Msg = JsMsg String

-- App MODEL
type alias Model = 
  { 
    msg : String
  }

-- APP
main =
  App.program
  { view = view
  , update = update
  , init = init
  , subscriptions = subscriptions}


-- INIT
init : (Model, Cmd Msg)
init = 
  (Model "", sendToJS "hi Elm! been a long time!")

-- UPDATE
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    JsMsg msg ->
      { model | msg = msg } ! []


-- Subscriptions
subscriptions : Model -> Sub Msg
subscriptions model = fromJS JsMsg

-- Top level view
view : Model -> Html Msg
view model =
  div [][
    p [] [ text "waiting for JS to respond"],
    p [] [ text model.msg]
  ]
