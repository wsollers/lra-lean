-- LRA/NumberSystems/RealNumbers/Constructions/Dedekind/WellDefinedness.lean
-- Closure proofs that each raw lower set from `Operations.lean` is
-- actually a cut, together with the `Cut`-packaged operations built from
-- those proofs (rational embedding, addition, zero, negation, nonnegative
-- multiplication, the sign-case product apparatus, one, and reciprocal),
-- plus the family-supremum packaging. For this subtype carrier, packaging
-- a lower set into a `Cut` requires its `IsCut` proof at construction
-- time, so the packaged operation and its closure proof are kept together
-- here rather than split across the raw-operation/well-definedness
-- boundary used for the quotient-based constructions.

import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.Operations

namespace LRA.NumberSystems.RealNumbers.Dedekind
open LRA.NumberSystems.Models

variable (rational_model : RationalModel)

/-- Theorem 2.4: every rational lower ray is a cut.

Mathematical statement (Lean): `theorem rational_lower_ray_is_cut (value : Rational rational_model) : IsCut rational_model (rational_lower_ray rational_model value)`.

*Proof status:* proof pending


Logical form:

```lean
theorem rational_lower_ray_is_cut (value : Rational rational_model) :
    IsCut rational_model (rational_lower_ray rational_model value)
```
-/
theorem rational_lower_ray_is_cut (value : Rational rational_model) :
    IsCut rational_model (rational_lower_ray rational_model value) := by
  sorry


/-- Definition 2.3: rational embedding into Dedekind cuts.

Mathematical statement (Lean): `def rational_embedding (value : Rational rational_model) : Cut rational_model`.


Logical form:

```lean
def rational_embedding (value : Rational rational_model) : Cut rational_model :=
  ⟨rational_lower_ray rational_model value,
    rational_lower_ray_is_cut rational_model value⟩
```
-/
def rational_embedding (value : Rational rational_model) : Cut rational_model :=
  ⟨rational_lower_ray rational_model value,
    rational_lower_ray_is_cut rational_model value⟩


/-- Theorem 2.5: the rational embedding is injective and order preserving/reflection.

Mathematical statement (Lean): `theorem rational_embedding_is_order_embedding : (∀ first second, rational_embedding rational_model first = rational_embedding rational_model second → first = second) ∧ (∀ first second, rational_model.signature.StrictOrder first second ↔ strict_order ration...`.

*Proof status:* proof pending


Logical form:

```lean
theorem rational_embedding_is_order_embedding :
    (∀ first second,
      rational_embedding rational_model first =
        rational_embedding rational_model second → first = second) ∧
    (∀ first second,
      rational_model.signature.StrictOrder first second ↔
        strict_order rational_model
          (rational_embedding rational_model first)
          (rational_embedding rational_model second))
```
-/
theorem rational_embedding_is_order_embedding :
    (∀ first second,
      rational_embedding rational_model first =
        rational_embedding rational_model second → first = second) ∧
    (∀ first second,
      rational_model.signature.StrictOrder first second ↔
        strict_order rational_model
          (rational_embedding rational_model first)
          (rational_embedding rational_model second)) := by
  sorry


/-- Theorem 3.2: cut addition is closed.

Mathematical statement (Lean): `theorem addition_lower_set_is_cut (first second : Cut rational_model) : IsCut rational_model (addition_lower_set rational_model first second)`.

*Proof status:* proof pending


Logical form:

```lean
theorem addition_lower_set_is_cut (first second : Cut rational_model) :
    IsCut rational_model (addition_lower_set rational_model first second)
```
-/
theorem addition_lower_set_is_cut (first second : Cut rational_model) :
    IsCut rational_model (addition_lower_set rational_model first second) := by
  sorry


/-- Definition 3.1: addition of cuts.

Mathematical statement (Lean): `def addition (first second : Cut rational_model) : Cut rational_model`.


Logical form:

```lean
def addition (first second : Cut rational_model) : Cut rational_model :=
  ⟨addition_lower_set rational_model first second,
    addition_lower_set_is_cut rational_model first second⟩
```
-/
def addition (first second : Cut rational_model) : Cut rational_model :=
  ⟨addition_lower_set rational_model first second,
    addition_lower_set_is_cut rational_model first second⟩


