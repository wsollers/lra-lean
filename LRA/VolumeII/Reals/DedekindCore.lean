-- Proof-ready Dedekind-cut core.

import LRA.VolumeII.NumberSystems.Models

namespace LRA.VolumeII.Reals.DedekindCore

open NumberSystems

abbrev RationalSet (rational_model : RationalModel) :=
  rational_model.signature.carrier → Prop

def IsCut (rational_model : RationalModel)
    (lower : RationalSet rational_model) : Prop :=
  (∃ q, lower q) ∧
  (∃ q, ¬ lower q) ∧
  (∀ x y, lower y → rational_model.signature.strict_order x y → lower x) ∧
  (∀ x, lower x → ∃ y, lower y ∧ rational_model.signature.strict_order x y)

abbrev Cut (rational_model : RationalModel) :=
  { lower : RationalSet rational_model // IsCut rational_model lower }

def contains (rational_model : RationalModel)
    (cut : Cut rational_model)
    (q : rational_model.signature.carrier) : Prop :=
  cut.1 q

def nonstrictOrder (rational_model : RationalModel)
    (first second : Cut rational_model) : Prop :=
  ∀ q, contains rational_model first q → contains rational_model second q

def strictOrder (rational_model : RationalModel)
    (first second : Cut rational_model) : Prop :=
  nonstrictOrder rational_model first second ∧ first ≠ second

def rationalLowerRay (rational_model : RationalModel)
    (q : rational_model.signature.carrier) : RationalSet rational_model :=
  fun x => rational_model.signature.strict_order x q

theorem rational_lower_ray_is_cut
    (rational_model : RationalModel)
    (q : rational_model.signature.carrier) :
    IsCut rational_model (rationalLowerRay rational_model q) := by
  sorry

def rationalEmbedding (rational_model : RationalModel)
    (q : rational_model.signature.carrier) : Cut rational_model :=
  ⟨rationalLowerRay rational_model q,
    rational_lower_ray_is_cut rational_model q⟩

def additionLowerSet (rational_model : RationalModel)
    (first second : Cut rational_model) : RationalSet rational_model :=
  fun x => ∃ a b,
    contains rational_model first a ∧
    contains rational_model second b ∧
    rational_model.signature.strict_order x
      (rational_model.signature.addition a b)

theorem addition_lower_set_is_cut
    (rational_model : RationalModel)
    (first second : Cut rational_model) :
    IsCut rational_model (additionLowerSet rational_model first second) := by
  sorry

def addition (rational_model : RationalModel)
    (first second : Cut rational_model) : Cut rational_model :=
  ⟨additionLowerSet rational_model first second,
    addition_lower_set_is_cut rational_model first second⟩

theorem zero_exists (rational_model : RationalModel) :
    ∃ zero : Cut rational_model,
      zero = rationalEmbedding rational_model rational_model.signature.zero := by
  sorry

def IsProduct (rational_model : RationalModel)
    (first second product : Cut rational_model) : Prop :=
  ∀ x,
    contains rational_model product x ↔
      ∃ a b,
        contains rational_model first a ∧
        contains rational_model second b ∧
        rational_model.signature.strict_order x
          (rational_model.signature.multiplication a b)

theorem product_exists_and_is_unique
    (rational_model : RationalModel)
    (first second : Cut rational_model) :
    ∃ product,
      IsProduct rational_model first second product ∧
      ∀ other, IsProduct rational_model first second other → other = product := by
  sorry

theorem supremum_exists
    (rational_model : RationalModel)
    (family : Cut rational_model → Prop)
    (nonempty : ∃ cut, family cut)
    (bounded : ∃ upper, ∀ cut, family cut → nonstrictOrder rational_model cut upper) :
    ∃ supremum,
      (∀ cut, family cut → nonstrictOrder rational_model cut supremum) ∧
      (∀ upper,
        (∀ cut, family cut → nonstrictOrder rational_model cut upper) →
        nonstrictOrder rational_model supremum upper) := by
  sorry

end LRA.VolumeII.Reals.DedekindCore
