import LRA.NumberSystems.RealNumbers.Interface.ModelTheory.Model

namespace LRA.NumberSystems.RealNumbers.Extended

open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

/--
`ExtendedReal` Canonical owner for the generic extended-real carrier and its order-first refinements. Arithmetic is layered through explicit definedness predicates rather than by silently treating every exceptional case as total.

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

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.bitwise Bool.and 1 (Nat.shiftRight 3 (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec 0 (fun value => (fun value => 1) value) 2 t)) = 1 → False) → (fun x => (fun x x_1 => Prop) x a_1) t) → (fun x => (fun x x_1 => Prop) x a_1) t) (fun «else» => (fun x => True) a_1) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.bitwise Bool.and 1 (Nat.shiftRight 6 (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn t 0 (fun value => 1) 2)) = 1 → False) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => «else» ⋯) (fun value_1 «else» => (fun value_2 => (fun first second => real_model.signature.toOrderedRingConceptSignature.2 first second) value value_2) value_1) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) a_1 fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) a_1) value) (fun «else» => «else» ⋯) a fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.bitwise Bool.and 1 (Nat.shiftRight 4 (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn t 0 (fun value => 1) 2)) = 1 → False) → (fun x => (fun x x_1 => Prop) a x) t) → (fun x => (fun x x_1 => Prop) a x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) a) a_1 fun h => (fun x x_1 => False) a a_1

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
`NonPositiveExtendedReal` TODO

Predicate logic:

  def NonPositiveExtendedReal (real_model : RealModel) : Type _ :=
    { value : ExtendedReal real_model //
        nonstrict_order real_model value (.finite real_model.signature.zero) }

Predicate logic (unfolded):

  def NonPositiveExtendedReal (real_model : RealModel) : Type _ :=
    { value : ExtendedReal real_model //
        nonstrict_order real_model value (.finite real_model.signature.zero) } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def NonPositiveExtendedReal (real_model : RealModel) : Type _ :=
  { value : ExtendedReal real_model //
      nonstrict_order real_model value (.finite real_model.signature.zero) }
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
def NonPositiveExtendedReal (real_model : RealModel) : Type _ :=
  { value : ExtendedReal real_model //
      nonstrict_order real_model value (.finite real_model.signature.zero) }

/--
`ZeroIsNonNegative` TODO

Predicate logic:

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel), real_model.signature.le real_model.signature.zero real_model.signature.zero

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    real_model : RealModel
  Prove
    real_model.signature.toOrderedRingConceptSignature.2 real_model.signature.toZeroOneBundle.2 real_model.signature.toZeroOneBundle.2

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

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel), LRA.NumberSystems.RealNumbers.Extended.nonstrict_order real_model (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.zero) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    real_model : RealModel
  Prove
    LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.land 1 (Nat.shiftRight 3 t.ctorIdx) = 1 → False) → (fun x => (fun x x_1 => Prop) x LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) t) → (fun x => (fun x x_1 => Prop) x LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) t) (fun «else» => (fun x => True) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 6 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => «else» ⋯) (fun value_1 «else» => (fun value_2 => (fun first second => real_model.signature.toOrderedRingConceptSignature.2 first second) value value_2) value_1) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) value) (fun «else» => «else» ⋯) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 4 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity

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
`NegativeInfinityIsNonPositive` TODO

Predicate logic:

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel), LRA.NumberSystems.RealNumbers.Extended.nonstrict_order real_model LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.zero)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    real_model : RealModel
  Prove
    LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.land 1 (Nat.shiftRight 3 t.ctorIdx) = 1 → False) → (fun x => (fun x x_1 => Prop) x (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) t) → (fun x => (fun x x_1 => Prop) x (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) t) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 6 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => «else» ⋯) (fun value_1 «else» => (fun value_2 => (fun first second => real_model.signature.toOrderedRingConceptSignature.2 first second) value value_2) value_1) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) value) (fun «else» => «else» ⋯) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 4 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity x) t) → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) fun h => (fun x x_1 => False) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)

Logical form (Lean):

