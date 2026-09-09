import LRA.Set.Constructions.ZFCSet.Axioms.Replacement.Uniqueness

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`TheReplacementImage` TODO

Predicate logic:

  noncomputable def TheReplacementImage
      (A : Set) (relation : Set → Set → Prop)
      (functional : IsFunctionalOn A relation) : Set :=
    Classical.choose (ReplacementImageExists A relation functional)

Predicate logic (unfolded):

  noncomputable def TheReplacementImage
      (A : Set) (relation : Set → Set → Prop)
      (functional : IsFunctionalOn A relation) : Set :=
    Classical.choose (ReplacementImageExists A relation functional) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def TheReplacementImage
    (A : Set) (relation : Set → Set → Prop)
    (functional : IsFunctionalOn A relation) : Set :=
  Classical.choose (ReplacementImageExists A relation functional)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
noncomputable def TheReplacementImage
    (A : Set) (relation : Set → Set → Prop)
    (functional : IsFunctionalOn A relation) : Set :=
  Classical.choose (ReplacementImageExists A relation functional)

/--
`TheReplacementImageIsReplacementImageOf` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.ZFCSet.Axioms.Set) (relation : LRA.Set.Constructions.ZFCSet.Axioms.Set → LRA.Set.Constructions.ZFCSet.Axioms.Set → Prop) (functional : LRA.Set.Constructions.ZFCSet.Axioms.IsFunctionalOn A relation), LRA.Set.Constructions.ZFCSet.Axioms.IsReplacementImageOf A relation (LRA.Set.Constructions.ZFCSet.Axioms.TheReplacementImage A relation functional)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : Set
    relation : Set → Set → Prop
  Prove
    LRA.Set.Constructions.instMembershipZFCSet.1 (Classical.indefiniteDescription (LRA.Set.Constructions.ZFCSet.Axioms.IsReplacementImageOf A relation) ⋯).1 y ↔ Exists fun x => (LRA.Set.Constructions.instMembershipZFCSet.1 A x ∧ relation x y)

Logical form (Lean):

```lean
theorem TheReplacementImageIsReplacementImageOf
    (A : Set) (relation : Set → Set → Prop)
    (functional : IsFunctionalOn A relation) :
    IsReplacementImageOf A relation (TheReplacementImage A relation functional)
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
theorem TheReplacementImageIsReplacementImageOf
    (A : Set) (relation : Set → Set → Prop)
    (functional : IsFunctionalOn A relation) :
    IsReplacementImageOf A relation (TheReplacementImage A relation functional) := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
