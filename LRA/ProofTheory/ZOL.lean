import LRA.ProofTheory.System.Basic
import LRA.ProofTheory.System.Derivation

namespace LRA.ProofTheory

/--
`ZOLProofSystem` Thin compatibility spine for zero-order/propositional proof theory. This currently exposes the generic proof-system layer while dedicated propositional calculi are developed.

Predicate logic:

  abbrev ZOLProofSystem := System.ProofSystem

Predicate logic (unfolded):

  abbrev ZOLProofSystem := System.ProofSystem (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev ZOLProofSystem := System.ProofSystem
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
abbrev ZOLProofSystem := System.ProofSystem
/--
`ZOLDerivable` TODO

Predicate logic:

  ∀ (P : LRA.ProofTheory.System.ProofSystem) (a : P.Judgement), LRA.ProofTheory.System.Derivable P a

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.ProofTheory.System.Derivable P a

Logical form (Lean):

```lean
abbrev ZOLDerivable := System.Derivable
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
abbrev ZOLDerivable := System.Derivable

end LRA.ProofTheory
