-- LRA/NumberSystems/Integers/Constructions/Polish/TwoSidedSuccessor/Equivalence.lean

/-!
No quotient is taken in this construction.

`Z` is a native Lean `inductive` type; its equality is whatever Lean's own
definitional/propositional equality gives an inductive type, with no
representatives to identify. There is no equivalence relation to define or
quotient by here, for the same reason there is none in
`NaturalNumbers.Constructions.Presburger.Equivalence` or
`NaturalNumbers.Constructions.VonNeumann.Equivalence` -- see those files.
-/
