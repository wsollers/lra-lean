import LRA.Identity.Interface.Logic.FirstOrder.Language
import LRA.Logic.Syntax.FirstOrder.Formula

namespace LRA.Identity

open LRA.Logic
open LRA.Logic.FirstOrder

/--
`equalityAtom` The object-language equality atom `left = right`.

Predicate logic:

  abbrev equalityAtom {S : LRA.Logic.Signature} {Variable : Type}
      (left right : Term S Variable) : Formula S Variable :=
    .equal left right

Predicate logic (unfolded):

  abbrev equalityAtom {S : LRA.Logic.Signature} {Variable : Type}
      (left right : Term S Variable) : Formula S Variable :=
    .equal left right (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev equalityAtom {S : LRA.Logic.Signature} {Variable : Type}
    (left right : Term S Variable) : Formula S Variable :=
  .equal left right
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
abbrev equalityAtom {S : LRA.Logic.Signature} {Variable : Type}
    (left right : Term S Variable) : Formula S Variable :=
  .equal left right

/--
`inequalityAtom` The object-language inequality formula `left != right`, defined as `not (left = right)`.

Predicate logic:

  abbrev inequalityAtom {S : LRA.Logic.Signature} {Variable : Type}
      (left right : Term S Variable) : Formula S Variable :=
    .neg (equalityAtom left right)

Predicate logic (unfolded):

  abbrev inequalityAtom {S : LRA.Logic.Signature} {Variable : Type}
      (left right : Term S Variable) : Formula S Variable :=
    .neg (equalityAtom left right) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev inequalityAtom {S : LRA.Logic.Signature} {Variable : Type}
    (left right : Term S Variable) : Formula S Variable :=
  .neg (equalityAtom left right)
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
abbrev inequalityAtom {S : LRA.Logic.Signature} {Variable : Type}
    (left right : Term S Variable) : Formula S Variable :=
  .neg (equalityAtom left right)

/--
`equalityOfVariables` The equality atom between the variables `left` and `right`.

Predicate logic:

  abbrev equalityOfVariables {S : LRA.Logic.Signature} {Variable : Type}
      (left right : Variable) : Formula S Variable :=
    equalityAtom (.var left) (.var right)

Predicate logic (unfolded):

  abbrev equalityOfVariables {S : LRA.Logic.Signature} {Variable : Type}
      (left right : Variable) : Formula S Variable :=
    equalityAtom (.var left) (.var right) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev equalityOfVariables {S : LRA.Logic.Signature} {Variable : Type}
    (left right : Variable) : Formula S Variable :=
  equalityAtom (.var left) (.var right)
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
abbrev equalityOfVariables {S : LRA.Logic.Signature} {Variable : Type}
    (left right : Variable) : Formula S Variable :=
  equalityAtom (.var left) (.var right)

/--
`inequalityOfVariables` The inequality formula between the variables `left` and `right`.

Predicate logic:

  abbrev inequalityOfVariables {S : LRA.Logic.Signature} {Variable : Type}
      (left right : Variable) : Formula S Variable :=
    inequalityAtom (.var left) (.var right)

Predicate logic (unfolded):

  abbrev inequalityOfVariables {S : LRA.Logic.Signature} {Variable : Type}
      (left right : Variable) : Formula S Variable :=
    inequalityAtom (.var left) (.var right) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev inequalityOfVariables {S : LRA.Logic.Signature} {Variable : Type}
    (left right : Variable) : Formula S Variable :=
  inequalityAtom (.var left) (.var right)
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
abbrev inequalityOfVariables {S : LRA.Logic.Signature} {Variable : Type}
    (left right : Variable) : Formula S Variable :=
  inequalityAtom (.var left) (.var right)

/--
`equalityReflexivityFormula` The reflexive equality formula `variable = variable`.

Predicate logic:

  abbrev equalityReflexivityFormula {S : LRA.Logic.Signature} {Variable : Type}
      (x : Variable) : Formula S Variable :=
    equalityOfVariables x x

Predicate logic (unfolded):

  abbrev equalityReflexivityFormula {S : LRA.Logic.Signature} {Variable : Type}
      (x : Variable) : Formula S Variable :=
    equalityOfVariables x x (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev equalityReflexivityFormula {S : LRA.Logic.Signature} {Variable : Type}
    (x : Variable) : Formula S Variable :=
  equalityOfVariables x x
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
abbrev equalityReflexivityFormula {S : LRA.Logic.Signature} {Variable : Type}
    (x : Variable) : Formula S Variable :=
  equalityOfVariables x x

end LRA.Identity