```lean
theorem NegativeInfinityIsNonPositive (real_model : RealModel) :
    nonstrict_order real_model
      (.negativeInfinity) (.finite real_model.signature.zero)
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
theorem NegativeInfinityIsNonPositive (real_model : RealModel) :
    nonstrict_order real_model
      (.negativeInfinity) (.finite real_model.signature.zero) := by
  sorry
/--
`negativeInfinityElement` TODO

Predicate logic:

  def negativeInfinityElement
      (real_model : RealModel) : NonPositiveExtendedReal real_model :=
    ⟨.negativeInfinity, NegativeInfinityIsNonPositive real_model⟩

Predicate logic (unfolded):

  def negativeInfinityElement
      (real_model : RealModel) : NonPositiveExtendedReal real_model :=
    ⟨.negativeInfinity, NegativeInfinityIsNonPositive real_model⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def negativeInfinityElement
    (real_model : RealModel) : NonPositiveExtendedReal real_model :=
  ⟨.negativeInfinity, NegativeInfinityIsNonPositive real_model⟩
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
def negativeInfinityElement
    (real_model : RealModel) : NonPositiveExtendedReal real_model :=
  ⟨.negativeInfinity, NegativeInfinityIsNonPositive real_model⟩

/--
`FiniteIsNonNegativeExtended` TODO

Predicate logic:

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (value : real_model.signature.carrier), real_model.signature.le real_model.signature.zero value → LRA.NumberSystems.RealNumbers.Extended.nonstrict_order real_model (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.zero) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    real_model : RealModel
    value : real_model.signature.carrier
    value_nonneg : real_model.signature.le real_model.signature.zero value
  Prove
    real_model.signature.toOrderedRingConceptSignature.2 real_model.signature.toZeroOneBundle.2 value → LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.land 1 (Nat.shiftRight 3 t.ctorIdx) = 1 → False) → (fun x => (fun x x_1 => Prop) x (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) t) → (fun x => (fun x x_1 => Prop) x (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) t) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (fun value_1 «else» => (fun value_2 => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 6 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value_2) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value_2) x) t) (fun «else» => «else» ⋯) (fun value «else» => (fun value => (fun first second => real_model.signature.toOrderedRingConceptSignature.2 first second) value_2 value) value) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value_2)) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value_2) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) value_1) (fun «else» => «else» ⋯) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 4 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)

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
`FiniteIsNonPositiveExtended` TODO

Predicate logic:

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (value : real_model.signature.carrier), real_model.signature.le value real_model.signature.zero → LRA.NumberSystems.RealNumbers.Extended.nonstrict_order real_model (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.zero)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    real_model : RealModel
    value : real_model.signature.carrier
    value_nonpos : real_model.signature.le value real_model.signature.zero
  Prove
    real_model.signature.toOrderedRingConceptSignature.2 value real_model.signature.toZeroOneBundle.2 → LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.land 1 (Nat.shiftRight 3 t.ctorIdx) = 1 → False) → (fun x => (fun x x_1 => Prop) x (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) t) → (fun x => (fun x x_1 => Prop) x (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) t) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 6 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => «else» ⋯) (fun value_1 «else» => (fun value_2 => (fun first second => real_model.signature.toOrderedRingConceptSignature.2 first second) value value_2) value_1) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) value) (fun «else» => «else» ⋯) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 4 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => «else» ⋯) (fun value_1 «else» => «else» ⋯) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)

Logical form (Lean):

```lean
theorem FiniteIsNonPositiveExtended (real_model : RealModel)
    (value : real_model.signature.carrier)
    (value_nonpos : real_model.signature.le value real_model.signature.zero) :
    nonstrict_order real_model
      (.finite value) (.finite real_model.signature.zero)
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
theorem FiniteIsNonPositiveExtended (real_model : RealModel)
    (value : real_model.signature.carrier)
    (value_nonpos : real_model.signature.le value real_model.signature.zero) :
    nonstrict_order real_model
      (.finite value) (.finite real_model.signature.zero) := by
  sorry
/--
`toExtendedNonPositive` TODO

Predicate logic:

  def toExtendedNonPositive (real_model : RealModel)
      (value : { x : real_model.signature.carrier //
        real_model.signature.le x real_model.signature.zero }) :
      NonPositiveExtendedReal real_model :=
    ⟨.finite value.val,
      FiniteIsNonPositiveExtended real_model value.val value.property⟩

Predicate logic (unfolded):

  def toExtendedNonPositive (real_model : RealModel)
      (value : { x : real_model.signature.carrier //
        real_model.signature.le x real_model.signature.zero }) :
      NonPositiveExtendedReal real_model :=
    ⟨.finite value.val,
      FiniteIsNonPositiveExtended real_model value.val value.property⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def toExtendedNonPositive (real_model : RealModel)
    (value : { x : real_model.signature.carrier //
      real_model.signature.le x real_model.signature.zero }) :
    NonPositiveExtendedReal real_model :=
  ⟨.finite value.val,
    FiniteIsNonPositiveExtended real_model value.val value.property⟩
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
def toExtendedNonPositive (real_model : RealModel)
    (value : { x : real_model.signature.carrier //
      real_model.signature.le x real_model.signature.zero }) :
    NonPositiveExtendedReal real_model :=
  ⟨.finite value.val,
    FiniteIsNonPositiveExtended real_model value.val value.property⟩

/--
`AdditionIsNonNegative` TODO

Predicate logic:

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (first second : real_model.signature.carrier), (real_model.signature.le real_model.signature.zero first ∧ real_model.signature.le real_model.signature.zero second) → real_model.signature.le real_model.signature.zero (real_model.signature.add first second)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    real_model : RealModel
    first second : real_model.signature.carrier
    first_nonneg : real_model.signature.le real_model.signature.zero first
    second_nonneg : real_model.signature.le real_model.signature.zero second
  Prove
    (real_model.signature.toOrderedRingConceptSignature.2 real_model.signature.toZeroOneBundle.2 first ∧ real_model.signature.toOrderedRingConceptSignature.2 real_model.signature.toZeroOneBundle.2 second) → real_model.signature.toOrderedRingConceptSignature.2 real_model.signature.toZeroOneBundle.2 (real_model.signature.toBooleanRingOperationBundle.2 first second)

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
`AdditionIsNonPositive` TODO

Predicate logic:

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (first second : real_model.signature.carrier), (real_model.signature.le first real_model.signature.zero ∧ real_model.signature.le second real_model.signature.zero) → real_model.signature.le (real_model.signature.add first second) real_model.signature.zero

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    real_model : RealModel
    first second : real_model.signature.carrier
    first_nonpos : real_model.signature.le first real_model.signature.zero
    second_nonpos : real_model.signature.le second real_model.signature.zero
  Prove
    (real_model.signature.toOrderedRingConceptSignature.2 first real_model.signature.toZeroOneBundle.2 ∧ real_model.signature.toOrderedRingConceptSignature.2 second real_model.signature.toZeroOneBundle.2) → real_model.signature.toOrderedRingConceptSignature.2 (real_model.signature.toBooleanRingOperationBundle.2 first second) real_model.signature.toZeroOneBundle.2

Logical form (Lean):

