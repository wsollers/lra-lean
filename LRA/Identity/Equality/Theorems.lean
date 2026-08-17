import LRA.Identity.Axioms

namespace LRA.Identity

universe u

/-- Equality is symmetric, derived from reflexivity and Leibniz substitution. -/
theorem EqualitySymmetry {Carrier : Type u} {left right : Carrier}
    (ObjectsAreEqual : left = right) :
    right = left := by
  have substitution :=
    LeibnizLaw ObjectsAreEqual (fun value => value = left)
  exact substitution.mp (EqualityReflexivity left)

/-- Equality is transitive, derived from Leibniz substitution. -/
theorem EqualityTransitivity {Carrier : Type u} {first second third : Carrier}
    (FirstEqualsSecond : first = second)
    (SecondEqualsThird : second = third) :
    first = third := by
  have substitution :=
    LeibnizLaw FirstEqualsSecond (fun value => value = third)
  exact substitution.mpr SecondEqualsThird

/-- A descriptive alias for Lean propositional equality. -/
abbrev PropositionalEquality {Carrier : Type u} (left right : Carrier) : Prop :=
  left = right

end LRA.Identity