/-- Definition 3.3: the zero cut.

Mathematical statement (Lean): `def zero : Cut rational_model`.


Logical form:

```lean
def zero : Cut rational_model :=
  rational_embedding rational_model rational_model.signature.zero
```
-/
def zero : Cut rational_model :=
  rational_embedding rational_model rational_model.signature.zero


/-- Theorem 3.5: additive inverse is closed.

Mathematical statement (Lean): `theorem negation_lower_set_is_cut (cut : Cut rational_model) : IsCut rational_model (negation_lower_set rational_model cut)`.

*Proof status:* proof pending


Logical form:

```lean
theorem negation_lower_set_is_cut (cut : Cut rational_model) :
    IsCut rational_model (negation_lower_set rational_model cut)
```
-/
theorem negation_lower_set_is_cut (cut : Cut rational_model) :
    IsCut rational_model (negation_lower_set rational_model cut) := by
  sorry


/-- Definition 3.4: additive inverse of a cut.

Mathematical statement (Lean): `def negation (cut : Cut rational_model) : Cut rational_model`.


Logical form:

```lean
def negation (cut : Cut rational_model) : Cut rational_model :=
  ⟨negation_lower_set rational_model cut,
    negation_lower_set_is_cut rational_model cut⟩
```
-/
def negation (cut : Cut rational_model) : Cut rational_model :=
  ⟨negation_lower_set rational_model cut,
    negation_lower_set_is_cut rational_model cut⟩


/-- Definition 4.1: positivity and nonnegativity of cuts.

Mathematical statement (Lean): `def IsPositive (cut : Cut rational_model) : Prop`.


Logical form:

```lean
def IsPositive (cut : Cut rational_model) : Prop :=
  strict_order rational_model (zero rational_model) cut
```
-/
def IsPositive (cut : Cut rational_model) : Prop :=
  strict_order rational_model (zero rational_model) cut

/--
**[Def — IsNonnegative]**

Mathematical statement (Lean): `def IsNonnegative (cut : Cut rational_model) : Prop`.


Logical form:

```lean
def IsNonnegative (cut : Cut rational_model) : Prop :=
  nonstrict_order rational_model (zero rational_model) cut
```
-/
def IsNonnegative (cut : Cut rational_model) : Prop :=
  nonstrict_order rational_model (zero rational_model) cut


/-- Theorem 4.3: nonnegative multiplication is closed.

Mathematical statement (Lean): `theorem nonnegative_product_is_cut (first second : Cut rational_model) (first_nonnegative : IsNonnegative rational_model first) (second_nonnegative : IsNonnegative rational_model second) : IsCut rational_model (nonnegative_product_lower_set rational_model f...`.

*Proof status:* proof pending


Logical form:

```lean
theorem nonnegative_product_is_cut
    (first second : Cut rational_model)
    (first_nonnegative : IsNonnegative rational_model first)
    (second_nonnegative : IsNonnegative rational_model second) :
    IsCut rational_model
      (nonnegative_product_lower_set rational_model first second)
```
-/
theorem nonnegative_product_is_cut
    (first second : Cut rational_model)
    (first_nonnegative : IsNonnegative rational_model first)
    (second_nonnegative : IsNonnegative rational_model second) :
    IsCut rational_model
      (nonnegative_product_lower_set rational_model first second) := by
  sorry


/-- The nonnegative product cut.

Mathematical statement (Lean): `def nonnegative_multiplication (first second : Cut rational_model) (first_nonnegative : IsNonnegative rational_model first) (second_nonnegative : IsNonnegative rational_model second) : Cut rational_model`.


Logical form:

```lean
def nonnegative_multiplication
    (first second : Cut rational_model)
    (first_nonnegative : IsNonnegative rational_model first)
    (second_nonnegative : IsNonnegative rational_model second) :
    Cut rational_model :=
  ⟨nonnegative_product_lower_set rational_model first second,
    nonnegative_product_is_cut rational_model first second
      first_nonnegative second_nonnegative⟩
```
-/
def nonnegative_multiplication
    (first second : Cut rational_model)
    (first_nonnegative : IsNonnegative rational_model first)
    (second_nonnegative : IsNonnegative rational_model second) :
    Cut rational_model :=
  ⟨nonnegative_product_lower_set rational_model first second,
    nonnegative_product_is_cut rational_model first second
      first_nonnegative second_nonnegative⟩


