
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

  ∀ {F : Type u_1} [inst : LE F] (u : F) (A : Set F) (x : F), x ∈ A → inst.le x u

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    x ∈ A → inst.le x u

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

  ∀ {F : Type u_1} [inst : LE F] (l : F) (A : Set F) (x : F), x ∈ A → inst.le l x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    x ∈ A → inst.le l x

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

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun u => ∀ (x : F), x ∈ A → inst.le x u

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

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun l => ∀ (x : F), x ∈ A → inst.le l x

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

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((Exists fun u => ∀ (x : F), x ∈ A → inst.le x u) ∧ (Exists fun l => ∀ (x : F), x ∈ A → inst.le l x))

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

  ∀ {F : Type u_1} [inst : LE F] (m : F) (A : Set F), (m ∈ A ∧ LRA.Analysis.Bounds.IsUpperBound m A)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (m ∈ A ∧ (∀ (x : F), x ∈ A → inst.le x m))

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

  ∀ {F : Type u_1} [inst : LE F] (m : F) (A : Set F), (m ∈ A ∧ LRA.Analysis.Bounds.IsLowerBound m A)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (m ∈ A ∧ (∀ (x : F), x ∈ A → inst.le m x))

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

  ∀ {F : Type u_1} [inst : Preorder F] (s : F) (A : Set F), (LRA.Analysis.Bounds.IsUpperBound s A ∧ (∀ (u : F), LRA.Analysis.Bounds.IsUpperBound u A → inst.le s u))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (x : F), x ∈ A → inst.1.le x s) ∧ (∀ (u : F), (∀ (x : F), x ∈ A → inst.1.le x u) → inst.1.le s u))

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

  ∀ {F : Type u_1} [inst : Preorder F] (i : F) (A : Set F), (LRA.Analysis.Bounds.IsLowerBound i A ∧ (∀ (l : F), LRA.Analysis.Bounds.IsLowerBound l A → inst.le l i))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (x : F), x ∈ A → inst.1.le i x) ∧ (∀ (l : F), (∀ (x : F), x ∈ A → inst.1.le l x) → inst.1.le l i))

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

  ∀ {F : Type u_1} [inst : Preorder F] {m : F} {A : Set F}, LRA.Analysis.Bounds.IsMaximum m A → LRA.Analysis.Bounds.IsSupremum m A

Predicate logic (unfolded):

  Ambient
    (F, ≤)
  Objects
    m : F
    A : Set F
  Prove
    (m ∈ A ∧ (∀ (x : F), x ∈ A → inst.1.le x m)) → ((∀ (x : F), x ∈ A → inst.1.le x m) ∧ (∀ (u : F), (∀ (x : F), x ∈ A → inst.1.le x u) → inst.1.le m u))

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

  ∀ {F : Type u_1} [inst : PartialOrder F] {s t : F} {A : Set F}, (LRA.Analysis.Bounds.IsSupremum s A ∧ LRA.Analysis.Bounds.IsSupremum t A) → s = t

Predicate logic (unfolded):

  Ambient
    (F, ≤)
  Objects
    s t : F
    A : Set F
  Prove
    (((∀ (x : F), x ∈ A → inst.toPreorder.1.le x s) ∧ (∀ (u : F), (∀ (x : F), x ∈ A → inst.toPreorder.1.le x u) → inst.toPreorder.1.le s u)) ∧ ((∀ (x : F), x ∈ A → inst.toPreorder.1.le x t) ∧ (∀ (u : F), (∀ (x : F), x ∈ A → inst.toPreorder.1.le x u) → inst.toPreorder.1.le t u))) → s = t

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

  ∀ {F : Type u_1} [inst : PartialOrder F] {s t : F} {A : Set F}, (LRA.Analysis.Bounds.IsInfimum s A ∧ LRA.Analysis.Bounds.IsInfimum t A) → s = t

