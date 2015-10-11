module Task.Utils where
{-| Helper functions for working with Tasks
-}

import Task exposing (Task, succeed, onError, map)

{-| Catamorphism. If the task is a failure, apply the first function to a; if it is successful, apply the second function to b.
-}
fold : (a -> c) -> (b -> c) -> Task a b -> Task y c
fold f1 f2 t =
  map f2 t `onError` (\x -> succeed(f1 x))
