import LRA.VolumeI.Map.Operation.Laws.Absorption.Examples
import LRA.VolumeI.Map.Operation.Laws.Absorbing.Definition

namespace LRA.Map.Operation.Laws.Absorption

open LRA.Map.Operation

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

/--
**[Failure Mode — NaturalAdditionMultiplicationFailAbsorption]**

Natural-number addition and multiplication are not a mutually absorbing
lattice-style pair.
-/
theorem NaturalAdditionMultiplicationFailAbsorption :
    FailsAbsorptionLaw NaturalAdditionOperation NaturalMultiplicationOperation /\
      FailsAbsorptionLaw NaturalMultiplicationOperation NaturalAdditionOperation := by
  constructor
  · intro law
    have contradiction := law 1 1
    simp [NaturalAdditionOperation, NaturalMultiplicationOperation] at contradiction
  · intro law
    have contradiction := law 2 0
    simp [NaturalAdditionOperation, NaturalMultiplicationOperation] at contradiction

/--
**[Failure Mode — NaturalMultiplicationHasAbsorberButFailsAbsorption]**

Having an absorbing element for one operation does not supply a two-operation
absorption law.
-/
theorem NaturalMultiplicationHasAbsorberButFailsAbsorption :
    LRA.Map.Operation.Laws.Absorbing.TwoSidedAbsorbing
      NaturalMultiplicationOperation 0 /\
      FailsAbsorptionLaw NaturalMultiplicationOperation
        NaturalAdditionOperation := by
  constructor
  · constructor <;> intro element <;> simp [NaturalMultiplicationOperation]
  · exact NaturalAdditionMultiplicationFailAbsorption.2

/--
**[Failure Mode — NaturalMaxHasNoAbsorbingElement]**

Natural maximum has no absorbing element on `Nat`, even though it participates
in the mutual absorption laws with `Nat.min`.
-/
theorem NaturalMaxHasNoAbsorbingElement :
    MutualAbsorptionLaw NaturalMaxOperation NaturalMinOperation /\
      Not
        (exists absorber : Nat,
          LRA.Map.Operation.Laws.Absorbing.TwoSidedAbsorbing
            NaturalMaxOperation absorber) := by
  constructor
  · exact NaturalMaxMinMutualAbsorption
  · intro witness
    rcases witness with ⟨absorber, _leftAbsorbing, rightAbsorbing⟩
    have contradiction := rightAbsorbing (absorber + 1)
    simp [NaturalMaxOperation] at contradiction

end LRA.Map.Operation.Laws.Absorption
