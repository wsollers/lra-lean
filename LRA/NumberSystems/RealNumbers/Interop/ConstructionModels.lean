
import LRA.UniversalAlgebra.Quotient.RepresentativeCompatibility
import LRA.NumberSystems.Integers.Interface.ModelTheory.Model
import LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.Model
import LRA.NumberSystems.RealNumbers.Interface.ModelTheory.Model
import LRA.NumberSystems.RealNumbers.Interface.Definition
import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions

namespace LRA.NumberSystems.RealNumbers

open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

end LRA.NumberSystems.RealNumbers
namespace LRA.NumberSystems.RealNumbers.DedekindCuts
open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

/--
`Cut` TODO

Predicate logic:

  structure Cut (RationalCarrier : Type)
    (strict_order : RationalCarrier → RationalCarrier → Prop) where
  lower_set : RationalCarrier → Prop
  nonempty : ∃ rational_value, lower_set rational_value
  proper : ∃ rational_value, ¬ lower_set rational_value
  downward_closed :
    ∀ upper_value lower_value,
      lower_set upper_value →
      strict_order lower_value upper_value →
      lower_set lower_value
  has_no_greatest_element :
    ∀ rational_value,
      lower_set rational_value →
      ∃ greater_value,
        lower_set greater_value ∧
        strict_order rational_value greater_value

