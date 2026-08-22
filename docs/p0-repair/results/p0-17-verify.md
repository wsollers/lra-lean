# p0-17 Verify Result

- Status: `approved`
- Task backend: `main-thread coordinator`
- Verify task id: `main-thread`
- Launched: `2026-08-22`
- Last good stop: verification completed with no bounded correction list

## Verifier Outcome

The spec is correct and implementation-complete.

1. The live `p0-17` defect is source strength at the construction surface. The
   repo already repaired carrier-tied realization packaging in `p0-16`, but
   several construction-level declarations still admit arbitrary
   `DenselyOrderedFieldModel` input where the mathematics intends the actual
   rational stage.

2. The Cauchy metric/input record is the canonical owner for this repair. It is
   the shared input object referenced by the Cauchy construction itself, the
   dyadic transport package, and the Cantor/PrimitiveIntervals comparison
   theorems, so retargeting that owner to `RationalNumberSystem` closes the
   source-strength gap without prematurely taking on the stronger metric-law
   repair reserved for `p0-19`.

3. Dedekind behavior should be adjusted only enough to consume actual rational
   input consistently. The specific arbitrary `natural_to_rational` theorem
   defect remains a separate bounded repair in `p0-18` and should not be solved
   incidentally here.

4. One scoped validator/build pair is sufficient. Every touched file is inside
   the authored real-number construction component.

## Resolution

`p0-17` is ready for implementation on `main`: retarget the active Cauchy
input record and dependent construction-level surfaces to
`RationalNumberSystem`, align the directly affected comments, then run the
real-number validator and build gates before commit and push.
