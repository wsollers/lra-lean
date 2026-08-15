namespace LRA.Logic

/-!
Arity-indexed symbol sets.

The recurring shape underlying arity-carrying vocabulary -- a first-order
signature's function and relation symbols, and any other object logic's
arity-indexed non-logical vocabulary -- is a type of symbols together with
a `Nat`-valued arity for each symbol. Naming this once here means no
consumer (`Signature` in `Language.FirstOrder`, or any future one) has to
restate the pairing by hand.
-/

/--
`ArityIndexedSymbols` packages the data and laws for arity indexed symbols.

Logical form:

```lean
structure ArityIndexedSymbols where
  Symbol : Type
  arity : Symbol -> Nat
```
-/
structure ArityIndexedSymbols where
  Symbol : Type
  arity : Symbol -> Nat

/-!
Nullary, unary, and binary symbols are common enough special cases to name
directly, rather than restating `arity symbol = 0 / 1 / 2` at every use
site.
-/

/--
`ArityIndexedSymbols.IsNullary` defines the displayed object for is nullary.

Logical form:

```lean
def ArityIndexedSymbols.IsNullary (A : ArityIndexedSymbols) (symbol : A.Symbol) : Prop :=
  A.arity symbol = 0
```
-/
def ArityIndexedSymbols.IsNullary (A : ArityIndexedSymbols) (symbol : A.Symbol) : Prop :=
  A.arity symbol = 0

/--
`ArityIndexedSymbols.IsUnary` defines the displayed object for is unary.

Logical form:

```lean
def ArityIndexedSymbols.IsUnary (A : ArityIndexedSymbols) (symbol : A.Symbol) : Prop :=
  A.arity symbol = 1
```
-/
def ArityIndexedSymbols.IsUnary (A : ArityIndexedSymbols) (symbol : A.Symbol) : Prop :=
  A.arity symbol = 1

/--
`ArityIndexedSymbols.IsBinary` defines the displayed object for is binary.

Logical form:

```lean
def ArityIndexedSymbols.IsBinary (A : ArityIndexedSymbols) (symbol : A.Symbol) : Prop :=
  A.arity symbol = 2
```
-/
def ArityIndexedSymbols.IsBinary (A : ArityIndexedSymbols) (symbol : A.Symbol) : Prop :=
  A.arity symbol = 2

end LRA.Logic
