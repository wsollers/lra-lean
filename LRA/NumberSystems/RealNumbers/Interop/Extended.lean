
import LRA.NumberSystems.RealNumbers.Extensions

namespace LRA.NumberSystems.RealNumbers.Extended
open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

/--
`ExtendedReal` TODO

Predicate logic:

  inductive ExtendedReal (real_model : RealModel) where
  | negativeInfinity
  | finite (value : real_model.signature.carrier)
  | positiveInfinity

Predicate logic (unfolded):

  inductive ExtendedReal (real_model : RealModel) where
  | negativeInfinity
  | finite (value : real_model.signature.carrier)
  | positiveInfinity (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive ExtendedReal (real_model : RealModel) where
  | negativeInfinity
  | finite (value : real_model.signature.carrier)
  | positiveInfinity
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
inductive ExtendedReal (real_model : RealModel) where
  | negativeInfinity
  | finite (value : real_model.signature.carrier)
  | positiveInfinity

/--
`nonstrict_order` TODO

Predicate logic:

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (a a_1 : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal real_model), LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Nat.hasNotBit 3 t.ctorIdx → (fun x => (fun x x_1 => Prop) x a_1) t) → (fun x => (fun x x_1 => Prop) x a_1) t) (fun «else» => (fun x => True) a_1) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.nonstrict_order._sparseCasesOn_2 a_1 ((fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (fun value_1 => (fun first second => real_model.signature.le first second) value value_1) fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) a_1) value) (fun «else» => «else» ⋯) a fun h => LRA.NumberSystems.RealNumbers.Extended.nonstrict_order._sparseCasesOn_3 a_1 ((fun x => True) a) fun h => (fun x x_1 => False) a a_1

Predicate logic (unfolded):

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (a a_1 : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal real_model), LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.bitwise Bool.and (instOfNatNat 1).1 (Nat.shiftRight 3 (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec 0 (fun value => (fun value => 1) value) 2 t)) = instOfNatNat 1.1 → False) → (fun x => (fun x x_1 => Prop) x a_1) t) → (fun x => (fun x x_1 => Prop) x a_1) t) (fun «else» => (fun x => True) a_1) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.bitwise Bool.and (instOfNatNat 1).1 (Nat.shiftRight 6 (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn t 0 (fun value => 1) 2)) = instOfNatNat 1.1 → False) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => «else» ⋯) (fun value_1 «else» => (fun value_2 => (fun first second => real_model.signature.toOrderedRingConceptSignature.2 first second) value value_2) value_1) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) a_1 fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) a_1) value) (fun «else» => «else» ⋯) a fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.bitwise Bool.and (instOfNatNat 1).1 (Nat.shiftRight 4 (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn t 0 (fun value => 1) 2)) = instOfNatNat 1.1 → False) → (fun x => (fun x x_1 => Prop) a x) t) → (fun x => (fun x x_1 => Prop) a x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) a) a_1 fun h => (fun x x_1 => False) a a_1

Logical form (Lean):

