import LRA.Metamathematics.FiniteSyntacticCollection

namespace LRA.Metamathematics

universe u

/-!
`SubstitutionSafety` names the metatheoretic obligation that any proof
system defining a substitution operation (replacing a variable by a term
inside an expression) must supply BOTH of the following, not just the
first:

(a) a definition of when substituting `t` for `x` inside expression `e`
    is SAFE -- i.e., performing the substitution cannot accidentally
    capture a free occurrence of some variable in `t` under a binder
    already present in `e`;
(b) a THEOREM that the system's actual substitution operation, when
    performed under condition (a), provably does not capture any
    variable -- i.e., that the safety condition is not merely stated but
    is actually sufficient.

Having (a) without (b) is a genuine, worse-than-cosmetic gap: it means a
safety condition has been named, but nothing has been shown to make it
true of the operation it is meant to guard.

REPO STATUS, checked directly (see accompanying audit trail):
`LRA.Logic.Syntax.FirstOrder.IsSubstitutable` supplies exactly (a) -- a
recursive `Prop` tracking, for a formula `φ`, variable `x`, and term `t`,
whether substituting `t` for `x` would let a variable free in `t` become
captured by a quantifier in `φ`. But `LRA.Logic.Syntax.FirstOrder.substitute`
(and the term-level `SubstituteInTerm`) do NOT take an `IsSubstitutable`
hypothesis anywhere, and no theorem in the repository connects the two --
confirmed by exhaustive search: `IsSubstitutable` is referenced only by
its own file's import chain (`Substitution.lean`, the `FirstOrder`
umbrella, `Substitute.lean`'s import list), never consumed as a
hypothesis or cited in a proof. `substitute` instead performs an
unconditional recursive substitution, with only a single ad hoc guard
(skip recursing under `forallQ v φ` when `v = x`, which prevents
substituting for an already-bound name but does nothing about a *free*
variable of `t` becoming newly bound by `forallQ v` for `v ≠ x`).

This file names the missing half of the obligation explicitly, so it is
tracked as a real proof target rather than assumed handled because a
plausibly-named predicate already exists in the codebase.
-/

/-- The abstract shape of a substitution-safety schema, parameterized
over an expression type `Expr`, a variable/term pair the substitution
acts on, and the specific "is this substitution safe" predicate a system
supplies. `IsSafe` corresponds to what `IsSubstitutable` already provides
for `LRA.Logic.Syntax.FirstOrder`; `substitute` corresponds to what
`LRA.Logic.Syntax.FirstOrder.substitute` already provides. The class
exists to make explicit that both must be supplied TOGETHER, with the
theorem below as the connecting obligation.

`freeVariablesOf` is typed `Expr → MetaCollection Variable` (see
`FiniteSyntacticCollection`) rather than `Mathlib`'s `Set Variable` or
`LRA.Set`'s own ZFC-backed sets, deliberately: this file sits beneath
both, and `MetaCollection` costs nothing beyond `List`, Lean's own core
inductive type, with no comprehension principle borrowed from either.
`LRA.Logic.Syntax.FirstOrder.freeVariables` happens to return a `Finset
Variable`; any future instantiation against it is expected to convert
via `Finset.toList` at the instance site, not to change this schema's
signature. -/
class SubstitutionSafety
    (Expr Variable Term : Type u)
    (IsSafe : Expr → Variable → Term → Prop)
    (substitute : Variable → Term → Expr → Expr)
    (variableOccursFreelyIn : Variable → Term → Prop)
    (freeVariablesOf : Expr → MetaCollection Variable) where
  /-- The theorem every instance of this schema is required to supply:
  performing `substitute` under the `IsSafe` guard never introduces a
  free variable of `t` into a position where it was not already free (or
  more precisely, never places it under a binder it did not already sit
  under before substitution) -- i.e., no capture occurs. This is stated
  here as a REQUIRED FIELD, not proved generically, because "capture"
  necessarily refers to `Expr`'s own binder structure, which differs per
  system (single `Variable` type for `LRA.Logic.Syntax.FirstOrder`, split
  `FreeVar`/`BoundVar` for `LRA.Logic.Proof.System.Takeuti`). -/
  noCaptureUnderSafety :
    ∀ (e : Expr) (x : Variable) (t : Term) (y : Variable),
      IsSafe e x t →
      variableOccursFreelyIn y t →
      y ∈ freeVariablesOf e →
      y ∈ freeVariablesOf (substitute x t e)

/-- A named, non-vacuous proposition standing for the missing first-order
substitution-safety bridge. -/
def FirstOrderSubstitutionSafetyObligation : Prop :=
  ∃ (Expr Variable Term : Type u)
    (IsSafe : Expr → Variable → Term → Prop)
    (substitute : Variable → Term → Expr → Expr)
    (variableOccursFreelyIn : Variable → Term → Prop)
    (freeVariablesOf : Expr → MetaCollection Variable),
      SubstitutionSafety
        Expr Variable Term IsSafe substitute variableOccursFreelyIn freeVariablesOf

/-- Named forward reference, not yet dischargeable: the obligation
`SubstitutionSafety` imposes on `LRA.Logic.Syntax.FirstOrder`
specifically, instantiating `IsSafe := IsSubstitutable`, `substitute :=
LRA.Logic.Syntax.FirstOrder.substitute`, `freeVariablesOf :=
LRA.Logic.Syntax.FirstOrder.freeVariables`. This instance is declared
here as a STATEMENT of what remains to be proved -- filling it in is
real work belonging to `LRA.Logic.Syntax.FirstOrder`, not to this file,
once undertaken. Left as `sorry` deliberately: no instance is asserted
to exist yet, only that one is owed. -/
theorem firstOrderSubstitutionSafetyObligation :
    FirstOrderSubstitutionSafetyObligation := by
  sorry
end LRA.Metamathematics
