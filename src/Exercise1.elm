module Exercise1 exposing (capitalize, main)

import Html


capitalize : Int -> String -> String
capitalize maxLength name =
    if String.length name > maxLength then
        String.toUpper name

    else
        name


displayName : Int -> String -> String
displayName length name =
    name
        ++ " - name length: "
        ++ String.fromInt length


main =
    let
        name =
            "Jon Rogozen"

        length =
            String.length name
    in
    capitalize 10 name
        |> displayName length
        |> Html.text
