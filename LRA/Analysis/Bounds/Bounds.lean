
import Mathlib.Algebra.Order.Field.Basic
import Mathlib.Algebra.Group.Pointwise.Set.Basic
import Mathlib.Order.Bounds.Defs

open scoped Pointwise

namespace LRA.Analysis.Bounds
open scoped Pointwise

variable {F : Type*}

/--
`IsUpperBound` TODO

Predicate logic:

  ∀ {F : Type u_1} [inst : LE F] (u : F) (A : Set F) (x : F), Set.instMembership.mem A x → inst.le x u

Predicate logic (unfolded):

  ∀ {F : Type u_1} [inst : LE F] (u : F) (A : F → Prop) (x : F), Set.instMembership.1 A x → inst.1 x u

Logical form (Lean):

```lean
def IsUpperBound [LE F] (u : F) (A : Set F) : Prop :=
  forall x, x ∈ A -> x <= u
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
def IsUpperBound [LE F] (u : F) (A : Set F) : Prop :=
  forall x, x ∈ A -> x <= u

/--
`IsLowerBound` TODO

Predicate logic:

  ∀ {F : Type u_1} [inst : LE F] (l : F) (A : Set F) (x : F), Set.instMembership.mem A x → inst.le l x

Predicate logic (unfolded):

  ∀ {F : Type u_1} [inst : LE F] (l : F) (A : F → Prop) (x : F), Set.instMembership.1 A x → inst.1 l x

Logical form (Lean):

```lean
def IsLowerBound [LE F] (l : F) (A : Set F) : Prop :=
  forall x, x ∈ A -> l <= x
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
def IsLowerBound [LE F] (l : F) (A : Set F) : Prop :=
  forall x, x ∈ A -> l <= x

/--
`IsBoundedAbove` TODO

Predicate logic:

  ∀ {F : Type u_1} [inst : LE F] (A : Set F), Exists fun u => LRA.Analysis.Bounds.IsUpperBound u A

Predicate logic (unfolded):

  ∀ {F : Type u_1} [inst : LE F] (A : F → Prop), Exists fun u => ∀ (x : F), Set.instMembership.1 A x → inst.1 x u

Logical form (Lean):

```lean
def IsBoundedAbove [LE F] (A : Set F) : Prop :=
  exists u, IsUpperBound u A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases, unfold

-/
def IsBoundedAbove [LE F] (A : Set F) : Prop :=
  exists u, IsUpperBound u A

/--
`IsBoundedBelow` TODO

Predicate logic:

  ∀ {F : Type u_1} [inst : LE F] (A : Set F), Exists fun l => LRA.Analysis.Bounds.IsLowerBound l A

Predicate logic (unfolded):

  ∀ {F : Type u_1} [inst : LE F] (A : F → Prop), Exists fun l => ∀ (x : F), Set.instMembership.1 A x → inst.1 l x

Logical form (Lean):

```lean
def IsBoundedBelow [LE F] (A : Set F) : Prop :=
  exists l, IsLowerBound l A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases, unfold

-/
def IsBoundedBelow [LE F] (A : Set F) : Prop :=
  exists l, IsLowerBound l A

/--
`IsBounded` TODO

Predicate logic:

  ∀ {F : Type u_1} [inst : LE F] (A : Set F), (LRA.Analysis.Bounds.IsBoundedAbove A ∧ LRA.Analysis.Bounds.IsBoundedBelow A)

Predicate logic (unfolded):

  ∀ {F : Type u_1} [inst : LE F] (A : F → Prop), (Exists fun u => ∀ (x : F), Set.instMembership.1 A x → inst.1 x u ∧ Exists fun l => ∀ (x : F), Set.instMembership.1 A x → inst.1 l x)

Logical form (Lean):