```lean
theorem AdditionIsNonPositive (real_model : RealModel)
    (first second : real_model.signature.carrier)
    (first_nonpos : real_model.signature.le first real_model.signature.zero)
    (second_nonpos : real_model.signature.le second real_model.signature.zero) :
    real_model.signature.le
      (real_model.signature.add first second) real_model.signature.zero
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
theorem AdditionIsNonPositive (real_model : RealModel)
    (first second : real_model.signature.carrier)
    (first_nonpos : real_model.signature.le first real_model.signature.zero)
    (second_nonpos : real_model.signature.le second real_model.signature.zero) :
    real_model.signature.le
      (real_model.signature.add first second) real_model.signature.zero := by
  sorry
/--
`addNonPositive` TODO

Predicate logic:

  def addNonPositive (real_model : RealModel)
      (first second : { x : real_model.signature.carrier //
        real_model.signature.le x real_model.signature.zero }) :
      { x : real_model.signature.carrier //
        real_model.signature.le x real_model.signature.zero } :=
    ⟨real_model.signature.add first.val second.val,
      AdditionIsNonPositive real_model first.val second.val
        first.property second.property⟩

Predicate logic (unfolded):

  def addNonPositive (real_model : RealModel)
      (first second : { x : real_model.signature.carrier //
        real_model.signature.le x real_model.signature.zero }) :
      { x : real_model.signature.carrier //
        real_model.signature.le x real_model.signature.zero } :=
    ⟨real_model.signature.add first.val second.val,
      AdditionIsNonPositive real_model first.val second.val
        first.property second.property⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def addNonPositive (real_model : RealModel)
    (first second : { x : real_model.signature.carrier //
      real_model.signature.le x real_model.signature.zero }) :
    { x : real_model.signature.carrier //
      real_model.signature.le x real_model.signature.zero } :=
  ⟨real_model.signature.add first.val second.val,
    AdditionIsNonPositive real_model first.val second.val
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
def addNonPositive (real_model : RealModel)
    (first second : { x : real_model.signature.carrier //
      real_model.signature.le x real_model.signature.zero }) :
    { x : real_model.signature.carrier //
      real_model.signature.le x real_model.signature.zero } :=
  ⟨real_model.signature.add first.val second.val,
    AdditionIsNonPositive real_model first.val second.val
      first.property second.property⟩

/--
`ExtendedAdditionDefined` TODO

Predicate logic:

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (a a_1 : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal real_model), LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Nat.hasNotBit 5 t.ctorIdx → (fun x => (fun x x_1 => Prop) x a_1) t) → (fun x => (fun x x_1 => Prop) x a_1) t) (fun «else» => LRA.NumberSystems.RealNumbers.Extended.nonstrict_order._sparseCasesOn_3 a_1 ((fun _ => False) Unit.unit) fun h => (fun x x_1 => True) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity a_1) (fun value «else» => «else» ⋯) (fun «else» => LRA.NumberSystems.RealNumbers.Extended.ExtendedAdditionDefined._sparseCasesOn_2 a_1 ((fun _ => False) Unit.unit) fun h => (fun x x_1 => True) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity a_1) a fun h => (fun x x_1 => True) a a_1

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.bitwise Bool.and 1 (Nat.shiftRight 5 (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec 0 (fun value => (fun value => 1) value) 2 t)) = 1 → False) → (fun x => (fun x x_1 => Prop) x a_1) t) → (fun x => (fun x x_1 => Prop) x a_1) t) (fun «else» => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.bitwise Bool.and 1 (Nat.shiftRight 4 (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn t 0 (fun value => 1) 2)) = 1 → False) → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity x) t) → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun _ => False) Unit.unit) a_1 fun h => (fun x x_1 => True) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity a_1) (fun value «else» => «else» ⋯) (fun «else» => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.bitwise Bool.and 1 (Nat.shiftRight 1 (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn t 0 (fun value => 1) 2)) = 1 → False) → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity x) t) → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity x) t) (fun «else» => (fun _ => False) Unit.unit) (fun value «else» => «else» ⋯) (fun «else» => «else» ⋯) a_1 fun h => (fun x x_1 => True) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity a_1) a fun h => (fun x x_1 => True) a a_1

Logical form (Lean):

```lean
def ExtendedAdditionDefined
    (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model → Prop
  | .positiveInfinity, .negativeInfinity => False
  | .negativeInfinity, .positiveInfinity => False
  | _, _ => True
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
def ExtendedAdditionDefined
    (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model → Prop
  | .positiveInfinity, .negativeInfinity => False
  | .negativeInfinity, .positiveInfinity => False
  | _, _ => True

/--
`positiveInfinityPlusNegativeInfinityUndefined` TODO

Predicate logic:

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel), ¬ LRA.NumberSystems.RealNumbers.Extended.ExtendedAdditionDefined real_model LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    real_model : RealModel
  Prove
    (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 5 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) x LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) t) → (fun x => (fun x x_1 => Prop) x LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) t) (fun «else» => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 4 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity x) t) → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun _ => False) Unit.unit) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity fun h => (fun x x_1 => True) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) (fun value «else» => «else» ⋯) (fun «else» => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 1 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity x) t) → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity x) t) (fun «else» => (fun _ => False) Unit.unit) (fun value «else» => «else» ⋯) (fun «else» => «else» ⋯) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity fun h => (fun x x_1 => True) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity fun h => (fun x x_1 => True) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) → False

Logical form (Lean):

