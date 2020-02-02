module Exercise4 exposing (..)

import Browser exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- model


type alias Model =
    { calories : Int
    , calorieInput : String
    , errorMessage : String
    }


initModel : Model
initModel =
    { calories = 0
    , calorieInput = ""
    , errorMessage = ""
    }



-- update


type Msg
    = AddCalorie
    | Input String
    | Clear


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddCalorie ->
            case String.toInt model.calorieInput of
                Nothing ->
                    { model
                        | calorieInput = ""
                        , errorMessage = "please enter a number"
                    }

                Just calories ->
                    { model
                        | calorieInput = ""
                        , calories = model.calories + calories
                    }

        Input val ->
            { model
                | calorieInput = val
                , errorMessage = ""
            }

        Clear ->
            initModel


view : Model -> Html Msg
view model =
    div []
        [ h3 []
            [ text ("Total Calories: " ++ String.fromInt model.calories) ]
        , input
            [ type_ "text"
            , onInput Input
            , placeholder "number of calories to add"
            , value model.calorieInput
            ]
            []
        , div [] [ text model.errorMessage ]
        , button
            [ type_ "button"
            , onClick AddCalorie
            ]
            [ text "Add" ]
        , button
            [ type_ "button"
            , onClick Clear
            ]
            [ text "Clear" ]
        ]


main =
    Browser.sandbox
        { init = initModel
        , update = update
        , view = view
        }
