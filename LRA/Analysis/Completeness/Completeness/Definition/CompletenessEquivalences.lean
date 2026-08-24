import Mathlib.Data.Set.Basic
import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.UniformSpace.Cauchy
import LRA.Analysis.Bounds.Extrema.SupremaInfima
import LRA.Analysis.Completeness.Completeness.Definition.CauchySequencesConverge

namespace LRA.Analysis.Completeness

open LRA.Analysis.Bounds.Extrema
open LRA.Analysis.Bounds

variable (F : Type*)

/--
`HasGreatestLowerBoundProperty` TODO

Predicate logic:

  ∀ (F : Type u_1) [inst : Preorder F] (A : Set F), (A.Nonempty ∧ Exists fun l => LRA.Analysis.Bounds.IsLowerBound l A) → Exists fun i => LRA.Analysis.Bounds.IsInfimum i A

Predicate logic (unfolded):

  ∀ (F : Type u_1) [inst : Preorder F] (A : F → Prop), (Exists fun x => Set.instMembership.1 A x ∧ Exists fun l => ∀ (x : F), Set.instMembership.1 A x → inst.toLE.1 l x) → Exists fun i => (∀ (x : F), Set.instMembership.1 A x → inst.toLE.1 i x ∧ ∀ (l : F), (∀ (x : F), Set.instMembership.1 A x → inst.toLE.1 l x) → inst.toLE.1 l i)

Logical form (Lean):

```lean
def HasGreatestLowerBoundProperty [Preorder F] : Prop :=
  ∀ A : Set F, A.Nonempty → (∃ l, IsLowerBound l A) → ∃ i, IsInfimum i A
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
def HasGreatestLowerBoundProperty [Preorder F] : Prop :=
  ∀ A : Set F, A.Nonempty → (∃ l, IsLowerBound l A) → ∃ i, IsInfimum i A

/--
`BolzanoWeierstrassProperty` TODO

Predicate logic:

  ∀ (F : Type u_1) [inst : Preorder F] [inst_1 : TopologicalSpace F] (a : Nat → F), (Exists fun u => LRA.Analysis.Bounds.IsUpperBound u (Set.range a) ∧ Exists fun l => LRA.Analysis.Bounds.IsLowerBound l (Set.range a)) → Exists fun indexMap => (StrictMono indexMap ∧ Exists fun L => Filter.Tendsto (Function.comp a indexMap) Filter.atTop (nhds L))

Predicate logic (unfolded):

  ∀ (F : Type u_1) [inst : Preorder F] [inst_1 : TopologicalSpace F] (a : Nat → F), (Exists fun u => ∀ (x : F), Set.instMembership.1 (fun x => Exists fun y => a y = x)x → inst.toLE.1 x u ∧ Exists fun l => ∀ (x : F), Set.instMembership.1 (fun x => Exists fun y => a y = x)x → inst.toLE.1 l x) → Exists fun indexMap => (∀ ⦃a b : Nat⦄, Nat.instPreorder.toLT.1 a b → Nat.instPreorder.toLT.1 (indexMap a) (indexMap b) ∧ Exists fun L => Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.1 Filter.atTop.sets (Set.preimage (Function.comp a indexMap) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))

Logical form (Lean):

```lean
def BolzanoWeierstrassProperty [Preorder F] [TopologicalSpace F] : Prop :=
  ∀ a : ℕ → F, (∃ u, IsUpperBound u (Set.range a)) →
    (∃ l, IsLowerBound l (Set.range a)) →
      ∃ indexMap : ℕ → ℕ,
        StrictMono indexMap ∧ ∃ L, Filter.Tendsto (a ∘ indexMap) Filter.atTop (nhds L)
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
def BolzanoWeierstrassProperty [Preorder F] [TopologicalSpace F] : Prop :=
  ∀ a : ℕ → F, (∃ u, IsUpperBound u (Set.range a)) →
    (∃ l, IsLowerBound l (Set.range a)) →
      ∃ indexMap : ℕ → ℕ,
        StrictMono indexMap ∧ ∃ L, Filter.Tendsto (a ∘ indexMap) Filter.atTop (nhds L)

end LRA.Analysis.Completeness
