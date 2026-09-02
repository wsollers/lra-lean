import LRA.NumberSystems.RealNumbers.Interface.ModelTheory.Model

namespace LRA.NumberSystems.RealNumbers.Extended

open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

/-- Canonical owner for the generic extended-real carrier and its order-first
refinements. Arithmetic is layered through explicit definedness predicates
rather than by silently treating every exceptional case as total. -/
inductive ExtendedReal (real_model : RealModel) where
  | negativeInfinity
  | finite (value : real_model.signature.carrier)
  | positiveInfinity

def nonstrict_order
    (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model → Prop
  | .negativeInfinity, _ => True
  | _, .positiveInfinity => True
  | .finite first, .finite second => real_model.signature.le first second
  | _, _ => False

def negation
    (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model
  | .negativeInfinity => .positiveInfinity
  | .positiveInfinity => .negativeInfinity
  | .finite value => .finite (real_model.signature.neg value)

def NonNegativeReal (real_model : RealModel) : Type _ :=
  { value : real_model.signature.carrier //
      real_model.signature.le real_model.signature.zero value }

def NonNegativeExtendedReal (real_model : RealModel) : Type _ :=
  { value : ExtendedReal real_model //
      nonstrict_order real_model (.finite real_model.signature.zero) value }

def NonPositiveExtendedReal (real_model : RealModel) : Type _ :=
  { value : ExtendedReal real_model //
      nonstrict_order real_model value (.finite real_model.signature.zero) }

theorem ZeroIsNonNegative (real_model : RealModel) :
    real_model.signature.le real_model.signature.zero real_model.signature.zero := by
  sorry
def zero (real_model : RealModel) : NonNegativeReal real_model :=
  ⟨real_model.signature.zero, ZeroIsNonNegative real_model⟩

theorem PositiveInfinityIsNonNegative (real_model : RealModel) :
    nonstrict_order real_model
      (.finite real_model.signature.zero) (.positiveInfinity) := by
  sorry
def infinity (real_model : RealModel) : NonNegativeExtendedReal real_model :=
  ⟨.positiveInfinity, PositiveInfinityIsNonNegative real_model⟩

theorem NegativeInfinityIsNonPositive (real_model : RealModel) :
    nonstrict_order real_model
      (.negativeInfinity) (.finite real_model.signature.zero) := by
  sorry
def negativeInfinityElement
    (real_model : RealModel) : NonPositiveExtendedReal real_model :=
  ⟨.negativeInfinity, NegativeInfinityIsNonPositive real_model⟩

theorem FiniteIsNonNegativeExtended (real_model : RealModel)
    (value : real_model.signature.carrier)
    (value_nonneg : real_model.signature.le real_model.signature.zero value) :
    nonstrict_order real_model
      (.finite real_model.signature.zero) (.finite value) := by
  sorry
def toExtended (real_model : RealModel)
    (value : NonNegativeReal real_model) : NonNegativeExtendedReal real_model :=
  ⟨.finite value.val, FiniteIsNonNegativeExtended real_model value.val value.property⟩

theorem FiniteIsNonPositiveExtended (real_model : RealModel)
    (value : real_model.signature.carrier)
    (value_nonpos : real_model.signature.le value real_model.signature.zero) :
    nonstrict_order real_model
      (.finite value) (.finite real_model.signature.zero) := by
  sorry
def toExtendedNonPositive (real_model : RealModel)
    (value : { x : real_model.signature.carrier //
      real_model.signature.le x real_model.signature.zero }) :
    NonPositiveExtendedReal real_model :=
  ⟨.finite value.val,
    FiniteIsNonPositiveExtended real_model value.val value.property⟩

theorem AdditionIsNonNegative (real_model : RealModel)
    (first second : real_model.signature.carrier)
    (first_nonneg : real_model.signature.le real_model.signature.zero first)
    (second_nonneg : real_model.signature.le real_model.signature.zero second) :
    real_model.signature.le real_model.signature.zero
      (real_model.signature.add first second) := by
  sorry
def add (real_model : RealModel)
    (first second : NonNegativeReal real_model) : NonNegativeReal real_model :=
  ⟨real_model.signature.add first.val second.val,
    AdditionIsNonNegative real_model first.val second.val
      first.property second.property⟩

theorem AdditionIsNonPositive (real_model : RealModel)
    (first second : real_model.signature.carrier)
    (first_nonpos : real_model.signature.le first real_model.signature.zero)
    (second_nonpos : real_model.signature.le second real_model.signature.zero) :
    real_model.signature.le
      (real_model.signature.add first second) real_model.signature.zero := by
  sorry
def addNonPositive (real_model : RealModel)
    (first second : { x : real_model.signature.carrier //
      real_model.signature.le x real_model.signature.zero }) :
    { x : real_model.signature.carrier //
      real_model.signature.le x real_model.signature.zero } :=
  ⟨real_model.signature.add first.val second.val,
    AdditionIsNonPositive real_model first.val second.val
      first.property second.property⟩

def ExtendedAdditionDefined
    (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model → Prop
  | .positiveInfinity, .negativeInfinity => False
  | .negativeInfinity, .positiveInfinity => False
  | _, _ => True

theorem positiveInfinityPlusNegativeInfinityUndefined
    (real_model : RealModel) :
    ¬ ExtendedAdditionDefined real_model
      (.positiveInfinity) (.negativeInfinity) := by
  sorry
theorem negativeInfinityPlusPositiveInfinityUndefined
    (real_model : RealModel) :
    ¬ ExtendedAdditionDefined real_model
      (.negativeInfinity) (.positiveInfinity) := by
  sorry
def addExtendedRaw (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model → ExtendedReal real_model
  | .positiveInfinity, _ => .positiveInfinity
  | _, .positiveInfinity => .positiveInfinity
  | .negativeInfinity, _ => .negativeInfinity
  | _, .negativeInfinity => .negativeInfinity
  | .finite first, .finite second => .finite (real_model.signature.add first second)

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
def addExtended (real_model : RealModel)
    (first second : NonNegativeExtendedReal real_model) :
    NonNegativeExtendedReal real_model :=
  ⟨addExtendedRaw real_model first.val second.val,
    AddExtendedRawIsNonNegative real_model first.val second.val
      first.property second.property⟩

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
def addExtendedNonPositive (real_model : RealModel)
    (first second : NonPositiveExtendedReal real_model) :
    NonPositiveExtendedReal real_model :=
  ⟨addExtendedRaw real_model first.val second.val,
    AddExtendedRawIsNonPositive real_model first.val second.val
      first.property second.property⟩

def le (real_model : RealModel)
    (first second : NonNegativeReal real_model) : Prop :=
  real_model.signature.le first.val second.val

def leExtended (real_model : RealModel)
    (first second : NonNegativeExtendedReal real_model) : Prop :=
  nonstrict_order real_model first.val second.val

def leExtendedNonPositive (real_model : RealModel)
    (first second : NonPositiveExtendedReal real_model) : Prop :=
  nonstrict_order real_model first.val second.val

def toReal (real_model : RealModel)
    (value : NonNegativeReal real_model) : real_model.signature.carrier :=
  value.val

def toExtendedReal (real_model : RealModel)
    (value : NonNegativeExtendedReal real_model) : ExtendedReal real_model :=
  value.val

def toExtendedNonPositiveReal (real_model : RealModel)
    (value : NonPositiveExtendedReal real_model) : ExtendedReal real_model :=
  value.val

def supremum
    (real_model : RealModel)
    (subset : ExtendedReal real_model → Prop)
    (candidate : ExtendedReal real_model) : Prop :=
  (∀ member, subset member → nonstrict_order real_model member candidate) ∧
    ∀ upper_bound,
      (∀ member, subset member → nonstrict_order real_model member upper_bound) →
        nonstrict_order real_model candidate upper_bound

theorem every_subset_has_supremum
    (real_model : RealModel)
    (subset : ExtendedReal real_model → Prop) :
    ∃ candidate : ExtendedReal real_model,
      supremum real_model subset candidate := by
  sorry
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

def ExtendedMultiplicationDefined
    (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model → Prop
  | .finite first, .positiveInfinity => first ≠ real_model.signature.zero
  | .positiveInfinity, .finite second => second ≠ real_model.signature.zero
  | .finite first, .negativeInfinity => first ≠ real_model.signature.zero
  | .negativeInfinity, .finite second => second ≠ real_model.signature.zero
  | _, _ => True

theorem zeroTimesPositiveInfinityUndefined
    (real_model : RealModel) :
    ¬ ExtendedMultiplicationDefined real_model
      (.finite real_model.signature.zero) (.positiveInfinity) := by
  sorry
theorem positiveInfinityTimesZeroUndefined
    (real_model : RealModel) :
    ¬ ExtendedMultiplicationDefined real_model
      (.positiveInfinity) (.finite real_model.signature.zero) := by
  sorry
theorem zeroTimesNegativeInfinityUndefined
    (real_model : RealModel) :
    ¬ ExtendedMultiplicationDefined real_model
      (.finite real_model.signature.zero) (.negativeInfinity) := by
  sorry
theorem negativeInfinityTimesZeroUndefined
    (real_model : RealModel) :
    ¬ ExtendedMultiplicationDefined real_model
      (.negativeInfinity) (.finite real_model.signature.zero) := by
  sorry
end LRA.NumberSystems.RealNumbers.Extended
