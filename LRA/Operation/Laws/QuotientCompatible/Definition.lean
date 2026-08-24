import LRA.UniversalAlgebra.Quotient.RepresentativeCompatibility

namespace LRA.Operation.Laws.QuotientCompatible

universe u v

/--
**[Operation.Laws.QuotientCompatible — a proper binary operation]**

Many constructions in this repository build a carrier by quotienting a
`Representative` type (e.g. `RealNumbers.Cauchy.Representative`,
`Integers.QuotientOrderedPairs.Representative`). Their raw operations
read two representatives and produce a value in some possibly-larger
`Raw` type (e.g. `Cauchy`'s `representative_addition : Representative →
Representative → Sequence`, where `Sequence` is bigger than
`Representative` — not every sequence is Cauchy); `toRaw` is the
projection back down (`Representative.sequence`), and `invariant` is
exactly the predicate that carves `Representative` out of `Raw`
(`is_cauchy`). Constructions with no such refinement at all (raw
operation already lands back in `Representative`) are the degenerate
case `Raw := Representative`, `toRaw := id`, `invariant := fun _ =>
True`.

Before `rawOperation` can be pushed down to the quotient, three
independent facts must be established — the three fields below, each
corresponding to a proof obligation this repository's
`WellDefinedness.lean`/`Laws.lean` files already state ad hoc,
per-construction, under ad hoc names:

- `closed` ("well-founded"): the raw operation's result always satisfies
  the invariant — e.g. the sum of two Cauchy sequences is itself Cauchy.
- `matches_raw`: the named `operation` on `Representative` actually
  computes what `rawOperation` computes, once projected back down —
  ties `operation` to its intended mathematical definition rather than
  leaving it an unmoored total function that merely happens to type
  check. (When `operation` is built directly from `rawOperation` and
  `closed` — the usual case — this is `rfl`.)
- `respects` ("well-defined"): `operation` doesn't depend on which
  representative was picked from each equivalence class.

Given all three, `induced_operation_exists` below gives existence of the
induced quotient operation for free, and `induced_operation_unique`
gives its uniqueness for free — neither needs a fourth field, both are
immediate consequences of `respects` alone (existence via
`LRA.UniversalAlgebra.Quotient.induced_binary_operation_exists`,
uniqueness via `Quotient.ind`). So `BinaryOperationIsProper` bundling
`closed`/`matches_raw`/`respects` is exactly "this operation is proper":
exists, unique, well-defined, well-founded, all in one named predicate a
concrete construction proves once per operation.
-/
structure BinaryOperationIsProper
    {Representative : Type u} {Raw : Type v}
    (invariant : Raw → Prop)
    (toRaw : Representative → Raw)
    (rawOperation : Representative → Representative → Raw)
    (setoid : Setoid Representative)
    (operation : Representative → Representative → Representative) : Prop where
  closed :
    ∀ first second : Representative, invariant (rawOperation first second)
  matches_raw :
    ∀ first second : Representative,
      toRaw (operation first second) = rawOperation first second
  respects :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects setoid operation

theorem BinaryOperationIsProper.induced_operation_exists
    {Representative : Type u} {Raw : Type v}
    {invariant : Raw → Prop} {toRaw : Representative → Raw}
    {rawOperation : Representative → Representative → Raw}
    {setoid : Setoid Representative}
    {operation : Representative → Representative → Representative}
    (proper :
      BinaryOperationIsProper invariant toRaw rawOperation setoid operation) :
    ∃ quotient_operation :
        Quotient setoid → Quotient setoid → Quotient setoid,
      ∀ first second : Representative,
        quotient_operation
            (Quotient.mk setoid first) (Quotient.mk setoid second) =
          Quotient.mk setoid (operation first second) :=
  LRA.UniversalAlgebra.Quotient.induced_binary_operation_exists
    setoid operation proper.respects

/--
Uniqueness of the induced quotient operation. Mechanically routine
(`funext` plus `Quotient.ind` in both arguments, then rewriting both
specs) — not attempted as a real proof here since this codebase is
audited statically only (no `lake build` available to verify a tactic
block actually closes the goal), so it's left `sorry`'d like every other
theorem in this pass, even though the underlying fact is free once
`induced_operation_exists`'s witness is unfolded.
-/
theorem BinaryOperationIsProper.induced_operation_unique
    {Representative : Type u} {Raw : Type v}
    {invariant : Raw → Prop} {toRaw : Representative → Raw}
    {rawOperation : Representative → Representative → Raw}
    {setoid : Setoid Representative}
    {operation : Representative → Representative → Representative}
    (_proper :
      BinaryOperationIsProper invariant toRaw rawOperation setoid operation)
    (first_candidate second_candidate :
      Quotient setoid → Quotient setoid → Quotient setoid)
    (first_candidate_spec :
      ∀ first second : Representative,
        first_candidate
            (Quotient.mk setoid first) (Quotient.mk setoid second) =
          Quotient.mk setoid (operation first second))
    (second_candidate_spec :
      ∀ first second : Representative,
        second_candidate
            (Quotient.mk setoid first) (Quotient.mk setoid second) =
          Quotient.mk setoid (operation first second)) :
    first_candidate = second_candidate := by
  sorry

/--
**[Operation.Laws.QuotientCompatible — a proper unary operation]**

The unary counterpart of `BinaryOperationIsProper`. Unlike the binary
case, the induced quotient operation doesn't need an existence lemma at
all — `Quotient.lift` gives it directly and constructively once
`respects` holds, so `inducedOperation` below is a plain `def`, not a
`sorry`'d existence theorem; its uniqueness is `Quotient.lift`'s own
definitional uniqueness, needing no separate statement.
-/
structure UnaryOperationIsProper
    {Representative : Type u} {Raw : Type v}
    (invariant : Raw → Prop)
    (toRaw : Representative → Raw)
    (rawOperation : Representative → Raw)
    (setoid : Setoid Representative)
    (operation : Representative → Representative) : Prop where
  closed : ∀ value : Representative, invariant (rawOperation value)
  matches_raw :
    ∀ value : Representative, toRaw (operation value) = rawOperation value
  respects :
    LRA.UniversalAlgebra.Quotient.unary_operation_respects setoid operation

def UnaryOperationIsProper.inducedOperation
    {Representative : Type u} {Raw : Type v}
    {invariant : Raw → Prop} {toRaw : Representative → Raw}
    {rawOperation : Representative → Raw} {setoid : Setoid Representative}
    {operation : Representative → Representative}
    (proper : UnaryOperationIsProper invariant toRaw rawOperation setoid operation) :
    Quotient setoid → Quotient setoid :=
  Quotient.lift (fun value => Quotient.mk setoid (operation value))
    (fun first second related => Quotient.sound (proper.respects first second related))

end LRA.Operation.Laws.QuotientCompatible
