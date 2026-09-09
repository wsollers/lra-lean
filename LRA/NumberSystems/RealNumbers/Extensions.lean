
import LRA.NumberSystems.RealNumbers.Interface.Definition
import LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.LStructure

namespace LRA.NumberSystems.RealNumbers.Extensions
open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers (ArchimedeanDenseOrderedFieldExtension)
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers (CofinalRealExtension)

/--
`EmbeddingPreservesOrderedField` Preservation of an ordered-field signature's structure: `map` sends `zero`/`one` to `zero`/`one`, commutes with `add`/`neg`/`multiply`, and reflects `le`.

Predicate logic:

  ∀ (signature : LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.OrderedFieldSignature) (target : LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.OrderedFieldSignature) (map : signature.carrier → target.carrier), (map signature.zero = target.zero ∧ (map signature.one = target.one ∧ ((∀ (a b : signature.carrier), map (signature.add a b) = target.add (map a) (map b)) ∧ ((∀ (a : signature.carrier), map (signature.neg a) = target.neg (map a)) ∧ ((∀ (a b : signature.carrier), map (signature.multiply a b) = target.multiply (map a) (map b)) ∧ (∀ (a b : signature.carrier), signature.le a b ↔ target.le (map a) (map b)))))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (map signature.zero = target.zero ∧ (map signature.one = target.one ∧ ((∀ (a b : signature.carrier), map (signature.add a b) = target.add (map a) (map b)) ∧ ((∀ (a : signature.carrier), map (signature.neg a) = target.neg (map a)) ∧ ((∀ (a b : signature.carrier), map (signature.multiply a b) = target.multiply (map a) (map b)) ∧ (∀ (a b : signature.carrier), signature.le a b ↔ target.le (map a) (map b)))))))

Logical form (Lean):

```lean
def EmbeddingPreservesOrderedField
    (signature target : LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.OrderedFieldSignature)
    (map : signature.carrier → target.carrier) : Prop :=
  map signature.zero = target.zero ∧
  map signature.one = target.one ∧
  (∀ a b, map (signature.add a b) = target.add (map a) (map b)) ∧
  (∀ a, map (signature.neg a) = target.neg (map a)) ∧
  (∀ a b, map (signature.multiply a b) = target.multiply (map a) (map b)) ∧
  (∀ a b, signature.le a b ↔ target.le (map a) (map b))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, unfold

-/
def EmbeddingPreservesOrderedField
    (signature target : LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.OrderedFieldSignature)
    (map : signature.carrier → target.carrier) : Prop :=
  map signature.zero = target.zero ∧
  map signature.one = target.one ∧
  (∀ a b, map (signature.add a b) = target.add (map a) (map b)) ∧
  (∀ a, map (signature.neg a) = target.neg (map a)) ∧
  (∀ a b, map (signature.multiply a b) = target.multiply (map a) (map b)) ∧
  (∀ a b, signature.le a b ↔ target.le (map a) (map b))

/--
`integer_power` TODO

Predicate logic:

  def integer_power
      (real_model : RealModel)
      (base : real_model.signature.carrier) : Nat → real_model.signature.carrier
    | 0 => real_model.signature.one
    | Nat.succ exponent =>
        real_model.signature.multiply
          (integer_power real_model base exponent) base

Predicate logic (unfolded):

  def integer_power
      (real_model : RealModel)
      (base : real_model.signature.carrier) : Nat → real_model.signature.carrier
    | 0 => real_model.signature.one
    | Nat.succ exponent =>
        real_model.signature.multiply
          (integer_power real_model base exponent) base (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def integer_power
    (real_model : RealModel)
    (base : real_model.signature.carrier) : Nat → real_model.signature.carrier
  | 0 => real_model.signature.one
  | Nat.succ exponent =>
      real_model.signature.multiply
        (integer_power real_model base exponent) base
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
def integer_power
    (real_model : RealModel)
    (base : real_model.signature.carrier) : Nat → real_model.signature.carrier
  | 0 => real_model.signature.one
  | Nat.succ exponent =>
      real_model.signature.multiply
        (integer_power real_model base exponent) base

/--
`is_nth_root` TODO

Predicate logic:

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (degree : Nat) (root radicand : real_model.signature.carrier), LRA.NumberSystems.RealNumbers.Extensions.integer_power real_model root degree = radicand

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.NumberSystems.RealNumbers.Extensions.integer_power real_model root degree = radicand

Logical form (Lean):

```lean
def is_nth_root
    (real_model : RealModel)
    (degree : Nat)
    (root radicand : real_model.signature.carrier) : Prop :=
  integer_power real_model root degree = radicand
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
def is_nth_root
    (real_model : RealModel)
    (degree : Nat)
    (root radicand : real_model.signature.carrier) : Prop :=
  integer_power real_model root degree = radicand

/--
`archimedean_integer_part` TODO

Predicate logic:

  ∀ (integer_model : LRA.NumberSystems.Integers.Interface.ModelTheory.IntegerModel) (rational_extension : LRA.NumberSystems.RationalNumbers.ArchimedeanDenseOrderedFieldExtension integer_model) (real_extension : LRA.NumberSystems.RealNumbers.CofinalRealExtension rational_extension.RationalModel) (value : real_extension.RealModel.signature.carrier), Exists fun lower => Exists fun upper => (real_extension.RealModel.signature.le (real_extension.DenseOrderedFieldEmbedding.ToReal (rational_extension.IntegerEmbedding.ToField lower)) value ∧ real_extension.RealModel.signature.StrictOrder value (real_extension.DenseOrderedFieldEmbedding.ToReal (rational_extension.IntegerEmbedding.ToField upper)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    integer_model : IntegerModel
    rational_extension : ArchimedeanDenseOrderedFieldExtension integer_model
    real_extension : CofinalRealExtension rational_extension.RationalModel
    value : real_extension.RealModel.signature.carrier
  Prove
    Exists fun lower => Exists fun upper => (real_extension.RealModel.signature.toOrderedRingConceptSignature.2 (real_extension.DenseOrderedFieldEmbedding.1 (rational_extension.IntegerEmbedding.1 lower)) value ∧ real_extension.RealModel.signature.toOrderedRingSignature.2 value (real_extension.DenseOrderedFieldEmbedding.1 (rational_extension.IntegerEmbedding.1 upper)))

Logical form (Lean):

```lean
theorem archimedean_integer_part
    (integer_model : IntegerModel)
    (rational_extension : ArchimedeanDenseOrderedFieldExtension integer_model)
    (real_extension : CofinalRealExtension rational_extension.RationalModel)
    (value : real_extension.RealModel.signature.carrier) :
    ∃ lower upper : integer_model.signature.carrier,
      real_extension.RealModel.signature.le
        (real_extension.DenseOrderedFieldEmbedding.ToReal
          (rational_extension.IntegerEmbedding.ToField lower))
        value ∧
      real_extension.RealModel.signature.StrictOrder
        value
        (real_extension.DenseOrderedFieldEmbedding.ToReal
          (rational_extension.IntegerEmbedding.ToField upper))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem archimedean_integer_part
    (integer_model : IntegerModel)
    (rational_extension : ArchimedeanDenseOrderedFieldExtension integer_model)
    (real_extension : CofinalRealExtension rational_extension.RationalModel)
    (value : real_extension.RealModel.signature.carrier) :
    ∃ lower upper : integer_model.signature.carrier,
      real_extension.RealModel.signature.le
        (real_extension.DenseOrderedFieldEmbedding.ToReal
          (rational_extension.IntegerEmbedding.ToField lower))
        value ∧
      real_extension.RealModel.signature.StrictOrder
        value
        (real_extension.DenseOrderedFieldEmbedding.ToReal
          (rational_extension.IntegerEmbedding.ToField upper)) := by
  sorry
/--
`nth_root_exists_for_nonnegative_reals` TODO

Predicate logic:

  ∀ (real_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (degree : Nat), instLTNat.lt 0 degree → ∀ (radicand : real_model.signature.carrier), real_model.signature.le real_model.signature.zero radicand → Exists fun root => (real_model.signature.le real_model.signature.zero root ∧ LRA.NumberSystems.RealNumbers.Extensions.is_nth_root real_model degree root radicand)

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    real_model : RealModel
    degree : Nat
    radicand : real_model.signature.carrier
    radicand_nonnegative : real_model.signature.le real_model.signature.zero radicand
  Prove
    instLTNat.lt 0 degree → ∀ (radicand : real_model.signature.toCarrierBundle.1), real_model.signature.toOrderedRingConceptSignature.2 real_model.signature.toZeroOneBundle.2 radicand → Exists fun root => (real_model.signature.toOrderedRingConceptSignature.2 real_model.signature.toZeroOneBundle.2 root ∧ LRA.NumberSystems.RealNumbers.Extensions.integer_power real_model root degree = radicand)

Logical form (Lean):

```lean
theorem nth_root_exists_for_nonnegative_reals
    (real_model : RealModel)
    (degree : Nat)
    (degree_positive : 0 < degree)
    (radicand : real_model.signature.carrier)
    (radicand_nonnegative :
      real_model.signature.le real_model.signature.zero radicand) :
    ∃ root : real_model.signature.carrier,
      real_model.signature.le real_model.signature.zero root ∧
        is_nth_root real_model degree root radicand
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem nth_root_exists_for_nonnegative_reals
    (real_model : RealModel)
    (degree : Nat)
    (degree_positive : 0 < degree)
    (radicand : real_model.signature.carrier)
    (radicand_nonnegative :
      real_model.signature.le real_model.signature.zero radicand) :
    ∃ root : real_model.signature.carrier,
      real_model.signature.le real_model.signature.zero root ∧
        is_nth_root real_model degree root radicand := by
  sorry
/--
`complete_archimedean_ordered_field_unique` TODO

Predicate logic:

  ∀ (first : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (second : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel), ExistsUnique fun comparison => (LRA.NumberSystems.RealNumbers.Extensions.EmbeddingPreservesOrderedField first.signature second.signature comparison ∧ LRA.Function.Surjective comparison)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    first second : RealModel
  Prove
    Exists fun x => (((fun comparison => ((comparison first.signature.toZeroOneBundle.2 = second.signature.toZeroOneBundle.2 ∧ (comparison first.signature.toZeroOneBundle.3 = second.signature.toZeroOneBundle.3 ∧ ((∀ (a b : first.signature.toCarrierBundle.1), comparison (first.signature.toBooleanRingOperationBundle.2 a b) = second.signature.toBooleanRingOperationBundle.2 (comparison a) (comparison b)) ∧ ((∀ (a : first.signature.toCarrierBundle.1), comparison (first.signature.toRingConceptSignature.2 a) = second.signature.toRingConceptSignature.2 (comparison a)) ∧ ((∀ (a b : first.signature.toCarrierBundle.1), comparison (first.signature.toBooleanRingOperationBundle.3 a b) = second.signature.toBooleanRingOperationBundle.3 (comparison a) (comparison b)) ∧ (∀ (a b : first.signature.toCarrierBundle.1), first.signature.toOrderedRingConceptSignature.2 a b ↔ second.signature.toOrderedRingConceptSignature.2 (comparison a) (comparison b))))))) ∧ (∀ (y : second.signature.toCarrierBundle.1), Exists fun x => comparison x = y))) x) ∧ (∀ (y : first.signature.toCarrierBundle.1 → second.signature.toCarrierBundle.1), ((y first.signature.toZeroOneBundle.2 = second.signature.toZeroOneBundle.2 ∧ (y first.signature.toZeroOneBundle.3 = second.signature.toZeroOneBundle.3 ∧ ((∀ (a b : first.signature.toCarrierBundle.1), y (first.signature.toBooleanRingOperationBundle.2 a b) = second.signature.toBooleanRingOperationBundle.2 (y a) (y b)) ∧ ((∀ (a : first.signature.toCarrierBundle.1), y (first.signature.toRingConceptSignature.2 a) = second.signature.toRingConceptSignature.2 (y a)) ∧ ((∀ (a b : first.signature.toCarrierBundle.1), y (first.signature.toBooleanRingOperationBundle.3 a b) = second.signature.toBooleanRingOperationBundle.3 (y a) (y b)) ∧ (∀ (a b : first.signature.toCarrierBundle.1), first.signature.toOrderedRingConceptSignature.2 a b ↔ second.signature.toOrderedRingConceptSignature.2 (y a) (y b))))))) ∧ (∀ (y_1 : second.signature.toCarrierBundle.1), Exists fun x => y x = y_1)) → y = x))

Logical form (Lean):

```lean
theorem complete_archimedean_ordered_field_unique
    (first second : RealModel) :
    ∃! comparison : first.signature.carrier → second.signature.carrier,
      EmbeddingPreservesOrderedField
        first.signature second.signature comparison ∧
      LRA.Function.Surjective comparison
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem complete_archimedean_ordered_field_unique
    (first second : RealModel) :
    ∃! comparison : first.signature.carrier → second.signature.carrier,
      EmbeddingPreservesOrderedField
        first.signature second.signature comparison ∧
      LRA.Function.Surjective comparison := by
  sorry
end LRA.NumberSystems.RealNumbers.Extensions
