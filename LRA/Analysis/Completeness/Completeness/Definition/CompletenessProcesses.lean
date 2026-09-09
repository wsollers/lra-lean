import Mathlib.Algebra.Order.Archimedean.Basic
import Mathlib.Data.Real.Basic
import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import LRA.Analysis.Bounds.Extrema.SupremaInfima

namespace LRA.Analysis.Completeness

open LRA.Analysis.Bounds.Extrema
open LRA.Analysis.Bounds

variable (F : Type*)

/--
`IncreasingBoundedProcessesConverge` TODO

Predicate logic:

  ∀ (F : Type u_1) [inst : Preorder F] [inst_1 : TopologicalSpace F] (a : Nat → F), (Monotone a ∧ Exists fun u => LRA.Analysis.Bounds.IsUpperBound u (Set.range a)) → Exists fun L => (LRA.Analysis.Bounds.IsSupremum L (Set.range a) ∧ Filter.Tendsto a Filter.atTop (nhds L))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.1.le a_1 b → inst.1.le (a a_1) (a b)) ∧ (Exists fun u => ∀ (x : F), x ∈ fun x => Exists fun y => a y = x → inst.1.le x u)) → Exists fun L => (((∀ (x : F), x ∈ fun x => Exists fun y => a y = x → inst.1.le x L) ∧ (∀ (u : F), (∀ (x : F), x ∈ fun x => Exists fun y => a y = x → inst.1.le x u) → inst.1.le L u)) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := fun x => setOf fun x_1 => a x_1 ∈ x ∈ Filter.atTop.1, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))

Logical form (Lean):

```lean
def IncreasingBoundedProcessesConverge [Preorder F] [TopologicalSpace F] : Prop :=
  ∀ a : ℕ → F, Monotone a → (∃ u, IsUpperBound u (Set.range a)) →
    ∃ L, IsSupremum L (Set.range a) ∧ Filter.Tendsto a Filter.atTop (nhds L)
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
def IncreasingBoundedProcessesConverge [Preorder F] [TopologicalSpace F] : Prop :=
  ∀ a : ℕ → F, Monotone a → (∃ u, IsUpperBound u (Set.range a)) →
    ∃ L, IsSupremum L (Set.range a) ∧ Filter.Tendsto a Filter.atTop (nhds L)

/--
`DecreasingBoundedProcessesConverge` TODO

Predicate logic:

  ∀ (F : Type u_1) [inst : Preorder F] [inst_1 : TopologicalSpace F] (a : Nat → F), (Antitone a ∧ Exists fun l => LRA.Analysis.Bounds.IsLowerBound l (Set.range a)) → Exists fun L => (LRA.Analysis.Bounds.IsInfimum L (Set.range a) ∧ Filter.Tendsto a Filter.atTop (nhds L))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.1.le a_1 b → inst.1.le (a b) (a a_1)) ∧ (Exists fun l => ∀ (x : F), x ∈ fun x => Exists fun y => a y = x → inst.1.le l x)) → Exists fun L => (((∀ (x : F), x ∈ fun x => Exists fun y => a y = x → inst.1.le L x) ∧ (∀ (l : F), (∀ (x : F), x ∈ fun x => Exists fun y => a y = x → inst.1.le l x) → inst.1.le l L)) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := fun x => setOf fun x_1 => a x_1 ∈ x ∈ Filter.atTop.1, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))

Logical form (Lean):

```lean
def DecreasingBoundedProcessesConverge [Preorder F] [TopologicalSpace F] : Prop :=
  ∀ a : ℕ → F, Antitone a → (∃ l, IsLowerBound l (Set.range a)) →
    ∃ L, IsInfimum L (Set.range a) ∧ Filter.Tendsto a Filter.atTop (nhds L)
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
def DecreasingBoundedProcessesConverge [Preorder F] [TopologicalSpace F] : Prop :=
  ∀ a : ℕ → F, Antitone a → (∃ l, IsLowerBound l (Set.range a)) →
    ∃ L, IsInfimum L (Set.range a) ∧ Filter.Tendsto a Filter.atTop (nhds L)

/--
`ArchimedeanReciprocalProperty` TODO

Predicate logic:

  ∀ (F : Type u_2) [inst : Field F] [inst_1 : TopologicalSpace F] ⦃U : Set F⦄, Filter.U ∈ nhds 0 → Filter.U ∈ Filter.map (fun n => instHDiv.hDiv 1 n.cast) Filter.atTop

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Filter.U ∈ nhds 0 → Filter.U ∈ { sets := fun x => setOf fun x_1 => (fun n => instHDiv.hDiv 1 n.cast) x_1 ∈ x ∈ Filter.atTop.1, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ }

Logical form (Lean):

```lean
def ArchimedeanReciprocalProperty
    (F : Type*) [Field F] [TopologicalSpace F] : Prop :=
  Filter.Tendsto (fun n : ℕ => (1 : F) / (n : F)) Filter.atTop (nhds 0)
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
def ArchimedeanReciprocalProperty
    (F : Type*) [Field F] [TopologicalSpace F] : Prop :=
  Filter.Tendsto (fun n : ℕ => (1 : F) / (n : F)) Filter.atTop (nhds 0)

end LRA.Analysis.Completeness
