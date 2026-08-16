import LRA.VolumeI.Map.Surjective.Definition
import LRA.VolumeI.Map.Examples.Canonical

namespace LRA.Map.Surjective

open LRA.Map.Typed
open LRA.Map.Examples.Canonical

universe u v

/--
A map misses a value when some codomain value is hit by no input.
-/
def MissesValue {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) : Prop :=
  exists output : Codomain, forall input : Domain, map input ≠ output

/--
Missing a value is exactly a failure of surjectivity.
-/
theorem MissesValueIffNotSurjective
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    MissesValue map <-> ¬ Surjective map := by
  classical
  constructor
  · intro missed surjective
    obtain ⟨output, misses⟩ := missed
    obtain ⟨input, hits⟩ := surjective output
    exact misses input hits
  · intro notSurjective
    by_cases missed : MissesValue map
    · exact missed
    · exfalso
      apply notSurjective
      intro output
      by_cases hasPreimage : exists input : Domain, map input = output
      · exact hasPreimage
      · exfalso
        exact missed ⟨output, fun input hits => hasPreimage ⟨input, hits⟩⟩

/--
The successor shift misses zero.
-/
theorem ShiftMissesZero :
    MissesValue shift := by
  exact ⟨0, fun input hits => Nat.succ_ne_zero input hits⟩

/--
The successor shift is not surjective.
-/
theorem ShiftNotSurjective :
    ¬ Surjective shift :=
  (MissesValueIffNotSurjective shift).mp ShiftMissesZero

end LRA.Map.Surjective
