import LRA.Set.Constructions.ZFCSet.Axioms.Pairing.Theorems

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`SingletonSet` TODO

Predicate logic:

  noncomputable def SingletonSet (element : Set) : Set :=
    PairSet element element

Predicate logic (unfolded):

  noncomputable def SingletonSet (element : Set) : Set :=
    PairSet element element (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def SingletonSet (element : Set) : Set :=
  PairSet element element
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
noncomputable def SingletonSet (element : Set) : Set :=
  PairSet element element

/--
`KuratowskiPair` TODO

Predicate logic:

  noncomputable def KuratowskiPair (first second : Set) : Set :=
    PairSet (SingletonSet first) (PairSet first second)

Predicate logic (unfolded):

  noncomputable def KuratowskiPair (first second : Set) : Set :=
    PairSet (SingletonSet first) (PairSet first second) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def KuratowskiPair (first second : Set) : Set :=
  PairSet (SingletonSet first) (PairSet first second)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
noncomputable def KuratowskiPair (first second : Set) : Set :=
  PairSet (SingletonSet first) (PairSet first second)

end LRA.Set.Constructions.ZFCSet.Axioms
