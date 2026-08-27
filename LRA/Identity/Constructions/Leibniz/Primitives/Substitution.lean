import LRA.Identity.Constructions.Leibniz.Axioms

namespace LRA.Identity

universe u

/-- `SubstitutionPreservesPredicates` (`Interface/Laws/Substitution.lean`) is
`LeibnizLaw` itself, restated — not an independently-proved fact. This is the
missing link the axiomatic derivation stopped short of: the whole
`Interface/Laws/Substitution.lean` family (and everything built on it —
`EqualityCongruence`, `EqualityIsCongruence`, …) is a corollary of this one
axiom, even though `Interface/Laws/Substitution.lean` proves it directly by
`rw` rather than by citing `LeibnizLaw`. Once proved, compare the two proofs
side by side. -/
theorem LeibnizSubstitution {Carrier : Type u} {left right : Carrier}
    (ObjectsAreEqual : left = right)
    (predicate : Carrier → Prop) :
    predicate left ↔ predicate right := by
  sorry

end LRA.Identity