```lean
def nonstrict_order
    (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model → Prop
  | .negativeInfinity, _ => True
  | _, .positiveInfinity => True
  | .finite first, .finite second => real_model.signature.le first second
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

Related proof moves: intro, unfold

-/
def nonstrict_order
    (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model → Prop
  | .negativeInfinity, _ => True
  | _, .positiveInfinity => True
  | .finite first, .finite second => real_model.signature.le first second
  | _, _ => False

/--
`negation` TODO

Predicate logic:

  def negation
    (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model
  | .negativeInfinity => .positiveInfinity
  | .positiveInfinity => .negativeInfinity
  | .finite value => .finite (real_model.signature.neg value)

Predicate logic (unfolded):

  def negation
    (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model
  | .negativeInfinity => .positiveInfinity
  | .positiveInfinity => .negativeInfinity
  | .finite value => .finite (real_model.signature.neg value) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def negation
    (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model
  | .negativeInfinity => .positiveInfinity
  | .positiveInfinity => .negativeInfinity
  | .finite value => .finite (real_model.signature.neg value)
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
def negation
    (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model
  | .negativeInfinity => .positiveInfinity
  | .positiveInfinity => .negativeInfinity
  | .finite value => .finite (real_model.signature.neg value)

/--
`supremum` TODO

Predicate logic:

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (subset : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal real_model → Prop) (candidate : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal real_model), (∀ (member : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal real_model), subset member → LRA.NumberSystems.RealNumbers.Extended.nonstrict_order real_model member candidate ∧ ∀ (upper_bound : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal real_model), (∀ (member : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal real_model), subset member → LRA.NumberSystems.RealNumbers.Extended.nonstrict_order real_model member upper_bound) → LRA.NumberSystems.RealNumbers.Extended.nonstrict_order real_model candidate upper_bound)

Predicate logic (unfolded):

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (subset : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal real_model → Prop) (candidate : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal real_model), (∀ (member : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal real_model), subset member → LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.land 1 (Nat.shiftRight 3 t.ctorIdx) = 1 → False) → (fun x => (fun x x_1 => Prop) x candidate) t) → (fun x => (fun x x_1 => Prop) x candidate) t) (fun «else» => (fun x => True) candidate) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 6 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => «else» ⋯) (fun value_1 «else» => (fun value_2 => (fun first second => real_model.signature.toOrderedRingConceptSignature.2 first second) value value_2) value_1) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) candidate fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) candidate) value) (fun «else» => «else» ⋯) member fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 4 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) member x) t) → (fun x => (fun x x_1 => Prop) member x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) member) candidate fun h => (fun x x_1 => False) member candidate ∧ ∀ (upper_bound : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal real_model), (∀ (member : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal real_model), subset member → LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.land 1 (Nat.shiftRight 3 t.ctorIdx) = 1 → False) → (fun x => (fun x x_1 => Prop) x upper_bound) t) → (fun x => (fun x x_1 => Prop) x upper_bound) t) (fun «else» => (fun x => True) upper_bound) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 6 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => «else» ⋯) (fun value_1 «else» => (fun value_2 => (fun first second => real_model.signature.toOrderedRingConceptSignature.2 first second) value value_2) value_1) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) upper_bound fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) upper_bound) value) (fun «else» => «else» ⋯) member fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 4 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) member x) t) → (fun x => (fun x x_1 => Prop) member x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) member) upper_bound fun h => (fun x x_1 => False) member upper_bound) → LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.land 1 (Nat.shiftRight 3 t.ctorIdx) = 1 → False) → (fun x => (fun x x_1 => Prop) x upper_bound) t) → (fun x => (fun x x_1 => Prop) x upper_bound) t) (fun «else» => (fun x => True) upper_bound) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 6 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => «else» ⋯) (fun value_1 «else» => (fun value_2 => (fun first second => real_model.signature.toOrderedRingConceptSignature.2 first second) value value_2) value_1) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) upper_bound fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) upper_bound) value) (fun «else» => «else» ⋯) candidate fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 4 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) candidate x) t) → (fun x => (fun x x_1 => Prop) candidate x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) candidate) upper_bound fun h => (fun x x_1 => False) candidate upper_bound)

Logical form (Lean):

```lean
def supremum
    (real_model : RealModel)
    (subset : ExtendedReal real_model → Prop)
    (candidate : ExtendedReal real_model) : Prop :=
  (∀ member, subset member → nonstrict_order real_model member candidate) ∧
    ∀ upper_bound,
      (∀ member, subset member → nonstrict_order real_model member upper_bound) →
        nonstrict_order real_model candidate upper_bound
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
def supremum
    (real_model : RealModel)
    (subset : ExtendedReal real_model → Prop)
    (candidate : ExtendedReal real_model) : Prop :=
  (∀ member, subset member → nonstrict_order real_model member candidate) ∧
    ∀ upper_bound,
      (∀ member, subset member → nonstrict_order real_model member upper_bound) →
        nonstrict_order real_model candidate upper_bound

/--
`every_subset_has_supremum` TODO

Predicate logic:

  (∀ real_model ∈ RealModel), (ExtendedReal real_model → Prop) → ∃ candidate ∈ ExtendedReal real_model, supremum real_model subset candidate