/-- Definition 4.4: sign-case specification of arbitrary multiplication.

Mathematical statement (Lean): `def IsProduct (first second product : Cut rational_model) : Prop`.


Logical form:

```lean
def IsProduct (first second product : Cut rational_model) : Prop :=
  (∃ first_nonnegative : IsNonnegative rational_model first,
    ∃ second_nonnegative : IsNonnegative rational_model second,
      product = nonnegative_multiplication rational_model first second
        first_nonnegative second_nonnegative) ∨
  (strict_order rational_model first (zero rational_model) ∧
    ∃ second_nonnegative : IsNonnegative rational_model second,
      ∃ first_neg_nonnegative : IsNonnegative rational_model
          (negation rational_model first),
        product = negation rational_model
          (nonnegative_multiplication rational_model
            (negation rational_model first) second
            first_neg_nonnegative second_nonnegative)) ∨
  (strict_order rational_model second (zero rational_model) ∧
    ∃ first_nonnegative : IsNonnegative rational_model first,
      ∃ second_neg_nonnegative : IsNonnegative rational_model
          (negation rational_model second),
        product = negation rational_model
          (nonnegative_multiplication rational_model
            first (negation rational_model second)
            first_nonnegative second_neg_nonnegative)) ∨
  (strict_order rational_model first (zero rational_model) ∧
    strict_order rational_model second (zero rational_model) ∧
    ∃ first_neg_nonnegative : IsNonnegative rational_model
        (negation rational_model first),
      ∃ second_neg_nonnegative : IsNonnegative rational_model
          (negation rational_model second),
        product = nonnegative_multiplication rational_model
          (negation rational_model first)
          (negation rational_model second)
          first_neg_nonnegative second_neg_nonnegative)
```
-/
def IsProduct (first second product : Cut rational_model) : Prop :=
  (∃ first_nonnegative : IsNonnegative rational_model first,
    ∃ second_nonnegative : IsNonnegative rational_model second,
      product = nonnegative_multiplication rational_model first second
        first_nonnegative second_nonnegative) ∨
  (strict_order rational_model first (zero rational_model) ∧
    ∃ second_nonnegative : IsNonnegative rational_model second,
      ∃ first_neg_nonnegative : IsNonnegative rational_model
          (negation rational_model first),
        product = negation rational_model
          (nonnegative_multiplication rational_model
            (negation rational_model first) second
            first_neg_nonnegative second_nonnegative)) ∨
  (strict_order rational_model second (zero rational_model) ∧
    ∃ first_nonnegative : IsNonnegative rational_model first,
      ∃ second_neg_nonnegative : IsNonnegative rational_model
          (negation rational_model second),
        product = negation rational_model
          (nonnegative_multiplication rational_model
            first (negation rational_model second)
            first_nonnegative second_neg_nonnegative)) ∨
  (strict_order rational_model first (zero rational_model) ∧
    strict_order rational_model second (zero rational_model) ∧
    ∃ first_neg_nonnegative : IsNonnegative rational_model
        (negation rational_model first),
      ∃ second_neg_nonnegative : IsNonnegative rational_model
          (negation rational_model second),
        product = nonnegative_multiplication rational_model
          (negation rational_model first)
          (negation rational_model second)
          first_neg_nonnegative second_neg_nonnegative)


/-- Definition 4.4: the sign-case product exists uniquely.

Mathematical statement (Lean): `theorem product_exists_uniquely (first second : Cut rational_model) : ∃ product : Cut rational_model, IsProduct rational_model first second product ∧ ∀ other, IsProduct rational_model first second other → other = product`.

*Proof status:* proof pending


Logical form:

```lean
theorem product_exists_uniquely (first second : Cut rational_model) :
    ∃ product : Cut rational_model,
      IsProduct rational_model first second product ∧
      ∀ other, IsProduct rational_model first second other → other = product
```
-/
theorem product_exists_uniquely (first second : Cut rational_model) :
    ∃ product : Cut rational_model,
      IsProduct rational_model first second product ∧
      ∀ other, IsProduct rational_model first second other → other = product := by
  sorry


