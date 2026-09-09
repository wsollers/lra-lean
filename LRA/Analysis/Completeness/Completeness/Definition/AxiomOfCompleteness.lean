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

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Exists fun x => x ∈ A ∧ (Exists fun u => ∀ (x : S), x ∈ A → inst.1.le x u)) → Exists fun s => ((∀ (x : S), x ∈ A → inst.1.le x s) ∧ (∀ (u : S), (∀ (x : S), x ∈ A → inst.1.le x u) → inst.1.le s u))

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

  LRA.Analysis.Completeness.HasLeastUpperBoundProperty Real

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Exists fun x => x ∈ A ∧ (Exists fun u => ∀ (x : Real), x ∈ A → Real.instPreorder.1.le x u)) → Exists fun s => ((∀ (x : Real), x ∈ A → Real.instPreorder.1.le x s) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le x u) → Real.instPreorder.1.le s u))

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
