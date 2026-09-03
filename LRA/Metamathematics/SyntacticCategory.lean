namespace LRA.Metamathematics

/-!
`SyntacticCategory` names the metatheoretic obligation every proof system
in this repository must satisfy for each kind of symbol it distinguishes
(variables, free-variable slots, bound-variable slots, function symbols,
relation symbols, ...): whatever type is chosen to represent that
category must have decidable equality, because "is this occurrence the
same symbol as that one" has to be a decidable question before
substitution, free-variable computation, or any other syntactic
operation can be defined by recursion on structure.

This is deliberately a SCHEMA, not a choice of representation. Different
proof systems in this repository make different, independently valid
design decisions about how many syntactic categories they need and how
those categories relate:

- `LRA.Logic.Syntax.FirstOrder` uses a single `Variable` type for both
  free and bound occurrences (see `Formula.forallQ : Variable ->
  Formula S Variable -> Formula S Variable`), with `[DecidableEq
  Variable]` assumed ambiently wherever needed (`IsSubstitutable`,
  `freeVariables`, `Theory`).
- `LRA.ProofTheory.System.Takeuti` uses TWO distinct types, `FreeVar` and
  `BoundVar`, as separate fields of `Alphabet`, with no `DecidableEq`
  requirement currently stated on either.

`SyntacticCategory` does not adjudicate between these choices -- both are
legitimate instances of "a category of syntactic object with decidable
identity," and whether free/bound variables should share one type or two
is a per-system design question, not a metatheoretic universal. What
this file DOES assert is the schema itself, so that:

(a) any future proof system added to this repository has a named
    obligation to satisfy, rather than silently assuming `DecidableEq`
    the way `LRA.Logic.Syntax.FirstOrder` currently does without comment;
(b) `LRA.ProofTheory.System.Takeuti.Alphabet` can be checked against this
    schema once it stabilizes, to confirm `FreeVar`/`BoundVar` should
    carry `DecidableEq` too -- currently an open question, not yet
    required by any Takeuti file's actual usage, and deliberately left
    unresolved here pending that system's own completion.
-/

/-- A syntactic category is a type together with a witness that equality
on it is decidable -- the minimal structure needed before any recursive
syntactic operation (substitution, free-variable computation, structural
comparison) can be defined on expressions built from it. -/
class SyntacticCategory (Symbol : Type u) where
  decidableEquality : DecidableEq Symbol

attribute [instance] SyntacticCategory.decidableEquality

/-- Two syntactic-category instances agree on a shared underlying type
iff their decidable-equality witnesses agree pointwise -- stated as the
uniqueness fact that licenses treating "the" `SyntacticCategory Symbol`
instance as canonical once one is fixed, rather than worrying that a
different instance might silently disagree about which occurrences count
as the same symbol. -/
theorem SyntacticCategory.decidableEquality_unique
    {Symbol : Type u} (inst1 inst2 : SyntacticCategory Symbol) :
    ∀ x y : Symbol,
      @Decidable.decide (x = y) (inst1.decidableEquality x y) =
      @Decidable.decide (x = y) (inst2.decidableEquality x y) := by
  sorry
end LRA.Metamathematics
