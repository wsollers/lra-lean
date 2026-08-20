-- LRA/Meta/DeclarationKeywords.lean
-- Command-keyword aliases so a Lean declaration's keyword can match its
-- LaTeX theorem-environment classification (`corollary`, `proposition`, ...)
-- instead of every result being flattened to `theorem`. `lemma` already
-- ships as a `theorem` synonym via Mathlib (`Mathlib.Tactic.Lemma`); this
-- file adds the remaining classifications this project's LaTeX source uses.
--
-- Each new keyword expands to `theorem` by rewriting the parsed syntax node
-- in place -- the same technique Mathlib uses for `lemma` -- so a
-- declaration written with `corollary` or `proposition` is, to the kernel
-- and to every downstream tool (docs, `#print`, `exact?`, ...), an ordinary
-- `theorem`. Only the surface keyword differs; nothing about elaboration,
-- proof irrelevance, or environment registration changes.
--
-- USAGE (manual / opt-in -- current policy):
--   Add this one line near the top of any file that wants `corollary` or
--   `proposition` as a declaration keyword:
--
--     import LRA.Meta.DeclarationKeywords
--
--   Command syntax, like everything else in Lean, is only visible once its
--   defining module is imported (directly or transitively) -- there is no
--   global registration that happens just by this file existing under
--   `LRA/`. Right now nothing else in the repo imports this module, so
--   `corollary`/`proposition` are unusable until a file opts in explicitly
--   with the line above. This is deliberate: existing `theorem`-heavy files
--   are unaffected until someone deliberately reclassifies a result.
--
-- HOW TO MAKE THEM GLOBAL LATER (not done yet -- do this only when we
-- decide to roll it out repo-wide):
--   Command syntax propagates the same way any other declaration does: a
--   file gets it by importing (transitively) whatever file defines it. So
--   "global" just means "imported from somewhere everything else already
--   imports." Two ways to get there, in order of how much they touch:
--     1. Broad-but-partial: add `import LRA.Meta.DeclarationKeywords` to a
--        widely-imported subject root that most construction chains already
--        pull in, e.g. `LRA/AlgebraicStructures.lean` (most `Carrier.lean`
--        files import it already) -- gets most of the tree without editing
--        every file, but anything outside that import fan-in still needs
--        its own import.
--     2. Fully universal: add `import LRA.Meta.DeclarationKeywords` to
--        `LRA.lean`, the repo's top-level aggregate -- but note `LRA.lean`
--        is the *root* of the import graph (it imports the subject
--        routers; they don't import it back), so this only reaches files
--        that themselves import `LRA.lean` or one of its importers, not
--        every leaf `Carrier.lean`/`WellDefinedness.lean` in the subject
--        tree. True 100% coverage would mean adding the import to each
--        subject root (`LRA/Logic.lean`, `LRA/Set.lean`, `LRA/Order.lean`,
--        `LRA/AlgebraicStructures.lean`, ...) individually.
--   Either way, this is a one-line addition per file/root -- nothing about
--   the syntax/macro definitions below needs to change to "turn on" wider
--   visibility.

import Lean

open Lean

/-- `corollary` means the same as `theorem`. Use it for a result that
follows readily from a preceding theorem, matching a LaTeX
`\begin{corollary}...\end{corollary}` block. -/
syntax (name := corollary) (priority := default + 1) declModifiers
  group("corollary " declId ppIndent(declSig) declVal) : command

/-- Implementation of the `corollary` command, by syntax-node rewrite to
`theorem` (mirrors `Mathlib.Tactic.Lemma.expandLemma`). -/
@[macro «corollary»] def expandCorollary : Macro := fun stx =>
  let stx := stx.modifyArg 1 fun stx =>
    let stx := stx.modifyArg 0 (mkAtomFrom · "theorem" (canonical := true))
    stx.setKind ``Parser.Command.theorem
  pure <| stx.setKind ``Parser.Command.declaration

/-- `proposition` means the same as `theorem`. Use it for a standalone
claim of independent interest, matching a LaTeX
`\begin{proposition}...\end{proposition}` block. -/
syntax (name := proposition) (priority := default + 1) declModifiers
  group("proposition " declId ppIndent(declSig) declVal) : command

/-- Implementation of the `proposition` command, by syntax-node rewrite to
`theorem` (mirrors `Mathlib.Tactic.Lemma.expandLemma`). -/
@[macro «proposition»] def expandProposition : Macro := fun stx =>
  let stx := stx.modifyArg 1 fun stx =>
    let stx := stx.modifyArg 0 (mkAtomFrom · "theorem" (canonical := true))
    stx.setKind ``Parser.Command.theorem
  pure <| stx.setKind ``Parser.Command.declaration

/-! ## Smoke tests: both keywords elaborate as ordinary `theorem`s

Namespaced so the test names don't crowd the global namespace of every file
that transitively imports this one.
-/

namespace LRA.Meta.DeclarationKeywords.SmokeTest

corollary corollary_smoke_test (a : Nat) : a + 0 = a := rfl

proposition proposition_smoke_test (a b : Nat) : a + b = b + a := Nat.add_comm a b

-- If either keyword failed to expand to a real `theorem`, this `#check`
-- would not type-check against the plain propositional statement.
#check (corollary_smoke_test : ∀ a : Nat, a + 0 = a)
#check (proposition_smoke_test : ∀ a b : Nat, a + b = b + a)

end LRA.Meta.DeclarationKeywords.SmokeTest
