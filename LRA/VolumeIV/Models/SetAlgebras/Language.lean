import LRA.VolumeI.Logic

namespace LRA.Logic.ModelTheory.SetAlgebras

/-!
First-order language for algebras of sets.
-/

/-- Function symbols for the set-algebra language `(0, 1, ∪, ∩, complement)`.

Logical form:

```lean
inductive SetAlgebraFunctionSymbol where
  | join
  | meet
  | complement
```
-/
inductive SetAlgebraFunctionSymbol where
  | join
  | meet
  | complement

/-- Set algebras have no primitive relation symbols in this language.

Logical form:

```lean
def SetAlgebraRelationSymbol : Type := Empty
```
-/
def SetAlgebraRelationSymbol : Type := Empty

/-- Constant symbols for the set-algebra language.

Logical form:

```lean
inductive SetAlgebraConstantSymbol where
  | zero
  | one
```
-/
inductive SetAlgebraConstantSymbol where
  | zero
  | one

/-- Arity assignment for set-algebra function symbols.

Logical form:

```lean
def SetAlgebraFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := SetAlgebraFunctionSymbol
  arity
    | .join => 2
    | .meet => 2
    | .complement => 1
```
-/
def SetAlgebraFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := SetAlgebraFunctionSymbol
  arity
    | .join => 2
    | .meet => 2
    | .complement => 1

/-- Arity assignment for set-algebra relation symbols.

Logical form:

```lean
def SetAlgebraFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := SetAlgebraRelationSymbol
  arity := Empty.elim
```
-/
def SetAlgebraFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := SetAlgebraRelationSymbol
  arity := Empty.elim

/-- The first-order set-algebra language `(0, 1, ∪, ∩, complement)`.

Logical form:

```lean
def SetAlgebraFirstOrderLanguage : LRA.Logic.Signature where
  Functions := SetAlgebraFirstOrderFunctions
  Relations := SetAlgebraFirstOrderRelations
  Constants := SetAlgebraConstantSymbol
```
-/
def SetAlgebraFirstOrderLanguage : LRA.Logic.Signature where
  Functions := SetAlgebraFirstOrderFunctions
  Relations := SetAlgebraFirstOrderRelations
  Constants := SetAlgebraConstantSymbol

end LRA.Logic.ModelTheory.SetAlgebras
