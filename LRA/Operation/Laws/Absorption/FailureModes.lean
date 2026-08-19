import LRA.Operation.Laws.Absorption.Definition
import LRA.Operation.Laws.Absorbing.Definition

namespace LRA.Operation.Laws.Absorption

open LRA.Operation

universe u

/-- Failure of one directed absorption law. -/
def FailsAbsorptionLaw {Carrier : Type u}
    (outer inner : BinaryEndoOperation Carrier) : Prop :=
  Not (AbsorptionLaw outer inner)

/-- Failure of mutual absorption. -/
def FailsMutualAbsorptionLaw {Carrier : Type u}
    (first second : BinaryEndoOperation Carrier) : Prop :=
  Not (MutualAbsorptionLaw first second)

/-- Natural-number addition as a ring-style operation. -/
def NaturalAdditionOperation : BinaryEndoOperation Nat :=
  fun left right => left + right

/-- Natural-number multiplication as a ring-style operation. -/
def NaturalMultiplicationOperation : BinaryEndoOperation Nat :=
  fun left right => left * right

/-- Natural-number maximum as a lattice-style join operation. -/
def NaturalMaxOperation : BinaryEndoOperation Nat :=
  fun left right => Nat.max left right

/-- Natural-number minimum as a lattice-style meet operation. -/
def NaturalMinOperation : BinaryEndoOperation Nat :=
  fun left right => Nat.min left right

/-- Natural-number addition and multiplication are not a mutually absorbing
lattice-style pair. -/
theorem NaturalAdditionMultiplicationFailAbsorption :
    FailsAbsorptionLaw NaturalAdditionOperation NaturalMultiplicationOperation ∧
      FailsAbsorptionLaw NaturalMultiplicationOperation NaturalAdditionOperation := by
  sorry

/-- Having an absorbing element for one operation does not supply a two-operation
absorption law. -/
theorem NaturalMultiplicationHasAbsorberButFailsAbsorption :
    LRA.Operation.Laws.Absorbing.TwoSidedAbsorbing
      NaturalMultiplicationOperation 0 ∧
      FailsAbsorptionLaw NaturalMultiplicationOperation
        NaturalAdditionOperation := by
  sorry

/-- Natural maximum has no absorbing element on `Nat`, even though it participates
in the mutual absorption laws with `Nat.min`. -/
theorem NaturalMaxHasNoAbsorbingElement :
    MutualAbsorptionLaw NaturalMaxOperation NaturalMinOperation ∧
      Not
        (∃ absorber : Nat,
          LRA.Operation.Laws.Absorbing.TwoSidedAbsorbing
            NaturalMaxOperation absorber) := by
  sorry

end LRA.Operation.Laws.Absorption
