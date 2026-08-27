import LRA.Identity.Interface.ModelTheory.LStructure
import LRA.Identity.Interface.ModelTheory.Theory

namespace LRA.Identity

universe u

/-- Soundness: every semantic model of pure equality obeys the axiomatic
equality theory. This is the bridge `EqualityStructure` → `EqualityTheory`
that neither `Interface/ModelTheory` nor `Constructions/*/Satisfies` provides
on its own — the two have been disconnected notions of "a model of equality"
until now. -/
theorem EqualityStructure.satisfiesEqualityTheory
    (equalityStructure : EqualityStructure.{u}) :
    EqualityTheory equalityStructure.Carrier := by
  sorry

/-- The converse direction: a relation need not be assumed diagonal to become
an `EqualityStructure`'s `equalityInterpretation` — reflexivity plus Leibniz
substitution already force it to be. In other words,
`EqualityStructure.equalityIsDiagonal` is not an extra axiom sitting on top of
`EqualityTheory`'s two fields; it is a consequence of them. -/
theorem ReflexiveLeibnizRelationIsDiagonal
    {Carrier : Type u} {relation : Carrier → Carrier → Prop}
    (reflexive : ∀ x, relation x x)
    (leibniz :
      ∀ x y, relation x y → ∀ property : Carrier → Prop, property x ↔ property y) :
    ∀ x y, relation x y ↔ x = y := by
  sorry

/-- Packaging `ReflexiveLeibnizRelationIsDiagonal`: any relation satisfying
`EqualityTheory`'s two axioms gives rise to an `EqualityStructure` — the
"vice versa" half of the bridge. -/
def EqualityStructure.ofReflexiveLeibnizRelation
    (Carrier : Type u) [Nonempty Carrier] {relation : Carrier → Carrier → Prop}
    (reflexive : ∀ x, relation x x)
    (leibniz :
      ∀ x y, relation x y → ∀ property : Carrier → Prop, property x ↔ property y) :
    EqualityStructure.{u} where
  Carrier := Carrier
  carrierNonempty := inferInstance
  equalityInterpretation := relation
  equalityIsDiagonal := ReflexiveLeibnizRelationIsDiagonal reflexive leibniz

end LRA.Identity
