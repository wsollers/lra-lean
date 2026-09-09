import LRA.ProofTheory.System.Basic
import LRA.ProofTheory.System.Derivation

namespace LRA.ProofTheory

/--
`SOLProofSystem` Thin compatibility spine for second-order proof theory. This currently exposes the generic proof-system layer only; second-order-specific calculi can be added under this standardized surface later.

Predicate logic:

  abbrev SOLProofSystem := System.ProofSystem

Predicate logic (unfolded):

  abbrev SOLProofSystem := System.ProofSystem (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev SOLProofSystem := System.ProofSystem
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
abbrev SOLProofSystem := System.ProofSystem
/--
`SOLDERivable` TODO

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
abbrev SOLDERivable := System.Derivable
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
abbrev SOLDERivable := System.Derivable

end LRA.ProofTheory
