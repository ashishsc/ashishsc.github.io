module Main exposing (..)

import Color
import Element exposing (..)
import Element.Attributes exposing (..)
import Html
import Style exposing (..)
import Style.Color as Color
import Style.Font as Font
import Style.Transition as Transition


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
            , Font.size 60
            ]
        , style Nav
            [ Font.size 16
            , Font.typeface defaultFont
            ]
        , style NavLink
            []
        ]


view : Model -> Html.Html Msg
view model =
    Element.layout stylesheet <|
        column None
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
