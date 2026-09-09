import LRA.Set.Constructions.ZFCSet.Axioms.Union.Theorems
import LRA.Set.Constructions.ZFCSet.Axioms.Separation.Theorems

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`TheIntersectionOver` TODO

Predicate logic:

  noncomputable def TheIntersectionOver (A : Set) : Set :=
    TheSeparatedSubset (TheUnionOver A)
      (fun x => ∀ B : Set, B ∈ A → x ∈ B)

Predicate logic (unfolded):

  noncomputable def TheIntersectionOver (A : Set) : Set :=
    TheSeparatedSubset (TheUnionOver A)
      (fun x => ∀ B : Set, B ∈ A → x ∈ B) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def TheIntersectionOver (A : Set) : Set :=
  TheSeparatedSubset (TheUnionOver A)
    (fun x => ∀ B : Set, B ∈ A → x ∈ B)
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
noncomputable def TheIntersectionOver (A : Set) : Set :=
  TheSeparatedSubset (TheUnionOver A)
    (fun x => ∀ B : Set, B ∈ A → x ∈ B)

end LRA.Set.Constructions.ZFCSet.Axioms
