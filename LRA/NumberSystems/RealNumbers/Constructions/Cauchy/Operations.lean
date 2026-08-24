
import LRA.NumberSystems.RealNumbers.Constructions.Cauchy.WellFoundedness

namespace LRA.NumberSystems.RealNumbers.Cauchy
open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers

/--
`representative_addition` TODO

Predicate logic:

  def representative_addition
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) :
    Sequence rationalSystem :=
  fun index =>
    rationalSystem.FieldModel.signature.add
      (first.sequence index)
      (second.sequence index)

Predicate logic (unfolded):

  def representative_addition
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) :
    Sequence rationalSystem :=
  fun index =>
    rationalSystem.FieldModel.signature.add
      (first.sequence index)
      (second.sequence index) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def representative_addition
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) :
    Sequence rationalSystem :=
  fun index =>
    rationalSystem.FieldModel.signature.add
      (first.sequence index)
      (second.sequence index)
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
def representative_addition
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) :
    Sequence rationalSystem :=
  fun index =>
    rationalSystem.FieldModel.signature.add
      (first.sequence index)
      (second.sequence index)

/--
`representative_negation` TODO

Predicate logic:

  def representative_negation
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (representative : Representative rationalSystem absolute_value_data) :
    Sequence rationalSystem :=
  fun index =>
    rationalSystem.FieldModel.signature.neg (representative.sequence index)

Predicate logic (unfolded):

  def representative_negation
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (representative : Representative rationalSystem absolute_value_data) :
    Sequence rationalSystem :=
  fun index =>
    rationalSystem.FieldModel.signature.neg (representative.sequence index) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def representative_negation
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (representative : Representative rationalSystem absolute_value_data) :
    Sequence rationalSystem :=
  fun index =>
    rationalSystem.FieldModel.signature.neg (representative.sequence index)
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
def representative_negation
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (representative : Representative rationalSystem absolute_value_data) :
    Sequence rationalSystem :=
  fun index =>
    rationalSystem.FieldModel.signature.neg (representative.sequence index)

/--
`representative_multiplication` TODO

Predicate logic:

  def representative_multiplication
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) :
    Sequence rationalSystem :=
  fun index =>
    rationalSystem.FieldModel.signature.multiply
      (first.sequence index)
      (second.sequence index)

Predicate logic (unfolded):

  def representative_multiplication
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) :
    Sequence rationalSystem :=
  fun index =>
    rationalSystem.FieldModel.signature.multiply
      (first.sequence index)
      (second.sequence index) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def representative_multiplication
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) :
    Sequence rationalSystem :=
  fun index =>
    rationalSystem.FieldModel.signature.multiply
      (first.sequence index)
      (second.sequence index)
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
def representative_multiplication
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Representative rationalSystem absolute_value_data) :
    Sequence rationalSystem :=
  fun index =>
    rationalSystem.FieldModel.signature.multiply
      (first.sequence index)
      (second.sequence index)

end LRA.NumberSystems.RealNumbers.Cauchy
