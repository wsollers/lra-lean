-- LRA/VolumeII/Reals/Dedekind.lean
-- Proof-ready construction of the real numbers by Dedekind cuts.

import LRA.VolumeII.NumberSystems.Models

namespace LRA
namespace VolumeII
namespace Reals
namespace Dedekind

open NumberSystems

/-!
Lean module: LRA.VolumeII.Reals.Dedekind
Source: docs/number-systems/gpt-04-reals-dedekind.md
Verification status: definitions complete; theorem proofs pending

The carrier is a subtype of rational lower sets satisfying the four Dedekind-cut
conditions. Raw set operations are defined first. Closure theorems, intentionally
left with `sorry`, justify the corresponding operations on the cut carrier.
-/

variable (rational_model : RationalModel)

abbrev Rational := rational_model.signature.carrier
abbrev LowerSet := Rational rational_model → Prop

/-- The four defining conditions for a Dedekind cut. -/
structure IsCut (lower_set : LowerSet rational_model) : Prop where
  nonempty : ∃ value, lower_set value
  proper : ∃ value, ¬ lower_set value
  downward_closed :
    ∀ upper lower,
      lower_set upper →
      rational_model.signature.strict_order lower upper →
      lower_set lower
  no_greatest_element :
    ∀ value,
      lower_set value →
      ∃ greater,
        lower_set greater ∧
        rational_model.signature.strict_order value greater

