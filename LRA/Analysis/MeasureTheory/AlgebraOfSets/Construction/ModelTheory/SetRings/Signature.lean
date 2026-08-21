import LRA.Logic

namespace LRA.Logic.ModelTheory.SetRings

/-!
First-order signature for rings of sets.
-/

/-- Function symbols for the set-ring language `(0, ∪, ∩, \)`.

Logical form:

```lean
inductive SetRingFunctionSymbol where
  | join
  | meet
  | difference
```
-/
inductive SetRingFunctionSymbol where
  | join
  | meet
  | difference

/-- Set rings have no primitive relation symbols in this language.

Logical form:

```lean
def SetRingRelationSymbol : Type := Empty
```
-/
def SetRingRelationSymbol : Type := Empty

/-- Constant symbols for the set-ring language.

Logical form:

```lean
inductive SetRingConstantSymbol where
  | zero
```
-/
inductive SetRingConstantSymbol where
  | zero

/-- Arity assignment for set-ring function symbols.

Logical form:

```lean
def SetRingFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := SetRingFunctionSymbol
  arity
    | .join => 2
    | .meet => 2
    | .difference => 2
```
-/
def SetRingFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := SetRingFunctionSymbol
  arity
    | .join => 2
    | .meet => 2
    | .difference => 2

/-- Arity assignment for set-ring relation symbols.

Logical form:

```lean
def SetRingFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := SetRingRelationSymbol
  arity := Empty.elim
```
-/
def SetRingFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := SetRingRelationSymbol
  arity := Empty.elim

/-- The first-order set-ring signature `(0, ∪, ∩, \)`.

Logical form:

```lean
def SetRingFirstOrderSignature : LRA.Logic.Signature where
  Functions := SetRingFirstOrderFunctions
  Relations := SetRingFirstOrderRelations
  Constants := SetRingConstantSymbol
```
-/
def SetRingFirstOrderSignature : LRA.Logic.Signature where
  Functions := SetRingFirstOrderFunctions
  Relations := SetRingFirstOrderRelations
  Constants := SetRingConstantSymbol

end LRA.Logic.ModelTheory.SetRings
