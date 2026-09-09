import LRA.ProofTheory.System

namespace LRA.ProofTheory

/--
`FOLProofSystem` Thin compatibility spine for first-order proof theory. This re-exports the generic proof-system layer together with the current Takeuti calculi.

Predicate logic:

  abbrev FOLProofSystem := System.ProofSystem

Predicate logic (unfolded):

  abbrev FOLProofSystem := System.ProofSystem (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev FOLProofSystem := System.ProofSystem
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
abbrev FOLProofSystem := System.ProofSystem
/--
`FOLDERivable` TODO

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
abbrev FOLDERivable := System.Derivable
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
abbrev FOLDERivable := System.Derivable
/--
`FOLLK` TODO

Predicate logic:

  abbrev FOLLK := System.Takeuti.LK

Predicate logic (unfolded):

  abbrev FOLLK := System.Takeuti.LK (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev FOLLK := System.Takeuti.LK
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
abbrev FOLLK := System.Takeuti.LK
/--
`FOLLJ` TODO

Predicate logic:

  abbrev FOLLJ := System.Takeuti.LJ

Predicate logic (unfolded):

  abbrev FOLLJ := System.Takeuti.LJ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev FOLLJ := System.Takeuti.LJ
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
abbrev FOLLJ := System.Takeuti.LJ

end LRA.ProofTheory
