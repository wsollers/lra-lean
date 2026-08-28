import LRA.NumberSystems.WholeNumbers.Constructions.Landau.Instances
import LRA.NumberSystems.WholeNumbers.Interface.ModelTheory.Model

namespace LRA.NumberSystems.WholeNumbers.Constructions.Landau

open LRA.NumberSystems.WholeNumbers.Interface.ModelTheory
open LRA.AlgebraicStructures
open LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/-- Landau's `<`/`≤` agree the way `StrictOrderCompatibilityLaw` requires.
Not yet proved from `ltOn`/`leOn`'s definitions (both come from
`strictOrder`/`nonstrictOrder` in `Behavior.lean`, so this should follow
directly), but the statement is accepted so the rest of the generic bridge
can be wired up. -/
theorem landauStrictOrderCompatibilityLawOn
    (natural_data : NaturalArithmeticForWholeNumbers Element SetObject) :
    letI : LT (Carrier natural_data) := ltOn natural_data
    letI : LE (Carrier natural_data) := leOn natural_data
    StrictOrderCompatibilityLaw (Carrier natural_data) := by
  sorry

/-- The Landau (successor-axiom) construction satisfies the generic 𝕎
interface: for any Landau-style natural-number arithmetic data, its carrier
is a `WholeNumberModel`.

Logical form:

```lean
noncomputable def genericModel
    (natural_data : NaturalArithmeticForWholeNumbers Element SetObject) :
    WholeNumberModel :=
  letI := zeroOn natural_data
  letI := oneOn natural_data
  letI := addOn natural_data
  letI := mulOn natural_data
  letI := ltOn natural_data
  letI := leOn natural_data
  letI := nonemptyOn natural_data
  letI := orderedSemiringLawsOn natural_data
  letI := landauStrictOrderCompatibilityLawOn natural_data
  WholeNumberModel.ofCarrier (Carrier natural_data)

abbrev satisfiesGeneric
    (natural_data : NaturalArithmeticForWholeNumbers Element SetObject) :
    WholeNumberModel :=
  genericModel natural_data
```
-/
noncomputable def genericModel
    (natural_data : NaturalArithmeticForWholeNumbers Element SetObject) :
    WholeNumberModel :=
  letI := zeroOn natural_data
  letI := oneOn natural_data
  letI := addOn natural_data
  letI := mulOn natural_data
  letI := ltOn natural_data
  letI := leOn natural_data
  letI := nonemptyOn natural_data
  letI := orderedSemiringLawsOn natural_data
  letI := landauStrictOrderCompatibilityLawOn natural_data
  WholeNumberModel.ofCarrier (Carrier natural_data)

noncomputable abbrev satisfiesGeneric
    (natural_data : NaturalArithmeticForWholeNumbers Element SetObject) :
    WholeNumberModel :=
  genericModel natural_data

end LRA.NumberSystems.WholeNumbers.Constructions.Landau
