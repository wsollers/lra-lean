
import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.WellFoundedness

namespace LRA.NumberSystems.RealNumbers.Dedekind
open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

variable (rational_model : RationalModel)

/--
`rational_lower_ray` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (value a : LRA.NumberSystems.RealNumbers.Dedekind.Rational rational_model), rational_model.ltInst.1 a value

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (value a : rational_model.signature.toCarrierBundle.1), rational_model.ltInst.1 a value

Logical form (Lean):

```lean
def rational_lower_ray (value : Rational rational_model) : RationalSet rational_model :=
  fun candidate => rational_model.signature.StrictOrder candidate value
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
def rational_lower_ray (value : Rational rational_model) : RationalSet rational_model :=
  fun candidate => rational_model.signature.StrictOrder candidate value

/--
`addition_lower_set` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (first second : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model) (a : LRA.NumberSystems.RealNumbers.Dedekind.Rational rational_model), Exists fun left => Exists fun right => (LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model first left ∧ (LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model second right ∧ a = rational_model.signature.add left right))

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))) (a : rational_model.signature.toCarrierBundle.1), Exists fun left => Exists fun right => (first.1 left ∧ (second.1 right ∧ a = rational_model.signature.toBooleanRingOperationBundle.2 left right))

Logical form (Lean):

```lean
def addition_lower_set (first second : Cut rational_model) : RationalSet rational_model :=
  fun value =>
    ∃ left right,
      contains rational_model first left ∧
      contains rational_model second right ∧
      value = rational_model.signature.add left right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use, unfold

-/
def addition_lower_set (first second : Cut rational_model) : RationalSet rational_model :=
  fun value =>
    ∃ left right,
      contains rational_model first left ∧
      contains rational_model second right ∧
      value = rational_model.signature.add left right

/--
`negation_lower_set` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (cut : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model) (a : LRA.NumberSystems.RealNumbers.Dedekind.Rational rational_model), Exists fun excluded => (¬ LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model cut excluded ∧ rational_model.signature.StrictOrder a (rational_model.signature.neg excluded))

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))) (a : rational_model.signature.toCarrierBundle.1), Exists fun excluded => (cut.1 excluded → False ∧ rational_model.signature.toOrderedRingSignature.2 a (rational_model.signature.toRingConceptSignature.2 excluded))

Logical form (Lean):

```lean
def negation_lower_set (cut : Cut rational_model) : RationalSet rational_model :=
  fun value =>
    ∃ excluded,
      ¬ contains rational_model cut excluded ∧
      rational_model.signature.StrictOrder
        value (rational_model.signature.neg excluded)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use, unfold

-/
def negation_lower_set (cut : Cut rational_model) : RationalSet rational_model :=
  fun value =>
    ∃ excluded,
      ¬ contains rational_model cut excluded ∧
      rational_model.signature.StrictOrder
        value (rational_model.signature.neg excluded)

/--
`nonnegative_product_lower_set` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (first second : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model) (a : LRA.NumberSystems.RealNumbers.Dedekind.Rational rational_model), Or (rational_model.signature.StrictOrder a rational_model.signature.zero) (Exists fun left => Exists fun right => (LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model first left ∧ (LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model second right ∧ (rational_model.signature.StrictOrder rational_model.signature.zero left ∧ (rational_model.signature.StrictOrder rational_model.signature.zero right ∧ rational_model.signature.StrictOrder a (rational_model.signature.multiply left right))))))

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))) (a : rational_model.signature.toCarrierBundle.1), Or (rational_model.signature.toOrderedRingSignature.2 a rational_model.signature.toZeroOneBundle.2) (Exists fun left => Exists fun right => (first.1 left ∧ (second.1 right ∧ (rational_model.signature.toOrderedRingSignature.2 rational_model.signature.toZeroOneBundle.2 left ∧ (rational_model.signature.toOrderedRingSignature.2 rational_model.signature.toZeroOneBundle.2 right ∧ rational_model.signature.toOrderedRingSignature.2 a (rational_model.signature.toBooleanRingOperationBundle.3 left right))))))

Logical form (Lean):

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

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, Or.inl, Or.inr, use, unfold

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

/--
`family_union` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (family : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model → Prop) (a : LRA.NumberSystems.RealNumbers.Dedekind.Rational rational_model), Exists fun cut => (family cut ∧ LRA.NumberSystems.RealNumbers.Dedekind.contains rational_model cut a)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (family : (Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))) → Prop) (a : rational_model.signature.toCarrierBundle.1), Exists fun cut => (family cut ∧ cut.1 a)

Logical form (Lean):

```lean
def family_union
    (family : Cut rational_model → Prop) : RationalSet rational_model :=
  fun value => ∃ cut, family cut ∧ contains rational_model cut value
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def family_union
    (family : Cut rational_model → Prop) : RationalSet rational_model :=
  fun value => ∃ cut, family cut ∧ contains rational_model cut value

end LRA.NumberSystems.RealNumbers.Dedekind