```lean
theorem positiveInfinityPlusNegativeInfinityUndefined
    (real_model : RealModel) :
    ¬ ExtendedAdditionDefined real_model
      (.positiveInfinity) (.negativeInfinity)
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
theorem positiveInfinityPlusNegativeInfinityUndefined
    (real_model : RealModel) :
    ¬ ExtendedAdditionDefined real_model
      (.positiveInfinity) (.negativeInfinity) := by
  sorry
/--
`negativeInfinityPlusPositiveInfinityUndefined` TODO

Predicate logic:

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel), ¬ LRA.NumberSystems.RealNumbers.Extended.ExtendedAdditionDefined real_model LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    real_model : RealModel
  Prove
    (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 5 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) x LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) t) → (fun x => (fun x x_1 => Prop) x LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) t) (fun «else» => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 4 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity x) t) → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun _ => False) Unit.unit) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity fun h => (fun x x_1 => True) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) (fun value «else» => «else» ⋯) (fun «else» => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 1 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity x) t) → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity x) t) (fun «else» => (fun _ => False) Unit.unit) (fun value «else» => «else» ⋯) (fun «else» => «else» ⋯) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity fun h => (fun x x_1 => True) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity fun h => (fun x x_1 => True) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) → False

Logical form (Lean):

```lean
theorem negativeInfinityPlusPositiveInfinityUndefined
    (real_model : RealModel) :
    ¬ ExtendedAdditionDefined real_model
      (.negativeInfinity) (.positiveInfinity)
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
theorem negativeInfinityPlusPositiveInfinityUndefined
    (real_model : RealModel) :
    ¬ ExtendedAdditionDefined real_model
      (.negativeInfinity) (.positiveInfinity) := by
  sorry
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

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (first second : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal real_model), (LRA.NumberSystems.RealNumbers.Extended.nonstrict_order real_model (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.zero) first ∧ LRA.NumberSystems.RealNumbers.Extended.nonstrict_order real_model (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.zero) second) → LRA.NumberSystems.RealNumbers.Extended.nonstrict_order real_model (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.zero) (LRA.NumberSystems.RealNumbers.Extended.addExtendedRaw real_model first second)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    real_model : RealModel
    first second : ExtendedReal real_model
    first_nonneg : nonstrict_order real_model (.finite real_model.signature.zero) first
    second_nonneg : nonstrict_order real_model (.finite real_model.signature.zero) second
  Prove
    ((LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.land 1 (Nat.shiftRight 3 t.ctorIdx) = 1 → False) → (fun x => (fun x x_1 => Prop) x first) t) → (fun x => (fun x x_1 => Prop) x first) t) (fun «else» => (fun x => True) first) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 6 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => «else» ⋯) (fun value_1 «else» => (fun value_2 => (fun first second => real_model.signature.toOrderedRingConceptSignature.2 first second) value value_2) value_1) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) first fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) first) value) (fun «else» => «else» ⋯) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 4 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) first fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) first) ∧ (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.land 1 (Nat.shiftRight 3 t.ctorIdx) = 1 → False) → (fun x => (fun x x_1 => Prop) x second) t) → (fun x => (fun x x_1 => Prop) x second) t) (fun «else» => (fun x => True) second) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 6 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => «else» ⋯) (fun value_1 «else» => (fun value_2 => (fun first second => real_model.signature.toOrderedRingConceptSignature.2 first second) value value_2) value_1) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) second fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) second) value) (fun «else» => «else» ⋯) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 4 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) second fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) second)) → LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.land 1 (Nat.shiftRight 3 t.ctorIdx) = 1 → False) → (fun x => (fun x x_1 => Prop) x (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (LRA.NumberSystems.RealNumbers.Extended.ExtendedAdditionDefined._sparseCasesOn_1 second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) fun h => (fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) second) (fun value => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (fun value_1 => (fun first second => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite (real_model.signature.add first second)) value value_1) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value))) value) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) second) first)) t) → (fun x => (fun x x_1 => Prop) x (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (LRA.NumberSystems.RealNumbers.Extended.ExtendedAdditionDefined._sparseCasesOn_1 second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) fun h => (fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) second) (fun value => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (fun value_1 => (fun first second => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite (real_model.signature.add first second)) value value_1) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value))) value) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) second) first)) t) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (LRA.NumberSystems.RealNumbers.Extended.ExtendedAdditionDefined._sparseCasesOn_1 second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) fun h => (fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) second) (fun value => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (fun value_1 => (fun first second => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite (real_model.signature.add first second)) value value_1) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value))) value) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) second) first)) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 6 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => «else» ⋯) (fun value_1 «else» => (fun value_2 => (fun first second => real_model.signature.toOrderedRingConceptSignature.2 first second) value value_2) value_1) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn first (LRA.NumberSystems.RealNumbers.Extended.ExtendedAdditionDefined._sparseCasesOn_1 second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) fun h => (fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) second) (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (fun value_1 => (fun first second => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite (real_model.signature.add first second)) value value_1) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value))) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) second)) fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn first (LRA.NumberSystems.RealNumbers.Extended.ExtendedAdditionDefined._sparseCasesOn_1 second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) fun h => (fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) second) (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (fun value_1 => (fun first second => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite (real_model.signature.add first second)) value value_1) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value))) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) second))) value) (fun «else» => «else» ⋯) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 4 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn first (LRA.NumberSystems.RealNumbers.Extended.ExtendedAdditionDefined._sparseCasesOn_1 second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) fun h => (fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) second) (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (fun value_1 => (fun first second => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite (real_model.signature.add first second)) value value_1) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value))) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) second)) fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn first (LRA.NumberSystems.RealNumbers.Extended.ExtendedAdditionDefined._sparseCasesOn_1 second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) fun h => (fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) second) (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (fun value_1 => (fun first second => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite (real_model.signature.add first second)) value value_1) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value))) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) second))

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
`AddExtendedRawIsNonPositive` TODO

