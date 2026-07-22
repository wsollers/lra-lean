import LRA.VolumeI.Set.ZFC.Syntax.Formula

namespace LRA.VolumeI.Set.ZFC

/-!
Derived ZFC vocabulary.

These definitions package common set-theoretic predicates as formulas over
the one-relation ZFC signature. They do not assert the corresponding ZFC
axioms; they only build the formulas used by those axioms.
-/

/-- The ZFC formula `x ⊆ y`, written as `∀z, z ∈ x → z ∈ y` with a
fresh bound variable `z`. -/
def isSubsetOf (x y : ZFCVariable) : ZFCFormula :=
  let z := freshVariable [x, y]
  forallVariable z (impliesFormula (isMemberOf z x) (isMemberOf z y))

/-- The ZFC formula saying `x` has no members. -/
def isEmptySet (x : ZFCVariable) : ZFCFormula :=
  let z := freshVariable [x]
  forallVariable z (notFormula (isMemberOf z x))

/-- The ZFC formula saying `p` is the unordered pair set `{x, y}`. -/
def isPairSetOf (p x y : ZFCVariable) : ZFCFormula :=
  let z := freshVariable [p, x, y]
  forallVariable z
    (iffFormula
      (isMemberOf z p)
      (orFormula (isEqualTo z x) (isEqualTo z y)))

/-- The ZFC formula saying `u` is the union of `x`. -/
def isUnionSetOf (u x : ZFCVariable) : ZFCFormula :=
  let z := freshVariable [u, x]
  let y := freshVariable [u, x, z]
  forallVariable z
    (iffFormula
      (isMemberOf z u)
      (existsVariable y
        (andFormula (isMemberOf y x) (isMemberOf z y))))

/-- The ZFC formula saying `p` is the power set of `x`. -/
def isPowerSetOf (p x : ZFCVariable) : ZFCFormula :=
  let z := freshVariable [p, x]
  forallVariable z
    (iffFormula
      (isMemberOf z p)
      (isSubsetOf z x))

/-- The ZFC formula saying `s` is the successor of `u`, i.e.
`s = u ∪ {u}`, written as `∀z, z ∈ s ↔ (z ∈ u ∨ z = u)` with a fresh
bound variable `z`. This is the adjunction operation `u ↦ u ∪ {u}` that
the Infinity axiom's inductive set is closed under. -/
def isSuccessorOf (s u : ZFCVariable) : ZFCFormula :=
  let z := freshVariable [s, u]
  forallVariable z
    (iffFormula
      (isMemberOf z s)
      (orFormula (isMemberOf z u) (isEqualTo z u)))

end LRA.VolumeI.Set.ZFC
