module Assignment.One exposing (collatz)

{-| Collatz Function

The [Collatz function](https://en.wikipedia.org/wiki/Collatz_conjecture) calculates a the following algorithm:

> start with any positive integer n. Then each term is obtained from the previous term as follows: if the previous term is even, the next term is one half the previous term. If the previous term is odd, the next term is 3 times the previous term plus 1.

There is a famous conjecture that states _no matter what value of n, the sequence will always reach 1_.
-}
collatz: Int -> Int
collatz n =
    1
