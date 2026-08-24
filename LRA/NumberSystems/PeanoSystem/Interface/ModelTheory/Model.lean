
import LRA.NumberSystems.PeanoSystem.Interface.ModelTheory.Theory
import LRA.NumberSystems.PeanoSystem.Interface.ModelTheory.LStructure

namespace LRA.NumberSystems.PeanoSystem.Interface.ModelTheory

/--
`PeanoModel` TODO

Predicate logic:

  structure PeanoModel where
  toHenkinModel : LRA.Logic.SecondOrderMonadic.HenkinModel PeanoFirstOrderSignature
  satisfiesTheory : PeanoTheory toHenkinModel

Predicate logic (unfolded):

  structure PeanoModel where
  toHenkinModel : LRA.Logic.SecondOrderMonadic.HenkinModel PeanoFirstOrderSignature
  satisfiesTheory : PeanoTheory toHenkinModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure PeanoModel where
  toHenkinModel : LRA.Logic.SecondOrderMonadic.HenkinModel PeanoFirstOrderSignature
  satisfiesTheory : PeanoTheory toHenkinModel
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
structure PeanoModel where
  toHenkinModel : LRA.Logic.SecondOrderMonadic.HenkinModel PeanoFirstOrderSignature
  satisfiesTheory : PeanoTheory toHenkinModel

/--
`PeanoSatisfaction` TODO

Predicate logic:

  abbrev PeanoSatisfaction := PeanoModel

Predicate logic (unfolded):

  abbrev PeanoSatisfaction := PeanoModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev PeanoSatisfaction := PeanoModel
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
abbrev PeanoSatisfaction := PeanoModel

end LRA.NumberSystems.PeanoSystem.Interface.ModelTheory
