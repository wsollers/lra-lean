import LRA.Relation.Constructions.Mathlib.PredicateSetRelation
import LRA.Set.Interop.Switch
import Mathlib.Data.Real.Basic

namespace LRA.Relation.Examples.Predicate

open LRA.Relation.Constructions.Mathlib

/--
`evenNaturals` TODO

Predicate logic:

  ∀ (a : Nat), instHMod.hMod a 2 = 0

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    instHMod.1 a 2 = 0

Logical form (Lean):

```lean
def evenNaturals : LRA.Set.LRA_Set Nat :=
  fun n => n % 2 = 0
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
def evenNaturals : LRA.Set.LRA_Set Nat :=
  fun n => n % 2 = 0

/--
`evenNaturalsAsUnaryRelation` TODO

Predicate logic:

  ∀ (a : Nat), instHMod.hMod a 2 = 0

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    instHMod.1 a 2 = 0

Logical form (Lean):

```lean
def evenNaturalsAsUnaryRelation : LRA.Relation.UnaryRelation Nat :=
  evenNaturals
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
def evenNaturalsAsUnaryRelation : LRA.Relation.UnaryRelation Nat :=
  evenNaturals

/--
`lessThanOrEqualPairs` TODO

Predicate logic:

  ∀ (a : Prod Nat Nat), a.fst.le a.snd

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    a.1.le a.2

Logical form (Lean):

```lean
def lessThanOrEqualPairs : PredicateSetRelation Nat :=
  fun pair => pair.1 ≤ pair.2
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
def lessThanOrEqualPairs : PredicateSetRelation Nat :=
  fun pair => pair.1 ≤ pair.2

/--
`lessThanOrEqualRelation` TODO

Predicate logic:

  ∀ (a a_1 : Nat), { fst := a, snd := a_1 }.fst.le { fst := a, snd := a_1 }.snd

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    { fst := a, snd := a_1 }.1.le { fst := a, snd := a_1 }.2

Logical form (Lean):

```lean
def lessThanOrEqualRelation : LRA.Relation.Endorelation Nat :=
  PredicateSetRelation.toEndorelation lessThanOrEqualPairs
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
def lessThanOrEqualRelation : LRA.Relation.Endorelation Nat :=
  PredicateSetRelation.toEndorelation lessThanOrEqualPairs

/--
`natToRealInclusionPairs` TODO

Predicate logic:

  ∀ (a : Prod (Sum Nat Real) (Sum Nat Real)), Sum.rec (motive := fun t => (Nat.hasNotBit 1 t.ctorIdx → (fun x => (fun x x_1 => Prop) x a.snd) t) → (fun x => (fun x x_1 => Prop) x a.snd) t) (fun val «else» => (fun val => LRA.Relation.Examples.Predicate.natToRealInclusionPairs._sparseCasesOn_2 a.snd (fun val_1 => (fun n r => r = n.cast)val val_1) fun h => (fun x x_1 => False) (Sum.inl val) a.snd) val) (fun val «else» => «else» ⋯) a.fst fun h => (fun x x_1 => False) a.fst a.snd

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Sum.rec (motive := fun t => ((Nat.bitwise Bool.and 1 (Nat.shiftRight 1 (Sum.rec (fun val => (fun val => 0) val) (fun val => (fun val => 1) val) t)) = 1 → False) → (fun x => (fun x x_1 => Prop) x a.2) t) → (fun x => (fun x x_1 => Prop) x a.2) t) (fun val «else» => (fun val => Sum.rec (motive := fun t => ((Nat.bitwise Bool.and 1 (Nat.shiftRight 2 (Sum.casesOn t (fun val => 0) fun val => 1)) = 1 → False) → (fun x => (fun x x_1 => Prop) (Sum.inl val) x) t) → (fun x => (fun x x_1 => Prop) (Sum.inl val) x) t) (fun val_1 «else» => «else» ⋯) (fun val_1 «else» => (fun val_2 => (fun n r => r = Real.instNatCast.1 n) val val_2) val_1) a.2 fun h => (fun x x_1 => False) (Sum.inl val) a.2) val) (fun val «else» => «else» ⋯) a.1 fun h => (fun x x_1 => False) a.1 a.2

Logical form (Lean):

