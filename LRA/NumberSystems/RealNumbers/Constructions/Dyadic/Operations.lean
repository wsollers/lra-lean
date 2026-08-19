-- LRA/NumberSystems/RealNumbers/Constructions/Dyadic/Operations.lean
-- Rational partial sums of a binary fractional expansion -- the one
-- operation at this stage whose definition does not itself need a
-- not-yet-available well-definedness fact.

import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.WellFoundedness

namespace LRA.NumberSystems.RealNumbers.Dyadic

/-!
Judgment call: the source's `fractional_value`, `unsigned_value`, and
`value` sit textually near `fractional_partial_sum`, but each depends
(directly or transitively) on `fractional_partial_sums_are_cauchy`:
`fractional_value` packages a partial-sum sequence together with the proof
that it is Cauchy into a `Quotient.mk` element of `CauchyCarrier`;
`unsigned_value` calls `fractional_value`; `value` calls `unsigned_value`.
`fractional_partial_sums_are_cauchy` is itself a well-definedness fact
(it belongs to the `WellDefinedness` stage, immediately after this one), so
stating any of the three here would reach forward past the stage that
supplies it, violating the pipeline's strict dependency order. All three
are therefore moved unchanged to `WellDefinedness.lean`, directly after
`fractional_partial_sums_are_cauchy`. `fractional_partial_sum` alone stays
here, since it only uses data already available from `Carrier.lean`. See
`RealNumbers/ProofOrder.md`.
-/

variable (dyadic_data : RationalDyadicApproximationData)

/-- Definition 2.3: rational partial sums of a binary fractional expansion.

Mathematical statement (Lean): `def fractional_partial_sum (digits : FractionalDigits) (bound : Nat) : Rational dyadic_data`.


Logical form:

```lean
def fractional_partial_sum
    (digits : FractionalDigits)
    (bound : Nat) : Rational dyadic_data :=
  dyadic_data.finite_sum
    (fun index =>
      dyadic_data.rational_model.signature.multiply
        (dyadic_data.digit_to_rational (digits index))
        (dyadic_data.rational_model.signature.inv
          (dyadic_data.power_of_two (dyadic_data.exponent_of_index index))))
    bound
```
-/
def fractional_partial_sum
    (digits : FractionalDigits)
    (bound : Nat) : Rational dyadic_data :=
  dyadic_data.finite_sum
    (fun index =>
      dyadic_data.rational_model.signature.multiply
        (dyadic_data.digit_to_rational (digits index))
        (dyadic_data.rational_model.signature.inv
          (dyadic_data.power_of_two (dyadic_data.exponent_of_index index))))
    bound

end LRA.NumberSystems.RealNumbers.Dyadic