Predicate logic:

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (first second : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal real_model), (LRA.NumberSystems.RealNumbers.Extended.nonstrict_order real_model first (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.zero) ∧ LRA.NumberSystems.RealNumbers.Extended.nonstrict_order real_model second (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.zero)) → LRA.NumberSystems.RealNumbers.Extended.nonstrict_order real_model (LRA.NumberSystems.RealNumbers.Extended.addExtendedRaw real_model first second) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.zero)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    real_model : RealModel
    first second : ExtendedReal real_model
    first_nonpos : nonstrict_order real_model first (.finite real_model.signature.zero)
    second_nonpos : nonstrict_order real_model second (.finite real_model.signature.zero)
  Prove
    ((LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.land 1 (Nat.shiftRight 3 t.ctorIdx) = 1 → False) → (fun x => (fun x x_1 => Prop) x (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) t) → (fun x => (fun x x_1 => Prop) x (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) t) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 6 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => «else» ⋯) (fun value_1 «else» => (fun value_2 => (fun first second => real_model.signature.toOrderedRingConceptSignature.2 first second) value value_2) value_1) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) value) (fun «else» => «else» ⋯) first fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 4 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) first x) t) → (fun x => (fun x x_1 => Prop) first x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) first) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) fun h => (fun x x_1 => False) first (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) ∧ (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.land 1 (Nat.shiftRight 3 t.ctorIdx) = 1 → False) → (fun x => (fun x x_1 => Prop) x (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) t) → (fun x => (fun x x_1 => Prop) x (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) t) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 6 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => «else» ⋯) (fun value_1 «else» => (fun value_2 => (fun first second => real_model.signature.toOrderedRingConceptSignature.2 first second) value value_2) value_1) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) value) (fun «else» => «else» ⋯) second fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 4 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) second x) t) → (fun x => (fun x x_1 => Prop) second x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) second) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) fun h => (fun x x_1 => False) second (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2))) → LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.land 1 (Nat.shiftRight 3 t.ctorIdx) = 1 → False) → (fun x => (fun x x_1 => Prop) x (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) t) → (fun x => (fun x x_1 => Prop) x (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) t) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 6 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => «else» ⋯) (fun value_1 «else» => (fun value_2 => (fun first second => real_model.signature.toOrderedRingConceptSignature.2 first second) value value_2) value_1) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) value) (fun «else» => «else» ⋯) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (LRA.NumberSystems.RealNumbers.Extended.ExtendedAdditionDefined._sparseCasesOn_1 second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) fun h => (fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) second) (fun value => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (fun value_1 => (fun first second => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite (real_model.signature.add first second)) value value_1) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value))) value) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) second) first) fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 4 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn first (LRA.NumberSystems.RealNumbers.Extended.ExtendedAdditionDefined._sparseCasesOn_1 second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) fun h => (fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) second) (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (fun value_1 => (fun first second => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite (real_model.signature.add first second)) value value_1) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value))) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) second)) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn first (LRA.NumberSystems.RealNumbers.Extended.ExtendedAdditionDefined._sparseCasesOn_1 second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) fun h => (fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) second) (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (fun value_1 => (fun first second => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite (real_model.signature.add first second)) value value_1) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value))) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) second)) x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn first (LRA.NumberSystems.RealNumbers.Extended.ExtendedAdditionDefined._sparseCasesOn_1 second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) fun h => (fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) second) (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (fun value_1 => (fun first second => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite (real_model.signature.add first second)) value value_1) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value))) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) second))) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn first (LRA.NumberSystems.RealNumbers.Extended.ExtendedAdditionDefined._sparseCasesOn_1 second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) fun h => (fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) second) (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn second ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (fun value_1 => (fun first second => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite (real_model.signature.add first second)) value value_1) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value))) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) second)) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)

Logical form (Lean):

```lean
theorem AddExtendedRawIsNonPositive (real_model : RealModel)
    (first second : ExtendedReal real_model)
    (first_nonpos :
      nonstrict_order real_model first (.finite real_model.signature.zero))
    (second_nonpos :
      nonstrict_order real_model second (.finite real_model.signature.zero)) :
    nonstrict_order real_model
      (addExtendedRaw real_model first second)
      (.finite real_model.signature.zero)
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
theorem AddExtendedRawIsNonPositive (real_model : RealModel)
    (first second : ExtendedReal real_model)
    (first_nonpos :
      nonstrict_order real_model first (.finite real_model.signature.zero))
    (second_nonpos :
      nonstrict_order real_model second (.finite real_model.signature.zero)) :
    nonstrict_order real_model
      (addExtendedRaw real_model first second)
      (.finite real_model.signature.zero) := by
  sorry
/--
`addExtendedNonPositive` TODO

Predicate logic:

  def addExtendedNonPositive (real_model : RealModel)
      (first second : NonPositiveExtendedReal real_model) :
      NonPositiveExtendedReal real_model :=
    ⟨addExtendedRaw real_model first.val second.val,
      AddExtendedRawIsNonPositive real_model first.val second.val
        first.property second.property⟩

Predicate logic (unfolded):

  def addExtendedNonPositive (real_model : RealModel)
      (first second : NonPositiveExtendedReal real_model) :
      NonPositiveExtendedReal real_model :=
    ⟨addExtendedRaw real_model first.val second.val,
      AddExtendedRawIsNonPositive real_model first.val second.val
        first.property second.property⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def addExtendedNonPositive (real_model : RealModel)
    (first second : NonPositiveExtendedReal real_model) :
    NonPositiveExtendedReal real_model :=
  ⟨addExtendedRaw real_model first.val second.val,
    AddExtendedRawIsNonPositive real_model first.val second.val
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
def addExtendedNonPositive (real_model : RealModel)
    (first second : NonPositiveExtendedReal real_model) :
    NonPositiveExtendedReal real_model :=
  ⟨addExtendedRaw real_model first.val second.val,
    AddExtendedRawIsNonPositive real_model first.val second.val
      first.property second.property⟩

/--
`le` TODO

Predicate logic:

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (first second : LRA.NumberSystems.RealNumbers.Extended.NonNegativeReal real_model), real_model.leInst.1 first.val second.val

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    real_model.leInst.1 first.1 second.1

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

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (first second : LRA.NumberSystems.RealNumbers.Extended.NonNegativeExtendedReal real_model), LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Nat.hasNotBit 3 t.ctorIdx → (fun x => (fun x x_1 => Prop) x second.val) t) → (fun x => (fun x x_1 => Prop) x second.val) t) (fun «else» => (fun x => True) second.val) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.nonstrict_order._sparseCasesOn_2 second.val ((fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (fun value_1 => (fun first second => real_model.signature.le first second) value value_1) fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) second.val) value) (fun «else» => «else» ⋯) first.val fun h => LRA.NumberSystems.RealNumbers.Extended.nonstrict_order._sparseCasesOn_3 second.val ((fun x => True) first.val) fun h => (fun x x_1 => False) first.val second.val

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.bitwise Bool.and 1 (Nat.shiftRight 3 (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec 0 (fun value => (fun value => 1) value) 2 t)) = 1 → False) → (fun x => (fun x x_1 => Prop) x second.1) t) → (fun x => (fun x x_1 => Prop) x second.1) t) (fun «else» => (fun x => True) second.1) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.bitwise Bool.and 1 (Nat.shiftRight 6 (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn t 0 (fun value => 1) 2)) = 1 → False) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => «else» ⋯) (fun value_1 «else» => (fun value_2 => (fun first second => real_model.signature.toOrderedRingConceptSignature.2 first second) value value_2) value_1) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) second.1 fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) second.1) value) (fun «else» => «else» ⋯) first.1 fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.bitwise Bool.and 1 (Nat.shiftRight 4 (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn t 0 (fun value => 1) 2)) = 1 → False) → (fun x => (fun x x_1 => Prop) first.1 x) t) → (fun x => (fun x x_1 => Prop) first.1 x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) first.1) second.1 fun h => (fun x x_1 => False) first.1 second.1

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
`leExtendedNonPositive` TODO

Predicate logic:

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (first second : LRA.NumberSystems.RealNumbers.Extended.NonPositiveExtendedReal real_model), LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Nat.hasNotBit 3 t.ctorIdx → (fun x => (fun x x_1 => Prop) x second.val) t) → (fun x => (fun x x_1 => Prop) x second.val) t) (fun «else» => (fun x => True) second.val) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.nonstrict_order._sparseCasesOn_2 second.val ((fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (fun value_1 => (fun first second => real_model.signature.le first second) value value_1) fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) second.val) value) (fun «else» => «else» ⋯) first.val fun h => LRA.NumberSystems.RealNumbers.Extended.nonstrict_order._sparseCasesOn_3 second.val ((fun x => True) first.val) fun h => (fun x x_1 => False) first.val second.val

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.bitwise Bool.and 1 (Nat.shiftRight 3 (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec 0 (fun value => (fun value => 1) value) 2 t)) = 1 → False) → (fun x => (fun x x_1 => Prop) x second.1) t) → (fun x => (fun x x_1 => Prop) x second.1) t) (fun «else» => (fun x => True) second.1) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.bitwise Bool.and 1 (Nat.shiftRight 6 (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn t 0 (fun value => 1) 2)) = 1 → False) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => «else» ⋯) (fun value_1 «else» => (fun value_2 => (fun first second => real_model.signature.toOrderedRingConceptSignature.2 first second) value value_2) value_1) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) second.1 fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) second.1) value) (fun «else» => «else» ⋯) first.1 fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.bitwise Bool.and 1 (Nat.shiftRight 4 (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn t 0 (fun value => 1) 2)) = 1 → False) → (fun x => (fun x x_1 => Prop) first.1 x) t) → (fun x => (fun x x_1 => Prop) first.1 x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) first.1) second.1 fun h => (fun x x_1 => False) first.1 second.1

Logical form (Lean):

```lean
def leExtendedNonPositive (real_model : RealModel)
    (first second : NonPositiveExtendedReal real_model) : Prop :=
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
def leExtendedNonPositive (real_model : RealModel)
    (first second : NonPositiveExtendedReal real_model) : Prop :=
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

