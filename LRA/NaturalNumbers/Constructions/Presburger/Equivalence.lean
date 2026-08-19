/-!
No quotient is taken in this construction.

`PresburgerElement` is a native Lean `inductive` type; its equality is
whatever Lean's own definitional/propositional equality gives an inductive
type, with no representatives to identify. There is no equivalence relation
to define or quotient by here, for the same reason there is none in
`VonNeumann.Equivalence` -- see that file.
-/
