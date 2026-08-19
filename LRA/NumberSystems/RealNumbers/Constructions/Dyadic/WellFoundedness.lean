-- LRA/NumberSystems/RealNumbers/Constructions/Dyadic/WellFoundedness.lean
-- Placeholder pipeline stage: at this point in the construction the carrier
-- under discussion is `Expansion`, a plain (non-quotient) inductive type,
-- so no bridging induction principle is required beyond what Lean already
-- derives for it.

import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.Equivalence

namespace LRA.NumberSystems.RealNumbers.Dyadic

/-!
`LRA/VolumeII/RealNumbers/Dyadic.lean` never states an induction/recursion
principle for `Expansion`, and this stage does not need to invent one. The
Cauchy construction's `WellFoundedness.lean` had to add
`InductionOnRepresentatives` because `Cauchy.Carrier` is a `Quotient`, so
proving a predicate about every class first requires justifying that it
suffices to prove it about every representative's image -- a genuinely new
fact not handed to it for free. `Expansion` (defined in `Carrier.lean`) is
by contrast a directly recursive `inductive` type built from `Sign` and
`UnsignedExpansion`/`FiniteNumeral`/`CanonicalFraction`, none of which are
quotients at this stage of the pipeline: Lean's derived recursor
`Expansion.rec` (and the `cases`/`induction` tactics built on it) already
gives exactly the case-split-on-`zero`-or-`nonzero` principle this stage
exists to supply, with no separate lemma to state or prove.

The bijection between `Expansion` and the quotient-based `CauchyCarrier`
only appears later, in `WellDefinedness.lean`; induction bridging *that*
correspondence is not required by anything the source states (the source
works with the bijection's `forward`/`inverse` maps directly, never by
induction on Cauchy classes through Expansion or vice versa). This file is
therefore a deliberate placeholder, present so `Operations.lean` has a
stage to import per §1.6.1. See `RealNumbers/ProofOrder.md`.
-/

end LRA.NumberSystems.RealNumbers.Dyadic
