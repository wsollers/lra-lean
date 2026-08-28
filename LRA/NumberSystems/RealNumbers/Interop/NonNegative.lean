
import LRA.NumberSystems.RealNumbers.Interop.Extended

namespace LRA.NumberSystems.RealNumbers.NonNegative
open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Extended

/--
`NonNegativeReal` TODO

Predicate logic:

  def NonNegativeReal (real_model : RealModel) : Type _ :=
  { value : real_model.signature.carrier //
      real_model.signature.le real_model.signature.zero value }

Predicate logic (unfolded):

  def NonNegativeReal (real_model : RealModel) : Type _ :=
  { value : real_model.signature.carrier //
      real_model.signature.le real_model.signature.zero value } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def NonNegativeReal (real_model : RealModel) : Type _ :=
  { value : real_model.signature.carrier //
      real_model.signature.le real_model.signature.zero value }
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
def NonNegativeReal (real_model : RealModel) : Type _ :=
  { value : real_model.signature.carrier //
      real_model.signature.le real_model.signature.zero value }

/--
`NonNegativeExtendedReal` TODO

Predicate logic:

  def NonNegativeExtendedReal (real_model : RealModel) : Type _ :=
  { value : ExtendedReal real_model //
      nonstrict_order real_model (.finite real_model.signature.zero) value }

Predicate logic (unfolded):

  def NonNegativeExtendedReal (real_model : RealModel) : Type _ :=
  { value : ExtendedReal real_model //
      nonstrict_order real_model (.finite real_model.signature.zero) value } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def NonNegativeExtendedReal (real_model : RealModel) : Type _ :=
  { value : ExtendedReal real_model //
      nonstrict_order real_model (.finite real_model.signature.zero) value }
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
def NonNegativeExtendedReal (real_model : RealModel) : Type _ :=
  { value : ExtendedReal real_model //
      nonstrict_order real_model (.finite real_model.signature.zero) value }

/--
`ZeroIsNonNegative` TODO

Predicate logic:

  (∀ real_model ∈ RealModel), real_model.signature.le real_model.signature.zero real_model.signature.zero

Predicate logic (unfolded):

  ∀ (real_model : LRA.NumberSystems.Interface.ModelTheory.RealModel), real_model.signature.toOrderedRingConceptSignature.2 real_model.signature.toZeroOneBundle.2 real_model.signature.toZeroOneBundle.2

Logical form (Lean):

```lean
theorem ZeroIsNonNegative (real_model : RealModel) :
    real_model.signature.le real_model.signature.zero real_model.signature.zero
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
theorem ZeroIsNonNegative (real_model : RealModel) :
    real_model.signature.le real_model.signature.zero real_model.signature.zero := by
  sorry

/--
`zero` TODO

Predicate logic:

  def zero (real_model : RealModel) : NonNegativeReal real_model :=
  ⟨real_model.signature.zero, ZeroIsNonNegative real_model⟩

Predicate logic (unfolded):

  def zero (real_model : RealModel) : NonNegativeReal real_model :=
  ⟨real_model.signature.zero, ZeroIsNonNegative real_model⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def zero (real_model : RealModel) : NonNegativeReal real_model :=
  ⟨real_model.signature.zero, ZeroIsNonNegative real_model⟩
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
def zero (real_model : RealModel) : NonNegativeReal real_model :=
  ⟨real_model.signature.zero, ZeroIsNonNegative real_model⟩

/--
`PositiveInfinityIsNonNegative` TODO

Predicate logic:

  (∀ real_model ∈ RealModel), nonstrict_order real_model (.finite real_model.signature.zero) (.positiveInfinity)

Predicate logic (unfolded):

  ∀ (real_model : LRA.NumberSystems.Interface.ModelTheory.RealModel), LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.land 1 (Nat.shiftRight 3 t.ctorIdx) = 1 → False) → (fun x => (fun x x_1 => Prop) x LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) t) → (fun x => (fun x x_1 => Prop) x LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) t) (fun «else» => (fun x => True) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 6 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => «else» ⋯) (fun value_1 «else» => (fun value_2 => (fun first second => real_model.signature.toOrderedRingConceptSignature.2 first second) value value_2) value_1) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) value) (fun «else» => «else» ⋯) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 4 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity

Logical form (Lean):

```lean
theorem PositiveInfinityIsNonNegative (real_model : RealModel) :
    nonstrict_order real_model
      (.finite real_model.signature.zero) (.positiveInfinity)
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
theorem PositiveInfinityIsNonNegative (real_model : RealModel) :
    nonstrict_order real_model
      (.finite real_model.signature.zero) (.positiveInfinity) := by
  sorry

