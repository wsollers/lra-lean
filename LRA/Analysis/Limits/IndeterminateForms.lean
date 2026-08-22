import LRA.Analysis.Limits.IndeterminateForms.Theorems

/-!
Aggregate import for the `IndeterminateForms` concept: one algebraically
resolved example per classic indeterminate form (`0/0`, `∞/∞`, `0·∞`,
`∞−∞`, `0⁰`, `∞⁰`, `1^∞`) in `Theorems`. Failure witnesses remain opt-in
in `Failures`, where the pattern alone never determines the answer:
different functions realizing the same `0/0` or `1^∞` shape can have
different limits.
-/
