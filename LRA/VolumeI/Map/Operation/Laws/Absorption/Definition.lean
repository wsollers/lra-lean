import LRA.VolumeI.Map.Operation.Definition

namespace LRA.Map.Operation.Laws.Absorption

open LRA.Map.Operation

universe u

/--
Absorption for two binary endo-operations: `outer a (inner a b) = a`.

This is deliberately separate from `Absorbing`, which is an element-level law.
-/
def AbsorptionLaw {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop :=
  forall left right, outer left (inner left right) = left

/--
Mutual absorption for a pair of operations, as in lattice join and meet.
-/
def MutualAbsorptionLaw {Carrier : Type u}
    (first second : BinaryEndoOperation Carrier) : Prop :=
  AbsorptionLaw first second /\ AbsorptionLaw second first

end LRA.Map.Operation.Laws.Absorption
