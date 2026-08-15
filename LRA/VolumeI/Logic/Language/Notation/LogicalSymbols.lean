import LRA.VolumeI.Logic.Language.Symbols.Signature

namespace LRA.Logic.Language.Notation

/-!
The logical symbols of a language.

Per the alphabet definition, every language `L` shares a fixed set of
logical symbols, present regardless of `L`'s similarity type
(`R`, `F`, `C` and their arities, in `Language.Symbols.Signature`):

  - the negation symbol `¬` ("not")
  - the implication symbol `→` ("implies")
  - the universal quantifier `∀` ("for all")
  - the equality symbol `=`

These are declared here, once, as vocabulary -- not as data carried
per-language -- because they are not part of any language's similarity
type; they are logical, not non-logical, symbols. Every concrete object
logic (propositional logic, first-order logic, ...) that wants "the usual"
connectives and quantifier draws on these same declarations rather than
re-declaring its own copies.

Bracket and comma symbols from the alphabet definition are deliberately not
represented here. They exist in the source definition because formulas are
built as literal strings of symbols; this development builds formulas as
typed abstract syntax trees instead, where the tree shape itself carries the
structure that brackets and commas would otherwise disambiguate in a linear
string. There is nothing for a Lean value to do on their behalf.
-/

/-!
Connectives.

A connective, like a relation or function symbol, combines a fixed number of
operands into a new thing of the same kind -- here, formulas into a formula,
rather than terms into a term or terms into a proposition. That number is
exactly what distinguishes `¬` (unary) from `→` (binary), so connectives are
arity-indexed the same way `Signature`'s relation and function symbols are,
using the same `ArityIndexedSymbols` shape rather than a bare enumeration
with the arity left implicit.
-/

/-- The primitive logical connectives shared by every language built on the
usual (¬, →)-basis. Other connectives (∧, ∨, ↔) are not primitive here; they
are expected to be introduced later as derived notation in terms of these
two, exactly as a Hilbert-style presentation would define them.

Logical form:

```lean
inductive LogicalConnective where
  | neg
  | impl
```
-/
inductive LogicalConnective where
  | neg
  | impl

/--
`LogicalConnectives` defines the displayed object for logical connectives.

Logical form:

```lean
def LogicalConnectives : ArityIndexedSymbols where
  Symbol := LogicalConnective
  arity
    | .neg => 1
    | .impl => 2
```
-/
def LogicalConnectives : ArityIndexedSymbols where
  Symbol := LogicalConnective
  arity
    | .neg => 1
    | .impl => 2

/--
`LogicalConnectives.negIsUnary` states neg is unary.

Logical form:

```lean
theorem LogicalConnectives.negIsUnary :
    LogicalConnectives.IsUnary .neg
```
-/
theorem LogicalConnectives.negIsUnary :
    LogicalConnectives.IsUnary .neg := rfl

/--
`LogicalConnectives.implIsBinary` states impl is binary.

Logical form:

```lean
theorem LogicalConnectives.implIsBinary :
    LogicalConnectives.IsBinary .impl
```
-/
theorem LogicalConnectives.implIsBinary :
    LogicalConnectives.IsBinary .impl := rfl

/-!
Equality.

Equality relates exactly two terms, so it is arity-indexed the same way as
connectives and as `Signature`'s relation symbols -- but it is kept as its
own symbol kind, separate from both, because it is neither a connective
(it does not combine formulas) nor a member of any language's similarity
type (per the alphabet definition, equality is a logical symbol present in
every language, unlike the symbols of `R`, which vary language to
language).
-/

/-- The equality symbol. There is exactly one; it is declared as an
`ArityIndexedSymbols` of its own purely so `.IsBinary` is available by the
same uniform name used elsewhere, not because more than one equality symbol
will ever exist.

Logical form:

```lean
inductive LogicalEquality where
  | eq
```
-/
inductive LogicalEquality where
  | eq

/--
`LogicalEqualitySymbols` defines the displayed object for logical equality symbols.

Logical form:

```lean
def LogicalEqualitySymbols : ArityIndexedSymbols where
  Symbol := LogicalEquality
  arity
    | .eq => 2
```
-/
def LogicalEqualitySymbols : ArityIndexedSymbols where
  Symbol := LogicalEquality
  arity
    | .eq => 2

/--
`LogicalEqualitySymbols.eqIsBinary` states eq is binary.

Logical form:

```lean
theorem LogicalEqualitySymbols.eqIsBinary :
    LogicalEqualitySymbols.IsBinary .eq
```
-/
theorem LogicalEqualitySymbols.eqIsBinary :
    LogicalEqualitySymbols.IsBinary .eq := rfl

/-!
The quantifier.

`∀` is not arity-indexed over formulas the way connectives are. A
connective's arity counts how many *formulas* it takes, and that count
genuinely varies by symbol (¬ takes one, → takes two). A quantifier instead
binds exactly one variable and scopes over exactly one formula -- a fixed
shape, the same for every quantifier symbol in this family, with nothing
varying per-symbol for an arity map to index. Forcing it into
`ArityIndexedSymbols` would model a degree of freedom that does not exist
here.

The binding itself -- which occurrences of the variable inside the formula
become bound, and which remain free in a larger enclosing formula -- is not
vocabulary content. It is a fact about formulas, stated and enforced once
`Formula` exists (via a constructor of shape
`LogicalQuantifier -> Variable -> Formula -> Formula`) and reasoned about
once free variables and substitution are defined on `Formula`. Nothing
about binding or free variables belongs at this vocabulary layer, and
nothing here anticipates that later definition beyond leaving room for it.
-/

/-- The primitive quantifier shared by every language with variables and
binding. `∃` is not primitive; it is expected to be introduced later as
derived notation, `∃v. φ := ¬∀v. ¬φ`.

Logical form:

```lean
inductive LogicalQuantifier where
  | forallQ
```
-/
inductive LogicalQuantifier where
  | forallQ

end LRA.Logic.Language.Notation