/--
`infinity` TODO

Predicate logic:

  def infinity (real_model : RealModel) : NonNegativeExtendedReal real_model :=
  ⟨.positiveInfinity, PositiveInfinityIsNonNegative real_model⟩

Predicate logic (unfolded):

  def infinity (real_model : RealModel) : NonNegativeExtendedReal real_model :=
  ⟨.positiveInfinity, PositiveInfinityIsNonNegative real_model⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def infinity (real_model : RealModel) : NonNegativeExtendedReal real_model :=
  ⟨.positiveInfinity, PositiveInfinityIsNonNegative real_model⟩
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
def infinity (real_model : RealModel) : NonNegativeExtendedReal real_model :=
  ⟨.positiveInfinity, PositiveInfinityIsNonNegative real_model⟩

/--
`FiniteIsNonNegativeExtended` TODO

Predicate logic:

  (∀ real_model ∈ RealModel ∀ value ∈ real_model.signature.carrier), nonstrict_order real_model (.finite real_model.signature.zero) (.finite value)

Predicate logic (unfolded):

  ∀ (real_model : LRA.NumberSystems.Interface.ModelTheory.RealModel) (value : real_model.signature.toCarrierBundle.1), real_model.signature.toOrderedRingConceptSignature.2 real_model.signature.toZeroOneBundle.2 value → LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.land 1 (Nat.shiftRight 3 t.ctorIdx) = 1 → False) → (fun x => (fun x x_1 => Prop) x (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) t) → (fun x => (fun x x_1 => Prop) x (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) t) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (fun value_1 «else» => (fun value_2 => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 6 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value_2) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value_2) x) t) (fun «else» => «else» ⋯) (fun value «else» => (fun value => (fun first second => real_model.signature.toOrderedRingConceptSignature.2 first second) value_2 value) value) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value_2)) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value_2) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) value_1) (fun «else» => «else» ⋯) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 4 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)

Logical form (Lean):

