import LRA.Set.Constructions.ZFCSet.Axioms.Common

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`IsEmptySet` TODO

Predicate logic:

  ∀ (A x : LRA.Set.Constructions.ZFCSet.Axioms.Set), ¬ LRA.Set.Constructions.instMembershipZFCSet.mem A x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipZFCSet.1 A x → False

Logical form (Lean):

```lean
def IsEmptySet (A : Set) : Prop :=
  ∀ x : Set, x ∉ A
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
def IsEmptySet (A : Set) : Prop :=
  ∀ x : Set, x ∉ A

end LRA.Set.Constructions.ZFCSet.Axioms
