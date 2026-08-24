import Mathlib.Data.Real.Basic
import LRA.Analysis.Bounds.Extrema.SupremaInfima

namespace LRA.Analysis.Completeness

open LRA.Analysis.Bounds.Extrema
open LRA.Analysis.Bounds

/--
`HasLeastUpperBoundProperty` TODO

Predicate logic:

  ∀ (S : Type u_1) [inst : Preorder S] (A : Set S), (A.Nonempty ∧ Exists fun u => LRA.Analysis.Bounds.IsUpperBound u A) → Exists fun s => LRA.Analysis.Bounds.IsSupremum s A

Predicate logic (unfolded):

  ∀ (S : Type u_1) [inst : Preorder S] (A : S → Prop), (Exists fun x => Set.instMembership.1 A x ∧ Exists fun u => ∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x u) → Exists fun s => (∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x s ∧ ∀ (u : S), (∀ (x : S), Set.instMembership.1 A x → inst.toLE.1 x u) → inst.toLE.1 s u)

Logical form (Lean):

```lean
def HasLeastUpperBoundProperty (S : Type*) [Preorder S] : Prop :=
  ∀ A : Set S, A.Nonempty → (∃ u, IsUpperBound u A) → ∃ s, IsSupremum s A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def HasLeastUpperBoundProperty (S : Type*) [Preorder S] : Prop :=
  ∀ A : Set S, A.Nonempty → (∃ u, IsUpperBound u A) → ∃ s, IsSupremum s A

/--
`AxiomOfCompleteness` TODO

Predicate logic:

  HasLeastUpperBoundProperty ℝ end LRA.Analysis.Completeness

Predicate logic (unfolded):

  ∀ (A : Real → Prop), (Exists fun x => Set.instMembership.1 A x ∧ Exists fun u => ∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x u) → Exists fun s => (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x s ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 s u)

Logical form (Lean):

```lean
axiom AxiomOfCompleteness : HasLeastUpperBoundProperty ℝ
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
axiom AxiomOfCompleteness : HasLeastUpperBoundProperty ℝ

end LRA.Analysis.Completeness