/-- The carrier of Dedekind real numbers. -/
abbrev Cut := { lower_set : LowerSet rational_model // IsCut rational_model lower_set }

/-- Membership of a rational in a cut. -/
def contains (cut : Cut rational_model) (value : Rational rational_model) : Prop :=
  cut.1 value

/-- Strict order of cuts is proper inclusion. -/
def strictOrder (first second : Cut rational_model) : Prop :=
  (∀ value, contains rational_model first value → contains rational_model second value) ∧
    ∃ witness,
      contains rational_model second witness ∧
      ¬ contains rational_model first witness

/-- Non-strict order of cuts is inclusion. -/
def nonstrictOrder (first second : Cut rational_model) : Prop :=
  ∀ value, contains rational_model first value → contains rational_model second value

/-- The lower rational ray determined by a rational value. -/
def rationalLowerSet (value : Rational rational_model) : LowerSet rational_model :=
  fun rational_value =>
    rational_model.signature.strict_order rational_value value

/-- Every rational lower ray is a Dedekind cut. -/
theorem rational_lower_set_is_cut (value : Rational rational_model) :
    IsCut rational_model (rationalLowerSet rational_model value) := by
  sorry

/-- Canonical embedding of the rationals into Dedekind cuts. -/
def rationalEmbedding (value : Rational rational_model) : Cut rational_model :=
  ⟨rationalLowerSet rational_model value,
    rational_lower_set_is_cut rational_model value⟩

/-- The rational embedding is injective. -/
theorem rational_embedding_is_injective :
    ∀ first second,
      rationalEmbedding rational_model first = rationalEmbedding rational_model second →
      first = second := by
  sorry

/-- The rational embedding preserves and reflects strict order. -/
theorem rational_embedding_preserves_and_reflects_order :
    ∀ first second,
      strictOrder rational_model
          (rationalEmbedding rational_model first)
          (rationalEmbedding rational_model second) ↔
        rational_model.signature.strict_order first second := by
  sorry

/-- Raw lower set for addition of cuts. -/
def additionLowerSet (first second : Cut rational_model) : LowerSet rational_model :=
  fun value =>
    ∃ left right,
      contains rational_model first left ∧
      contains rational_model second right ∧
      rational_model.signature.addition left right = value

/-- The raw sum of two cuts is a cut. -/
theorem addition_lower_set_is_cut (first second : Cut rational_model) :
    IsCut rational_model (additionLowerSet rational_model first second) := by
  sorry

/-- Addition of Dedekind cuts. -/
def addition (first second : Cut rational_model) : Cut rational_model :=
  ⟨additionLowerSet rational_model first second,
    addition_lower_set_is_cut rational_model first second⟩

/-- The zero cut. -/
def zero : Cut rational_model :=
  rationalEmbedding rational_model rational_model.signature.zero

/-- Raw lower set for the additive inverse of a cut. -/
def negationLowerSet (cut : Cut rational_model) : LowerSet rational_model :=
  fun value =>
    ∃ outside,
      ¬ contains rational_model cut outside ∧
      rational_model.signature.strict_order
        value
        (rational_model.signature.negation outside)

/-- The raw additive inverse is a cut. -/
theorem negation_lower_set_is_cut (cut : Cut rational_model) :
    IsCut rational_model (negationLowerSet rational_model cut) := by
  sorry

/-- Additive inverse of a Dedekind cut. -/
def negation (cut : Cut rational_model) : Cut rational_model :=
  ⟨negationLowerSet rational_model cut,
    negation_lower_set_is_cut rational_model cut⟩

/-- A cut is nonnegative when the zero cut is included in it. -/
def isNonnegative (cut : Cut rational_model) : Prop :=
  nonstrictOrder rational_model (zero rational_model) cut

/-- Raw product lower set for nonnegative cuts. -/
def nonnegativeProductLowerSet
    (first second : Cut rational_model) : LowerSet rational_model :=
  fun value =>
    rational_model.signature.strict_order value rational_model.signature.zero ∨
      ∃ left right,
        contains rational_model first left ∧
        contains rational_model second right ∧
        rational_model.signature.strict_order rational_model.signature.zero left ∧
        rational_model.signature.strict_order rational_model.signature.zero right ∧
        rational_model.signature.strict_order
          value
          (rational_model.signature.multiplication left right)

/-- The raw nonnegative product is a cut. -/
theorem nonnegative_product_lower_set_is_cut
    (first second : Cut rational_model)
    (first_nonnegative : isNonnegative rational_model first)
    (second_nonnegative : isNonnegative rational_model second) :
    IsCut rational_model
      (nonnegativeProductLowerSet rational_model first second) := by
  sorry

/-- Nonnegative multiplication of cuts. -/
def nonnegativeMultiplication
    (first second : Cut rational_model)
    (first_nonnegative : isNonnegative rational_model first)
    (second_nonnegative : isNonnegative rational_model second) :
    Cut rational_model :=
  ⟨nonnegativeProductLowerSet rational_model first second,
    nonnegative_product_lower_set_is_cut rational_model first second
      first_nonnegative second_nonnegative⟩

/-- Existence and uniqueness of the sign-correct product cut. -/
theorem multiplication_exists_uniquely
    (first second : Cut rational_model) :
    ∃! product : Cut rational_model,
      (isNonnegative rational_model first ∧ isNonnegative rational_model second →
        product = nonnegativeMultiplication rational_model first second ‹_› ‹_›) ∧
      (¬ isNonnegative rational_model first ∧ isNonnegative rational_model second →
        product = negation rational_model
          (nonnegativeMultiplication rational_model
            (negation rational_model first) second ‹_› ‹_›)) ∧
      (isNonnegative rational_model first ∧ ¬ isNonnegative rational_model second →
        product = negation rational_model
          (nonnegativeMultiplication rational_model
            first (negation rational_model second) ‹_› ‹_›)) ∧
      (¬ isNonnegative rational_model first ∧ ¬ isNonnegative rational_model second →
        product = nonnegativeMultiplication rational_model
          (negation rational_model first)
          (negation rational_model second) ‹_› ‹_›) := by
  sorry

/-- Multiplication of arbitrary Dedekind cuts, obtained from the sign-case theorem. -/
noncomputable def multiplication
    (first second : Cut rational_model) : Cut rational_model :=
  Classical.choose (multiplication_exists_uniquely rational_model first second)

/-- The one cut. -/
def one : Cut rational_model :=
  rationalEmbedding rational_model rational_model.signature.one

/-- Raw reciprocal lower set for a positive cut. -/
def positiveReciprocalLowerSet (cut : Cut rational_model) : LowerSet rational_model :=
  fun value =>
    rational_model.signature.nonstrict_order value rational_model.signature.zero ∨
      ∃ outside,
        rational_model.signature.strict_order rational_model.signature.zero outside ∧
        ¬ contains rational_model cut outside ∧
        rational_model.signature.strict_order
          value
          (rational_model.signature.inverse outside)

/-- Reciprocal exists uniquely for every nonzero cut. -/
theorem reciprocal_exists_uniquely
    (cut : Cut rational_model)
    (cut_nonzero : cut ≠ zero rational_model) :
    ∃! reciprocal : Cut rational_model,
      multiplication rational_model cut reciprocal = one rational_model := by
  sorry

/-- Reciprocal of a nonzero Dedekind cut. -/
noncomputable def inverse
    (cut : Cut rational_model)
    (cut_nonzero : cut ≠ zero rational_model) : Cut rational_model :=
  Classical.choose (reciprocal_exists_uniquely rational_model cut cut_nonzero)

/-- Proper inclusion is a strict total order on cuts. -/
theorem strict_order_is_total :
    (∀ cut : Cut rational_model, ¬ strictOrder rational_model cut cut) ∧
    (∀ first second third,
      strictOrder rational_model first second →
      strictOrder rational_model second third →
      strictOrder rational_model first third) ∧
    (∀ first second,
      strictOrder rational_model first second ∨
      first = second ∨
      strictOrder rational_model second first) := by
  sorry

/-- Cut addition is an abelian-group operation. -/
theorem additive_group_laws :
    (∀ first second third,
      addition rational_model (addition rational_model first second) third =
        addition rational_model first (addition rational_model second third)) ∧
    (∀ first second,
      addition rational_model first second = addition rational_model second first) ∧
    (∀ value,
      addition rational_model (zero rational_model) value = value ∧
      addition rational_model value (zero rational_model) = value) ∧
    (∀ value,
      addition rational_model value (negation rational_model value) =
        zero rational_model) := by
  sorry

/-- Cut multiplication is commutative, associative, unital, and distributive. -/
theorem multiplicative_and_distributive_laws :
    (∀ first second third,
      multiplication rational_model
          (multiplication rational_model first second) third =
        multiplication rational_model first
          (multiplication rational_model second third)) ∧
    (∀ first second,
      multiplication rational_model first second =
        multiplication rational_model second first) ∧
    (∀ value,
      multiplication rational_model (one rational_model) value = value ∧
      multiplication rational_model value (one rational_model) = value) ∧
    (∀ first second third,
      multiplication rational_model first
          (addition rational_model second third) =
        addition rational_model
          (multiplication rational_model first second)
          (multiplication rational_model first third)) := by
  sorry

/-- The union lower set of a family of cuts. -/
def familyUnion (family : Cut rational_model → Prop) : LowerSet rational_model :=
  fun value => ∃ cut, family cut ∧ contains rational_model cut value

/-- A nonempty bounded family has a union cut. -/
theorem family_union_is_cut
    (family : Cut rational_model → Prop)
    (nonempty : ∃ cut, family cut)
    (bounded_above :
      ∃ upper,
        ∀ cut, family cut → nonstrictOrder rational_model cut upper) :
    IsCut rational_model (familyUnion rational_model family) := by
  sorry

/-- Supremum of a nonempty bounded family is its union. -/
def supremum
    (family : Cut rational_model → Prop)
    (nonempty : ∃ cut, family cut)
    (bounded_above :
      ∃ upper,
        ∀ cut, family cut → nonstrictOrder rational_model cut upper) :
    Cut rational_model :=
  ⟨familyUnion rational_model family,
    family_union_is_cut rational_model family nonempty bounded_above⟩

/-- The union cut is the least upper bound. -/
theorem supremum_is_least_upper_bound
    (family : Cut rational_model → Prop)
    (nonempty : ∃ cut, family cut)
    (bounded_above :
      ∃ upper,
        ∀ cut, family cut → nonstrictOrder rational_model cut upper) :
    (∀ cut, family cut →
      nonstrictOrder rational_model cut
        (supremum rational_model family nonempty bounded_above)) ∧
    (∀ upper,
      (∀ cut, family cut → nonstrictOrder rational_model cut upper) →
      nonstrictOrder rational_model
        (supremum rational_model family nonempty bounded_above) upper) := by
  sorry

/-- Embedded rationals are order dense in the Dedekind reals. -/
theorem embedded_rationals_are_dense :
    ∀ first second,
      strictOrder rational_model first second →
      ∃ rational_value,
        strictOrder rational_model first
          (rationalEmbedding rational_model rational_value) ∧
        strictOrder rational_model
          (rationalEmbedding rational_model rational_value) second := by
  sorry

/-- The Dedekind real construction is Archimedean. -/
theorem archimedean_property
    (natural_to_rational : Nat → Rational rational_model) :
    ∀ cut,
      ∃ natural_number,
        strictOrder rational_model cut
          (rationalEmbedding rational_model
            (natural_to_rational natural_number)) := by
  sorry

end Dedekind
end Reals
end VolumeII
end LRA
