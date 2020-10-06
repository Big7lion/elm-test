module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)

main = 
    Browser.sandbox {init = init, update = update, view = view}

type alias Model = 
  { content: String
    , reverse: Bool
  }

init: Model
init = 
  { content = ""
    , reverse = True
  }

type Msg =
  Change String
  | ReverseChange

update: Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
     { model | content = newContent }
    ReverseChange ->
     { model | reverse = not model.reverse }

view: Model -> Html Msg
view model =
 div [] [ 
   input [placeholder "oh no what", onInput Change, value model.content] []
   , div [] [ text (if model.reverse then String.reverse(model.content) else model.content)  ]
   , input [id "checkbox", type_ "checkbox", checked model.reverse, onClick ReverseChange] []
   , label [for "checkbox"] [text "是否倒序"]
 ]