/--
`toExtendedNonPositiveReal` TODO

Predicate logic:

  def toExtendedNonPositiveReal (real_model : RealModel)
      (value : NonPositiveExtendedReal real_model) : ExtendedReal real_model :=
    value.val

Predicate logic (unfolded):

  def toExtendedNonPositiveReal (real_model : RealModel)
      (value : NonPositiveExtendedReal real_model) : ExtendedReal real_model :=
    value.val (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def toExtendedNonPositiveReal (real_model : RealModel)
    (value : NonPositiveExtendedReal real_model) : ExtendedReal real_model :=
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
def toExtendedNonPositiveReal (real_model : RealModel)
    (value : NonPositiveExtendedReal real_model) : ExtendedReal real_model :=
  value.val

/--
`supremum` TODO

Predicate logic:

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (subset : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal real_model → Prop) (candidate : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal real_model), ((∀ (member : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal real_model), subset member → LRA.NumberSystems.RealNumbers.Extended.nonstrict_order real_model member candidate) ∧ (∀ (upper_bound : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal real_model), (∀ (member : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal real_model), subset member → LRA.NumberSystems.RealNumbers.Extended.nonstrict_order real_model member upper_bound) → LRA.NumberSystems.RealNumbers.Extended.nonstrict_order real_model candidate upper_bound))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (member : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal real_model), subset member → LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.land 1 (Nat.shiftRight 3 t.ctorIdx) = 1 → False) → (fun x => (fun x x_1 => Prop) x candidate) t) → (fun x => (fun x x_1 => Prop) x candidate) t) (fun «else» => (fun x => True) candidate) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 6 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => «else» ⋯) (fun value_1 «else» => (fun value_2 => (fun first second => real_model.signature.toOrderedRingConceptSignature.2 first second) value value_2) value_1) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) candidate fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) candidate) value) (fun «else» => «else» ⋯) member fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 4 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) member x) t) → (fun x => (fun x x_1 => Prop) member x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) member) candidate fun h => (fun x x_1 => False) member candidate) ∧ (∀ (upper_bound : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal real_model), (∀ (member : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal real_model), subset member → LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.land 1 (Nat.shiftRight 3 t.ctorIdx) = 1 → False) → (fun x => (fun x x_1 => Prop) x upper_bound) t) → (fun x => (fun x x_1 => Prop) x upper_bound) t) (fun «else» => (fun x => True) upper_bound) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 6 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => «else» ⋯) (fun value_1 «else» => (fun value_2 => (fun first second => real_model.signature.toOrderedRingConceptSignature.2 first second) value value_2) value_1) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) upper_bound fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) upper_bound) value) (fun «else» => «else» ⋯) member fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 4 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) member x) t) → (fun x => (fun x x_1 => Prop) member x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) member) upper_bound fun h => (fun x x_1 => False) member upper_bound) → LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.land 1 (Nat.shiftRight 3 t.ctorIdx) = 1 → False) → (fun x => (fun x x_1 => Prop) x upper_bound) t) → (fun x => (fun x x_1 => Prop) x upper_bound) t) (fun «else» => (fun x => True) upper_bound) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 6 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => «else» ⋯) (fun value_1 «else» => (fun value_2 => (fun first second => real_model.signature.toOrderedRingConceptSignature.2 first second) value value_2) value_1) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) upper_bound fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) upper_bound) value) (fun «else» => «else» ⋯) candidate fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 4 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) candidate x) t) → (fun x => (fun x x_1 => Prop) candidate x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) candidate) upper_bound fun h => (fun x x_1 => False) candidate upper_bound))

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

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (subset : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal real_model → Prop), Exists fun candidate => LRA.NumberSystems.RealNumbers.Extended.supremum real_model subset candidate

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    real_model : RealModel
    subset : ExtendedReal real_model → Prop
  Prove
    Exists fun candidate => ((∀ (member : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal real_model), subset member → LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 3 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) x candidate) t) → (fun x => (fun x x_1 => Prop) x candidate) t) (fun «else» => (fun x => True) candidate) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 6 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => «else» ⋯) (fun value_1 «else» => (fun value_2 => (fun first second => real_model.signature.toOrderedRingConceptSignature.2 first second) value value_2) value_1) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) candidate fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) candidate) value) (fun «else» => «else» ⋯) member fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 4 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) member x) t) → (fun x => (fun x x_1 => Prop) member x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) member) candidate fun h => (fun x x_1 => False) member candidate) ∧ (∀ (upper_bound : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal real_model), (∀ (member : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal real_model), subset member → LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 3 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) x upper_bound) t) → (fun x => (fun x x_1 => Prop) x upper_bound) t) (fun «else» => (fun x => True) upper_bound) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 6 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => «else» ⋯) (fun value_1 «else» => (fun value_2 => (fun first second => real_model.signature.toOrderedRingConceptSignature.2 first second) value value_2) value_1) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) upper_bound fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) upper_bound) value) (fun «else» => «else» ⋯) member fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 4 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) member x) t) → (fun x => (fun x x_1 => Prop) member x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) member) upper_bound fun h => (fun x x_1 => False) member upper_bound) → LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 3 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) x upper_bound) t) → (fun x => (fun x x_1 => Prop) x upper_bound) t) (fun «else» => (fun x => True) upper_bound) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 6 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => «else» ⋯) (fun value_1 «else» => (fun value_2 => (fun first second => real_model.signature.toOrderedRingConceptSignature.2 first second) value value_2) value_1) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) upper_bound fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) upper_bound) value) (fun «else» => «else» ⋯) candidate fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 4 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) candidate x) t) → (fun x => (fun x x_1 => Prop) candidate x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) candidate) upper_bound fun h => (fun x x_1 => False) candidate upper_bound))

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

