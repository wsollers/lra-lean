import LRA.VolumeI.Logic.Language.Symbols.Signature

namespace LRA.VolumeI.Logic

/-!
Terms.

A term over a signature `S`, with variables drawn from some type
`Variable`, is one of:

  - a variable,
  - a constant symbol of `S`, or
  - a function symbol of `S` applied to exactly `arity f` many smaller
    terms (packaged as a `Fin (arity f)`-indexed family, the same shape
    used throughout `Signature`/`Model` for arity-indexed arguments).

This is pure syntax: nothing here mentions a domain, an interpretation, or
truth. A term is a recipe -- "take this variable, apply this function
symbol to these arguments" -- that only denotes an actual element once it
is paired with a `Model S` and an assignment of domain elements to
variables, via term evaluation (not defined here; that is the first place
`Term` and `Model` meet, and belongs in `Semantics`, not `Syntax`).

`Variable` is left as a free type parameter rather than fixed to `Nat` (the
literal `Vbl := {vn | n ∈ N0}` of the alphabet definition). Nothing about a
term's formation depends on what the variable type is, and leaving it open
lets worked examples use readable variable names (`x`, `y`, `z`) while the
canonical `Nat`-indexed family remains available as `Term S Nat` whenever
the literal correspondence to the alphabet definition is wanted.

`const` is a constructor in its own right, not a derived case of `apply` at
arity `0` -- because `Signature.Constants` is its own independent field
(constants are not modeled as arity-0 function symbols; see
`Language.Symbols.Signature`), `Term` needs its own constructor to consume
it, matching `Model.interpretConstant` being its own independent field
rather than a special case of `interpretFunction`.
-/

inductive Term (S : Signature) (Variable : Type) where
  | var : Variable -> Term S Variable
  | const : S.Constants -> Term S Variable
  | apply :
      (f : S.FunctionSymbol) ->
      (Fin (S.functionArity f) -> Term S Variable) ->
      Term S Variable

end LRA.VolumeI.Logic