```lean
def IsBounded [LE F] (A : Set F) : Prop :=
  IsBoundedAbove A /\ IsBoundedBelow A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def IsBounded [LE F] (A : Set F) : Prop :=
  IsBoundedAbove A /\ IsBoundedBelow A

/--
`IsMaximum` TODO

Predicate logic:

  ∀ {F : Type u_1} [inst : LE F] (m : F) (A : Set F), (Set.instMembership.mem A m ∧ LRA.Analysis.Bounds.IsUpperBound m A)

Predicate logic (unfolded):

  ∀ {F : Type u_1} [inst : LE F] (m : F) (A : F → Prop), (Set.instMembership.1 A m ∧ ∀ (x : F), Set.instMembership.1 A x → inst.1 x m)

Logical form (Lean):

```lean
def IsMaximum [LE F] (m : F) (A : Set F) : Prop :=
  m ∈ A /\ IsUpperBound m A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def IsMaximum [LE F] (m : F) (A : Set F) : Prop :=
  m ∈ A /\ IsUpperBound m A

/--
`IsMinimum` TODO

Predicate logic:

  ∀ {F : Type u_1} [inst : LE F] (m : F) (A : Set F), (Set.instMembership.mem A m ∧ LRA.Analysis.Bounds.IsLowerBound m A)

Predicate logic (unfolded):

  ∀ {F : Type u_1} [inst : LE F] (m : F) (A : F → Prop), (Set.instMembership.1 A m ∧ ∀ (x : F), Set.instMembership.1 A x → inst.1 m x)

Logical form (Lean):

```lean
def IsMinimum [LE F] (m : F) (A : Set F) : Prop :=
  m ∈ A /\ IsLowerBound m A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def IsMinimum [LE F] (m : F) (A : Set F) : Prop :=
  m ∈ A /\ IsLowerBound m A

/--
`IsSupremum` TODO

Predicate logic:

  ∀ {F : Type u_1} [inst : Preorder F] (s : F) (A : Set F), (LRA.Analysis.Bounds.IsUpperBound s A ∧ ∀ (u : F), LRA.Analysis.Bounds.IsUpperBound u A → inst.le s u)

Predicate logic (unfolded):

  ∀ {F : Type u_1} [inst : Preorder F] (s : F) (A : F → Prop), (∀ (x : F), Set.instMembership.1 A x → inst.toLE.1 x s ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 A x → inst.toLE.1 x u) → inst.toLE.1 s u)

Logical form (Lean):

```lean
def IsSupremum [Preorder F] (s : F) (A : Set F) : Prop :=
  IsUpperBound s A /\ forall u, IsUpperBound u A -> s <= u
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def IsSupremum [Preorder F] (s : F) (A : Set F) : Prop :=
  IsUpperBound s A /\ forall u, IsUpperBound u A -> s <= u

/--
`IsInfimum` TODO

Predicate logic:

  ∀ {F : Type u_1} [inst : Preorder F] (i : F) (A : Set F), (LRA.Analysis.Bounds.IsLowerBound i A ∧ ∀ (l : F), LRA.Analysis.Bounds.IsLowerBound l A → inst.le l i)

Predicate logic (unfolded):

  ∀ {F : Type u_1} [inst : Preorder F] (i : F) (A : F → Prop), (∀ (x : F), Set.instMembership.1 A x → inst.toLE.1 i x ∧ ∀ (l : F), (∀ (x : F), Set.instMembership.1 A x → inst.toLE.1 l x) → inst.toLE.1 l i)

Logical form (Lean):