```lean
theorem FiniteIsNonNegativeExtended (real_model : RealModel)
    (value : real_model.signature.carrier)
    (value_nonneg : real_model.signature.le real_model.signature.zero value) :
    nonstrict_order real_model
      (.finite real_model.signature.zero) (.finite value)
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
theorem FiniteIsNonNegativeExtended (real_model : RealModel)
    (value : real_model.signature.carrier)
    (value_nonneg : real_model.signature.le real_model.signature.zero value) :
    nonstrict_order real_model
      (.finite real_model.signature.zero) (.finite value) := by
  sorry

/--
`toExtended` TODO

Predicate logic:

  def toExtended (real_model : RealModel)
    (value : NonNegativeReal real_model) : NonNegativeExtendedReal real_model :=
  ⟨.finite value.val, FiniteIsNonNegativeExtended real_model value.val value.property⟩

Predicate logic (unfolded):

  def toExtended (real_model : RealModel)
    (value : NonNegativeReal real_model) : NonNegativeExtendedReal real_model :=
  ⟨.finite value.val, FiniteIsNonNegativeExtended real_model value.val value.property⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def toExtended (real_model : RealModel)
    (value : NonNegativeReal real_model) : NonNegativeExtendedReal real_model :=
  ⟨.finite value.val, FiniteIsNonNegativeExtended real_model value.val value.property⟩
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
def toExtended (real_model : RealModel)
    (value : NonNegativeReal real_model) : NonNegativeExtendedReal real_model :=
  ⟨.finite value.val, FiniteIsNonNegativeExtended real_model value.val value.property⟩

/--
`AdditionIsNonNegative` TODO

Predicate logic:

  (∀ real_model ∈ RealModel ∀ first second ∈ real_model.signature.carrier), real_model.signature.le real_model.signature.zero (real_model.signature.add first second)

Predicate logic (unfolded):

  ∀ (real_model : LRA.NumberSystems.Interface.ModelTheory.RealModel) (first second : real_model.signature.toCarrierBundle.1), (real_model.signature.toOrderedRingConceptSignature.2 real_model.signature.toZeroOneBundle.2 first ∧ real_model.signature.toOrderedRingConceptSignature.2 real_model.signature.toZeroOneBundle.2 second) → real_model.signature.toOrderedRingConceptSignature.2 real_model.signature.toZeroOneBundle.2 (real_model.signature.toBooleanRingOperationBundle.2 first second)

Logical form (Lean):

```lean
theorem AdditionIsNonNegative (real_model : RealModel)
    (first second : real_model.signature.carrier)
    (first_nonneg : real_model.signature.le real_model.signature.zero first)
    (second_nonneg : real_model.signature.le real_model.signature.zero second) :
    real_model.signature.le real_model.signature.zero
      (real_model.signature.add first second)
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
theorem AdditionIsNonNegative (real_model : RealModel)
    (first second : real_model.signature.carrier)
    (first_nonneg : real_model.signature.le real_model.signature.zero first)
    (second_nonneg : real_model.signature.le real_model.signature.zero second) :
    real_model.signature.le real_model.signature.zero
      (real_model.signature.add first second) := by
  sorry

/--
`add` TODO

Predicate logic:

  def add (real_model : RealModel)
    (first second : NonNegativeReal real_model) : NonNegativeReal real_model :=
  ⟨real_model.signature.add first.val second.val,
    AdditionIsNonNegative real_model first.val second.val
      first.property second.property⟩

Predicate logic (unfolded):

  def add (real_model : RealModel)
    (first second : NonNegativeReal real_model) : NonNegativeReal real_model :=
  ⟨real_model.signature.add first.val second.val,
    AdditionIsNonNegative real_model first.val second.val
      first.property second.property⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def add (real_model : RealModel)
    (first second : NonNegativeReal real_model) : NonNegativeReal real_model :=
  ⟨real_model.signature.add first.val second.val,
    AdditionIsNonNegative real_model first.val second.val
      first.property second.property⟩
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
def add (real_model : RealModel)
    (first second : NonNegativeReal real_model) : NonNegativeReal real_model :=
  ⟨real_model.signature.add first.val second.val,
    AdditionIsNonNegative real_model first.val second.val
      first.property second.property⟩

/--
`addExtendedRaw` TODO

