-- LRA/NumberSystems/Integers/Constructions/Polish/TwoSidedSuccessor/WellDefinedness.lean

/-!
No quotient is taken in this construction (see `Equivalence.lean`), so there
is no respects-the-equivalence obligation to discharge here: `add`, `negZ`,
and `mul` are defined directly on `Z` by structural recursion, not on
representatives of an equivalence class.
-/
