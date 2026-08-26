import LRA.Set.Constructions.NBGSet.Primitives

namespace LRA.Set.Constructions.NBG

open LRA.Set.Constructions

abbrev Set := NBGSet

abbrev Class := NBGClass

axiom ClassOfSet : Set → Class

axiom OrderedPair : Set → Set → Set

end LRA.Set.Constructions.NBG
