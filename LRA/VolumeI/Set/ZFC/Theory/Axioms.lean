import LRA.VolumeI.Set.ZFC.Syntax.Vocabulary

namespace LRA.VolumeI.Set.ZFC

/-!
ZFC axioms.

These are formulas over the ZFC signature. Their model-theoretic
satisfaction properties are proved separately when the semantic layer
needs them.

Each axiom below is a closed formula (no free variables): the numeric
variables `0`, `1`, … seeded here are all bound by this formula's own
quantifiers, and every helper that introduces a bound variable of its own
(`isSubsetOf`, `isPairSetOf`, …) chooses it fresh, so the seeds never
collide with a helper's internal binder.

Equality is a *primitive* logical symbol of this first-order language
(`Formula.equal`, present in every signature), not a defined predicate --
so, unlike a treatment that defines `x = y` as `∀z (z ∈ x ↔ z ∈ y)`, these
axioms may use `=` directly and Extensionality is a genuine axiom rather
than a definition. The corresponding equality/congruence axioms are not
listed here because the semantic layer gets them for free (see
`Model.lean`); a future proof-theoretic layer will need to add them
explicitly.
-/

/-- Extensionality: sets with the same members are equal, expressed using
mutual subset inclusion. -/
def extensionalityAxiom : ZFCFormula :=
  let x : ZFCVariable := 0
  let y : ZFCVariable := 1
  forallVariable x
    (forallVariable y
      (impliesFormula
        (andFormula (isSubsetOf x y) (isSubsetOf y x))
        (isEqualTo x y)))

/-- Empty set: some set has no members.

Strictly, this is redundant in the presence of Separation and any
nonempty domain: separating the always-false condition out of any set
yields an empty set. It is kept as a named axiom anyway, both because that
is the conventional presentation and because it does not presuppose the
Separation schema. -/
def emptySetAxiom : ZFCFormula :=
  let x : ZFCVariable := 0
  existsVariable x (isEmptySet x)

/-- Pairing: for any `x` and `y`, there is a set whose members are exactly
`x` and `y`. -/
def pairingAxiom : ZFCFormula :=
  let x : ZFCVariable := 0
  let y : ZFCVariable := 1
  let p := freshVariable [x, y]
  forallVariable x
    (forallVariable y
      (existsVariable p (isPairSetOf p x y)))

/-- Union: for every set `x`, there is a set whose members are exactly the
members of members of `x`. -/
def unionAxiom : ZFCFormula :=
  let x : ZFCVariable := 0
  let u := freshVariable [x]
  forallVariable x (existsVariable u (isUnionSetOf u x))

/-- Power set: for every set `x`, there is a set whose members are exactly
the subsets of `x`. -/
def powerSetAxiom : ZFCFormula :=
  let x : ZFCVariable := 0
  let p := freshVariable [x]
  forallVariable x (existsVariable p (isPowerSetOf p x))

/-- Foundation (Regularity): every nonempty set `x` has a member `y` that
is `∈`-minimal in `x` -- no member `z` of `x` is also a member of `y`.
Stated as `∀x ((∃w, w ∈ x) → ∃y (y ∈ x ∧ ∀z (z ∈ x → ¬z ∈ y)))`. -/
def foundationAxiom : ZFCFormula :=
  let x : ZFCVariable := 0
  let w := freshVariable [x]
  let y := freshVariable [x, w]
  let z := freshVariable [x, w, y]
  forallVariable x
    (impliesFormula
      (existsVariable w (isMemberOf w x))
      (existsVariable y
        (andFormula
          (isMemberOf y x)
          (forallVariable z
            (impliesFormula (isMemberOf z x) (notFormula (isMemberOf z y)))))))

/-- Infinity: there is an inductive set `i` -- one that contains an empty
set and is closed under the successor operation `u ↦ u ∪ {u}`. Stated as
`∃i ((∃e (e ∈ i ∧ e is empty)) ∧ ∀u (u ∈ i → ∃v (v ∈ i ∧ v is the
successor of u)))`. -/
def infinityAxiom : ZFCFormula :=
  let i : ZFCVariable := 0
  let e := freshVariable [i]
  let u := freshVariable [i, e]
  let v := freshVariable [i, e, u]
  existsVariable i
    (andFormula
      (existsVariable e (andFormula (isMemberOf e i) (isEmptySet e)))
      (forallVariable u
        (impliesFormula
          (isMemberOf u i)
          (existsVariable v
            (andFormula (isMemberOf v i) (isSuccessorOf v u))))))

/-- Choice: the `C` of ZFC.

Stated in the *pairwise-disjoint transversal* form: for every family `F`
whose members are all nonempty and pairwise disjoint, there is a set `C`
that meets each member of `F` in exactly one point. In full:
`∀F ((∀Y (Y ∈ F → ∃w w ∈ Y)) ∧ (∀A ∀B ((A ∈ F ∧ B ∈ F ∧ ¬A = B) →
¬∃u (u ∈ A ∧ u ∈ B))) → ∃C ∀Y (Y ∈ F → ∃z (z ∈ Y ∧ z ∈ C ∧
∀z' ((z' ∈ Y ∧ z' ∈ C) → z' = z))))`.

This form is chosen because it is expressible in the pure `∈`-vocabulary
already in hand: the more familiar "every set has a choice function"
phrasing would first require encoding ordered pairs and functions as sets,
which this layer has not built. It is one of many classically equivalent
statements (choice function, well-ordering theorem, Zorn's lemma, …).

It is added here for completeness and documentation -- so the theory
actually named by the `C` in `ZFC` is present and precise -- and is
deliberately *not* included in the model-facing satisfaction predicates:
`SatisfiesZFCAxiomsWithoutChoice` remains the honest aggregate, and the
semantic and proof-theoretic role of Choice is left for later work. -/
def choiceAxiom : ZFCFormula :=
  let family : ZFCVariable := 0
  let member : ZFCVariable := 1
  let witness : ZFCVariable := 2
  let firstMember : ZFCVariable := 3
  let secondMember : ZFCVariable := 4
  let shared : ZFCVariable := 5
  let choiceSet : ZFCVariable := 6
  let transversalMember : ZFCVariable := 7
  let chosen : ZFCVariable := 8
  let otherChosen : ZFCVariable := 9
  let membersNonempty :=
    forallVariable member
      (impliesFormula (isMemberOf member family)
        (existsVariable witness (isMemberOf witness member)))
  let membersPairwiseDisjoint :=
    forallVariable firstMember
      (forallVariable secondMember
        (impliesFormula
          (andFormula
            (andFormula (isMemberOf firstMember family) (isMemberOf secondMember family))
            (notFormula (isEqualTo firstMember secondMember)))
          (notFormula
            (existsVariable shared
              (andFormula (isMemberOf shared firstMember)
                (isMemberOf shared secondMember))))))
  let hasTransversal :=
    existsVariable choiceSet
      (forallVariable transversalMember
        (impliesFormula (isMemberOf transversalMember family)
          (existsVariable chosen
            (andFormula
              (andFormula (isMemberOf chosen transversalMember)
                (isMemberOf chosen choiceSet))
              (forallVariable otherChosen
                (impliesFormula
                  (andFormula (isMemberOf otherChosen transversalMember)
                    (isMemberOf otherChosen choiceSet))
                  (isEqualTo otherChosen chosen)))))))
  forallVariable family
    (impliesFormula
      (andFormula membersNonempty membersPairwiseDisjoint)
      hasTransversal)

end LRA.VolumeI.Set.ZFC