```lean
def IsInfimum [Preorder F] (i : F) (A : Set F) : Prop :=
  IsLowerBound i A /\ forall l, IsLowerBound l A -> l <= i
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def IsInfimum [Preorder F] (i : F) (A : Set F) : Prop :=
  IsLowerBound i A /\ forall l, IsLowerBound l A -> l <= i

/--
`MaximumIsSupremum` TODO

Predicate logic:

  (IsMaximum m A) → IsSupremum m A

Predicate logic (unfolded):

  ∀ {F : Type u_1} [inst : Preorder F] {m : F} {A : F → Prop}, (Set.instMembership.1 A m ∧ ∀ (x : F), Set.instMembership.1 A x → inst.toLE.1 x m) → (∀ (x : F), Set.instMembership.1 A x → inst.toLE.1 x m ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 A x → inst.toLE.1 x u) → inst.toLE.1 m u)

Logical form (Lean):

```lean
theorem MaximumIsSupremum [Preorder F] {m : F} {A : Set F}
    (maximum_hypothesis : IsMaximum m A) : IsSupremum m A
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
theorem MaximumIsSupremum [Preorder F] {m : F} {A : Set F}
    (maximum_hypothesis : IsMaximum m A) : IsSupremum m A := by
  sorry

/--
`SupremumUnique` TODO

Predicate logic:

  (IsSupremum s A ∧ IsSupremum t A) → s = t

Predicate logic (unfolded):

  ∀ {F : Type u_1} [inst : PartialOrder F] {s t : F} {A : F → Prop}, ((∀ (x : F), Set.instMembership.1 A x → inst.toLE.1 x s ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 A x → inst.toLE.1 x u) → inst.toLE.1 s u) ∧ (∀ (x : F), Set.instMembership.1 A x → inst.toLE.1 x t ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 A x → inst.toLE.1 x u) → inst.toLE.1 t u)) → s = t

Logical form (Lean):

```lean
theorem SupremumUnique [PartialOrder F] {s t : F} {A : Set F}
    (left_supremum : IsSupremum s A)
    (right_supremum : IsSupremum t A) : s = t
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
theorem SupremumUnique [PartialOrder F] {s t : F} {A : Set F}
    (left_supremum : IsSupremum s A)
    (right_supremum : IsSupremum t A) : s = t := by
  sorry

/--
`InfimumUnique` TODO

Predicate logic:

  (IsInfimum s A ∧ IsInfimum t A) → s = t

Predicate logic (unfolded):

  ∀ {F : Type u_1} [inst : PartialOrder F] {s t : F} {A : F → Prop}, ((∀ (x : F), Set.instMembership.1 A x → inst.toLE.1 s x ∧ ∀ (l : F), (∀ (x : F), Set.instMembership.1 A x → inst.toLE.1 l x) → inst.toLE.1 l s) ∧ (∀ (x : F), Set.instMembership.1 A x → inst.toLE.1 t x ∧ ∀ (l : F), (∀ (x : F), Set.instMembership.1 A x → inst.toLE.1 l x) → inst.toLE.1 l t)) → s = t

Logical form (Lean):

```lean
theorem InfimumUnique [PartialOrder F] {s t : F} {A : Set F}
    (left_infimum : IsInfimum s A)
    (right_infimum : IsInfimum t A) : s = t
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
theorem InfimumUnique [PartialOrder F] {s t : F} {A : Set F}
    (left_infimum : IsInfimum s A)
    (right_infimum : IsInfimum t A) : s = t := by
  sorry

/--
`SupremumIffIsLUB` TODO

Predicate logic:

  IsSupremum s A <-> IsLUB A s

Predicate logic (unfolded):

  ∀ {F : Type u_1} [inst : Preorder F] {s : F} {A : F → Prop}, (∀ (x : F), Set.instMembership.1 A x → inst.toLE.1 x s ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 A x → inst.toLE.1 x u) → inst.toLE.1 s u) ↔ (Set.instMembership.1 (fun x => ∀ ⦃a : F⦄, Set.instMembership.1 A a → inst.toLE.1 a x) s ∧ Set.instMembership.1 (fun x => ∀ ⦃a : F⦄, Set.instMembership.1 (upperBounds A) a → inst.toLE.1 x a) s)

Logical form (Lean):

