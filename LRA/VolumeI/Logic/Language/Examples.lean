import LRA.VolumeI.Logic.Language.Symbols.Signature
import LRA.VolumeI.Logic.Language.FirstOrder.Signature

namespace LRA.Logic

/-!
Worked examples of `Signature`.

Two of the standard opening examples from algebra: the signature of monoids
under multiplication, and the signature of monoids under addition. Both have
the same shape -- one binary function symbol, one constant symbol, no
relation symbols -- differing only in which operation and identity element
they name. Building both side by side makes that shared shape visible, and
exercises the "no relation symbols at all" case, which nothing so far has
instantiated.

These are signature-only examples. Concrete models interpreting them (e.g.
`Nat` under multiplication, `Nat` under addition) belong with `Model`'s own
examples, once `Model` has its own `Examples.lean`.
-/

/-!
`L_Monoid = ⟨*, 1⟩`: the signature of a monoid under multiplication.
-/

/-- The one function symbol of `L_Monoid`: multiplication, arity 2.

Logical form:

```lean
inductive MonoidFunctionSymbol where
  | mul
```
-/
inductive MonoidFunctionSymbol where
  | mul

/-- `L_Monoid` has no relation symbols.

Logical form:

```lean
def MonoidRelationSymbol : Type := Empty
```
-/
def MonoidRelationSymbol : Type := Empty

/-- The one constant symbol of `L_Monoid`: the multiplicative identity.

Logical form:

```lean
inductive MonoidConstantSymbol where
  | one
```
-/
inductive MonoidConstantSymbol where
  | one

/--
`monoidFunctions` defines the displayed object for monoid functions.

Logical form:

```lean
def monoidFunctions : ArityIndexedSymbols where
  Symbol := MonoidFunctionSymbol
  arity
    | .mul => 2
```
-/
def monoidFunctions : ArityIndexedSymbols where
  Symbol := MonoidFunctionSymbol
  arity
    | .mul => 2

/--
`monoidRelations` defines the displayed object for monoid relations.

Logical form:

```lean
def monoidRelations : ArityIndexedSymbols where
  Symbol := MonoidRelationSymbol
  arity := Empty.elim
```
-/
def monoidRelations : ArityIndexedSymbols where
  Symbol := MonoidRelationSymbol
  arity := Empty.elim

/-- The signature `L_Monoid = ⟨*, 1⟩`.

Logical form:

```lean
def monoidSignature : Signature where
  Functions := monoidFunctions
  Relations := monoidRelations
  Constants := MonoidConstantSymbol
```
-/
def monoidSignature : Signature where
  Functions := monoidFunctions
  Relations := monoidRelations
  Constants := MonoidConstantSymbol

/--
`monoidSignature.mulIsBinary` states mul is binary.

Logical form:

```lean
theorem monoidSignature.mulIsBinary :
    monoidSignature.IsBinaryFunctionSymbol .mul
```
-/
theorem monoidSignature.mulIsBinary :
    monoidSignature.IsBinaryFunctionSymbol .mul := rfl

/-!
`L_AdditiveMonoid = ⟨+, 0⟩`: the signature of a monoid under addition.

Same shape as `L_Monoid` above, entirely by design -- a monoid's signature
does not depend on which operation it names, only on there being one binary
function symbol and one constant symbol. Only the symbol names differ.
-/

/-- The one function symbol of `L_AdditiveMonoid`: addition, arity 2.

Logical form:

```lean
inductive AdditiveMonoidFunctionSymbol where
  | add
```
-/
inductive AdditiveMonoidFunctionSymbol where
  | add

/-- `L_AdditiveMonoid` has no relation symbols.

Logical form:

```lean
def AdditiveMonoidRelationSymbol : Type := Empty
```
-/
def AdditiveMonoidRelationSymbol : Type := Empty

/-- The one constant symbol of `L_AdditiveMonoid`: the additive identity.

Logical form:

```lean
inductive AdditiveMonoidConstantSymbol where
  | zero
```
-/
inductive AdditiveMonoidConstantSymbol where
  | zero

/--
`additiveMonoidFunctions` defines the displayed object for additive monoid functions.

Logical form:

```lean
def additiveMonoidFunctions : ArityIndexedSymbols where
  Symbol := AdditiveMonoidFunctionSymbol
  arity
    | .add => 2
```
-/
def additiveMonoidFunctions : ArityIndexedSymbols where
  Symbol := AdditiveMonoidFunctionSymbol
  arity
    | .add => 2

/--
`additiveMonoidRelations` defines the displayed object for additive monoid relations.

Logical form:

```lean
def additiveMonoidRelations : ArityIndexedSymbols where
  Symbol := AdditiveMonoidRelationSymbol
  arity := Empty.elim
```
-/
def additiveMonoidRelations : ArityIndexedSymbols where
  Symbol := AdditiveMonoidRelationSymbol
  arity := Empty.elim

