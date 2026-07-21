namespace LRA.VolumeI.Logic.Propositional

/-!
Propositional languages.

Propositional logic's vocabulary is not a `Signature` -- it has no
function symbols, no relation symbols, no constants, and no domain to
interpret any of those against. Its only non-logical content is a bare set
of propositional atoms: distinguishable propositions with no internal
structure (no arity, no arguments, nothing to apply them to). This is a
different *kind* of vocabulary from `Signature`'s, not merely a smaller
instance of it -- exactly why `PropositionalLanguage` is its own type here,
not a `Signature` with `Functions`/`Relations` both `Empty`.

`PropositionalLanguage` deliberately does not declare which connectives are
available. Which connectives are primitive (the usual `¬`/`→`-with-derived-
rest presentation, a NAND-only presentation, or otherwise) is a property of
the `Formula` type built on a given atom set, not of the atom set itself --
two different connective presentations over the *same* atoms are two
different `Formula` inductive types (as the earlier NAND-based propositional
work already demonstrated), needing a translation theorem to connect them,
not a field on `PropositionalLanguage` to select between them.
-/

/-- A propositional language: a bare, structureless set of propositional
atoms. Everything else needed to build propositional formulas -- which
connectives are primitive, how formulas are evaluated -- is supplied
separately, on top of a chosen `Atoms` type, not as part of the language
itself. -/
structure PropositionalLanguage where
  Atoms : Type

end LRA.VolumeI.Logic.Propositional