/--
`ExtendedMultiplicationDefined` TODO

Predicate logic:

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (a a_1 : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal real_model), LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (LRA.NumberSystems.RealNumbers.Extended.ExtendedMultiplicationDefined._sparseCasesOn_1 a_1 (fun value => (fun second => Ne second real_model.signature.zero) value) fun h => (fun x x_1 => True) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity a_1) (fun value => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedAdditionDefined._sparseCasesOn_1 a_1 ((fun first => Ne first real_model.signature.zero) value) ((fun first => Ne first real_model.signature.zero) value) fun h => (fun x x_1 => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) a_1) value) (LRA.NumberSystems.RealNumbers.Extended.ExtendedMultiplicationDefined._sparseCasesOn_1 a_1 (fun value => (fun second => Ne second real_model.signature.zero) value) fun h => (fun x x_1 => True) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity a_1) a

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.bitwise Bool.and 1 (Nat.shiftRight 2 (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn t 0 (fun value => 1) 2)) = 1 → False) → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity x) t) → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity x) t) (fun «else» => «else» ⋯) (fun value «else» => (fun value => (fun second => second = real_model.signature.toZeroOneBundle.2 → False) value) value) (fun «else» => «else» ⋯) a_1 fun h => (fun x x_1 => True) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity a_1) (fun value => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.bitwise Bool.and 1 (Nat.shiftRight 5 (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn t 0 (fun value => 1) 2)) = 1 → False) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => (fun first => first = real_model.signature.toZeroOneBundle.2 → False) value) (fun value_1 «else» => «else» ⋯) (fun «else» => (fun first => first = real_model.signature.toZeroOneBundle.2 → False) value) a_1 fun h => (fun x x_1 => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) a_1) value) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.bitwise Bool.and 1 (Nat.shiftRight 2 (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.casesOn t 0 (fun value => 1) 2)) = 1 → False) → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity x) t) → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity x) t) (fun «else» => «else» ⋯) (fun value «else» => (fun value => (fun second => second = real_model.signature.toZeroOneBundle.2 → False) value) value) (fun «else» => «else» ⋯) a_1 fun h => (fun x x_1 => True) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity a_1) a

Logical form (Lean):