/-- Definition 4.4: multiplication of arbitrary cuts.

Mathematical statement (Lean): `noncomputable def multiplication (first second : Cut rational_model) : Cut rational_model`.


Logical form:

```lean
noncomputable def multiplication
    (first second : Cut rational_model) : Cut rational_model :=
  Classical.choose (product_exists_uniquely rational_model first second)
```
-/
noncomputable def multiplication
    (first second : Cut rational_model) : Cut rational_model :=
  Classical.choose (product_exists_uniquely rational_model first second)


/-- Definition 4.5: the one cut.

Mathematical statement (Lean): `def one : Cut rational_model`.


Logical form:

```lean
def one : Cut rational_model :=
  rational_embedding rational_model rational_model.signature.one
```
-/
def one : Cut rational_model :=
  rational_embedding rational_model rational_model.signature.one


/-- Definition 4.7–4.8: a reciprocal is the unique multiplicative inverse.

Mathematical statement (Lean): `def IsReciprocal (cut reciprocal : Cut rational_model) : Prop`.


Logical form:

```lean
def IsReciprocal (cut reciprocal : Cut rational_model) : Prop :=
  multiplication rational_model cut reciprocal = one rational_model ∧
  multiplication rational_model reciprocal cut = one rational_model
```
-/
def IsReciprocal (cut reciprocal : Cut rational_model) : Prop :=
  multiplication rational_model cut reciprocal = one rational_model ∧
  multiplication rational_model reciprocal cut = one rational_model


/-- Theorem 4.9: every nonzero cut has a unique reciprocal.

Mathematical statement (Lean): `theorem reciprocal_exists_uniquely (cut : Cut rational_model) (cut_nonzero : cut ≠ zero rational_model) : ∃ reciprocal : Cut rational_model, IsReciprocal rational_model cut reciprocal ∧ ∀ other, IsReciprocal rational_model cut other → other = reciprocal`.

*Proof status:* proof pending


Logical form:

```lean
theorem reciprocal_exists_uniquely
    (cut : Cut rational_model)
    (cut_nonzero : cut ≠ zero rational_model) :
    ∃ reciprocal : Cut rational_model,
      IsReciprocal rational_model cut reciprocal ∧
      ∀ other, IsReciprocal rational_model cut other → other = reciprocal
```
-/
theorem reciprocal_exists_uniquely
    (cut : Cut rational_model)
    (cut_nonzero : cut ≠ zero rational_model) :
    ∃ reciprocal : Cut rational_model,
      IsReciprocal rational_model cut reciprocal ∧
      ∀ other, IsReciprocal rational_model cut other → other = reciprocal := by
  sorry


/-- Definition 4.7–4.8: reciprocal of a nonzero cut.

Mathematical statement (Lean): `noncomputable def inverse (cut : Cut rational_model) (cut_nonzero : cut ≠ zero rational_model) : Cut rational_model`.


Logical form:

```lean
noncomputable def inverse
    (cut : Cut rational_model)
    (cut_nonzero : cut ≠ zero rational_model) : Cut rational_model :=
  Classical.choose
    (reciprocal_exists_uniquely rational_model cut cut_nonzero)
```
-/
noncomputable def inverse
    (cut : Cut rational_model)
    (cut_nonzero : cut ≠ zero rational_model) : Cut rational_model :=
  Classical.choose
    (reciprocal_exists_uniquely rational_model cut cut_nonzero)


/-- Theorem 4.9: reciprocal correctness.

Mathematical statement (Lean): `theorem inverse_correct (cut : Cut rational_model) (cut_nonzero : cut ≠ zero rational_model) : IsReciprocal rational_model cut (inverse rational_model cut cut_nonzero)`.

*Proof status:* proof pending


Logical form:

```lean
theorem inverse_correct
    (cut : Cut rational_model)
    (cut_nonzero : cut ≠ zero rational_model) :
    IsReciprocal rational_model cut
      (inverse rational_model cut cut_nonzero)
```
-/
theorem inverse_correct
    (cut : Cut rational_model)
    (cut_nonzero : cut ≠ zero rational_model) :
    IsReciprocal rational_model cut
      (inverse rational_model cut cut_nonzero) := by
  sorry


