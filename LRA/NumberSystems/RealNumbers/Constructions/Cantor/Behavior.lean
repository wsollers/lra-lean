
import LRA.NumberSystems.RealNumbers.Constructions.Cantor.Laws
import LRA.NumberSystems.RealNumbers.Constructions.Cauchy
import LRA.Function.Properties.Definition
import LRA.NumberSystems.RationalNumbers.Interface.Definition

namespace LRA.NumberSystems.RealNumbers.Cantor
open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers

/--
`cantor_reals_are_isomorphic_to_cauchy_reals` TODO

Predicate logic:

  (∀ rationalSystem ∈ RationalNumberSystem), ∃ comparison ∈ Carrier rationalSystem.FieldModel → Cauchy.Carrier rationalSystem metric_data, LRA.Function.Bijective comparison

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (metric_data : LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData rationalSystem), Exists fun comparison => (∀ (y : Quot (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem metric_data).1) (x₁ x₂ : Quot (LRA.NumberSystems.RealNumbers.Cantor.EndpointSetoid rationalSystem.FieldModel).1), comparison x₁ = y → comparison x₂ = y → x₁ = x₂ ∧ ∀ (y : Quot (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid rationalSystem metric_data).1), Exists fun x => comparison x = y)

Logical form (Lean):

```lean
theorem cantor_reals_are_isomorphic_to_cauchy_reals
    (rationalSystem : RationalNumberSystem)
    (metric_data : Cauchy.RationalMetricData rationalSystem) :
    ∃ comparison :
      Carrier rationalSystem.FieldModel →
        Cauchy.Carrier rationalSystem metric_data,
      LRA.Function.Bijective comparison
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
theorem cantor_reals_are_isomorphic_to_cauchy_reals
    (rationalSystem : RationalNumberSystem)
    (metric_data : Cauchy.RationalMetricData rationalSystem) :
    ∃ comparison :
      Carrier rationalSystem.FieldModel →
        Cauchy.Carrier rationalSystem metric_data,
      LRA.Function.Bijective comparison := by
  sorry

end LRA.NumberSystems.RealNumbers.Cantor
