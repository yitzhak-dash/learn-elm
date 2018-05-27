module Playground exposing (..)

import Html

ecsapeEarth velocity speed =
    if velocity > 11.186 then
        "Goodspeed"
    else if speed == 7.67 then
        "Stay on orbit"
    else
        "Come back"


main = Html.text(ecsapeEarth 11.2 7.2)