port module AppPorts exposing (..)

--import Json.Decode exposing (..)

port fromJS : (String -> msg) -> Sub msg
port sendToJS : String -> Cmd msg