Predicate logic (unfolded):

  structure Cut (RationalCarrier : Type)
    (strict_order : RationalCarrier → RationalCarrier → Prop) where
  lower_set : RationalCarrier → Prop
  nonempty : ∃ rational_value, lower_set rational_value
  proper : ∃ rational_value, ¬ lower_set rational_value
  downward_closed :
    ∀ upper_value lower_value,
      lower_set upper_value →
      strict_order lower_value upper_value →
      lower_set lower_value
  has_no_greatest_element :
    ∀ rational_value,
      lower_set rational_value →
      ∃ greater_value,
        lower_set greater_value ∧
        strict_order rational_value greater_value (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure Cut (RationalCarrier : Type)
    (strict_order : RationalCarrier → RationalCarrier → Prop) where
  lower_set : RationalCarrier → Prop
  nonempty : ∃ rational_value, lower_set rational_value
  proper : ∃ rational_value, ¬ lower_set rational_value
  downward_closed :
    ∀ upper_value lower_value,
      lower_set upper_value →
      strict_order lower_value upper_value →
      lower_set lower_value
  has_no_greatest_element :
    ∀ rational_value,
      lower_set rational_value →
      ∃ greater_value,
        lower_set greater_value ∧
        strict_order rational_value greater_value
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
structure Cut (RationalCarrier : Type)
    (strict_order : RationalCarrier → RationalCarrier → Prop) where
  lower_set : RationalCarrier → Prop
  nonempty : ∃ rational_value, lower_set rational_value
  proper : ∃ rational_value, ¬ lower_set rational_value
  downward_closed :
    ∀ upper_value lower_value,
      lower_set upper_value →
      strict_order lower_value upper_value →
      lower_set lower_value
  has_no_greatest_element :
    ∀ rational_value,
      lower_set rational_value →
      ∃ greater_value,
        lower_set greater_value ∧
        strict_order rational_value greater_value

/--
`real_model_exists` TODO

Predicate logic:

  (∀ rational_model ∈ RationalModel), Nonempty RealModel

Predicate logic (unfolded):

  ∀ (a : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), Nonempty LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel

Logical form (Lean):

```lean
theorem real_model_exists
    (rational_model : RationalModel) : Nonempty RealModel
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
theorem real_model_exists
    (rational_model : RationalModel) : Nonempty RealModel := by
  sorry

/--
`real_model` TODO

Predicate logic:

  noncomputable def real_model
    (rational_model : RationalModel) : RealModel :=
  Classical.choice (real_model_exists rational_model)

Predicate logic (unfolded):

  noncomputable def real_model
    (rational_model : RationalModel) : RealModel :=
  Classical.choice (real_model_exists rational_model) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def real_model
    (rational_model : RationalModel) : RealModel :=
  Classical.choice (real_model_exists rational_model)
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
noncomputable def real_model
    (rational_model : RationalModel) : RealModel :=
  Classical.choice (real_model_exists rational_model)

/--
`real_extension_exists` TODO

Predicate logic:

  (∀ rational_model ∈ RationalModel), Nonempty (CofinalRealExtension rational_model)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), Nonempty (LRA.NumberSystems.Interface.ModelTheory.CofinalRealExtension rational_model)

Logical form (Lean):

```lean
theorem real_extension_exists
    (rational_model : RationalModel) :
    Nonempty (CofinalRealExtension rational_model)
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
theorem real_extension_exists
    (rational_model : RationalModel) :
    Nonempty (CofinalRealExtension rational_model) := by
  sorry

/--
`real_extension` TODO

Predicate logic:

  noncomputable def real_extension
    (rational_model : RationalModel) :
    CofinalRealExtension rational_model :=
  Classical.choice (real_extension_exists rational_model)

Predicate logic (unfolded):

  noncomputable def real_extension
    (rational_model : RationalModel) :
    CofinalRealExtension rational_model :=
  Classical.choice (real_extension_exists rational_model) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def real_extension
    (rational_model : RationalModel) :
    CofinalRealExtension rational_model :=
  Classical.choice (real_extension_exists rational_model)
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
noncomputable def real_extension
    (rational_model : RationalModel) :
    CofinalRealExtension rational_model :=
  Classical.choice (real_extension_exists rational_model)

/--
`reals_are_complete` TODO

Predicate logic:

  (∀ rational_model ∈ RationalModel), ∀ subset : (real_model rational_model).signature.carrier → Prop, (∃ member, subset member) → (∃ upper_bound, ∀ member, subset member → (real_model rational_model).signature.le member upper_bound) → ∃ supremum, (∀ member, subset member → (real_model rational_model).signature.le member supremum) ∧ (∀ upper_bound, (∀ member, subset member → (real_model rational_model).signature.le member upper_bound) → (real_model rational_model).signature.le supremum upper_bound)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (subset : (LRA.NumberSystems.RealNumbers.DedekindCuts.real_model rational_model).signature.toCarrierBundle.1 → Prop), (Exists fun member => subset member ∧ Exists fun upper_bound => ∀ (member : (LRA.NumberSystems.RealNumbers.DedekindCuts.real_model rational_model).signature.toCarrierBundle.1), subset member → (LRA.NumberSystems.RealNumbers.DedekindCuts.real_model rational_model).signature.toOrderedRingConceptSignature.2 member upper_bound) → Exists fun supremum => (∀ (member : (LRA.NumberSystems.RealNumbers.DedekindCuts.real_model rational_model).signature.toCarrierBundle.1), subset member → (LRA.NumberSystems.RealNumbers.DedekindCuts.real_model rational_model).signature.toOrderedRingConceptSignature.2 member supremum ∧ ∀ (upper_bound : (LRA.NumberSystems.RealNumbers.DedekindCuts.real_model rational_model).signature.toCarrierBundle.1), (∀ (member : (LRA.NumberSystems.RealNumbers.DedekindCuts.real_model rational_model).signature.toCarrierBundle.1), subset member → (LRA.NumberSystems.RealNumbers.DedekindCuts.real_model rational_model).signature.toOrderedRingConceptSignature.2 member upper_bound) → (LRA.NumberSystems.RealNumbers.DedekindCuts.real_model rational_model).signature.toOrderedRingConceptSignature.2 supremum upper_bound)

Logical form (Lean):

```lean
theorem reals_are_complete
    (rational_model : RationalModel) :
    ∀ subset : (real_model rational_model).signature.carrier → Prop,
      (∃ member, subset member) →
      (∃ upper_bound,
        ∀ member,
          subset member →
          (real_model rational_model).signature.le
            member upper_bound) →
      ∃ supremum,
        (∀ member,
          subset member →
          (real_model rational_model).signature.le
            member supremum) ∧
        (∀ upper_bound,
          (∀ member,
            subset member →
            (real_model rational_model).signature.le
              member upper_bound) →
          (real_model rational_model).signature.le
            supremum upper_bound)
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
theorem reals_are_complete
    (rational_model : RationalModel) :
    ∀ subset : (real_model rational_model).signature.carrier → Prop,
      (∃ member, subset member) →
      (∃ upper_bound,
        ∀ member,
          subset member →
          (real_model rational_model).signature.le
            member upper_bound) →
      ∃ supremum,
        (∀ member,
          subset member →
          (real_model rational_model).signature.le
            member supremum) ∧
        (∀ upper_bound,
          (∀ member,
            subset member →
            (real_model rational_model).signature.le
              member upper_bound) →
          (real_model rational_model).signature.le
            supremum upper_bound) := by
  sorry

end LRA.NumberSystems.RealNumbers.DedekindCuts
namespace LRA.NumberSystems.RealNumbers
open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

end LRA.NumberSystems.RealNumbers
namespace LRA.NumberSystems.RealNumbers.CauchySequences
open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

/--
`Sequence` TODO

Predicate logic:

  def Sequence (Index RationalCarrier : Type) := Index → RationalCarrier

Predicate logic (unfolded):

  def Sequence (Index RationalCarrier : Type) := Index → RationalCarrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Sequence (Index RationalCarrier : Type) := Index → RationalCarrier
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
def Sequence (Index RationalCarrier : Type) := Index → RationalCarrier

/--
`is_cauchy` TODO

Predicate logic:

  ∀ {Index RationalCarrier : Type} (sequence : LRA.NumberSystems.RealNumbers.CauchySequences.Sequence Index RationalCarrier) (first_index second_index : Index), sequence first_index = sequence second_index

Predicate logic (unfolded):

  ∀ {Index RationalCarrier : Type} (sequence : Index → RationalCarrier) (first_index second_index : Index), sequence first_index = sequence second_index

Logical form (Lean):

```lean
def is_cauchy
    {Index RationalCarrier : Type}
    (sequence : Sequence Index RationalCarrier) : Prop :=
  ∀ first_index second_index : Index,
    sequence first_index = sequence second_index
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
def is_cauchy
    {Index RationalCarrier : Type}
    (sequence : Sequence Index RationalCarrier) : Prop :=
  ∀ first_index second_index : Index,
    sequence first_index = sequence second_index

/--
`equivalent` TODO

Predicate logic:

  ∀ {Index RationalCarrier : Type} (first second : LRA.NumberSystems.RealNumbers.CauchySequences.Sequence Index RationalCarrier) (index : Index), first index = second index

Predicate logic (unfolded):

  ∀ {Index RationalCarrier : Type} (first second : Index → RationalCarrier) (index : Index), first index = second index

Logical form (Lean):

```lean
def equivalent
    {Index RationalCarrier : Type}
    (first second : Sequence Index RationalCarrier) : Prop :=
  ∀ index : Index, first index = second index
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
def equivalent
    {Index RationalCarrier : Type}
    (first second : Sequence Index RationalCarrier) : Prop :=
  ∀ index : Index, first index = second index

/--
`equivalent_is_equivalence_relation` TODO

Predicate logic:

  Equivalence (@equivalent Index RationalCarrier)

Predicate logic (unfolded):

  ∀ {Digit : Type}, Equivalence fun first second => (first.1 = second.1 ∧ first.2 = second.2)

Logical form (Lean):

```lean
theorem equivalent_is_equivalence_relation
    {Index RationalCarrier : Type} :
    Equivalence (@equivalent Index RationalCarrier)
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
theorem equivalent_is_equivalence_relation
    {Index RationalCarrier : Type} :
    Equivalence (@equivalent Index RationalCarrier) := by
  sorry

/--
`real_model_exists` TODO

Predicate logic:

  (∀ rational_model ∈ RationalModel), Nonempty RealModel

Predicate logic (unfolded):

  ∀ (a : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), Nonempty LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel

Logical form (Lean):

```lean
theorem real_model_exists
    (rational_model : RationalModel) : Nonempty RealModel
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
theorem real_model_exists
    (rational_model : RationalModel) : Nonempty RealModel := by
  sorry

/--
`real_model` TODO

Predicate logic:

  noncomputable def real_model
    (rational_model : RationalModel) : RealModel :=
  Classical.choice (real_model_exists rational_model)

Predicate logic (unfolded):

  noncomputable def real_model
    (rational_model : RationalModel) : RealModel :=
  Classical.choice (real_model_exists rational_model) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def real_model
    (rational_model : RationalModel) : RealModel :=
  Classical.choice (real_model_exists rational_model)
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
noncomputable def real_model
    (rational_model : RationalModel) : RealModel :=
  Classical.choice (real_model_exists rational_model)

/--
`real_extension_exists` TODO

Predicate logic:

  (∀ rational_model ∈ RationalModel), Nonempty (CofinalRealExtension rational_model)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), Nonempty (LRA.NumberSystems.Interface.ModelTheory.CofinalRealExtension rational_model)

Logical form (Lean):

```lean
theorem real_extension_exists
    (rational_model : RationalModel) :
    Nonempty (CofinalRealExtension rational_model)
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
theorem real_extension_exists
    (rational_model : RationalModel) :
    Nonempty (CofinalRealExtension rational_model) := by
  sorry

/--
`real_extension` TODO

Predicate logic:

  noncomputable def real_extension
    (rational_model : RationalModel) :
    CofinalRealExtension rational_model :=
  Classical.choice (real_extension_exists rational_model)

Predicate logic (unfolded):

  noncomputable def real_extension
    (rational_model : RationalModel) :
    CofinalRealExtension rational_model :=
  Classical.choice (real_extension_exists rational_model) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def real_extension
    (rational_model : RationalModel) :
    CofinalRealExtension rational_model :=
  Classical.choice (real_extension_exists rational_model)
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
noncomputable def real_extension
    (rational_model : RationalModel) :
    CofinalRealExtension rational_model :=
  Classical.choice (real_extension_exists rational_model)

end LRA.NumberSystems.RealNumbers.CauchySequences
namespace LRA.NumberSystems.RealNumbers
open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

end LRA.NumberSystems.RealNumbers
namespace LRA.NumberSystems.RealNumbers.CantorNestedIntervals
open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

/--
`IntervalSequence` TODO

Predicate logic:

  structure IntervalSequence (Index RationalCarrier : Type) where
  left_endpoint : Index → RationalCarrier
  right_endpoint : Index → RationalCarrier
  is_nested : Prop
  widths_converge_to_zero : Prop

Predicate logic (unfolded):

  structure IntervalSequence (Index RationalCarrier : Type) where
  left_endpoint : Index → RationalCarrier
  right_endpoint : Index → RationalCarrier
  is_nested : Prop
  widths_converge_to_zero : Prop (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure IntervalSequence (Index RationalCarrier : Type) where
  left_endpoint : Index → RationalCarrier
  right_endpoint : Index → RationalCarrier
  is_nested : Prop
  widths_converge_to_zero : Prop
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
structure IntervalSequence (Index RationalCarrier : Type) where
  left_endpoint : Index → RationalCarrier
  right_endpoint : Index → RationalCarrier
  is_nested : Prop
  widths_converge_to_zero : Prop

/--
`real_model_exists` TODO

Predicate logic:

  (∀ rational_model ∈ RationalModel), Nonempty RealModel

Predicate logic (unfolded):

  ∀ (a : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), Nonempty LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel

Logical form (Lean):

```lean
theorem real_model_exists
    (rational_model : RationalModel) : Nonempty RealModel
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
theorem real_model_exists
    (rational_model : RationalModel) : Nonempty RealModel := by
  sorry

/--
`real_model` TODO

Predicate logic:

  noncomputable def real_model
    (rational_model : RationalModel) : RealModel :=
  Classical.choice (real_model_exists rational_model)

Predicate logic (unfolded):

  noncomputable def real_model
    (rational_model : RationalModel) : RealModel :=
  Classical.choice (real_model_exists rational_model) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def real_model
    (rational_model : RationalModel) : RealModel :=
  Classical.choice (real_model_exists rational_model)
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
noncomputable def real_model
    (rational_model : RationalModel) : RealModel :=
  Classical.choice (real_model_exists rational_model)

/--
`endpoint_sequences_determine_cauchy_class` TODO

Predicate logic:

  (∀ rational_model ∈ RationalModel), CauchySequences.equivalent interval_sequence.left_endpoint interval_sequence.left_endpoint

Predicate logic (unfolded):

  ∀ (a : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) {Index RationalCarrier : Type} (interval_sequence : LRA.NumberSystems.RealNumbers.CantorNestedIntervals.IntervalSequence Index RationalCarrier) (index : Index), interval_sequence.1 index = interval_sequence.1 index

Logical form (Lean):

```lean
theorem endpoint_sequences_determine_cauchy_class
    (rational_model : RationalModel)
    {Index RationalCarrier : Type}
    (interval_sequence : IntervalSequence Index RationalCarrier) :
    CauchySequences.equivalent
      interval_sequence.left_endpoint
      interval_sequence.left_endpoint
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
theorem endpoint_sequences_determine_cauchy_class
    (rational_model : RationalModel)
    {Index RationalCarrier : Type}
    (interval_sequence : IntervalSequence Index RationalCarrier) :
    CauchySequences.equivalent
      interval_sequence.left_endpoint
      interval_sequence.left_endpoint := by
  sorry

end LRA.NumberSystems.RealNumbers.CantorNestedIntervals
namespace LRA.NumberSystems.RealNumbers
open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

end LRA.NumberSystems.RealNumbers
namespace LRA.NumberSystems.RealNumbers.PrimitiveIntervalQuotient
open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

/--
`RationalInterval` TODO

Predicate logic:

  structure RationalInterval (RationalCarrier : Type)
    (nonstrict_order : RationalCarrier → RationalCarrier → Prop) where
  left_endpoint : RationalCarrier
  right_endpoint : RationalCarrier
  endpoints_are_ordered :
    nonstrict_order left_endpoint right_endpoint

Predicate logic (unfolded):

  structure RationalInterval (RationalCarrier : Type)
    (nonstrict_order : RationalCarrier → RationalCarrier → Prop) where
  left_endpoint : RationalCarrier
  right_endpoint : RationalCarrier
  endpoints_are_ordered :
    nonstrict_order left_endpoint right_endpoint (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure RationalInterval (RationalCarrier : Type)
    (nonstrict_order : RationalCarrier → RationalCarrier → Prop) where
  left_endpoint : RationalCarrier
  right_endpoint : RationalCarrier
  endpoints_are_ordered :
    nonstrict_order left_endpoint right_endpoint
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
structure RationalInterval (RationalCarrier : Type)
    (nonstrict_order : RationalCarrier → RationalCarrier → Prop) where
  left_endpoint : RationalCarrier
  right_endpoint : RationalCarrier
  endpoints_are_ordered :
    nonstrict_order left_endpoint right_endpoint

/--
`equivalent` TODO

Predicate logic:

  ∀ {Index RationalCarrier : Type} (first second : LRA.NumberSystems.RealNumbers.CauchySequences.Sequence Index RationalCarrier) (index : Index), first index = second index

Predicate logic (unfolded):

  ∀ {Index RationalCarrier : Type} (first second : Index → RationalCarrier) (index : Index), first index = second index

Logical form (Lean):

```lean
def equivalent
    {IntervalSequenceCarrier : Type}
    (first second : IntervalSequenceCarrier) : Prop :=
  first = second
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
def equivalent
    {IntervalSequenceCarrier : Type}
    (first second : IntervalSequenceCarrier) : Prop :=
  first = second

/--
`equivalent_is_equivalence_relation` TODO

Predicate logic:

  Equivalence (@equivalent IntervalSequenceCarrier)

Predicate logic (unfolded):

  ∀ {Digit : Type}, Equivalence fun first second => (first.1 = second.1 ∧ first.2 = second.2)

Logical form (Lean):

```lean
theorem equivalent_is_equivalence_relation
    {IntervalSequenceCarrier : Type} :
    Equivalence (@equivalent IntervalSequenceCarrier)
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
theorem equivalent_is_equivalence_relation
    {IntervalSequenceCarrier : Type} :
    Equivalence (@equivalent IntervalSequenceCarrier) := by
  sorry

/--
`representative_multiplication_respects_equivalence` TODO

Predicate logic:

  (IntervalSequenceCarrier → IntervalSequenceCarrier → IntervalSequenceCarrier) → LRA.UniversalAlgebra.Quotient.binary_operation_respects setoid representative_multiplication

Predicate logic (unfolded):

  ∀ {IntervalSequenceCarrier : Type} (setoid : Setoid IntervalSequenceCarrier) (representative_multiplication : IntervalSequenceCarrier → IntervalSequenceCarrier → IntervalSequenceCarrier) (first_representative first_replacement second_representative second_replacement : IntervalSequenceCarrier), (setoid.1 first_representative first_replacement ∧ setoid.1 second_representative second_replacement) → setoid.1 (representative_multiplication first_representative second_representative) (representative_multiplication first_replacement second_replacement)

Logical form (Lean):

```lean
theorem representative_multiplication_respects_equivalence
    {IntervalSequenceCarrier : Type}
    (setoid : Setoid IntervalSequenceCarrier)
    (representative_multiplication :
      IntervalSequenceCarrier →
      IntervalSequenceCarrier →
      IntervalSequenceCarrier) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      setoid representative_multiplication
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem representative_multiplication_respects_equivalence
    {IntervalSequenceCarrier : Type}
    (setoid : Setoid IntervalSequenceCarrier)
    (representative_multiplication :
      IntervalSequenceCarrier →
      IntervalSequenceCarrier →
      IntervalSequenceCarrier) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      setoid representative_multiplication := by
  sorry

/--
`raw_interval_multiplication_is_not_distributive` TODO

Predicate logic:

  (IntervalSequenceCarrier → IntervalSequenceCarrier → IntervalSequenceCarrier ∧ IntervalSequenceCarrier → IntervalSequenceCarrier → IntervalSequenceCarrier) → ¬ ∀ first second third, representative_multiplication first (representative_addition second third) = representative_addition (representative_multiplication first second) (representative_multiplication first third)

Predicate logic (unfolded):

  ∀ {IntervalSequenceCarrier : Type} (representative_multiplication representative_addition : IntervalSequenceCarrier → IntervalSequenceCarrier → IntervalSequenceCarrier), (∀ (first second third : IntervalSequenceCarrier), representative_multiplication first (representative_addition second third) = representative_addition (representative_multiplication first second) (representative_multiplication first third)) → False

Logical form (Lean):

```lean
theorem raw_interval_multiplication_is_not_distributive
    {IntervalSequenceCarrier : Type}
    (representative_multiplication :
      IntervalSequenceCarrier →
      IntervalSequenceCarrier →
      IntervalSequenceCarrier)
    (representative_addition :
      IntervalSequenceCarrier →
      IntervalSequenceCarrier →
      IntervalSequenceCarrier) :
    ¬ ∀ first second third,
      representative_multiplication
          first
          (representative_addition second third) =
        representative_addition
          (representative_multiplication first second)
          (representative_multiplication first third)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem raw_interval_multiplication_is_not_distributive
    {IntervalSequenceCarrier : Type}
    (representative_multiplication :
      IntervalSequenceCarrier →
      IntervalSequenceCarrier →
      IntervalSequenceCarrier)
    (representative_addition :
      IntervalSequenceCarrier →
      IntervalSequenceCarrier →
      IntervalSequenceCarrier) :
    ¬ ∀ first second third,
      representative_multiplication
          first
          (representative_addition second third) =
        representative_addition
          (representative_multiplication first second)
          (representative_multiplication first third) := by
  sorry

/--
`quotient_multiplication_is_distributive` TODO

Predicate logic:

  ∀ first second third, multiplication first (addition second third) = addition (multiplication first second) (multiplication first third)

Predicate logic (unfolded):

  ∀ {RealCarrier : Type} (multiplication addition : RealCarrier → RealCarrier → RealCarrier) (first second third : RealCarrier), multiplication first (addition second third) = addition (multiplication first second) (multiplication first third)

Logical form (Lean):

```lean
theorem quotient_multiplication_is_distributive
    {RealCarrier : Type}
    (multiplication addition : RealCarrier → RealCarrier → RealCarrier) :
    ∀ first second third,
      multiplication first (addition second third) =
        addition (multiplication first second) (multiplication first third)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem quotient_multiplication_is_distributive
    {RealCarrier : Type}
    (multiplication addition : RealCarrier → RealCarrier → RealCarrier) :
    ∀ first second third,
      multiplication first (addition second third) =
        addition (multiplication first second) (multiplication first third) := by
  sorry

/--
`real_model_exists` TODO

Predicate logic:

  (∀ rational_model ∈ RationalModel), Nonempty RealModel

Predicate logic (unfolded):

  ∀ (a : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), Nonempty LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel

Logical form (Lean):

```lean
theorem real_model_exists
    (rational_model : RationalModel) : Nonempty RealModel
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
theorem real_model_exists
    (rational_model : RationalModel) : Nonempty RealModel := by
  sorry

/--
`real_model` TODO

Predicate logic:

  noncomputable def real_model
    (rational_model : RationalModel) : RealModel :=
  Classical.choice (real_model_exists rational_model)

Predicate logic (unfolded):

  noncomputable def real_model
    (rational_model : RationalModel) : RealModel :=
  Classical.choice (real_model_exists rational_model) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def real_model
    (rational_model : RationalModel) : RealModel :=
  Classical.choice (real_model_exists rational_model)
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
noncomputable def real_model
    (rational_model : RationalModel) : RealModel :=
  Classical.choice (real_model_exists rational_model)

end LRA.NumberSystems.RealNumbers.PrimitiveIntervalQuotient
namespace LRA.NumberSystems.RealNumbers
open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

end LRA.NumberSystems.RealNumbers
namespace LRA.NumberSystems.RealNumbers.DyadicExpansions
open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

/--
`Expansion` TODO

Predicate logic:

  structure Expansion (Digit : Type) where
  integer_part : Digit → Prop
  fractional_digits : Nat → Digit

Predicate logic (unfolded):

  structure Expansion (Digit : Type) where
  integer_part : Digit → Prop
  fractional_digits : Nat → Digit (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure Expansion (Digit : Type) where
  integer_part : Digit → Prop
  fractional_digits : Nat → Digit
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
structure Expansion (Digit : Type) where
  integer_part : Digit → Prop
  fractional_digits : Nat → Digit

/--
`equivalent` TODO

Predicate logic:

  ∀ {Index RationalCarrier : Type} (first second : LRA.NumberSystems.RealNumbers.CauchySequences.Sequence Index RationalCarrier) (index : Index), first index = second index

Predicate logic (unfolded):

  ∀ {Index RationalCarrier : Type} (first second : Index → RationalCarrier) (index : Index), first index = second index

Logical form (Lean):

```lean
def equivalent
    {Digit : Type}
    (first second : Expansion Digit) : Prop :=
  first.integer_part = second.integer_part ∧
    first.fractional_digits = second.fractional_digits
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def equivalent
    {Digit : Type}
    (first second : Expansion Digit) : Prop :=
  first.integer_part = second.integer_part ∧
    first.fractional_digits = second.fractional_digits

/--
`equivalent_is_equivalence_relation` TODO

Predicate logic:

  Equivalence (@equivalent Digit)

Predicate logic (unfolded):

  ∀ {Digit : Type}, Equivalence fun first second => (first.1 = second.1 ∧ first.2 = second.2)

Logical form (Lean):

```lean
theorem equivalent_is_equivalence_relation
    {Digit : Type} :
    Equivalence (@equivalent Digit)
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
theorem equivalent_is_equivalence_relation
    {Digit : Type} :
    Equivalence (@equivalent Digit) := by
  sorry

/--
`real_model_exists` TODO

Predicate logic:

  (∀ rational_model ∈ RationalModel), Nonempty RealModel

Predicate logic (unfolded):

  ∀ (a : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), Nonempty LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel

Logical form (Lean):

```lean
theorem real_model_exists
    (rational_model : RationalModel) : Nonempty RealModel
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
theorem real_model_exists
    (rational_model : RationalModel) : Nonempty RealModel := by
  sorry

/--
`real_model` TODO

Predicate logic:

  noncomputable def real_model
    (rational_model : RationalModel) : RealModel :=
  Classical.choice (real_model_exists rational_model)

Predicate logic (unfolded):

  noncomputable def real_model
    (rational_model : RationalModel) : RealModel :=
  Classical.choice (real_model_exists rational_model) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def real_model
    (rational_model : RationalModel) : RealModel :=
  Classical.choice (real_model_exists rational_model)
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
noncomputable def real_model
    (rational_model : RationalModel) : RealModel :=
  Classical.choice (real_model_exists rational_model)

end LRA.NumberSystems.RealNumbers.DyadicExpansions
namespace LRA.NumberSystems.RealNumbers
open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

/--
`ModelIsomorphism` TODO

Predicate logic:

  structure ModelIsomorphism
    (first_model second_model : RealModel) where
  to_function :
    first_model.signature.carrier →
      second_model.signature.carrier
  inverse_function :
    second_model.signature.carrier →
      first_model.signature.carrier
  left_inverse :
    ∀ value,
      inverse_function (to_function value) = value
  right_inverse :
    ∀ value,
      to_function (inverse_function value) = value
  preserves_zero :
    to_function first_model.signature.zero =
      second_model.signature.zero
  preserves_one :
    to_function first_model.signature.one =
      second_model.signature.one
  preserves_addition :
    ∀ first second,
      to_function
          (first_model.signature.add first second) =
        second_model.signature.add
          (to_function first)
          (to_function second)
  preserves_multiplication :
    ∀ first second,
      to_function
          (first_model.signature.multiply first second) =
        second_model.signature.multiply
          (to_function first)
          (to_function second)
  preserves_and_reflects_order :
    ∀ first second,
      second_model.signature.le
          (to_function first)
          (to_function second) ↔
        first_model.signature.le first second

Predicate logic (unfolded):

  structure ModelIsomorphism
    (first_model second_model : RealModel) where
  to_function :
    first_model.signature.carrier →
      second_model.signature.carrier
  inverse_function :
    second_model.signature.carrier →
      first_model.signature.carrier
  left_inverse :
    ∀ value,
      inverse_function (to_function value) = value
  right_inverse :
    ∀ value,
      to_function (inverse_function value) = value
  preserves_zero :
    to_function first_model.signature.zero =
      second_model.signature.zero
  preserves_one :
    to_function first_model.signature.one =
      second_model.signature.one
  preserves_addition :
    ∀ first second,
      to_function
          (first_model.signature.add first second) =
        second_model.signature.add
          (to_function first)
          (to_function second)
  preserves_multiplication :
    ∀ first second,
      to_function
          (first_model.signature.multiply first second) =
        second_model.signature.multiply
          (to_function first)
          (to_function second)
  preserves_and_reflects_order :
    ∀ first second,
      second_model.signature.le
          (to_function first)
          (to_function second) ↔
        first_model.signature.le first second (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure ModelIsomorphism
    (first_model second_model : RealModel) where
  to_function :
    first_model.signature.carrier →
      second_model.signature.carrier
  inverse_function :
    second_model.signature.carrier →
      first_model.signature.carrier
  left_inverse :
    ∀ value,
      inverse_function (to_function value) = value
  right_inverse :
    ∀ value,
      to_function (inverse_function value) = value
  preserves_zero :
    to_function first_model.signature.zero =
      second_model.signature.zero
  preserves_one :
    to_function first_model.signature.one =
      second_model.signature.one
  preserves_addition :
    ∀ first second,
      to_function
          (first_model.signature.add first second) =
        second_model.signature.add
          (to_function first)
          (to_function second)
  preserves_multiplication :
    ∀ first second,
      to_function
          (first_model.signature.multiply first second) =
        second_model.signature.multiply
          (to_function first)
          (to_function second)
  preserves_and_reflects_order :
    ∀ first second,
      second_model.signature.le
          (to_function first)
          (to_function second) ↔
        first_model.signature.le first second
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
structure ModelIsomorphism
    (first_model second_model : RealModel) where
  to_function :
    first_model.signature.carrier →
      second_model.signature.carrier
  inverse_function :
    second_model.signature.carrier →
      first_model.signature.carrier
  left_inverse :
    ∀ value,
      inverse_function (to_function value) = value
  right_inverse :
    ∀ value,
      to_function (inverse_function value) = value
  preserves_zero :
    to_function first_model.signature.zero =
      second_model.signature.zero
  preserves_one :
    to_function first_model.signature.one =
      second_model.signature.one
  preserves_addition :
    ∀ first second,
      to_function
          (first_model.signature.add first second) =
        second_model.signature.add
          (to_function first)
          (to_function second)
  preserves_multiplication :
    ∀ first second,
      to_function
          (first_model.signature.multiply first second) =
        second_model.signature.multiply
          (to_function first)
          (to_function second)
  preserves_and_reflects_order :
    ∀ first second,
      second_model.signature.le
          (to_function first)
          (to_function second) ↔
        first_model.signature.le first second

/--
`complete_archimedean_ordered_fields_are_uniquely_isomorphic` TODO

Predicate logic:

  (∀ first_model second_model ∈ RealModel), ∃ isomorphism ∈ ModelIsomorphism first_model second_model, ∀ other_isomorphism : ModelIsomorphism first_model second_model, ∀ value, other_isomorphism.to_function value = isomorphism.to_function value

Predicate logic (unfolded):

  ∀ (first_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel) (second_model : LRA.NumberSystems.RealNumbers.Interface.ModelTheory.RealModel), Exists fun isomorphism => ∀ (other_isomorphism : LRA.NumberSystems.RealNumbers.ModelIsomorphism first_model second_model) (value : first_model.signature.toCarrierBundle.1), other_isomorphism.1 value = isomorphism.1 value

Logical form (Lean):

```lean
theorem complete_archimedean_ordered_fields_are_uniquely_isomorphic
    (first_model second_model : RealModel) :
    ∃ isomorphism : ModelIsomorphism first_model second_model,
      ∀ other_isomorphism : ModelIsomorphism first_model second_model,
        ∀ value,
          other_isomorphism.to_function value =
            isomorphism.to_function value
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
theorem complete_archimedean_ordered_fields_are_uniquely_isomorphic
    (first_model second_model : RealModel) :
    ∃ isomorphism : ModelIsomorphism first_model second_model,
      ∀ other_isomorphism : ModelIsomorphism first_model second_model,
        ∀ value,
          other_isomorphism.to_function value =
            isomorphism.to_function value := by
  sorry

/--
`dedekind_equiv_cauchy_exists` TODO

Predicate logic:

  (∀ rational_model ∈ RationalModel), Nonempty (ModelIsomorphism (DedekindCuts.real_model rational_model) (CauchySequences.real_model rational_model))

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), Nonempty (LRA.NumberSystems.RealNumbers.ModelIsomorphism (Classical.choice ⋯) (Classical.choice ⋯))

Logical form (Lean):

```lean
theorem dedekind_equiv_cauchy_exists
    (rational_model : RationalModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (CauchySequences.real_model rational_model))
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
theorem dedekind_equiv_cauchy_exists
    (rational_model : RationalModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (CauchySequences.real_model rational_model)) := by
  sorry

/--
`dedekind_equiv_cauchy` TODO

Predicate logic:

  noncomputable def dedekind_equiv_cauchy
    (rational_model : RationalModel) :
    ModelIsomorphism
      (DedekindCuts.real_model rational_model)
      (CauchySequences.real_model rational_model) :=
  Classical.choice (dedekind_equiv_cauchy_exists rational_model)

Predicate logic (unfolded):

  noncomputable def dedekind_equiv_cauchy
    (rational_model : RationalModel) :
    ModelIsomorphism
      (DedekindCuts.real_model rational_model)
      (CauchySequences.real_model rational_model) :=
  Classical.choice (dedekind_equiv_cauchy_exists rational_model) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def dedekind_equiv_cauchy
    (rational_model : RationalModel) :
    ModelIsomorphism
      (DedekindCuts.real_model rational_model)
      (CauchySequences.real_model rational_model) :=
  Classical.choice (dedekind_equiv_cauchy_exists rational_model)
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
noncomputable def dedekind_equiv_cauchy
    (rational_model : RationalModel) :
    ModelIsomorphism
      (DedekindCuts.real_model rational_model)
      (CauchySequences.real_model rational_model) :=
  Classical.choice (dedekind_equiv_cauchy_exists rational_model)

/--
`dedekind_and_cauchy_are_isomorphic` TODO

Predicate logic:

  (∀ rational_model ∈ RationalModel), Nonempty (ModelIsomorphism (DedekindCuts.real_model rational_model) (CauchySequences.real_model rational_model))

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), Nonempty (LRA.NumberSystems.RealNumbers.ModelIsomorphism (Classical.choice ⋯) (Classical.choice ⋯))

Logical form (Lean):

```lean
theorem dedekind_and_cauchy_are_isomorphic
    (rational_model : RationalModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (CauchySequences.real_model rational_model))
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
theorem dedekind_and_cauchy_are_isomorphic
    (rational_model : RationalModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (CauchySequences.real_model rational_model)) := by
  sorry

/--
`dedekind_equiv_cantor_exists` TODO

Predicate logic:

  (∀ rational_model ∈ RationalModel), Nonempty (ModelIsomorphism (DedekindCuts.real_model rational_model) (CantorNestedIntervals.real_model rational_model))

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), Nonempty (LRA.NumberSystems.RealNumbers.ModelIsomorphism (Classical.choice ⋯) (Classical.choice ⋯))

Logical form (Lean):

```lean
theorem dedekind_equiv_cantor_exists
    (rational_model : RationalModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (CantorNestedIntervals.real_model rational_model))
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
theorem dedekind_equiv_cantor_exists
    (rational_model : RationalModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (CantorNestedIntervals.real_model rational_model)) := by
  sorry

/--
`dedekind_equiv_cantor` TODO

Predicate logic:

  noncomputable def dedekind_equiv_cantor
    (rational_model : RationalModel) :
    ModelIsomorphism
      (DedekindCuts.real_model rational_model)
      (CantorNestedIntervals.real_model rational_model) :=
  Classical.choice (dedekind_equiv_cantor_exists rational_model)

Predicate logic (unfolded):

  noncomputable def dedekind_equiv_cantor
    (rational_model : RationalModel) :
    ModelIsomorphism
      (DedekindCuts.real_model rational_model)
      (CantorNestedIntervals.real_model rational_model) :=
  Classical.choice (dedekind_equiv_cantor_exists rational_model) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def dedekind_equiv_cantor
    (rational_model : RationalModel) :
    ModelIsomorphism
      (DedekindCuts.real_model rational_model)
      (CantorNestedIntervals.real_model rational_model) :=
  Classical.choice (dedekind_equiv_cantor_exists rational_model)
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
noncomputable def dedekind_equiv_cantor
    (rational_model : RationalModel) :
    ModelIsomorphism
      (DedekindCuts.real_model rational_model)
      (CantorNestedIntervals.real_model rational_model) :=
  Classical.choice (dedekind_equiv_cantor_exists rational_model)

/--
`dedekind_and_cantor_are_isomorphic` TODO

Predicate logic:

  (∀ rational_model ∈ RationalModel), Nonempty (ModelIsomorphism (DedekindCuts.real_model rational_model) (CantorNestedIntervals.real_model rational_model))

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), Nonempty (LRA.NumberSystems.RealNumbers.ModelIsomorphism (Classical.choice ⋯) (Classical.choice ⋯))

Logical form (Lean):

```lean
theorem dedekind_and_cantor_are_isomorphic
    (rational_model : RationalModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (CantorNestedIntervals.real_model rational_model))
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
theorem dedekind_and_cantor_are_isomorphic
    (rational_model : RationalModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (CantorNestedIntervals.real_model rational_model)) := by
  sorry

/--
`dedekind_equiv_interval_quotient_exists` TODO

Predicate logic:

  (∀ rational_model ∈ RationalModel), Nonempty (ModelIsomorphism (DedekindCuts.real_model rational_model) (PrimitiveIntervalQuotient.real_model rational_model))

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), Nonempty (LRA.NumberSystems.RealNumbers.ModelIsomorphism (Classical.choice ⋯) (Classical.choice ⋯))

Logical form (Lean):

```lean
theorem dedekind_equiv_interval_quotient_exists
    (rational_model : RationalModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (PrimitiveIntervalQuotient.real_model rational_model))
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
theorem dedekind_equiv_interval_quotient_exists
    (rational_model : RationalModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (PrimitiveIntervalQuotient.real_model rational_model)) := by
  sorry

/--
`dedekind_equiv_interval_quotient` TODO

Predicate logic:

  noncomputable def dedekind_equiv_interval_quotient
    (rational_model : RationalModel) :
    ModelIsomorphism
      (DedekindCuts.real_model rational_model)
      (PrimitiveIntervalQuotient.real_model rational_model) :=
  Classical.choice (dedekind_equiv_interval_quotient_exists rational_model)

Predicate logic (unfolded):

  noncomputable def dedekind_equiv_interval_quotient
    (rational_model : RationalModel) :
    ModelIsomorphism
      (DedekindCuts.real_model rational_model)
      (PrimitiveIntervalQuotient.real_model rational_model) :=
  Classical.choice (dedekind_equiv_interval_quotient_exists rational_model) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def dedekind_equiv_interval_quotient
    (rational_model : RationalModel) :
    ModelIsomorphism
      (DedekindCuts.real_model rational_model)
      (PrimitiveIntervalQuotient.real_model rational_model) :=
  Classical.choice (dedekind_equiv_interval_quotient_exists rational_model)
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
noncomputable def dedekind_equiv_interval_quotient
    (rational_model : RationalModel) :
    ModelIsomorphism
      (DedekindCuts.real_model rational_model)
      (PrimitiveIntervalQuotient.real_model rational_model) :=
  Classical.choice (dedekind_equiv_interval_quotient_exists rational_model)

/--
`dedekind_and_interval_quotient_are_isomorphic` TODO

Predicate logic:

  (∀ rational_model ∈ RationalModel), Nonempty (ModelIsomorphism (DedekindCuts.real_model rational_model) (PrimitiveIntervalQuotient.real_model rational_model))

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), Nonempty (LRA.NumberSystems.RealNumbers.ModelIsomorphism (Classical.choice ⋯) (Classical.choice ⋯))

Logical form (Lean):

```lean
theorem dedekind_and_interval_quotient_are_isomorphic
    (rational_model : RationalModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (PrimitiveIntervalQuotient.real_model rational_model))
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
theorem dedekind_and_interval_quotient_are_isomorphic
    (rational_model : RationalModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (PrimitiveIntervalQuotient.real_model rational_model)) := by
  sorry

/--
`dedekind_equiv_dyadic_exists` TODO

Predicate logic:

  (∀ rational_model ∈ RationalModel), Nonempty (ModelIsomorphism (DedekindCuts.real_model rational_model) (DyadicExpansions.real_model rational_model))

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), Nonempty (LRA.NumberSystems.RealNumbers.ModelIsomorphism (Classical.choice ⋯) (Classical.choice ⋯))