/-- The signature `L_AdditiveMonoid = ⟨+, 0⟩`.

Logical form:

```lean
def additiveMonoidSignature : Signature where
  Functions := additiveMonoidFunctions
  Relations := additiveMonoidRelations
  Constants := AdditiveMonoidConstantSymbol
```
-/
def additiveMonoidSignature : Signature where
  Functions := additiveMonoidFunctions
  Relations := additiveMonoidRelations
  Constants := AdditiveMonoidConstantSymbol

/--
`additiveMonoidSignature.addIsBinary` states add is binary.

Logical form:

```lean
theorem additiveMonoidSignature.addIsBinary :
    additiveMonoidSignature.IsBinaryFunctionSymbol .add
```
-/
theorem additiveMonoidSignature.addIsBinary :
    additiveMonoidSignature.IsBinaryFunctionSymbol .add := rfl

/-!
`L_OrderedRing = ⟨+, *, -, 0, 1, <⟩`: the signature of an ordered ring.

The first example with all three kinds of symbol at once, and the first
with a non-uniform arity map: `+` and `*` are binary, `-` is unary. Per the
usual convention, `-` here is unary negation (`-x`), not binary subtraction
-- subtraction is expected to be introduced later as derived notation,
`x - y := x + (-y)`, the same "derive the convenient thing from the
primitive thing" discipline already used for `∧`/`∨`/`↔` and `∃` in
`Language/Notation`.
-/

/-- The function symbols of `L_OrderedRing`: addition and multiplication
(both arity 2), negation (arity 1).

Logical form:

```lean
inductive OrderedRingFunctionSymbol where
  | add
  | mul
  | neg
```
-/
inductive OrderedRingFunctionSymbol where
  | add
  | mul
  | neg

/-- The one relation symbol of `L_OrderedRing`: the strict order `<`,
arity 2.

Logical form:

```lean
inductive OrderedRingRelationSymbol where
  | lt
```
-/
inductive OrderedRingRelationSymbol where
  | lt

/-- The constant symbols of `L_OrderedRing`: the additive identity `0` and
the multiplicative identity `1`.

Logical form:

```lean
inductive OrderedRingConstantSymbol where
  | zero
  | one
```
-/
inductive OrderedRingConstantSymbol where
  | zero
  | one

/--
`orderedRingFunctions` defines the displayed object for ordered ring functions.

Logical form:

```lean
def orderedRingFunctions : ArityIndexedSymbols where
  Symbol := OrderedRingFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
    | .neg => 1
```
-/
def orderedRingFunctions : ArityIndexedSymbols where
  Symbol := OrderedRingFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
    | .neg => 1

/--
`orderedRingRelations` defines the displayed object for ordered ring relations.

Logical form:

```lean
def orderedRingRelations : ArityIndexedSymbols where
  Symbol := OrderedRingRelationSymbol
  arity
    | .lt => 2
```
-/
def orderedRingRelations : ArityIndexedSymbols where
  Symbol := OrderedRingRelationSymbol
  arity
    | .lt => 2

/-- The signature `L_OrderedRing = ⟨+, *, -, 0, 1, <⟩`.

Logical form:

```lean
def orderedRingSignature : Signature where
  Functions := orderedRingFunctions
  Relations := orderedRingRelations
  Constants := OrderedRingConstantSymbol
```
-/
def orderedRingSignature : Signature where
  Functions := orderedRingFunctions
  Relations := orderedRingRelations
  Constants := OrderedRingConstantSymbol

/--
`orderedRingSignature.addIsBinary` states add is binary.

Logical form:

```lean
theorem orderedRingSignature.addIsBinary :
    orderedRingSignature.IsBinaryFunctionSymbol .add
```
-/
theorem orderedRingSignature.addIsBinary :
    orderedRingSignature.IsBinaryFunctionSymbol .add := rfl

/--
`orderedRingSignature.mulIsBinary` states mul is binary.

Logical form:

```lean
theorem orderedRingSignature.mulIsBinary :
    orderedRingSignature.IsBinaryFunctionSymbol .mul
```
-/
theorem orderedRingSignature.mulIsBinary :
    orderedRingSignature.IsBinaryFunctionSymbol .mul := rfl

/--
`orderedRingSignature.negIsUnary` states neg is unary.

Logical form:

```lean
theorem orderedRingSignature.negIsUnary :
    orderedRingSignature.IsUnaryFunctionSymbol .neg
```
-/
theorem orderedRingSignature.negIsUnary :
    orderedRingSignature.IsUnaryFunctionSymbol .neg := rfl

/--
`orderedRingSignature.ltIsBinary` states lt is binary.

Logical form:

```lean
theorem orderedRingSignature.ltIsBinary :
    orderedRingSignature.IsBinaryRelationSymbol .lt
```
-/
theorem orderedRingSignature.ltIsBinary :
    orderedRingSignature.IsBinaryRelationSymbol .lt := rfl

end LRA.Logic
