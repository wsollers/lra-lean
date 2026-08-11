import LRA.VolumeI.Set.Algebra.Ring

namespace LRA.VolumeI.Set.Algebra

open LRA.VolumeI.Set

universe u v

/-!
Algebras of sets, relative to an ambient set.

An algebra of sets on `X` is a ring of sets that also contains `X`
itself. Closure under *relative* complement (`ambient \ A`) then follows
from difference-closure -- it is a theorem, not a field -- which is why
this definition works on every backend: no absolute complement (`ᶜ`) and
no universal set (`𝒰`) are ever mentioned, so ZF-style backends
(Enderton, `ZFSet`) host algebras of sets on any ambient set they can
form, exactly as in the textbooks.
-/

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [Union SetObject] [Inter SetObject] [SDiff SetObject]
variable [EmptyCollection SetObject] [HasSubset SetObject]
variable [HasSymmDiff SetObject]

/-- An algebra of sets on `ambient`: a ring of sets that contains the
ambient set itself. -/
structure AlgebraOfSets (ambient : SetObject) extends
    RingOfSets ambient where
  AmbientIsMember : IsMember ambient

namespace AlgebraOfSets

variable {ambient : SetObject}

/-- Relative complements of members are members: derived from
difference-closure and ambient-membership, not a primitive field. -/
theorem RelativeComplementIsMember
    (algebra : AlgebraOfSets ambient)
    (A : SetObject) (AIsMember : algebra.IsMember A) :
    algebra.IsMember (ambient \ A) := by
  sorry

end AlgebraOfSets

end LRA.VolumeI.Set.Algebra