Predicate logic (unfolded):

  Ambient
    (F, ≤)
  Objects
    s t : F
    A : Set F
  Prove
    (((∀ (x : F), x ∈ A → inst.toPreorder.1.le s x) ∧ (∀ (l : F), (∀ (x : F), x ∈ A → inst.toPreorder.1.le l x) → inst.toPreorder.1.le l s)) ∧ ((∀ (x : F), x ∈ A → inst.toPreorder.1.le t x) ∧ (∀ (l : F), (∀ (x : F), x ∈ A → inst.toPreorder.1.le l x) → inst.toPreorder.1.le l t))) → s = t

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

  ∀ {F : Type u_1} [inst : Preorder F] {s : F} {A : Set F}, LRA.Analysis.Bounds.IsSupremum s A ↔ IsLUB A s

Predicate logic (unfolded):

  Ambient
    (F, ≤)
  Objects
    s : F
    A : Set F
  Prove
    LRA.Analysis.Bounds.IsSupremum s A ↔ IsLUB A s

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

  ∀ {F : Type u_1} [inst : Field F] [inst_1 : LinearOrder F], IsStrictOrderedRing F → ∀ {sA sB : F} {A B : Set F}, (A.Nonempty ∧ (B.Nonempty ∧ (LRA.Analysis.Bounds.IsSupremum sA A ∧ LRA.Analysis.Bounds.IsSupremum sB B))) → LRA.Analysis.Bounds.IsSupremum (instHAdd.hAdd sA sB) (instHAdd.hAdd A B)

