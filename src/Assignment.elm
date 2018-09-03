module Assignment exposing (main)

import Assignment.One exposing (collatz)
import Assignment.Three exposing (cons, head, singleton, tail)
import Assignment.Two exposing (hull, intersection, interval)
import Html
import Html.Attributes as Attribute


main =
    describe
        [ ( "Assignment 1"
          , [ test "(collatz 1) should be 4" (equal 4 (collatz 1))
            , test "(collatz 4) should be 2" (equal 2 (collatz 4))
            , test "(collatz 2) should be 1" (equal 1 (collatz 2))
            ]
          )
        , ( "Assignment 2"
          , [ test "interval orders arguments" (equal (interval 1 3) (interval 3 1))
            , test "interval with different bounds are different" (negate (equal (interval 1 2) (interval 2 3)))
            , test "hull of [1,3] [6,7] is [1,7]" (equal (interval 1 7) (hull (interval 1 3) (interval 6 7)))
            , test "intersection of [1,6] [3,7] is Just [3,6]" (equal (Just (interval 3 6)) (intersection (interval 1 6) (interval 3 7)))
            , test "intersection of [1,3] [6,7] is Nothing" (equal Nothing (intersection (interval 1 3) (interval 6 7)))
            ]
          )
        , ( "Assignment 3"
          , [ test "singleton of different values are different" (negate (equal (singleton 1) (singleton 2)))
            , test "head of singleton is value" (equal 37 (head (singleton 37)))
            , test "head of a cons" (equal 51 (head (cons 51 (singleton 37))))
            , test "tail of a cons" (equal (Just (singleton 37)) (tail (cons 51 (singleton 37))))
            , test "tail of a singleton" (equal Nothing (tail (singleton 37)))
            ]
          )
        ]


describe : List ( String, List Expectation ) -> Html.Html msg
describe expectationGroups =
    let
        groups =
            List.map viewExpectationGroup expectationGroups
    in
    Html.div [ Attribute.class "groups" ] groups


viewExpectationGroup : ( String, List Expectation ) -> Html.Html msg
viewExpectationGroup ( description, expectations ) =
    let
        viewOfExpectations =
            List.map viewExpectation expectations
    in
    Html.div [ Attribute.class "group" ]
        (Html.h1 [ Attribute.class "description" ] [ Html.text description ]
            :: viewOfExpectations
        )


viewExpectation : Expectation -> Html.Html msg
viewExpectation expectation =
    Html.div [ Attribute.class "expectation" ]
        [ Html.span [ Attribute.class "description" ] [ Html.text expectation.description ]
        , viewOfReport expectation.report
        ]


viewOfReport : Report -> Html.Html msg
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


type alias Expectation =
    { description : String
    , report : Report
    }


type alias Report =
    { expectationType : ExpectationType
    , resolution : Resolution
    }


type ExpectationType
    = Equal


type Resolution
    = Correct
    | Incorrect String


test : String -> Report -> Expectation
test description report =
    { description = description, report = report }


equal : a -> a -> Report
equal left right =
    let
        resolution =
            if left == right then
                Correct

            else
                Incorrect "Expected arguments to be equal"
    in
    { expectationType = Equal
    , resolution = resolution
    }


negate : Report -> Report
negate report =
    let
        opposite : Resolution -> Resolution
        opposite resolution =
            case resolution of
                Correct ->
                    Incorrect "Expected to be correct"

                Incorrect _ ->
                    Correct
    in
    { report | resolution = opposite report.resolution }
