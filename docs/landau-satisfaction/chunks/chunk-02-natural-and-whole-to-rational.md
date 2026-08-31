# Chunk 02 - Natural And Whole To Rational

Updated: 2026-08-31

## Purpose

Carry the scalar chain from the completed operator/model-theory scaffolding
through the concrete theorem and construction work for naturals, whole numbers,
integers, fractions, and rationals.

## Theorem Band

- Chapter I `Natural Numbers` (Theorems 1–36)
- Chapter II `Fractions` / rationals (Theorems 37–115)

## Algebraic-Structure Prerequisites

- `as-18` `Semiring`
- `as-19` `AbelianGroup`
- `as-22` `CommutativeSemiring`
- `as-24` `Ring`
- `as-25` `OrderedSemiring`
- `as-27` `CommutativeRing`
- `as-28` `NontrivialRing`
- `as-29` `OrderedRing`
- `as-31` `IntegralDomain`
- `as-33` `Field`
- `as-34` `OrderedField`
- side inputs: `as-06` `Archimedean`, `as-07` `DiscreteInteger`

## Required Context

- `docs/landau-satisfaction/phases/phase-04-concrete-construction-proofs.md`
- `LANDAU-THEOREMS.md`
- `LANDAU-CROSSWALK.md`

## Primary Files

- `LRA/NumberSystems/NaturalNumbers/Constructions/Landau/*`
- `LRA/NumberSystems/WholeNumbers/Constructions/Landau/*`
- `LRA/NumberSystems/Integers/Constructions/QuotientOrderedPairs/*`
- `LRA/NumberSystems/Integers/Constructions/Tao/*`
- `LRA/NumberSystems/Integers/Constructions/Mendelson/*`
- `LRA/NumberSystems/RationalNumbers/Constructions/RationalQuotientFractions/*`
- matching `Satisfy_Generic.lean` and `Laws.lean` files for the same families

## Checklist

- [ ] Normalize construction-local addition and multiplication bridges for the
  natural, whole, integer, and rational families.
- [ ] Package the required structure-law bundles for those families.
- [ ] Add or align the chapter-I and chapter-II theorem artifacts in their
  owned files.
- [ ] Update the crosswalk entries for the theorem slots touched in this chunk.
- [x] Leave all new proofs as `sorry`.

## Current State On 2026-08-31

- Chapter I crosswalk coverage is complete in `LANDAU-CROSSWALK.md` for
  Theorems `1`-`36`.
- `LRA/NumberSystems/NaturalNumbers/Constructions/Landau/Instances.lean`
  now packages the one-based Landau carrier through the natural algebraic
  endpoint justified there:
  `AdditiveCancellativeLaws`,
  `MultiplicativeIdentityLaws`,
  `MultiplicativeCancellativeLaws`, and
  `CommutativeSemiringWithoutZeroLaws`.
- `LRA/NumberSystems/WholeNumbers/Constructions/Landau/Instances.lean`
  now exposes
  `underlyingNaturalCommutativeSemiringWithoutZeroLawsOn`
  so the zero-adjoined whole-number construction names the recovered Chapter I
  law bundle explicitly.
- `LRA/NumberSystems/WholeNumbers/Constructions/Landau/Instances.lean:
  quotientOrderedPairsInput` now routes the
  `WholeNumberArithmeticForQuotientPairs.ofCarrier` handoff through the
  existing named whole-number theorems
  `additive_structure` and
  `addition_preserves_and_reflects_nonstrict_order`
  instead of anonymous `by sorry` placeholders.
- `LRA/NumberSystems/WholeNumbers/Constructions/Landau/Instances.lean:
  additionRespectsOrderLawsOn` now routes its `AddLeAddRight` field through
  the existing named theorem `addition_preserves_nonstrict_order`, and routes
  its `AddLeAddLeft` field through that same theorem plus additive
  commutativity on the whole-number carrier, instead of anonymous
  placeholders.
- `LRA/NumberSystems/WholeNumbers/Constructions/Landau/Instances.lean:
  multiplicationRespectsOrderLawsOn` now routes its `MulNonneg` field through
  the existing named theorem `multiplication_preserves_nonstrict_order`
  together with the existing zero-absorbing law package on the whole-number
  carrier, instead of an anonymous placeholder.
- `LRA/NumberSystems/WholeNumbers/Constructions/Landau/Instances.lean:
  distributiveLawsOn` now routes its second distributivity field through the
  existing named distributive theorem from `semiring_structure` together with
  multiplicative commutativity on the whole-number carrier, instead of an
  anonymous placeholder.
- Do not add
  `LRA/NumberSystems/NaturalNumbers/Constructions/Landau/Satisfy_Generic.lean`
  under the current contracts. The Chapter I Landau carrier is one-based and
  therefore is not a construction-local owner of the zero-bearing
  `NaturalNumberModel`.
- `LRA/NumberSystems/Integers/Constructions/QuotientOrderedPairs/Laws.lean`
  and
  `LRA/NumberSystems/RationalNumbers/Constructions/RationalQuotientFractions/Laws.lean`
  were re-inspected on 2026-08-31 to keep the owner/crosswalk picture honest.
  This is owner inspection only, not full Chapter II theorem alignment.

## Checklist Interpretation On 2026-08-31

- The first four checklist items remain open at chunk scope.
- Natural and whole-number bridge normalization is partially complete.
- Natural and whole-number law packaging is partially complete.
- Chapter I theorem artifacts are aligned, but Chapter II theorem artifacts are
  not yet aligned end to end.
- Crosswalk updates are complete for the Chapter I theorem slots touched so
  far, but not for the blocked Chapter II alignment work.
- The proof placeholder rule is satisfied: new theorem bodies and new
  proof-carrying `instance` declarations remain `sorry`.

## Gate

- The hard blocker for further integer/rational construction alignment in this
  chunk remains `as-31` `IntegralDomain` and `as-34` `OrderedField`.
- This is not only a documentation blocker. Those items are still not marked
  `done`, and no explicit sufficiency exception is recorded for them in the
  canonical algebraic-structures queue.
- A known cross-workstream documentation mismatch still exists between
  `docs/algebraic-structures-repair/status.md` and
  `docs/algebraic-structures-repair/ledger.json` on `as-21`, `as-22`, and
  `as-25`: `status.md` says `as-21 = not_started`,
  `as-22 = reorg_in_progress`, and `as-25 = reorg_in_progress`, while
  `ledger.json` says `as-21 = reorg_in_progress`, `as-22 = reorg_in_progress`
  with note text that actually describes `OrderedSemiring`, and
  `as-25 = not_started`. That mismatch does not remove the `as-31` / `as-34`
  hard gate.

## Success Gates

- `lake build LRA.NumberSystems.NaturalNumbers.Constructions.Landau`
- `lake build LRA.NumberSystems.WholeNumbers.Constructions.Landau`
- `lake build LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs`
- `lake build LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions`
