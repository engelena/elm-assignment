module Assignment exposing (main)

import Assignment.One exposing (collatz)
import Html
import Html.Attributes as Attribute


main =
    describe
        [ ( "Assignment 1"
          , [ test "value of 1" (equal 4 (collatz 1))
            , test "value of 4" (equal 2 (collatz 4))
            , test "value of 2" (equal 1 (collatz 2))
            ]
          )
        ]


describe : List ( String, List (Expectation t) ) -> Html.Html msg
describe expectationGroups =
    let
        groups =
            List.map viewExpectationGroup expectationGroups
    in
    Html.div [ Attribute.class "groups" ] groups


viewExpectationGroup : ( String, List (Expectation t) ) -> Html.Html msg
viewExpectationGroup ( description, expectations ) =
    let
        viewOfExpectations =
            List.map viewExpectation expectations
    in
    Html.div [ Attribute.class "group" ]
        (Html.h1 [ Attribute.class "description" ] [ Html.text description ]
            :: viewOfExpectations
        )


viewExpectation : Expectation t -> Html.Html msg
viewExpectation expectation =
    Html.div [ Attribute.class "expectation" ]
        [ Html.span [ Attribute.class "description" ] [ Html.text expectation.description ]
        , viewOfReport expectation.report
        ]


viewOfReport : Report t -> Html.Html msg
viewOfReport report =
    let
        success =
            report.resolution == Correct

        failure =
            not success
    in
    Html.span
        [ Attribute.classList
            [ ( "report", True )
            , ( "success", success )
            , ( "failure", failure )
            ]
        ]
        [ viewOfResolution report.resolution
        ]


viewOfResolution : Resolution -> Html.Html msg
viewOfResolution resolution =
    let
        text =
            case resolution of
                Correct ->
                    "✓"

                Incorrect reason ->
                    "❌: " ++ reason
    in
    Html.span [ Attribute.class "resolution" ] [ Html.text text ]


type alias Expectation t =
    { description : String
    , report : Report t
    }


type alias Report t =
    { expectationType : ExpectationType
    , left : t
    , right : t
    , resolution : Resolution
    }


type ExpectationType
    = Equal


type Resolution
    = Correct
    | Incorrect String


test : String -> Report t -> Expectation t
test description report =
    { description = description, report = report }


equal : a -> a -> Report a
equal left right =
    let
        resolution =
            if left == right then
                Correct

            else
                Incorrect "Expected arguments to be equal"
    in
    { expectationType = Equal
    , left = left
    , right = right
    , resolution = resolution
    }
