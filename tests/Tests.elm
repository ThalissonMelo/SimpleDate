module Tests exposing (..)

import Test exposing (..)
import SimpleDate exposing (..)
import Expect
import String


-- Check out http://package.elm-lang.org/packages/elm-community/elm-test/latest to learn more about testing in Elm!


all : Test
all =
    describe "Testing the simple date aplication"
        [ test "verifing json format" <|
            \() ->
            let
                simpleDate = {day = Just 25, month = Just 6, year = Just 1996}
                jsonDate = SimpleDate.toJson simpleDate
                jsonCorrectFormat = "{ year = 1996, month = 6, day = 25 }"
            in
            Expect.equal (toString(jsonDate)) jsonCorrectFormat
        
        , test "json file empty" <|
            \() ->
            let
                dataEmpty = {day = Nothing, month = Nothing, year = Nothing}
                jsonDate = SimpleDate.toJson dataEmpty
                jsonCorrectFormat = "{ year = null, month = null, day = null }"
            in
            Expect.equal (toString(jsonDate)) jsonCorrectFormat
            
        , test "json file empty on year when that one is bigger than 2999" <|
            \() ->
            let
                wrongYear = { day = Just 25, month = Just 6, year = Just 3000 }
                jsonDate = SimpleDate.toJson wrongYear
                jsonCorrectFormat = "{ year = null, month = 6, day = 25 }"
            in
            Expect.equal (toString(jsonDate)) jsonCorrectFormat
            
        , test "json file empty on year when that one is less than 1" <|
            \() ->
            let
                wrongYear = { day = Just 25, month = Just 6, year = Just 0 }
                jsonDate = SimpleDate.toJson wrongYear
                jsonCorrectFormat = "{ year = null, month = 6, day = 25 }"
            in
            Expect.equal (toString(jsonDate)) jsonCorrectFormat

        , test "json file empty on day when that one is bigger than 31" <|
            \() ->
            let
                wrongYear = { day = Just 32, month = Just 6, year = Just 1996 }
                jsonDate = SimpleDate.toJson wrongYear
                jsonCorrectFormat = "{ year = 1996, month = 6, day = null }"
            in
            Expect.equal (toString(jsonDate)) jsonCorrectFormat
        
        , test "json file empty on day when that one is less than 1" <|
            \() ->
            let
                wrongYear = { day = Just 0, month = Just 6, year = Just 1996 }
                jsonDate = SimpleDate.toJson wrongYear
                jsonCorrectFormat = "{ year = 1996, month = 6, day = null }"
            in
            Expect.equal (toString(jsonDate)) jsonCorrectFormat
        , test "json file empty on month when that one is less than 12" <|
            \() ->
            let
                wrongYear = { day = Just 25, month = Just 13, year = Just 1996 }
                jsonDate = SimpleDate.toJson wrongYear
                jsonCorrectFormat = "{ year = 1996, month = null, day = 25 }"
            in
            Expect.equal (toString(jsonDate)) jsonCorrectFormat
        , test "json file empty on month when that one is less than 1" <|
            \() ->
            let
                wrongYear = { day = Just 25, month = Just 0, year = Just 1996 }
                jsonDate = SimpleDate.toJson wrongYear
                jsonCorrectFormat = "{ year = 1996, month = null, day = 25 }"
            in
            Expect.equal (toString(jsonDate)) jsonCorrectFormat
        ]
