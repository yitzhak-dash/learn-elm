module Playground exposing (..)

import Html

escapeEarth velocity speed =
    if velocity > 11.186 then
        "Goodspeed"
    else if speed == 7.67 then
        "Stay on orbit"
    else
        "Come back"


main = Html.text(escapeEarth 11.2 7.2)