```lean
def natToRealInclusionPairs : PredicateSetRelation (Nat ⊕ Real) :=
  fun pair =>
    match pair.1, pair.2 with
    | Sum.inl n, Sum.inr r => r = n
    | _, _ => False
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
def natToRealInclusionPairs : PredicateSetRelation (Nat ⊕ Real) :=
  fun pair =>
    match pair.1, pair.2 with
    | Sum.inl n, Sum.inr r => r = n
    | _, _ => False

/--
`natToRealInclusionRelation` TODO

Predicate logic:

  ∀ (a a_1 : Sum Nat Real), Sum.rec (motive := fun t => (Nat.hasNotBit 1 t.ctorIdx → (fun x => (fun x x_1 => Prop) x { fst := a, snd := a_1 }.snd) t) → (fun x => (fun x x_1 => Prop) x { fst := a, snd := a_1 }.snd) t) (fun val «else» => (fun val => LRA.Relation.Examples.Predicate.natToRealInclusionPairs._sparseCasesOn_2 { fst := a, snd := a_1 }.snd (fun val_1 => (fun n r => r = n.cast)val val_1) fun h => (fun x x_1 => False) (Sum.inl val) { fst := a, snd := a_1 }.snd) val) (fun val «else» => «else» ⋯) { fst := a, snd := a_1 }.fst fun h => (fun x x_1 => False) { fst := a, snd := a_1 }.fst { fst := a, snd := a_1 }.snd

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Sum.rec (motive := fun t => ((Nat.bitwise Bool.and 1 (Nat.shiftRight 1 (Sum.rec (fun val => (fun val => 0) val) (fun val => (fun val => 1) val) t)) = 1 → False) → (fun x => (fun x x_1 => Prop) x { fst := a, snd := a_1 }.2) t) → (fun x => (fun x x_1 => Prop) x { fst := a, snd := a_1 }.2) t) (fun val «else» => (fun val => Sum.rec (motive := fun t => ((Nat.bitwise Bool.and 1 (Nat.shiftRight 2 (Sum.casesOn t (fun val => 0) fun val => 1)) = 1 → False) → (fun x => (fun x x_1 => Prop) (Sum.inl val) x) t) → (fun x => (fun x x_1 => Prop) (Sum.inl val) x) t) (fun val_1 «else» => «else» ⋯) (fun val_1 «else» => (fun val_2 => (fun n r => r = Real.instNatCast.1 n) val val_2) val_1) { fst := a, snd := a_1 }.2 fun h => (fun x x_1 => False) (Sum.inl val) { fst := a, snd := a_1 }.2) val) (fun val «else» => «else» ⋯) { fst := a, snd := a_1 }.1 fun h => (fun x x_1 => False) { fst := a, snd := a_1 }.1 { fst := a, snd := a_1 }.2

Logical form (Lean):

```lean
def natToRealInclusionRelation : LRA.Relation.Endorelation (Nat ⊕ Real) :=
  PredicateSetRelation.toEndorelation natToRealInclusionPairs
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
def natToRealInclusionRelation : LRA.Relation.Endorelation (Nat ⊕ Real) :=
  PredicateSetRelation.toEndorelation natToRealInclusionPairs

/--
`successorPairs` TODO

Predicate logic:

  ∀ (a : Prod Nat Nat), a.snd = instHAdd.hAdd a.fst 1

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    a.2 = { hAdd := fun a b => instAddNat.add a b }.hAdd a.1 1

Logical form (Lean):

```lean
def successorPairs : PredicateSetRelation Nat :=
  fun pair => pair.2 = pair.1 + 1
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
def successorPairs : PredicateSetRelation Nat :=
  fun pair => pair.2 = pair.1 + 1

/--
`successorRelation` TODO

Predicate logic:

  ∀ (a a_1 : Nat), { fst := a, snd := a_1 }.snd = instHAdd.hAdd { fst := a, snd := a_1 }.fst 1

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    { fst := a, snd := a_1 }.2 = { hAdd := fun a b => instAddNat.add a b }.hAdd { fst := a, snd := a_1 }.1 1

Logical form (Lean):

```lean
def successorRelation : LRA.Relation.Endorelation Nat :=
  PredicateSetRelation.toEndorelation successorPairs
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
def successorRelation : LRA.Relation.Endorelation Nat :=
  PredicateSetRelation.toEndorelation successorPairs

/--
`successorRelatesZeroToOne` TODO

Predicate logic:

  LRA.Relation.Examples.Predicate.successorRelation 0 1

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    { fst := 0, snd := 1 } ∈ LRA.Relation.Examples.Predicate.successorPairs

Logical form (Lean):

```lean
theorem successorRelatesZeroToOne :
    successorRelation 0 1
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
theorem successorRelatesZeroToOne :
    successorRelation 0 1 := by
  sorry
end LRA.Relation.Examples.Predicate
