module Exercise3 exposing (..)

import Html


cart =
    [ { name = "Lemon", qty = 1, freeQty = 0 }
    , { name = "Apple", qty = 5, freeQty = 0 }
    , { name = "Pear", qty = 10, freeQty = 0 }
    ]


free minQty freeQty item =
    if item.freeQty == 0 && minQty > 0 then
        { item | freeQty = item.qty // minQty * freeQty }

    else
        item


main =
    List.map (free 10 3 >> free 5 1) cart
        |> List.map (\item -> Html.li [] [ Html.text (item.name ++ " free: " ++ String.fromInt item.freeQty) ])
        |> Html.ul []
