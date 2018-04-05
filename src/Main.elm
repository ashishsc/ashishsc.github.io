module Main exposing (..)

import Color as C exposing (Color, rgb)
import Element exposing (..)
import Element.Attributes exposing (..)
import Html
import Style exposing (..)
import Style.Color as Color
import Style.Font as Font
import Style.Transition as Transition


-- Colorscheme: http://paletton.com/#uid=54P0u0kllllaFw0g0qFqFg0w0aF


darkestPurple : C.Color
darkestPurple =
    rgb 70 46 116


purple : C.Color
purple =
    rgb 98 40 112


lightestPink : C.Color
lightestPink =
    rgb 145 48 89


type alias Model =
    ()


init : ( Model, Cmd Msg )
init =
    ( (), Cmd.none )


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


type Styles
    = None
    | Heading
    | Nav
    | NavLink
    | Base


defaultFont : List Font
defaultFont =
    [ Font.font "Open Sans"
    , Font.font "helvetica"
    , Font.font "arial"
    , Font.font "sans-serif"
    ]


stylesheet : StyleSheet Styles variation
stylesheet =
    Style.styleSheet
        [ style None []
        , style Heading
            [ Font.typeface defaultFont
            , Font.size 80
            ]
        , style Nav
            [ Font.size 20
            , Font.typeface defaultFont
            , Color.text lightestPink
            ]
        , style NavLink
            []
        , style Base
            [ Color.text darkestPurple ]
        ]


view : Model -> Html.Html Msg
view model =
    Element.layout stylesheet <|
        column Base
            [ center, width fill, height fill, moveDown 50 ]
            [ el Heading [ center ] (text "Ashish")
            , navigation Nav
                [ spacing 80, moveDown 20 ]
                { name = "Main Navigation"
                , options =
                    [ link "/about" (el NavLink [] (text "About"))
                    , link "/blog" (el NavLink [] (text "Blog"))
                    , link "https://github.com/ashishsc" (el NavLink [] (text "Projects"))
                    ]
                }
            ]


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
