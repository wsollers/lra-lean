import LRA.Set.Constructions.ZFCSet.Axioms.Replacement.Canonical

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`EveryReplacementImageEqualsTheReplacementImage` TODO

Predicate logic:

  ∀ {A : LRA.Set.Constructions.ZFCSet.Axioms.Set} {relation : LRA.Set.Constructions.ZFCSet.Axioms.Set → LRA.Set.Constructions.ZFCSet.Axioms.Set → Prop} (functional : LRA.Set.Constructions.ZFCSet.Axioms.IsFunctionalOn A relation) {B : LRA.Set.Constructions.ZFCSet.Axioms.Set}, LRA.Set.Constructions.ZFCSet.Axioms.IsReplacementImageOf A relation B → B = LRA.Set.Constructions.ZFCSet.Axioms.TheReplacementImage A relation functional

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
    relation : Set → Set → Prop
    B : Set
  Prove
    (∀ (y : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 B y ↔ Exists fun x => (LRA.Set.Constructions.instMembershipZFCSet.1 A x ∧ relation x y)) → B = Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsReplacementImageOf A relation) ⋯.1

Logical form (Lean):

```lean
theorem EveryReplacementImageEqualsTheReplacementImage
    {A : Set} {relation : Set → Set → Prop}
    (functional : IsFunctionalOn A relation)
    {B : Set}
    (BIsReplacementImageOf : IsReplacementImageOf A relation B) :
    B = TheReplacementImage A relation functional
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem EveryReplacementImageEqualsTheReplacementImage
    {A : Set} {relation : Set → Set → Prop}
    (functional : IsFunctionalOn A relation)
    {B : Set}
    (BIsReplacementImageOf : IsReplacementImageOf A relation B) :
    B = TheReplacementImage A relation functional := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