Predicate logic:

  def addExtendedRaw (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model → ExtendedReal real_model
  | .positiveInfinity, _ => .positiveInfinity
  | _, .positiveInfinity => .positiveInfinity
  | .negativeInfinity, _ => .negativeInfinity
  | _, .negativeInfinity => .negativeInfinity
  | .finite first, .finite second => .finite (real_model.signature.add first second)

Predicate logic (unfolded):

  def addExtendedRaw (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model → ExtendedReal real_model
  | .positiveInfinity, _ => .positiveInfinity
  | _, .positiveInfinity => .positiveInfinity
  | .negativeInfinity, _ => .negativeInfinity
  | _, .negativeInfinity => .negativeInfinity
  | .finite first, .finite second => .finite (real_model.signature.add first second) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def addExtendedRaw (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model → ExtendedReal real_model
  | .positiveInfinity, _ => .positiveInfinity
  | _, .positiveInfinity => .positiveInfinity
  | .negativeInfinity, _ => .negativeInfinity
  | _, .negativeInfinity => .negativeInfinity
  | .finite first, .finite second => .finite (real_model.signature.add first second)
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
def addExtendedRaw (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model → ExtendedReal real_model
  | .positiveInfinity, _ => .positiveInfinity
  | _, .positiveInfinity => .positiveInfinity
  | .negativeInfinity, _ => .negativeInfinity
  | _, .negativeInfinity => .negativeInfinity
  | .finite first, .finite second => .finite (real_model.signature.add first second)

/--
`AddExtendedRawIsNonNegative` TODO

Predicate logic:

  (∀ real_model ∈ RealModel), nonstrict_order real_model (.finite real_model.signature.zero) (addExtendedRaw real_model first second)

Predicate logic (unfolded):

  ∀ (real_model : LRA.NumberSystems.Interface.ModelTheory.RealModel) (first second : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal real_model), (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.land 1 (Nat.shiftRight 3 t.ctorIdx) = 1 → False) → (fun x => (fun x x_1 => Prop) x first) t) → (fun x => (fun x x_1 => Prop) x first) t) (fun «else» => (fun x => True) first) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 6 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => «else» ⋯) (fun value_1 «else» => (fun value_2 => (fun first second => real_model.signature.toOrderedRingConceptSignature.2 first second) value value_2) value_1) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) first fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) first) value) (fun «else» => «else» ⋯) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 4 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) first fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) first ∧ LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.land 1 (Nat.shiftRight 3 t.ctorIdx) = 1 → False) → (fun x => (fun x x_1 => Prop) x second) t) → (fun x => (fun x x_1 => Prop) x second) t) (fun «else» => (fun x => True) second) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 6 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => «else» ⋯) (fun value_1 «else» => (fun value_2 => (fun first second => real_model.signature.toOrderedRingConceptSignature.2 first second) value value_2) value_1) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) second fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) second) value) (fun «else» => «else» ⋯) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 4 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) second fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) second) → LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.land 1 (Nat.shiftRight 3 t.ctorIdx) = 1 → False) → (fun x => (fun x x_1 => Prop) x (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (LRA.NumberSystems.RealNumbers.NonNegative.addExtendedRaw._sparseCasesOn_1 second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) fun h => (fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) second) (fun value => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (fun value_1 => (fun first second => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite (real_model.signature.add first second)) value value_1) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value))) value) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) second) first)) t) → (fun x => (fun x x_1 => Prop) x (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (LRA.NumberSystems.RealNumbers.NonNegative.addExtendedRaw._sparseCasesOn_1 second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) fun h => (fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) second) (fun value => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (fun value_1 => (fun first second => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite (real_model.signature.add first second)) value value_1) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value))) value) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) second) first)) t) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (LRA.NumberSystems.RealNumbers.NonNegative.addExtendedRaw._sparseCasesOn_1 second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) fun h => (fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) second) (fun value => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (fun value_1 => (fun first second => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite (real_model.signature.add first second)) value value_1) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value))) value) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) second) first)) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 6 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => «else» ⋯) (fun value_1 «else» => (fun value_2 => (fun first second => real_model.signature.toOrderedRingConceptSignature.2 first second) value value_2) value_1) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn first (LRA.NumberSystems.RealNumbers.NonNegative.addExtendedRaw._sparseCasesOn_1 second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) fun h => (fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) second) (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (fun value_1 => (fun first second => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite (real_model.signature.add first second)) value value_1) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value))) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) second)) fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn first (LRA.NumberSystems.RealNumbers.NonNegative.addExtendedRaw._sparseCasesOn_1 second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) fun h => (fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) second) (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (fun value_1 => (fun first second => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite (real_model.signature.add first second)) value value_1) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value))) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) second))) value) (fun «else» => «else» ⋯) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 4 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn first (LRA.NumberSystems.RealNumbers.NonNegative.addExtendedRaw._sparseCasesOn_1 second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) fun h => (fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) second) (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (fun value_1 => (fun first second => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite (real_model.signature.add first second)) value value_1) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value))) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) second)) fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn first (LRA.NumberSystems.RealNumbers.NonNegative.addExtendedRaw._sparseCasesOn_1 second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) fun h => (fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) second) (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (fun value_1 => (fun first second => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite (real_model.signature.add first second)) value value_1) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value))) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) second))

