import LRA.VolumeI.Logic.Language.FirstOrder.Signature

namespace LRA.VolumeI.Logic.SecondOrderMonadic

/-!
Monadic second-order languages.

Second-order quantification (`∀X. φ(X)`, `X` ranging over subsets of the
domain) adds a new *syntactic* category on top of a formula language --
relation/set variables -- but touches nothing about the fixed, non-logical
vocabulary a theory already has. PA and PA₂ (its second-order extension
with the induction axiom stated as `∀X. ...`) share the identical
signature `⟨0, succ⟩`; only the *logic* built on top differs.

`SecondOrderMonadicLanguage` accordingly aliases the same `Signature` used
by first-order logic, purely as a documentation device -- marking, at the
type level and at call sites, "this signature is being used in a monadic
second-order context" -- not because it carries different data. This
mirrors `FirstOrderLanguage`'s own reason for existing: some sources call
the shared data a signature, others a language, and both names are worth
keeping as an explicit record of that variance rather than picking one.

"Monadic" restricts something entirely different from the signature: it
restricts the arity of *second-order variables* (`X` in `∀X. φ(X)`) to
unary only -- equivalently, quantification ranges over subsets of the
domain, not over arbitrary-arity relations. This restriction lives in the
shape of `SOFormula`'s constructors (`Syntax.SecondOrderMonadic`), not
here: a signature's own relations and functions keep whatever arity they
already have, completely unrestricted, exactly as in first-order logic.
-/

/-- `SecondOrderMonadicLanguage` is exactly `Signature` -- see the module
doc for why this alias exists alongside `FirstOrderLanguage`. -/
abbrev SecondOrderMonadicLanguage := Signature

end LRA.VolumeI.Logic.SecondOrderMonadic
