import LRA.VolumeI.Map.Operation.Laws.Absorption.Theorems

namespace LRA.Map.Operation.Laws.Absorption

open LRA.Map.Operation

/-- Boolean disjunction as a lattice-style join operation. -/
def BooleanOrOperation : BinaryEndoOperation Bool :=
  fun left right => left || right

/-- Boolean conjunction as a lattice-style meet operation. -/
def BooleanAndOperation : BinaryEndoOperation Bool :=
  fun left right => left && right

/--
**[Example — BooleanOrAndMutualAbsorption]**

Boolean disjunction and conjunction satisfy mutual absorption.
-/
theorem BooleanOrAndMutualAbsorption :
    MutualAbsorptionLaw BooleanOrOperation BooleanAndOperation := by
  constructor
  · intro left right
    cases left <;> cases right <;> rfl
  · intro left right
    cases left <;> cases right <;> rfl

/-- Natural-number maximum as a lattice-style join operation. -/
def NaturalMaxOperation : BinaryEndoOperation Nat :=
  fun left right => Nat.max left right

/-- Natural-number minimum as a lattice-style meet operation. -/
def NaturalMinOperation : BinaryEndoOperation Nat :=
  fun left right => Nat.min left right

/--
**[Example — NaturalMaxMinMutualAbsorption]**

Natural-number maximum and minimum satisfy mutual absorption.
-/
theorem NaturalMaxMinMutualAbsorption :
    MutualAbsorptionLaw NaturalMaxOperation NaturalMinOperation := by
  constructor
  · intro left right
    exact Nat.max_eq_left (Nat.min_le_left left right)
  · intro left right
    exact Nat.min_eq_left (Nat.le_max_left left right)

end LRA.Map.Operation.Laws.Absorption
