import LRA.VolumeI.Logic

namespace LRA.VolumeIV.Models.BooleanAlgebras

/-!
First-order language for Boolean algebras.
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
def BooleanAlgebraFirstOrderFunctions : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := BooleanAlgebraFunctionSymbol
  arity
    | .join => 2
    | .meet => 2
    | .complement => 1
```
-/
def BooleanAlgebraFirstOrderFunctions : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := BooleanAlgebraFunctionSymbol
  arity
    | .join => 2
    | .meet => 2
    | .complement => 1

/-- Arity assignment for Boolean-algebra relation symbols.

Logical form:

```lean
def BooleanAlgebraFirstOrderRelations : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := BooleanAlgebraRelationSymbol
  arity := Empty.elim
```
-/
def BooleanAlgebraFirstOrderRelations : LRA.VolumeI.Logic.ArityIndexedSymbols where
  Symbol := BooleanAlgebraRelationSymbol
  arity := Empty.elim

/-- The first-order Boolean-algebra language `(0, 1, ∨, ∧, ¬)`.

Logical form:

```lean
def BooleanAlgebraFirstOrderLanguage : LRA.VolumeI.Logic.Signature where
  Functions := BooleanAlgebraFirstOrderFunctions
  Relations := BooleanAlgebraFirstOrderRelations
  Constants := BooleanAlgebraConstantSymbol
```
-/
def BooleanAlgebraFirstOrderLanguage : LRA.VolumeI.Logic.Signature where
  Functions := BooleanAlgebraFirstOrderFunctions
  Relations := BooleanAlgebraFirstOrderRelations
  Constants := BooleanAlgebraConstantSymbol

end LRA.VolumeIV.Models.BooleanAlgebras