Logical form (Lean):

```lean
theorem AddExtendedRawIsNonNegative (real_model : RealModel)
    (first second : ExtendedReal real_model)
    (first_nonneg :
      nonstrict_order real_model (.finite real_model.signature.zero) first)
    (second_nonneg :
      nonstrict_order real_model (.finite real_model.signature.zero) second) :
    nonstrict_order real_model
      (.finite real_model.signature.zero)
      (addExtendedRaw real_model first second)
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
theorem AddExtendedRawIsNonNegative (real_model : RealModel)
    (first second : ExtendedReal real_model)
    (first_nonneg :
      nonstrict_order real_model (.finite real_model.signature.zero) first)
    (second_nonneg :
      nonstrict_order real_model (.finite real_model.signature.zero) second) :
    nonstrict_order real_model
      (.finite real_model.signature.zero)
      (addExtendedRaw real_model first second) := by
  sorry

/--
`addExtended` TODO

Predicate logic:

  def addExtended (real_model : RealModel)
    (first second : NonNegativeExtendedReal real_model) :
    NonNegativeExtendedReal real_model :=
  ⟨addExtendedRaw real_model first.val second.val,
    AddExtendedRawIsNonNegative real_model first.val second.val
      first.property second.property⟩

Predicate logic (unfolded):

  def addExtended (real_model : RealModel)
    (first second : NonNegativeExtendedReal real_model) :
    NonNegativeExtendedReal real_model :=
  ⟨addExtendedRaw real_model first.val second.val,
    AddExtendedRawIsNonNegative real_model first.val second.val
      first.property second.property⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def addExtended (real_model : RealModel)
    (first second : NonNegativeExtendedReal real_model) :
    NonNegativeExtendedReal real_model :=
  ⟨addExtendedRaw real_model first.val second.val,
    AddExtendedRawIsNonNegative real_model first.val second.val
      first.property second.property⟩
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
def addExtended (real_model : RealModel)
    (first second : NonNegativeExtendedReal real_model) :
    NonNegativeExtendedReal real_model :=
  ⟨addExtendedRaw real_model first.val second.val,
    AddExtendedRawIsNonNegative real_model first.val second.val
      first.property second.property⟩

/--
`le` TODO

Predicate logic:

  ∀ (real_model : LRA.NumberSystems.Interface.ModelTheory.RealModel) (first second : LRA.NumberSystems.RealNumbers.NonNegative.NonNegativeReal real_model), real_model.leInst.1 first.val second.val

Predicate logic (unfolded):

  ∀ (real_model : LRA.NumberSystems.Interface.ModelTheory.RealModel) (first second : Subtype fun value => real_model.signature.toOrderedRingConceptSignature.2 real_model.signature.toZeroOneBundle.2 value), real_model.leInst.1 first.1 second.1

Logical form (Lean):

```lean
def le (real_model : RealModel)
    (first second : NonNegativeReal real_model) : Prop :=
  real_model.signature.le first.val second.val
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
def le (real_model : RealModel)
    (first second : NonNegativeReal real_model) : Prop :=
  real_model.signature.le first.val second.val

/--
`leExtended` TODO

Predicate logic:

  ∀ (real_model : LRA.NumberSystems.Interface.ModelTheory.RealModel) (first second : LRA.NumberSystems.RealNumbers.NonNegative.NonNegativeExtendedReal real_model), LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Nat.hasNotBit 3 t.ctorIdx → (fun x => (fun x x_1 => Prop) x second.val) t) → (fun x => (fun x x_1 => Prop) x second.val) t) (fun «else» => (fun x => True) second.val) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.nonstrict_order._sparseCasesOn_2 second.val ((fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (fun value_1 => (fun first second => real_model.signature.le first second) value value_1) fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) second.val) value) (fun «else» => «else» ⋯) first.val fun h => LRA.NumberSystems.RealNumbers.Extended.nonstrict_order._sparseCasesOn_3 second.val ((fun x => True) first.val) fun h => (fun x x_1 => False) first.val second.val

