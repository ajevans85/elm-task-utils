module Task.Utils where
{-| Helper functions for working with Tasks
-}

import Task exposing (Task, succeed, onError, map, mapError)

{-| Catamorphism. If the task is a failure, apply the first function to a; if it is successful, apply the second function to b.
-}
fold : (a -> c) -> (b -> c) -> Task a b -> Task y c
fold f1 f2 t =
  map f2 t `onError` (\x -> succeed(f1 x))


bimap : (a1 -> a2) -> (b1 -> b2) -> Task a1 b1 -> Task a2 b2
bimap f1 f2 t =
  Task.mapError f1 t
    |> Task.map f2