/-- Theorem 6.1: a nonempty bounded family has a union cut.

Mathematical statement (Lean): `theorem family_union_is_cut (family : Cut rational_model → Prop) (family_nonempty : ∃ cut, family cut) (family_bounded : ∃ upper, ∀ cut, family cut → nonstrict_order rational_model cut upper) : IsCut rational_model (family_union rational_model family)`.

*Proof status:* proof pending


Logical form:

```lean
theorem family_union_is_cut
    (family : Cut rational_model → Prop)
    (family_nonempty : ∃ cut, family cut)
    (family_bounded :
      ∃ upper,
        ∀ cut,
          family cut → nonstrict_order rational_model cut upper) :
    IsCut rational_model (family_union rational_model family)
```
-/
theorem family_union_is_cut
    (family : Cut rational_model → Prop)
    (family_nonempty : ∃ cut, family cut)
    (family_bounded :
      ∃ upper,
        ∀ cut,
          family cut → nonstrict_order rational_model cut upper) :
    IsCut rational_model (family_union rational_model family) := by
  sorry


/-- The union cut of a nonempty bounded family.

Mathematical statement (Lean): `def family_supremum (family : Cut rational_model → Prop) (family_nonempty : ∃ cut, family cut) (family_bounded : ∃ upper, ∀ cut, family cut → nonstrict_order rational_model cut upper) : Cut rational_model`.


Logical form:

```lean
def family_supremum
    (family : Cut rational_model → Prop)
    (family_nonempty : ∃ cut, family cut)
    (family_bounded :
      ∃ upper,
        ∀ cut,
          family cut → nonstrict_order rational_model cut upper) :
    Cut rational_model :=
  ⟨family_union rational_model family,
    family_union_is_cut rational_model family
      family_nonempty family_bounded⟩
```
-/
def family_supremum
    (family : Cut rational_model → Prop)
    (family_nonempty : ∃ cut, family cut)
    (family_bounded :
      ∃ upper,
        ∀ cut,
          family cut → nonstrict_order rational_model cut upper) :
    Cut rational_model :=
  ⟨family_union rational_model family,
    family_union_is_cut rational_model family
      family_nonempty family_bounded⟩


/-- Theorem 6.2: the union cut is the supremum.

Mathematical statement (Lean): `theorem family_union_is_supremum (family : Cut rational_model → Prop) (family_nonempty : ∃ cut, family cut) (family_bounded : ∃ upper, ∀ cut, family cut → nonstrict_order rational_model cut upper) : (∀ cut, family cut → nonstrict_order rational_model cut (f...`.

*Proof status:* proof pending


Logical form:

```lean
theorem family_union_is_supremum
    (family : Cut rational_model → Prop)
    (family_nonempty : ∃ cut, family cut)
    (family_bounded :
      ∃ upper,
        ∀ cut,
          family cut → nonstrict_order rational_model cut upper) :
    (∀ cut,
      family cut →
      nonstrict_order rational_model cut
        (family_supremum rational_model family
          family_nonempty family_bounded)) ∧
    (∀ upper,
      (∀ cut,
        family cut → nonstrict_order rational_model cut upper) →
      nonstrict_order rational_model
        (family_supremum rational_model family
          family_nonempty family_bounded)
        upper)
```
-/
theorem family_union_is_supremum
    (family : Cut rational_model → Prop)
    (family_nonempty : ∃ cut, family cut)
    (family_bounded :
      ∃ upper,
        ∀ cut,
          family cut → nonstrict_order rational_model cut upper) :
    (∀ cut,
      family cut →
      nonstrict_order rational_model cut
        (family_supremum rational_model family
          family_nonempty family_bounded)) ∧
    (∀ upper,
      (∀ cut,
        family cut → nonstrict_order rational_model cut upper) →
      nonstrict_order rational_model
        (family_supremum rational_model family
          family_nonempty family_bounded)
        upper) := by
  sorry

end LRA.NumberSystems.RealNumbers.Dedekind
