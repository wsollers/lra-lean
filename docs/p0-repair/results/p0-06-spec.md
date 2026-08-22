# p0-06 Spec Result

- Status: `completed`
- Task backend: `main-thread coordinator`
- Spec task id: `main-thread`
- Validator path: `LRA/Analysis/Integration`
- Build target: `LRA.Analysis.Integration`
- Last good stop: spec frozen on disk and ready for implementation

## Brief Summary

`p0-06` is still live. The active integration subject still carries fake numeric semantics in the canonical owner modules for [PartitionMesh](/F:/repos/lra-lean/LRA/Analysis/Integration/Partitions.lean:51), [LowerDarbouxSum](/F:/repos/lra-lean/LRA/Analysis/Integration/DarbouxIntegral/Basic.lean:19), [UpperDarbouxSum](/F:/repos/lra-lean/LRA/Analysis/Integration/DarbouxIntegral/Basic.lean:33), [PointOscillation](/F:/repos/lra-lean/LRA/Analysis/Integration/MeasureZero.lean:37), and [TotalVariation](/F:/repos/lra-lean/LRA/Analysis/Integration/RiemannStieltjes/Basic.lean:57). The same subject also still exposes false theorem surfaces: [dirichlet_not_darboux_integrable](/F:/repos/lra-lean/LRA/Analysis/Integration/DarbouxIntegral/Basic.lean:240) is currently about the constant-zero function, [hk_strictly_wider_than_lebesgue_witness](/F:/repos/lra-lean/LRA/Analysis/Integration/HenstockKurzweil/Basic.lean:177) overclaims a universal HK-only witness, [mcshane_equals_lebesgue](/F:/repos/lra-lean/LRA/Analysis/Integration/McShaneIntegral/Basic.lean:118) states a criterion that actually matches the Riemann/Lebesgue-null-discontinuity theorem rather than McShane integrability, and [rs_step_integrator_finite_sum](/F:/repos/lra-lean/LRA/Analysis/Integration/RiemannStieltjes/Basic.lean:225) lets the output sum depend on an arbitrary `jump` function not tied to the integrator `α`.

The repair scope is self-contained inside the active integration router. No earlier open P0 blocks this item. The one remaining placeholder [MeshOf](/F:/repos/lra-lean/LRA/Analysis/Continuity/Gauge.lean:104) sits in `LRA/Analysis/Continuity/Gauge.lean`, which is not imported by the active integration root and should be handled separately from this `p0-06` gate.

## Exact Repair List

- Update [LRA/Analysis/Integration/Partitions.lean](/F:/repos/lra-lean/LRA/Analysis/Integration/Partitions.lean:51).
  Replace `PartitionMesh := 0` with the actual mesh of the partition: the supremum of the finite set of subinterval widths, with `0` included to give the degenerate `n = 0` case an honest value.

- Update [LRA/Analysis/Integration/DarbouxIntegral/Basic.lean](/F:/repos/lra-lean/LRA/Analysis/Integration/DarbouxIntegral/Basic.lean:19).
  Replace `LowerDarbouxSum` and `UpperDarbouxSum` with the finite sums of cell widths times the infimum/supremum of `f` on each closed cell.
  Keep the owner definitions numeric, but add the boundedness hypotheses needed by downstream theorems that compare those sums.
  Repair [dirichlet_not_darboux_integrable](/F:/repos/lra-lean/LRA/Analysis/Integration/DarbouxIntegral/Basic.lean:240) so it states non-integrability of the actual Dirichlet function on `[0,1]`, not the constant-zero function.

- Update [LRA/Analysis/Integration/MeasureZero.lean](/F:/repos/lra-lean/LRA/Analysis/Integration/MeasureZero.lean:37).
  Replace the numeric placeholder `PointOscillation` with a relation-valued interval-local oscillation predicate reusing the repaired continuity semantics on `Set.Icc a b`.
  Retarget [lebesgue_criterion_riemann_integrability](/F:/repos/lra-lean/LRA/Analysis/Integration/MeasureZero.lean:53) so the discontinuity set is expressed as points admitting a positive oscillation witness, not points where a fake numeric placeholder is `> 0`.

- Update [LRA/Analysis/Integration/RiemannStieltjes/Basic.lean](/F:/repos/lra-lean/LRA/Analysis/Integration/RiemannStieltjes/Basic.lean:57).
  Replace `TotalVariation := 0` with the supremum of `VariationSums α a b`.
  Strengthen [rs_step_integrator_finite_sum](/F:/repos/lra-lean/LRA/Analysis/Integration/RiemannStieltjes/Basic.lean:225) by adding an explicit hypothesis
  `hjump : ∀ i, LRA.Analysis.Continuity.JumpOf α (Set.Icc a b) (c i) (jump i)`
  so each summand uses the actual jump of the integrator `α` at `c i`.

- Update [LRA/Analysis/Integration/HenstockKurzweil/Basic.lean](/F:/repos/lra-lean/LRA/Analysis/Integration/HenstockKurzweil/Basic.lean:177).
  Remove [hk_strictly_wider_than_lebesgue_witness](/F:/repos/lra-lean/LRA/Analysis/Integration/HenstockKurzweil/Basic.lean:177) from the formal theorem surface.
  The current repository does not yet define Lebesgue integration, and the existing universal witness theorem is not a mathematically sound replacement for an actual example-specific strictness result.
  Replace the theorem with a plain comment noting that strict HK-vs-Riemann/Lebesgue witness examples are deferred until the measure-theoretic layer exists.

- Update [LRA/Analysis/Integration/McShaneIntegral/Basic.lean](/F:/repos/lra-lean/LRA/Analysis/Integration/McShaneIntegral/Basic.lean:6).
  Remove the file-header prose that currently claims `McShane = Lebesgue exactly`.
  Remove [mcshane_equals_lebesgue](/F:/repos/lra-lean/LRA/Analysis/Integration/McShaneIntegral/Basic.lean:118) and [hk_strictly_wider_than_mcshane](/F:/repos/lra-lean/LRA/Analysis/Integration/McShaneIntegral/Basic.lean:137) from the formal theorem surface.
  Keep the safe inclusion theorem [riemann_mcshane_hk_inclusions](/F:/repos/lra-lean/LRA/Analysis/Integration/McShaneIntegral/Basic.lean:95), but defer any McShane/Lebesgue equivalence or strict HK-vs-McShane witness claim until the repository has a genuine Lebesgue/measure-theoretic integration layer.

## Acceptance Criteria

- No active integration owner definition in the `LRA/Analysis/Integration` router is still a fake `:= 0` placeholder for:
  - `PartitionMesh`
  - `LowerDarbouxSum`
  - `UpperDarbouxSum`
  - `PointOscillation`
  - `TotalVariation`
- `dirichlet_not_darboux_integrable` is about an actual Dirichlet-type discontinuous function on `[0,1]`, not `fun _ => 0`.
- `rs_step_integrator_finite_sum` explicitly ties each `jump i` to the integrator `α`.
- The formal theorem surface no longer contains the current overclaimed HK-only witness theorem or the false McShane/Lebesgue equivalence theorems.
- `python scripts/validate_structure.py --path LRA/Analysis/Integration` passes after implementation.
- `lake build LRA.Analysis.Integration` passes after implementation.

## Blockers Or Dependencies

No earlier open P0 blocks `p0-06`.

`MeshOf` in [LRA/Analysis/Continuity/Gauge.lean](/F:/repos/lra-lean/LRA/Analysis/Continuity/Gauge.lean:104) is still a placeholder, but it is not part of the active integration router and is therefore not part of this P0's validator/build gate.