```lean
theorem SupremumIffIsLUB [Preorder F] {s : F} {A : Set F} :
    IsSupremum s A <-> IsLUB A s
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem SupremumIffIsLUB [Preorder F] {s : F} {A : Set F} :
    IsSupremum s A <-> IsLUB A s := by
  sorry

end LRA.Analysis.Bounds
namespace LRA.Analysis.Bounds.Algebra
open scoped Pointwise

variable {F : Type*} [Field F] [LinearOrder F] [IsStrictOrderedRing F]

/--
`SupremumOfSum` TODO

Predicate logic:

  (∀ A_nonempty ∈ A.Nonempty ∀ B_nonempty ∈ B.Nonempty), (IsSupremum sA A ∧ IsSupremum sB B) → IsSupremum (sA + sB) (A + B)

Predicate logic (unfolded):

  ∀ {F : Type u_1} [inst : Field F] [inst_1 : LinearOrder F], IsStrictOrderedRing F → ∀ {sA sB : F} {A B : F → Prop}, (Exists fun x => Set.instMembership.1 A x ∧ (Exists fun x => Set.instMembership.1 B x ∧ ((∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x sA ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 sA u) ∧ (∀ (x : F), Set.instMembership.1 B x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x sB ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 B x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 sB u)))) → (∀ (x : F), Set.instMembership.1 (instHAdd.1 A B) x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x (instHAdd.1 sA sB) ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 (instHAdd.1 A B) x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (instHAdd.1 sA sB) u)

Logical form (Lean):

```lean
theorem SupremumOfSum {sA sB : F} {A B : Set F}
    (A_nonempty : A.Nonempty)
    (B_nonempty : B.Nonempty)
    (left_supremum : IsSupremum sA A)
    (right_supremum : IsSupremum sB B) :
    IsSupremum (sA + sB) (A + B)
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
theorem SupremumOfSum {sA sB : F} {A B : Set F}
    (A_nonempty : A.Nonempty)
    (B_nonempty : B.Nonempty)
    (left_supremum : IsSupremum sA A)
    (right_supremum : IsSupremum sB B) :
    IsSupremum (sA + sB) (A + B) := by
  sorry

/--
`InfimumOfSum` TODO

Predicate logic:

  (∀ A_nonempty ∈ A.Nonempty ∀ B_nonempty ∈ B.Nonempty), (IsInfimum iA A ∧ IsInfimum iB B) → IsInfimum (iA + iB) (A + B)

Predicate logic (unfolded):

  ∀ {F : Type u_1} [inst : Field F] [inst_1 : LinearOrder F], IsStrictOrderedRing F → ∀ {iA iB : F} {A B : F → Prop}, (Exists fun x => Set.instMembership.1 A x ∧ (Exists fun x => Set.instMembership.1 B x ∧ ((∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 iA x ∧ ∀ (l : F), (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l x) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l iA) ∧ (∀ (x : F), Set.instMembership.1 B x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 iB x ∧ ∀ (l : F), (∀ (x : F), Set.instMembership.1 B x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l x) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l iB)))) → (∀ (x : F), Set.instMembership.1 (instHAdd.1 A B) x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (instHAdd.1 iA iB) x ∧ ∀ (l : F), (∀ (x : F), Set.instMembership.1 (instHAdd.1 A B) x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l x) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l (instHAdd.1 iA iB))

Logical form (Lean):