```lean
def ExtendedMultiplicationDefined
    (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model → Prop
  | .finite first, .positiveInfinity => first ≠ real_model.signature.zero
  | .positiveInfinity, .finite second => second ≠ real_model.signature.zero
  | .finite first, .negativeInfinity => first ≠ real_model.signature.zero
  | .negativeInfinity, .finite second => second ≠ real_model.signature.zero
  | _, _ => True
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
def ExtendedMultiplicationDefined
    (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model → Prop
  | .finite first, .positiveInfinity => first ≠ real_model.signature.zero
  | .positiveInfinity, .finite second => second ≠ real_model.signature.zero
  | .finite first, .negativeInfinity => first ≠ real_model.signature.zero
  | .negativeInfinity, .finite second => second ≠ real_model.signature.zero
  | _, _ => True

/--
`zeroTimesPositiveInfinityUndefined` TODO

Predicate logic:

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel), ¬ LRA.NumberSystems.RealNumbers.Extended.ExtendedMultiplicationDefined real_model (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.zero) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    real_model : RealModel
  Prove
    LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 2 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity x) t) → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity x) t) (fun «else» => «else» ⋯) (fun value «else» => (fun value => (fun second => ¬ second = real_model.signature.zero) value) value) (fun «else» => «else» ⋯) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity fun h => (fun x x_1 => True) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) (fun value => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 5 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => (fun first => ¬ first = real_model.signature.zero) value) (fun value_1 «else» => «else» ⋯) (fun «else» => (fun first => ¬ first = real_model.signature.zero) value) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity fun h => (fun x x_1 => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) value) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 2 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity x) t) → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity x) t) (fun «else» => «else» ⋯) (fun value «else» => (fun value => (fun second => ¬ second = real_model.signature.zero) value) value) (fun «else» => «else» ⋯) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity fun h => (fun x x_1 => True) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) → False

Logical form (Lean):

```lean
theorem zeroTimesPositiveInfinityUndefined
    (real_model : RealModel) :
    ¬ ExtendedMultiplicationDefined real_model
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
theorem zeroTimesPositiveInfinityUndefined
    (real_model : RealModel) :
    ¬ ExtendedMultiplicationDefined real_model
      (.finite real_model.signature.zero) (.positiveInfinity) := by
  sorry
/--
`positiveInfinityTimesZeroUndefined` TODO

Predicate logic:

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel), ¬ LRA.NumberSystems.RealNumbers.Extended.ExtendedMultiplicationDefined real_model LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.zero)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    real_model : RealModel
  Prove
    LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 2 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity x) t) → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity x) t) (fun «else» => «else» ⋯) (fun value «else» => (fun value => (fun second => ¬ second = real_model.signature.zero) value) value) (fun «else» => «else» ⋯) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) fun h => (fun x x_1 => True) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) (fun value => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 5 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => (fun first => ¬ first = real_model.signature.zero) value) (fun value_1 «else» => «else» ⋯) (fun «else» => (fun first => ¬ first = real_model.signature.zero) value) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) fun h => (fun x x_1 => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) value) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 2 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity x) t) → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity x) t) (fun «else» => «else» ⋯) (fun value «else» => (fun value => (fun second => ¬ second = real_model.signature.zero) value) value) (fun «else» => «else» ⋯) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) fun h => (fun x x_1 => True) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity → False

Logical form (Lean):

```lean
theorem positiveInfinityTimesZeroUndefined
    (real_model : RealModel) :
    ¬ ExtendedMultiplicationDefined real_model
      (.positiveInfinity) (.finite real_model.signature.zero)
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
theorem positiveInfinityTimesZeroUndefined
    (real_model : RealModel) :
    ¬ ExtendedMultiplicationDefined real_model
      (.positiveInfinity) (.finite real_model.signature.zero) := by
  sorry
/--
`zeroTimesNegativeInfinityUndefined` TODO

Predicate logic:

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel), ¬ LRA.NumberSystems.RealNumbers.Extended.ExtendedMultiplicationDefined real_model (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.zero) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    real_model : RealModel
  Prove
    LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 2 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity x) t) → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity x) t) (fun «else» => «else» ⋯) (fun value «else» => (fun value => (fun second => ¬ second = real_model.signature.zero) value) value) (fun «else» => «else» ⋯) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity fun h => (fun x x_1 => True) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) (fun value => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 5 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => (fun first => ¬ first = real_model.signature.zero) value) (fun value_1 «else» => «else» ⋯) (fun «else» => (fun first => ¬ first = real_model.signature.zero) value) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity fun h => (fun x x_1 => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) value) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 2 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity x) t) → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity x) t) (fun «else» => «else» ⋯) (fun value «else» => (fun value => (fun second => ¬ second = real_model.signature.zero) value) value) (fun «else» => «else» ⋯) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity fun h => (fun x x_1 => True) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) → False

Logical form (Lean):

```lean
theorem zeroTimesNegativeInfinityUndefined
    (real_model : RealModel) :
    ¬ ExtendedMultiplicationDefined real_model
      (.finite real_model.signature.zero) (.negativeInfinity)
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
theorem zeroTimesNegativeInfinityUndefined
    (real_model : RealModel) :
    ¬ ExtendedMultiplicationDefined real_model
      (.finite real_model.signature.zero) (.negativeInfinity) := by
  sorry
/--
`negativeInfinityTimesZeroUndefined` TODO

Predicate logic:

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel), ¬ LRA.NumberSystems.RealNumbers.Extended.ExtendedMultiplicationDefined real_model LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.zero)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    real_model : RealModel
  Prove
    LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 2 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity x) t) → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity x) t) (fun «else» => «else» ⋯) (fun value «else» => (fun value => (fun second => ¬ second = real_model.signature.zero) value) value) (fun «else» => «else» ⋯) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) fun h => (fun x x_1 => True) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) (fun value => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 5 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => (fun first => ¬ first = real_model.signature.zero) value) (fun value_1 «else» => «else» ⋯) (fun «else» => (fun first => ¬ first = real_model.signature.zero) value) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) fun h => (fun x x_1 => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) value) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 2 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity x) t) → (fun x => (fun x x_1 => Prop) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity x) t) (fun «else» => «else» ⋯) (fun value «else» => (fun value => (fun second => ¬ second = real_model.signature.zero) value) value) (fun «else» => «else» ⋯) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2) fun h => (fun x x_1 => True) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite real_model.signature.toZeroOneBundle.2)) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity → False

Logical form (Lean):

```lean
theorem negativeInfinityTimesZeroUndefined
    (real_model : RealModel) :
    ¬ ExtendedMultiplicationDefined real_model
      (.negativeInfinity) (.finite real_model.signature.zero)
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
theorem negativeInfinityTimesZeroUndefined
    (real_model : RealModel) :
    ¬ ExtendedMultiplicationDefined real_model
      (.negativeInfinity) (.finite real_model.signature.zero) := by
  sorry
end LRA.NumberSystems.RealNumbers.Extended
