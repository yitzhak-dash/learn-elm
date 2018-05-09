module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Regex


main =
    Html.beginnerProgram { model = model, view = view, update = update }



-- MODEL


type alias Model =
    { name : String
    , password : String
    , passwordAgain : String
    }


model : Model
model =
    Model "" "" ""



-- UPDATE


type Msg
    = Name String
    | Password String
    | PasswordAgain String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Name name ->
            { model | name = name }

        Password password ->
            { model | password = password }

        PasswordAgain password ->
            { model | passwordAgain = password }

-- VIEW


view : Model -> Html Msg
view model =
     div []
        [ input [ type_ "text", placeholder "Name", onInput Name ] []
        , input [ type_ "password", placeholder "Password", onInput Password ] []
        , input [ type_ "password", placeholder "Re-enter Password", onInput PasswordAgain ] []
        , viewValidation model
        ]

pattern = Regex.regex "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).+$"

viewValidation : Model -> Html msg
viewValidation model =
    let
        (color, message) =
            if model.password /= model.passwordAgain
                then ("red", "Password do not mutch")
            else if not (Regex.contains pattern model.password)
                then ("red", "the password should contains upper case, lower case, and numeric characters")
            else if String.length model.password < 8
                then ("red", "Password is not longer than 8 characters")
            else ("green", "OK")
    in
        div [ style [("color", color)]][text message]