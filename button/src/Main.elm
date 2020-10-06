module Main exposing (..)

import Browser exposing (sandbox)
import Html exposing (..)
import Html.Events exposing (onClick)


main =
    sandbox { init = init, update = update, view = view }


init : Model
init =
    { current = 0
    , step = 1
    }


type alias Model =
    { current : Int
    , step : Int
    }


type Msg
    = Increment
    | Decrement
    | Reset
    | IncreStep
    | DecreStep


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | current = model.current + model.step }

        Decrement ->
            { model | current = model.current - model.step }

        Reset ->
            { model | current = 0 }

        IncreStep ->
            { model | step = model.step + 1 }

        DecreStep ->
            { model | step = model.step - 1 }


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ Html.text "Decrement" ]
        , div [] [ Html.text (String.fromInt model.current) ]
        , button [ onClick Increment ] [ Html.text "Increment" ]
        , button [ onClick Reset ] [ text "Reset" ]
        , div []
            [ button [ onClick IncreStep ] [ text "step add" ]
            , div [] [ text (String.fromInt model.step) ]
            , button [ onClick DecreStep ] [ text "step decre" ]
            ]
        ]
