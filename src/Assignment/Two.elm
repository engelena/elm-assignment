module Assignment.Two exposing (Interval, hull, interval, intersection)

{-| An _interval_ is a contiguous sequence of numbers.

For example, the numbers `1, 2, 3` form the interval `interval 1 3`.

-}


type alias Interval =
    {}


{-| The interval constructor.

It takes the lower and upper bound and constructs the corresponding `Interval`

-}
interval : Int -> Int -> Interval
interval lower upper =
    {}


{-| The convex hull of two intervals

A [convex hull](https://en.wikipedia.org/wiki/Convex_hull) of intervals is the smallest interval that contains all intervals.

-}
hull : Interval -> Interval -> Interval
hull first second =
    {}


{-| The intersection of two intervals

Given two intervals, the [intersection](https://en.wikipedia.org/wiki/Intersection) is the interval that contains all the integers that are present in both.

Note that intersections sometimes are empty.

-}
intersection : Interval -> Interval -> Maybe Interval
intersection first second =
    Nothing