Predicate logic (unfolded):

  Ambient
    (F, ≤)
  Objects
    sA sB : F
    A B : Set F
    A_nonempty : A.Nonempty
    B_nonempty : B.Nonempty
  Prove
    IsStrictOrderedRing F → ∀ {sA sB : F} {A B : F → Prop}, (Exists fun x => x ∈ A ∧ (Exists fun x => x ∈ B ∧ (((∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x sA) ∧ (∀ (u : F), (∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le sA u)) ∧ ((∀ (x : F), x ∈ B → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x sB) ∧ (∀ (u : F), (∀ (x : F), x ∈ B → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le sB u))))) → ((∀ (x : F), x ∈ { hAdd := fun a b => { add := fun s t => setOf fun c => Exists fun a => (a ∈ s ∧ (Exists fun b => (b ∈ t ∧ (fun x1 x2 => instHAdd.hAdd x1 x2) a b = c))) }.add a b }.hAdd A B → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x ({ hAdd := fun a b => instDistribOfSemiring.2.add a b }.hAdd sA sB)) ∧ (∀ (u : F), (∀ (x : F), x ∈ { hAdd := fun a b => { add := fun s t => setOf fun c => Exists fun a => (a ∈ s ∧ (Exists fun b => (b ∈ t ∧ (fun x1 x2 => instHAdd.hAdd x1 x2) a b = c))) }.add a b }.hAdd A B → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le ({ hAdd := fun a b => instDistribOfSemiring.2.add a b }.hAdd sA sB) u))

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

  ∀ {F : Type u_1} [inst : Field F] [inst_1 : LinearOrder F], IsStrictOrderedRing F → ∀ {iA iB : F} {A B : Set F}, (A.Nonempty ∧ (B.Nonempty ∧ (LRA.Analysis.Bounds.IsInfimum iA A ∧ LRA.Analysis.Bounds.IsInfimum iB B))) → LRA.Analysis.Bounds.IsInfimum (instHAdd.hAdd iA iB) (instHAdd.hAdd A B)

Predicate logic (unfolded):

  Ambient
    (F, ≤)
  Objects
    iA iB : F
    A B : Set F
    A_nonempty : A.Nonempty
    B_nonempty : B.Nonempty
  Prove
    IsStrictOrderedRing F → ∀ {iA iB : F} {A B : F → Prop}, (Exists fun x => x ∈ A ∧ (Exists fun x => x ∈ B ∧ (((∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le iA x) ∧ (∀ (l : F), (∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le l x) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le l iA)) ∧ ((∀ (x : F), x ∈ B → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le iB x) ∧ (∀ (l : F), (∀ (x : F), x ∈ B → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le l x) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le l iB))))) → ((∀ (x : F), x ∈ { hAdd := fun a b => { add := fun s t => setOf fun c => Exists fun a => (a ∈ s ∧ (Exists fun b => (b ∈ t ∧ (fun x1 x2 => instHAdd.hAdd x1 x2) a b = c))) }.add a b }.hAdd A B → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le ({ hAdd := fun a b => instDistribOfSemiring.2.add a b }.hAdd iA iB) x) ∧ (∀ (l : F), (∀ (x : F), x ∈ { hAdd := fun a b => { add := fun s t => setOf fun c => Exists fun a => (a ∈ s ∧ (Exists fun b => (b ∈ t ∧ (fun x1 x2 => instHAdd.hAdd x1 x2) a b = c))) }.add a b }.hAdd A B → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le l x) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le l ({ hAdd := fun a b => instDistribOfSemiring.2.add a b }.hAdd iA iB)))

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

  ∀ {F : Type u_1} [inst : Field F] [inst_1 : LinearOrder F], IsStrictOrderedRing F → ∀ {a s : F} {A : Set F}, (A.Nonempty ∧ (instDistribLatticeOfLinearOrder.toSemilatticeInf.lt 0 a ∧ LRA.Analysis.Bounds.IsSupremum s A)) → LRA.Analysis.Bounds.IsSupremum (instHMul.hMul a s) (Set.image (fun x => instHMul.hMul a x) A)

Predicate logic (unfolded):

  Ambient
    (F, ≤)
  Objects
    a s : F
    A : Set F
    A_nonempty : A.Nonempty
  Prove
    IsStrictOrderedRing F → ∀ {a s : F} {A : F → Prop}, (Exists fun x => x ∈ A ∧ (instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.2.lt 0 a ∧ ((∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x s) ∧ (∀ (u : F), (∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le s u)))) → ((∀ (x : F), x ∈ fun x => Exists fun a_2 => (a_2 ∈ A ∧ (fun x => { hMul := fun a b => instDistribOfSemiring.mul a b }.hMul a x) a_2 = x) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x ({ hMul := fun a b => instDistribOfSemiring.1.mul a b }.hMul a s)) ∧ (∀ (u : F), (∀ (x : F), x ∈ fun x => Exists fun a_2 => (a_2 ∈ A ∧ (fun x => { hMul := fun a b => instDistribOfSemiring.mul a b }.hMul a x) a_2 = x) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le ({ hMul := fun a b => instDistribOfSemiring.1.mul a b }.hMul a s) u))

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

  ∀ {F : Type u_1} [inst : Field F] [inst_1 : LinearOrder F], IsStrictOrderedRing F → ∀ {s : F} {A : Set F}, LRA.Analysis.Bounds.IsSupremum s A ↔ LRA.Analysis.Bounds.IsInfimum (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg s) (Set.neg.neg A)

Predicate logic (unfolded):

  Ambient
    (F, ≤)
  Objects
    s : F
    A : Set F
  Prove
    IsStrictOrderedRing F → ∀ {s : F} {A : Set F}, LRA.Analysis.Bounds.IsSupremum s A ↔ LRA.Analysis.Bounds.IsInfimum (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg s) (Set.neg.neg A)

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

  ∀ {F : Type u_1} [inst : Field F] [inst_1 : LinearOrder F], IsStrictOrderedRing F → ∀ {sA sB : F} {A B : Set F}, (Set.instLE.le A B ∧ (LRA.Analysis.Bounds.IsSupremum sA A ∧ LRA.Analysis.Bounds.IsSupremum sB B)) → instDistribLatticeOfLinearOrder.toSemilatticeInf.le sA sB

Predicate logic (unfolded):

  Ambient
    (F, ≤)
  Objects
    sA sB : F
    A B : Set F
    subset_hypothesis : A ⊆ B
  Prove
    IsStrictOrderedRing F → ∀ {sA sB : F} {A B : F → Prop}, (({ le := fun s₁ s₂ => ∀ ⦃a : F⦄, a ∈ s₁ → a ∈ s₂}.le A B) ∧ (((∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x sA) ∧ (∀ (u : F), (∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le sA u)) ∧ ((∀ (x : F), x ∈ B → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x sB) ∧ (∀ (u : F), (∀ (x : F), x ∈ B → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le sB u)))) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le sA sB

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
