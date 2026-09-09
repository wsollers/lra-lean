import LRA.ModelTheory.Model
import LRA.ModelTheory.Comparison
import LRA.ModelTheory.Theory

namespace LRA.ModelTheory

/--
`FOLModel` Thin compatibility spine for first-order model theory. This is the standardized entrypoint over the existing `FirstOrder` implementation layer.

Predicate logic:

  abbrev FOLModel := FirstOrder.Model

Predicate logic (unfolded):

  abbrev FOLModel := FirstOrder.Model (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev FOLModel := FirstOrder.Model
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev FOLModel := FirstOrder.Model

end LRA.ModelTheory