Predicate logic (unfolded):

  ∀ (real_model : LRA.NumberSystems.Interface.ModelTheory.RealModel) (first second : Subtype fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 3 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) x value) t) → (fun x => (fun x x_1 => Prop) x value) t) (fun «else» => (fun x => True) value) (fun value_1 «else» => (fun value_2 => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 6 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value_2) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value_2) x) t) (fun «else» => «else» ⋯) (fun value «else» => (fun value => (fun first second => real_model.signature.toOrderedRingConceptSignature.2 first second) value_2 value) value) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value_2)) value fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value_2) value) value_1) (fun «else» => «else» ⋯) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 4 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) value fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) value), LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.bitwise Bool.and (instOfNatNat 1).1 (Nat.shiftRight 3 (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec 0 (fun value => (fun value => 1) value) 2 t)) = instOfNatNat 1.1 → False) → (fun x => (fun x x_1 => Prop) x second.1) t) → (fun x => (fun x x_1 => Prop) x second.1) t) (fun «else» => (fun x => True) second.1) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.bitwise Bool.and (instOfNatNat 1).1 (Nat.shiftRight 6 (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn t 0 (fun value => 1) 2)) = instOfNatNat 1.1 → False) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => «else» ⋯) (fun value_1 «else» => (fun value_2 => (fun first second => real_model.signature.toOrderedRingConceptSignature.2 first second) value value_2) value_1) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) second.1 fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) second.1) value) (fun «else» => «else» ⋯) first.1 fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.bitwise Bool.and (instOfNatNat 1).1 (Nat.shiftRight 4 (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn t 0 (fun value => 1) 2)) = instOfNatNat 1.1 → False) → (fun x => (fun x x_1 => Prop) first.1 x) t) → (fun x => (fun x x_1 => Prop) first.1 x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) first.1) second.1 fun h => (fun x x_1 => False) first.1 second.1

Logical form (Lean):

```lean
def leExtended (real_model : RealModel)
    (first second : NonNegativeExtendedReal real_model) : Prop :=
  nonstrict_order real_model first.val second.val
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
def leExtended (real_model : RealModel)
    (first second : NonNegativeExtendedReal real_model) : Prop :=
  nonstrict_order real_model first.val second.val

/--
`toReal` TODO

Predicate logic:

  def toReal (real_model : RealModel)
    (value : NonNegativeReal real_model) : real_model.signature.carrier :=
  value.val

Predicate logic (unfolded):

  def toReal (real_model : RealModel)
    (value : NonNegativeReal real_model) : real_model.signature.carrier :=
  value.val (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def toReal (real_model : RealModel)
    (value : NonNegativeReal real_model) : real_model.signature.carrier :=
  value.val
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
def toReal (real_model : RealModel)
    (value : NonNegativeReal real_model) : real_model.signature.carrier :=
  value.val

/--
`toExtendedReal` TODO

Predicate logic:

  def toExtendedReal (real_model : RealModel)
    (value : NonNegativeExtendedReal real_model) : ExtendedReal real_model :=
  value.val

Predicate logic (unfolded):

  def toExtendedReal (real_model : RealModel)
    (value : NonNegativeExtendedReal real_model) : ExtendedReal real_model :=
  value.val (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def toExtendedReal (real_model : RealModel)
    (value : NonNegativeExtendedReal real_model) : ExtendedReal real_model :=
  value.val
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
def toExtendedReal (real_model : RealModel)
    (value : NonNegativeExtendedReal real_model) : ExtendedReal real_model :=
  value.val

end LRA.NumberSystems.RealNumbers.NonNegative
