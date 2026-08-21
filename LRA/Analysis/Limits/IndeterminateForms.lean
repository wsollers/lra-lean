import LRA.Analysis.Limits.IndeterminateForms.Theorems
import LRA.Analysis.Limits.IndeterminateForms.Failures

/-!
Aggregate import for the `IndeterminateForms` concept: one algebraically
resolved example per classic indeterminate form (`0/0`, `∞/∞`, `0·∞`,
`∞−∞`, `0⁰`, `∞⁰`, `1^∞`) in `Theorems`, and, in `Failures`, witnesses
that the pattern alone never determines the answer — different functions
realizing the same `0/0` or `1^∞` shape can have different limits.
-/
