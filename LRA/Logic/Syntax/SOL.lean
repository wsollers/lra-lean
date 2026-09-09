import LRA.Logic.Syntax.SecondOrder
import LRA.Logic.Syntax.SecondOrderMonadic

namespace LRA.Logic

/--
`SOLTerm` General `SOL` syntax in `LRA.Logic`. The canonical `SOLFormula` now denotes the general second-order formula layer, while the monadic path remains available as an explicit specialization.

Predicate logic:

  abbrev SOLTerm := SecondOrder.Term

Predicate logic (unfolded):

  abbrev SOLTerm := SecondOrder.Term (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev SOLTerm := SecondOrder.Term
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
abbrev SOLTerm := SecondOrder.Term
/--
`SOLFormula` TODO

Predicate logic:

  abbrev SOLFormula := SecondOrder.Formula

Predicate logic (unfolded):

  abbrev SOLFormula := SecondOrder.Formula (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev SOLFormula := SecondOrder.Formula
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
abbrev SOLFormula := SecondOrder.Formula
/--
`MonadicSOLFormula` TODO

Predicate logic:

  abbrev MonadicSOLFormula := SecondOrderMonadic.SOFormula

Predicate logic (unfolded):

  abbrev MonadicSOLFormula := SecondOrderMonadic.SOFormula (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev MonadicSOLFormula := SecondOrderMonadic.SOFormula
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
abbrev MonadicSOLFormula := SecondOrderMonadic.SOFormula

end LRA.Logic