```lean
theorem InfimumOfSum {iA iB : F} {A B : Set F}
    (A_nonempty : A.Nonempty)
    (B_nonempty : B.Nonempty)
    (left_infimum : IsInfimum iA A)
    (right_infimum : IsInfimum iB B) :
    IsInfimum (iA + iB) (A + B)
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
theorem InfimumOfSum {iA iB : F} {A B : Set F}
    (A_nonempty : A.Nonempty)
    (B_nonempty : B.Nonempty)
    (left_infimum : IsInfimum iA A)
    (right_infimum : IsInfimum iB B) :
    IsInfimum (iA + iB) (A + B) := by
  sorry

/--
`SupremumOfPositiveScale` TODO

Predicate logic:

  (∀ A_nonempty ∈ A.Nonempty), (0 < a ∧ IsSupremum s A) → IsSupremum (a * s) ((fun x => a * x) '' A)

Predicate logic (unfolded):

  ∀ {F : Type u_1} [inst : Field F] [inst_1 : LinearOrder F], IsStrictOrderedRing F → ∀ {a s : F} {A : F → Prop}, (Exists fun x => Set.instMembership.1 A x ∧ (instDistribLatticeOfLinearOrder.toSemilatticeInf.toLT.1 Zero.toOfNat0.1 a ∧ (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x s ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 s u))) → (∀ (x : F), Set.instMembership.1 (fun x => Exists fun a_2 => (Set.instMembership.1 A a_2 ∧ (fun x => instHMul.1 a x) a_2 = x)) x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x (instHMul.1 a s) ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 (fun x => Exists fun a_2 => (Set.instMembership.1 A a_2 ∧ (fun x => instHMul.1 a x) a_2 = x)) x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (instHMul.1 a s) u)

Logical form (Lean):

```lean
theorem SupremumOfPositiveScale {a s : F} {A : Set F}
    (A_nonempty : A.Nonempty)
    (scale_positive : 0 < a)
    (supremum_hypothesis : IsSupremum s A) :
    IsSupremum (a * s) ((fun x => a * x) '' A)
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
theorem SupremumOfPositiveScale {a s : F} {A : Set F}
    (A_nonempty : A.Nonempty)
    (scale_positive : 0 < a)
    (supremum_hypothesis : IsSupremum s A) :
    IsSupremum (a * s) ((fun x => a * x) '' A) := by
  sorry

/--
`NegationSwapsSupremumInfimum` TODO

Predicate logic:

  IsSupremum s A <-> IsInfimum (-s) (-A)

Predicate logic (unfolded):

  ∀ {F : Type u_1} [inst : Field F] [inst_1 : LinearOrder F], IsStrictOrderedRing F → ∀ {s : F} {A : F → Prop}, (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x s ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 s u) ↔ (∀ (x : F), Set.instMembership.1 (Set.neg.1 A) x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 s) x ∧ ∀ (l : F), (∀ (x : F), Set.instMembership.1 (Set.neg.1 A) x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l x) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 s))

Logical form (Lean):

```lean
theorem NegationSwapsSupremumInfimum {s : F} {A : Set F} :
    IsSupremum s A <-> IsInfimum (-s) (-A)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem NegationSwapsSupremumInfimum {s : F} {A : Set F} :
    IsSupremum s A <-> IsInfimum (-s) (-A) := by
  sorry

/--
`SupremumMonotone` TODO

Predicate logic:

  (IsSupremum sA A ∧ IsSupremum sB B) → sA <= sB

Predicate logic (unfolded):

  ∀ {F : Type u_1} [inst : Field F] [inst_1 : LinearOrder F], IsStrictOrderedRing F → ∀ {sA sB : F} {A B : F → Prop}, (Set.instLE.1 A B ∧ ((∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x sA ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 sA u) ∧ (∀ (x : F), Set.instMembership.1 B x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x sB ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 B x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 sB u))) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 sA sB

Logical form (Lean):

```lean
theorem SupremumMonotone {sA sB : F} {A B : Set F}
    (subset_hypothesis : A ⊆ B)
    (left_supremum : IsSupremum sA A)
    (right_supremum : IsSupremum sB B) :
    sA <= sB
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
theorem SupremumMonotone {sA sB : F} {A B : Set F}
    (subset_hypothesis : A ⊆ B)
    (left_supremum : IsSupremum sA A)
    (right_supremum : IsSupremum sB B) :
    sA <= sB := by
  sorry

end LRA.Analysis.Bounds.Algebra
namespace LRA.Analysis.Bounds
open scoped Pointwise

end LRA.Analysis.Bounds
