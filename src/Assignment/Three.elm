module Assignment.Three exposing (NonEmptyList, cons, head, singleton, tail)

{-| A non-empty list

A type of list that guarantees that it has at least a single item.

-}


type NonEmptyList t
    = YourImplementationHere


{-| singleton returns a non empty list with a single item.
-}
singleton : t -> NonEmptyList t
singleton value =
    YourImplementationHere


{-| `cons` takes a value and a non empty list and puts the value at the front.
-}
cons : t -> NonEmptyList t -> NonEmptyList t
cons value aList =
    YourImplementationHere


{-| `head` returns the first element in the non-empty list.

Notice the difference between the implementation of `head` in the `List` module.

Furthermore, the type signature is restricted to `Int` to make it compile. Make sure to allow any type inside of the list.

-}
head : NonEmptyList Int -> Int
head aList =
    0


{-| `tail` return the tail of the list, if it exist.
-}
tail : NonEmptyList t -> Maybe (NonEmptyList t)
tail aList =
    Just YourImplementationHere
