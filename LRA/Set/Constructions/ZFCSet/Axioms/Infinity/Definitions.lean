import LRA.Set.Constructions.ZFCSet.Axioms.Common
import LRA.Set.Constructions.ZFCSet.Axioms.EmptySet.Definitions

namespace LRA.Set.Constructions.ZFCSet.Axioms

/--
`IsSuccessorOf` TODO

Predicate logic:

  ∀ (x successor w : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.mem successor w ↔ Or (LRA.Set.Constructions.instMembershipZFCSet.mem x w) (w = x)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipZFCSet.mem successor w ↔ Or (LRA.Set.Constructions.instMembershipZFCSet.mem x w) (w = x)

Logical form (Lean):

```lean
def IsSuccessorOf (x successor : Set) : Prop :=
  ∀ w : Set, w ∈ successor ↔ w ∈ x ∨ w = x
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
def IsSuccessorOf (x successor : Set) : Prop :=
  ∀ w : Set, w ∈ successor ↔ w ∈ x ∨ w = x

/--
`IsInductiveSet` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.ZFCSet.Axioms.Set), ((Exists fun empty => (LRA.Set.Constructions.instMembershipZFCSet.mem A empty ∧ LRA.Set.Constructions.ZFCSet.Axioms.IsEmptySet empty)) ∧ (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.mem A x → Exists fun successor => (LRA.Set.Constructions.instMembershipZFCSet.mem A successor ∧ LRA.Set.Constructions.ZFCSet.Axioms.IsSuccessorOf x successor)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((Exists fun empty => (LRA.Set.Constructions.instMembershipZFCSet.1 A empty ∧ (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 empty x → False))) ∧ (∀ (x : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 A x → Exists fun successor => (LRA.Set.Constructions.instMembershipZFCSet.1 A successor ∧ (∀ (w : LRA.Set.Constructions.ZFCSet.Axioms.Set), LRA.Set.Constructions.instMembershipZFCSet.1 successor w ↔ Or (LRA.Set.Constructions.instMembershipZFCSet.1 x w) (w = x)))))

Logical form (Lean):

```lean
def IsInductiveSet (A : Set) : Prop :=
  (∃ empty : Set, empty ∈ A ∧ IsEmptySet empty) ∧
  ∀ x : Set, x ∈ A → ∃ successor : Set, successor ∈ A ∧ IsSuccessorOf x successor
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def IsInductiveSet (A : Set) : Prop :=
  (∃ empty : Set, empty ∈ A ∧ IsEmptySet empty) ∧
  ∀ x : Set, x ∈ A → ∃ successor : Set, successor ∈ A ∧ IsSuccessorOf x successor

end LRA.Set.Constructions.ZFCSet.Axioms
