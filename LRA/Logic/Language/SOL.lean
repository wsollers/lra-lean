import LRA.Logic.Language.SecondOrder
import LRA.Logic.Language.SecondOrderMonadic

namespace LRA.Logic

/--
`SOLLanguage` General `SOL` surface in `LRA.Logic`. The canonical `SOLLanguage` now denotes the general second-order layer, while the monadic path remains available as a compatibility specialization.

Predicate logic:

  abbrev SOLLanguage := SecondOrder.SecondOrderLanguage

Predicate logic (unfolded):

  abbrev SOLLanguage := SecondOrder.SecondOrderLanguage (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev SOLLanguage := SecondOrder.SecondOrderLanguage
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
abbrev SOLLanguage := SecondOrder.SecondOrderLanguage
/--
`MonadicSOLLanguage` TODO

Predicate logic:

  abbrev MonadicSOLLanguage := SecondOrderMonadic.SecondOrderMonadicLanguage

Predicate logic (unfolded):

  abbrev MonadicSOLLanguage := SecondOrderMonadic.SecondOrderMonadicLanguage (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev MonadicSOLLanguage := SecondOrderMonadic.SecondOrderMonadicLanguage
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
abbrev MonadicSOLLanguage := SecondOrderMonadic.SecondOrderMonadicLanguage

end LRA.Logic
