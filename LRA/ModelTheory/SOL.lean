import LRA.ModelTheory.SecondOrder
import LRA.ModelTheory.SecondOrderMonadic
import LRA.ModelTheory.Theory

namespace LRA.ModelTheory

/--
`SOLModel` Thin compatibility spine for second-order model theory. The canonical `SOL` surface now names the general second-order layer, while the established monadic path remains available as an explicit specialization.

Predicate logic:

  abbrev SOLModel := SecondOrder.HenkinModel

Predicate logic (unfolded):

  abbrev SOLModel := SecondOrder.HenkinModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev SOLModel := SecondOrder.HenkinModel
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
abbrev SOLModel := SecondOrder.HenkinModel
/--
`SOLHenkinModel` TODO

Predicate logic:

  abbrev SOLHenkinModel := SecondOrder.HenkinModel

Predicate logic (unfolded):

  abbrev SOLHenkinModel := SecondOrder.HenkinModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev SOLHenkinModel := SecondOrder.HenkinModel
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
abbrev SOLHenkinModel := SecondOrder.HenkinModel
/--
`SOLFullModel` TODO

Predicate logic:

  abbrev SOLFullModel := SecondOrder.FullModel

Predicate logic (unfolded):

  abbrev SOLFullModel := SecondOrder.FullModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev SOLFullModel := SecondOrder.FullModel
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
abbrev SOLFullModel := SecondOrder.FullModel
/--
`MonadicSOLHenkinModel` TODO

Predicate logic:

  abbrev MonadicSOLHenkinModel := SecondOrderMonadic.HenkinModel

Predicate logic (unfolded):

  abbrev MonadicSOLHenkinModel := SecondOrderMonadic.HenkinModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev MonadicSOLHenkinModel := SecondOrderMonadic.HenkinModel
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
abbrev MonadicSOLHenkinModel := SecondOrderMonadic.HenkinModel
/--
`MonadicSOLFullModel` TODO

Predicate logic:

  abbrev MonadicSOLFullModel := SecondOrderMonadic.FullModel

Predicate logic (unfolded):

  abbrev MonadicSOLFullModel := SecondOrderMonadic.FullModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev MonadicSOLFullModel := SecondOrderMonadic.FullModel
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
abbrev MonadicSOLFullModel := SecondOrderMonadic.FullModel

end LRA.ModelTheory
