module Main exposing (main)

import Browser
import Html exposing (Html, button, div, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    Int


init : Model
init =
    0



-- UPDATE


type Msg
    = Increment
    | Decrement
    | Reset


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1

        Reset ->
            0



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "columns is-gapless" ]
        [ div [ class "column" ]
            [ button [ class "button is-primary is-small", onClick Decrement ]
                [ text "-" ]
            ]
        , div [ class "column" ]
            [ text (String.fromInt model) ]
        , div [ class "column" ]
            [ button [ class "button is-primary is-small", onClick Increment ]
                [ text "+" ]
            ]
        , div [ class "column" ]
            [ button [ class "button is-primary is-small", onClick Reset ]
                [ text "0" ]
            ]
        ]