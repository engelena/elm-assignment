# Elm Assignment
Assignment to learn te beginnings of Elm and functional programming.

For a short introduction to Elm see the [Elm demonstration][demo]. It also provides links more references. The [documentation][docs] should probably consulted more often.

## Assignments
This project contains a small Elm project. Run the `elm reactor` command and open [http://localhost:8000](http://localhost:8000). You should see a series of assignments being tested. Your goal is to make all the tests pass.

For each assignment there is a Elm module. Those modules can be found in the `src/Assignment/` directory. For example, assignment one can be found at `src/Assignment/One.elm`

### Assignment 1
Calculate the **Collatz function**. The Collatz function is

>  start with any positive integer n. Then each term is obtained from the previous term as follows: if the previous term is even, the next term is one half the previous term. If the previous term is odd, the next term is 3 times the previous term plus 1.

For example, Let's calculate the Collatz function for `28`. Now `28` is an even number, so we are instructed to divide by two, getting `14` in the process. If we apply the Collatz function to `14` we find `7`.

Open `src/Assignment/One.elm` and implement the Collatz function.

### Assignment 2
Create a type alias for an [`Interval` type][interval]. You should also implement 

1. A constructor.
2. The convex hull of two intervals
3. The intersection of two intervals.

Type signatures are provided as well as default implementations. The `intersection` signature uses the [`Maybe` type][maybe].

[demo]: https://github.com/HAN-ASD-DT/elm-demonstration
[docs]: http://elm-lang.org/docs
[collatz]: https://en.wikipedia.org/wiki/Collatz_conjecture
[interval]: https://en.wikipedia.org/wiki/Interval_(mathematics)
[maybe]: https://package.elm-lang.org/packages/elm/core/latest/Maybe
