module Main exposing (main)

import Html


add a b =
    a + b


result =
    add 1 2
        |> add 3


main =
    Html.text (String.fromInt result)
