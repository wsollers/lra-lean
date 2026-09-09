import LRA.Set.Constructions.ZFCSet.Axioms.Common

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`IsPairSet` TODO

Predicate logic:

  ∀ (x1 x2 P w : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.mem P w ↔ Or (w = x1)(w = x2)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipZFCSet.mem P w ↔ Or (w = x1)(w = x2)

Logical form (Lean):

```lean
def IsPairSet (x1 x2 P : Set) : Prop :=
  ∀ w : Set, w ∈ P ↔ w = x1 ∨ w = x2
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, Or.inl, Or.inr, cases, rcases, unfold

-/
def IsPairSet (x1 x2 P : Set) : Prop :=
  ∀ w : Set, w ∈ P ↔ w = x1 ∨ w = x2

/--
`IsSingletonSet` TODO

Predicate logic:

  ∀ (x S w : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.mem S w ↔ w = x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipZFCSet.mem S w ↔ w = x

Logical form (Lean):

```lean
def IsSingletonSet (x S : Set) : Prop :=
  ∀ w : Set, w ∈ S ↔ w = x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, unfold

-/
def IsSingletonSet (x S : Set) : Prop :=
  ∀ w : Set, w ∈ S ↔ w = x

end LRA.Set.Constructions.ZFCSet.Axioms
