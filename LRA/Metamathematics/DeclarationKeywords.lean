
import Lean

open Lean

syntax (name := corollary) (priority := default + 1) declModifiers
  group("corollary " declId ppIndent(declSig) declVal) : command

/--
`expandCorollary` TODO

Predicate logic:

  def expandCorollary : Macro := fun stx =>
    let stx := stx.modifyArg 1 fun stx =>
      let stx := stx.modifyArg 0 (mkAtomFrom · "theorem" (canonical := true))
      stx.setKind ``Parser.Command.theorem
    pure <| stx.setKind ``Parser.Command.declaration

Predicate logic (unfolded):

  def expandCorollary : Macro := fun stx =>
    let stx := stx.modifyArg 1 fun stx =>
      let stx := stx.modifyArg 0 (mkAtomFrom · "theorem" (canonical := true))
      stx.setKind ``Parser.Command.theorem
    pure <| stx.setKind ``Parser.Command.declaration (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def expandCorollary : Macro := fun stx =>
  let stx := stx.modifyArg 1 fun stx =>
    let stx := stx.modifyArg 0 (mkAtomFrom · "theorem" (canonical := true))
    stx.setKind ``Parser.Command.theorem
  pure <| stx.setKind ``Parser.Command.declaration
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
@[macro «corollary»] def expandCorollary : Macro := fun stx =>
  let stx := stx.modifyArg 1 fun stx =>
    let stx := stx.modifyArg 0 (mkAtomFrom · "theorem" (canonical := true))
    stx.setKind ``Parser.Command.theorem
  pure <| stx.setKind ``Parser.Command.declaration

syntax (name := proposition) (priority := default + 1) declModifiers
  group("proposition " declId ppIndent(declSig) declVal) : command

/--
`expandProposition` TODO

Predicate logic:

  def expandProposition : Macro := fun stx =>
    let stx := stx.modifyArg 1 fun stx =>
      let stx := stx.modifyArg 0 (mkAtomFrom · "theorem" (canonical := true))
      stx.setKind ``Parser.Command.theorem
    pure <| stx.setKind ``Parser.Command.declaration

Predicate logic (unfolded):

  def expandProposition : Macro := fun stx =>
    let stx := stx.modifyArg 1 fun stx =>
      let stx := stx.modifyArg 0 (mkAtomFrom · "theorem" (canonical := true))
      stx.setKind ``Parser.Command.theorem
    pure <| stx.setKind ``Parser.Command.declaration (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def expandProposition : Macro := fun stx =>
  let stx := stx.modifyArg 1 fun stx =>
    let stx := stx.modifyArg 0 (mkAtomFrom · "theorem" (canonical := true))
    stx.setKind ``Parser.Command.theorem
  pure <| stx.setKind ``Parser.Command.declaration
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
@[macro «proposition»] def expandProposition : Macro := fun stx =>
  let stx := stx.modifyArg 1 fun stx =>
    let stx := stx.modifyArg 0 (mkAtomFrom · "theorem" (canonical := true))
    stx.setKind ``Parser.Command.theorem
  pure <| stx.setKind ``Parser.Command.declaration

namespace LRA.Metamathematics.DeclarationKeywords.SmokeTest

/--
`corollary_smoke_test` TODO

Predicate logic:

  ∀ (a : Nat), instHAdd.hAdd a 0 = a

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    a : Nat
  Prove
    { hAdd := fun a b => instAddNat.add a b }.hAdd a 0 = a

Logical form (Lean):

```lean
corollary corollary_smoke_test (a : Nat) : a + 0 = a
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
corollary corollary_smoke_test (a : Nat) : a + 0 = a := by
  sorry
proposition proposition_smoke_test (a b : Nat) : a + b = b + a := by
  sorry
