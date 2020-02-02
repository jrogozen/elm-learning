module Exercise2 exposing (..)

import Html


wordCount : String -> Int
wordCount sentence =
    String.words sentence
        |> List.map (\w -> String.length w)
        |> List.sum


main =
    let
        sentence =
            "this is my sentence"
    in
    sentence
        |> wordCount
        |> String.fromInt
        |> Html.text
