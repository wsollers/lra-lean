-- LRA/NumberSystems/RealNumbers/Constructions/Dedekind/Operations.lean
-- The raw, proof-free lower-set operations: the lower set of a rational,
-- of a sum, of a negation, of a nonnegative product, and of a family
-- union. None of these definitions need a proof that the result is a cut
-- to typecheck -- that packaging happens in `WellDefinedness.lean`, since
-- for a subtype carrier the packaged (`Cut`-valued) operations require the
-- `IsCut` proof at construction time and so cannot precede it.

import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.WellFoundedness

namespace LRA.NumberSystems.RealNumbers.Dedekind
open LRA.NumberSystems.Models

variable (rational_model : DenselyOrderedFieldModel)

/-- Definition 2.3: the rational lower ray determined by q.

Mathematical statement (Lean): `def rational_lower_ray (value : Rational rational_model) : RationalSet rational_model`.


Logical form:

```lean
def rational_lower_ray (value : Rational rational_model) : RationalSet rational_model :=
  fun candidate => rational_model.signature.StrictOrder candidate value
```
-/
def rational_lower_ray (value : Rational rational_model) : RationalSet rational_model :=
  fun candidate => rational_model.signature.StrictOrder candidate value


/-- Definition 3.1: the lower set of the sum of two cuts.

Mathematical statement (Lean): `def addition_lower_set (first second : Cut rational_model) : RationalSet rational_model`.


Logical form:

```lean
def addition_lower_set (first second : Cut rational_model) : RationalSet rational_model :=
  fun value =>
    ∃ left right,
      contains rational_model first left ∧
      contains rational_model second right ∧
      value = rational_model.signature.add left right
```
-/
def addition_lower_set (first second : Cut rational_model) : RationalSet rational_model :=
  fun value =>
    ∃ left right,
      contains rational_model first left ∧
      contains rational_model second right ∧
      value = rational_model.signature.add left right


/-- Definition 3.4: lower set of the additive inverse.

Mathematical statement (Lean): `def negation_lower_set (cut : Cut rational_model) : RationalSet rational_model`.


Logical form:

```lean
def negation_lower_set (cut : Cut rational_model) : RationalSet rational_model :=
  fun value =>
    ∃ excluded,
      ¬ contains rational_model cut excluded ∧
      rational_model.signature.StrictOrder
        value (rational_model.signature.neg excluded)
```
-/
def negation_lower_set (cut : Cut rational_model) : RationalSet rational_model :=
  fun value =>
    ∃ excluded,
      ¬ contains rational_model cut excluded ∧
      rational_model.signature.StrictOrder
        value (rational_model.signature.neg excluded)


/-- Definition 4.2: positive-cone product lower set.

Mathematical statement (Lean): `def nonnegative_product_lower_set (first second : Cut rational_model) : RationalSet rational_model`.


Logical form:

```lean
def nonnegative_product_lower_set
    (first second : Cut rational_model) : RationalSet rational_model :=
  fun value =>
    rational_model.signature.StrictOrder value rational_model.signature.zero ∨
    ∃ left right,
      contains rational_model first left ∧
      contains rational_model second right ∧
      rational_model.signature.StrictOrder rational_model.signature.zero left ∧
      rational_model.signature.StrictOrder rational_model.signature.zero right ∧
      rational_model.signature.StrictOrder
        value (rational_model.signature.multiply left right)
```
-/
def nonnegative_product_lower_set
    (first second : Cut rational_model) : RationalSet rational_model :=
  fun value =>
    rational_model.signature.StrictOrder value rational_model.signature.zero ∨
    ∃ left right,
      contains rational_model first left ∧
      contains rational_model second right ∧
      rational_model.signature.StrictOrder rational_model.signature.zero left ∧
      rational_model.signature.StrictOrder rational_model.signature.zero right ∧
      rational_model.signature.StrictOrder
        value (rational_model.signature.multiply left right)


/-- Definition used in Theorem 6.1: union of a family of cuts.

Mathematical statement (Lean): `def family_union (family : Cut rational_model → Prop) : RationalSet rational_model`.


Logical form:

```lean
def family_union
    (family : Cut rational_model → Prop) : RationalSet rational_model :=
  fun value => ∃ cut, family cut ∧ contains rational_model cut value
```
-/
def family_union
    (family : Cut rational_model → Prop) : RationalSet rational_model :=
  fun value => ∃ cut, family cut ∧ contains rational_model cut value

end LRA.NumberSystems.RealNumbers.Dedekind
