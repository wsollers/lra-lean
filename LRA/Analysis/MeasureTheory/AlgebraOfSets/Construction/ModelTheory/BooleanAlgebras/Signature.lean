import LRA.Logic

namespace LRA.Logic.ModelTheory.BooleanAlgebras

/-!
First-order signature for Boolean algebras.
-/

/-- Function symbols for the Boolean-algebra language `(0, 1, ∨, ∧, ¬)`.

Logical form:

```lean
inductive BooleanAlgebraFunctionSymbol where
  | join
  | meet
  | complement
```
-/
inductive BooleanAlgebraFunctionSymbol where
  | join
  | meet
  | complement

/-- Boolean algebras have no primitive relation symbols in this language.

Logical form:

```lean
def BooleanAlgebraRelationSymbol : Type := Empty
```
-/
def BooleanAlgebraRelationSymbol : Type := Empty

/-- Constant symbols for the Boolean-algebra language.

Logical form:

```lean
inductive BooleanAlgebraConstantSymbol where
  | zero
  | one
```
-/
inductive BooleanAlgebraConstantSymbol where
  | zero
  | one

/-- Arity assignment for Boolean-algebra function symbols.

Logical form:

```lean
def BooleanAlgebraFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := BooleanAlgebraFunctionSymbol
  arity
    | .join => 2
    | .meet => 2
    | .complement => 1
```
-/
def BooleanAlgebraFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := BooleanAlgebraFunctionSymbol
  arity
    | .join => 2
    | .meet => 2
    | .complement => 1

/-- Arity assignment for Boolean-algebra relation symbols.

Logical form:

```lean
def BooleanAlgebraFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := BooleanAlgebraRelationSymbol
  arity := Empty.elim
```
-/
def BooleanAlgebraFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := BooleanAlgebraRelationSymbol
  arity := Empty.elim

/-- The first-order Boolean-algebra signature `(0, 1, ∨, ∧, ¬)`.

Logical form:

```lean
def BooleanAlgebraFirstOrderSignature : LRA.Logic.Signature where
  Functions := BooleanAlgebraFirstOrderFunctions
  Relations := BooleanAlgebraFirstOrderRelations
  Constants := BooleanAlgebraConstantSymbol
```
-/
def BooleanAlgebraFirstOrderSignature : LRA.Logic.Signature where
  Functions := BooleanAlgebraFirstOrderFunctions
  Relations := BooleanAlgebraFirstOrderRelations
  Constants := BooleanAlgebraConstantSymbol

end LRA.Logic.ModelTheory.BooleanAlgebras
