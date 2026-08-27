import LRA.Operation.Laws.Identity.Definition
import LRA.AlgebraicStructures.Semigroup.Examples.PositiveIntegersUnderAddition

namespace LRA.AlgebraicStructures.Monoid.Failures

open LRA.Operation.Laws.Identity

/-- A semigroup that is *not* a monoid: positive integers under addition
(`Semigroup.Examples.PositiveIntegersUnderAddition`) are closed and
associative but have no identity — `0`, the only possible candidate, is
excluded by construction. Reuses the tier-below example directly rather than
restating it, per `DECISIONS.md` D3 ("a semigroup with no identity ... is
exactly Monoid's failure mode"). Same fact as `Semigroup.Examples.
IdentityNotRequired.positiveIntegersHaveNoIdentity`, restated here as this
subject's own dropped-law consequence. -/
theorem positiveIntegersHaveNoIdentity :
    ¬ ∃ e : {n // n ∈ LRA.AlgebraicStructures.Semigroup.Examples.PositiveIntegers},
        TwoSidedIdentity
          (fun a b : {n // n ∈ LRA.AlgebraicStructures.Semigroup.Examples.PositiveIntegers} =>
            a * b) e := by
  sorry

end LRA.AlgebraicStructures.Monoid.Failures
