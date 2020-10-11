module Main exposing (main)

import Browser exposing (sandbox)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)


main =
    Browser.sandbox { init = init, update = update, view = view }


type alias Model =
    { name : String
    , password : String
    , passwordVerification : String
    }


init : Model
init =
    Model "" "" ""


type Msg
    = Name String
    | Password String
    | PasswordVerify String


update : Msg -> Model -> Model
update msg model =
  case msg of
    Name name ->
      { model | name = name }
    Password password ->
      { model | password = password }
    PasswordVerify password ->
      { model | passwordVerification = password }


viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput inputType p v onChange =
    input [ type_ inputType, placeholder p, value v, onInput onChange ] []


viewInputValidation : Model -> Html msg
viewInputValidation model =

    if model.password == model.passwordVerification then
        div [ style "color" "green" ] [ text "pass" ]

    else
        div [ style "color" "red" ] [ text "not match" ]


view : Model -> Html Msg
view model =
    div [style "display" "table"]
        [ viewInput "text" "你的名字" model.name Name
        , viewInput "password" "密码" model.password Password
        , viewInput "password" "再次输入密码进行验证" model.passwordVerification PasswordVerify
        , viewInputValidation model
        ]