Logical form (Lean):

```lean
theorem dedekind_equiv_dyadic_exists
    (rational_model : RationalModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (DyadicExpansions.real_model rational_model))
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
theorem dedekind_equiv_dyadic_exists
    (rational_model : RationalModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (DyadicExpansions.real_model rational_model)) := by
  sorry

/--
`dedekind_equiv_dyadic` TODO

Predicate logic:

  noncomputable def dedekind_equiv_dyadic
    (rational_model : RationalModel) :
    ModelIsomorphism
      (DedekindCuts.real_model rational_model)
      (DyadicExpansions.real_model rational_model) :=
  Classical.choice (dedekind_equiv_dyadic_exists rational_model)

Predicate logic (unfolded):

  noncomputable def dedekind_equiv_dyadic
    (rational_model : RationalModel) :
    ModelIsomorphism
      (DedekindCuts.real_model rational_model)
      (DyadicExpansions.real_model rational_model) :=
  Classical.choice (dedekind_equiv_dyadic_exists rational_model) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def dedekind_equiv_dyadic
    (rational_model : RationalModel) :
    ModelIsomorphism
      (DedekindCuts.real_model rational_model)
      (DyadicExpansions.real_model rational_model) :=
  Classical.choice (dedekind_equiv_dyadic_exists rational_model)
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
noncomputable def dedekind_equiv_dyadic
    (rational_model : RationalModel) :
    ModelIsomorphism
      (DedekindCuts.real_model rational_model)
      (DyadicExpansions.real_model rational_model) :=
  Classical.choice (dedekind_equiv_dyadic_exists rational_model)

/--
`dedekind_and_dyadic_are_isomorphic` TODO

Predicate logic:

  (∀ rational_model ∈ RationalModel), Nonempty (ModelIsomorphism (DedekindCuts.real_model rational_model) (DyadicExpansions.real_model rational_model))

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), Nonempty (LRA.NumberSystems.RealNumbers.ModelIsomorphism (Classical.choice ⋯) (Classical.choice ⋯))

Logical form (Lean):

```lean
theorem dedekind_and_dyadic_are_isomorphic
    (rational_model : RationalModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (DyadicExpansions.real_model rational_model))
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
theorem dedekind_and_dyadic_are_isomorphic
    (rational_model : RationalModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (DyadicExpansions.real_model rational_model)) := by
  sorry

end LRA.NumberSystems.RealNumbers