Predicate logic (unfolded):

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (subset : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal real_model → Prop), Exists fun candidate => (∀ (member : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal real_model), subset member → LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 3 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) x candidate) t) → (fun x => (fun x x_1 => Prop) x candidate) t) (fun «else» => (fun x => True) candidate) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 6 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => «else» ⋯) (fun value_1 «else» => (fun value_2 => (fun first second => real_model.signature.toOrderedRingConceptSignature.2 first second) value value_2) value_1) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) candidate fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) candidate) value) (fun «else» => «else» ⋯) member fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 4 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) member x) t) → (fun x => (fun x x_1 => Prop) member x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) member) candidate fun h => (fun x x_1 => False) member candidate ∧ ∀ (upper_bound : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal real_model), (∀ (member : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal real_model), subset member → LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 3 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) x upper_bound) t) → (fun x => (fun x x_1 => Prop) x upper_bound) t) (fun «else» => (fun x => True) upper_bound) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 6 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => «else» ⋯) (fun value_1 «else» => (fun value_2 => (fun first second => real_model.signature.toOrderedRingConceptSignature.2 first second) value value_2) value_1) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) upper_bound fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) upper_bound) value) (fun «else» => «else» ⋯) member fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 4 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) member x) t) → (fun x => (fun x x_1 => Prop) member x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) member) upper_bound fun h => (fun x x_1 => False) member upper_bound) → LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 3 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) x upper_bound) t) → (fun x => (fun x x_1 => Prop) x upper_bound) t) (fun «else» => (fun x => True) upper_bound) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 6 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => «else» ⋯) (fun value_1 «else» => (fun value_2 => (fun first second => real_model.signature.toOrderedRingConceptSignature.2 first second) value value_2) value_1) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) upper_bound fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) upper_bound) value) (fun «else» => «else» ⋯) candidate fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 4 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) candidate x) t) → (fun x => (fun x x_1 => Prop) candidate x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) candidate) upper_bound fun h => (fun x x_1 => False) candidate upper_bound)

Logical form (Lean):

```lean
theorem every_subset_has_supremum
    (real_model : RealModel)
    (subset : ExtendedReal real_model → Prop) :
    ∃ candidate : ExtendedReal real_model,
      supremum real_model subset candidate
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem every_subset_has_supremum
    (real_model : RealModel)
    (subset : ExtendedReal real_model → Prop) :
    ∃ candidate : ExtendedReal real_model,
      supremum real_model subset candidate := by
  sorry

/--
`PartialOperation` TODO

Predicate logic:

  structure PartialOperation
    (real_model : RealModel)
    (operation : ExtendedReal real_model → ExtendedReal real_model → ExtendedReal real_model) where
  defined_at : ExtendedReal real_model → ExtendedReal real_model → Prop
  respects_finite_values :
    ∀ first second,
      defined_at (.finite first) (.finite second) →
        operation (.finite first) (.finite second) =
          .finite (real_model.signature.add first second) ∨
        operation (.finite first) (.finite second) =
          .finite (real_model.signature.multiply first second)

Predicate logic (unfolded):

  structure PartialOperation
    (real_model : RealModel)
    (operation : ExtendedReal real_model → ExtendedReal real_model → ExtendedReal real_model) where
  defined_at : ExtendedReal real_model → ExtendedReal real_model → Prop
  respects_finite_values :
    ∀ first second,
      defined_at (.finite first) (.finite second) →
        operation (.finite first) (.finite second) =
          .finite (real_model.signature.add first second) ∨
        operation (.finite first) (.finite second) =
          .finite (real_model.signature.multiply first second) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure PartialOperation
    (real_model : RealModel)
    (operation : ExtendedReal real_model → ExtendedReal real_model → ExtendedReal real_model) where
  defined_at : ExtendedReal real_model → ExtendedReal real_model → Prop
  respects_finite_values :
    ∀ first second,
      defined_at (.finite first) (.finite second) →
        operation (.finite first) (.finite second) =
          .finite (real_model.signature.add first second) ∨
        operation (.finite first) (.finite second) =
          .finite (real_model.signature.multiply first second)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, Or.inl, Or.inr, cases, rcases

-/
structure PartialOperation
    (real_model : RealModel)
    (operation : ExtendedReal real_model → ExtendedReal real_model → ExtendedReal real_model) where
  defined_at : ExtendedReal real_model → ExtendedReal real_model → Prop
  respects_finite_values :
    ∀ first second,
      defined_at (.finite first) (.finite second) →
        operation (.finite first) (.finite second) =
          .finite (real_model.signature.add first second) ∨
        operation (.finite first) (.finite second) =
          .finite (real_model.signature.multiply first second)

end LRA.NumberSystems.RealNumbers.Extended
