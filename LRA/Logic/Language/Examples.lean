import LRA.Logic.Language.Symbols.Signature
import LRA.Logic.Language.FirstOrder.Signature

namespace LRA.Logic

/--
`MonoidFunctionSymbol` TODO

Predicate logic:

  inductive MonoidFunctionSymbol where
  | mul

Predicate logic (unfolded):

  inductive MonoidFunctionSymbol where
  | mul (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive MonoidFunctionSymbol where
  | mul
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
inductive MonoidFunctionSymbol where
  | mul

/--
`MonoidRelationSymbol` TODO

Predicate logic:

  def MonoidRelationSymbol : Type := Empty

Predicate logic (unfolded):

  def MonoidRelationSymbol : Type := Empty (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def MonoidRelationSymbol : Type := Empty
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
def MonoidRelationSymbol : Type := Empty

/--
`MonoidConstantSymbol` TODO

Predicate logic:

  inductive MonoidConstantSymbol where
  | one

Predicate logic (unfolded):

  inductive MonoidConstantSymbol where
  | one (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive MonoidConstantSymbol where
  | one
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
inductive MonoidConstantSymbol where
  | one

/--
`monoidFunctions` TODO

Predicate logic:

  def monoidFunctions : ArityIndexedSymbols where
  Symbol := MonoidFunctionSymbol
  arity
    | .mul => 2

Predicate logic (unfolded):

  def monoidFunctions : ArityIndexedSymbols where
  Symbol := MonoidFunctionSymbol
  arity
    | .mul => 2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def monoidFunctions : ArityIndexedSymbols where
  Symbol := MonoidFunctionSymbol
  arity
    | .mul => 2
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
def monoidFunctions : ArityIndexedSymbols where
  Symbol := MonoidFunctionSymbol
  arity
    | .mul => 2

/--
`monoidRelations` TODO

Predicate logic:

  def monoidRelations : ArityIndexedSymbols where
  Symbol := MonoidRelationSymbol
  arity := Empty.elim

Predicate logic (unfolded):

  def monoidRelations : ArityIndexedSymbols where
  Symbol := MonoidRelationSymbol
  arity := Empty.elim (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def monoidRelations : ArityIndexedSymbols where
  Symbol := MonoidRelationSymbol
  arity := Empty.elim
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
def monoidRelations : ArityIndexedSymbols where
  Symbol := MonoidRelationSymbol
  arity := Empty.elim

/--
`monoidSignature` TODO

Predicate logic:

  def monoidSignature : Signature where
  Functions := monoidFunctions
  Relations := monoidRelations
  Constants := MonoidConstantSymbol

Predicate logic (unfolded):

  def monoidSignature : Signature where
  Functions := monoidFunctions
  Relations := monoidRelations
  Constants := MonoidConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def monoidSignature : Signature where
  Functions := monoidFunctions
  Relations := monoidRelations
  Constants := MonoidConstantSymbol
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
def monoidSignature : Signature where
  Functions := monoidFunctions
  Relations := monoidRelations
  Constants := MonoidConstantSymbol

/--
`monoidSignature.mulIsBinary` TODO

Predicate logic:

  monoidSignature.IsBinaryFunctionSymbol .mul

Predicate logic (unfolded):

  LRA.Logic.monoidSignature.Functions.2 LRA.Logic.MonoidFunctionSymbol.mul = instOfNatNat 2.1

Logical form (Lean):

```lean
theorem monoidSignature.mulIsBinary :
    monoidSignature.IsBinaryFunctionSymbol .mul
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem monoidSignature.mulIsBinary :
    monoidSignature.IsBinaryFunctionSymbol .mul := rfl

/--
`AdditiveMonoidFunctionSymbol` TODO

Predicate logic:

  inductive AdditiveMonoidFunctionSymbol where
  | add

Predicate logic (unfolded):

  inductive AdditiveMonoidFunctionSymbol where
  | add (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive AdditiveMonoidFunctionSymbol where
  | add
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
inductive AdditiveMonoidFunctionSymbol where
  | add

/--
`AdditiveMonoidRelationSymbol` TODO

Predicate logic:

  def AdditiveMonoidRelationSymbol : Type := Empty

Predicate logic (unfolded):

  def AdditiveMonoidRelationSymbol : Type := Empty (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def AdditiveMonoidRelationSymbol : Type := Empty
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
def AdditiveMonoidRelationSymbol : Type := Empty

/--
`AdditiveMonoidConstantSymbol` TODO

Predicate logic:

  inductive AdditiveMonoidConstantSymbol where
  | zero

Predicate logic (unfolded):

  inductive AdditiveMonoidConstantSymbol where
  | zero (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive AdditiveMonoidConstantSymbol where
  | zero
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
inductive AdditiveMonoidConstantSymbol where
  | zero

/--
`additiveMonoidFunctions` TODO

Predicate logic:

  def additiveMonoidFunctions : ArityIndexedSymbols where
  Symbol := AdditiveMonoidFunctionSymbol
  arity
    | .add => 2

Predicate logic (unfolded):

  def additiveMonoidFunctions : ArityIndexedSymbols where
  Symbol := AdditiveMonoidFunctionSymbol
  arity
    | .add => 2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def additiveMonoidFunctions : ArityIndexedSymbols where
  Symbol := AdditiveMonoidFunctionSymbol
  arity
    | .add => 2
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
def additiveMonoidFunctions : ArityIndexedSymbols where
  Symbol := AdditiveMonoidFunctionSymbol
  arity
    | .add => 2

/--
`additiveMonoidRelations` TODO

Predicate logic:

  def additiveMonoidRelations : ArityIndexedSymbols where
  Symbol := AdditiveMonoidRelationSymbol
  arity := Empty.elim

Predicate logic (unfolded):

  def additiveMonoidRelations : ArityIndexedSymbols where
  Symbol := AdditiveMonoidRelationSymbol
  arity := Empty.elim (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def additiveMonoidRelations : ArityIndexedSymbols where
  Symbol := AdditiveMonoidRelationSymbol
  arity := Empty.elim
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
def additiveMonoidRelations : ArityIndexedSymbols where
  Symbol := AdditiveMonoidRelationSymbol
  arity := Empty.elim

/--
`additiveMonoidSignature` TODO

Predicate logic:

  def additiveMonoidSignature : Signature where
  Functions := additiveMonoidFunctions
  Relations := additiveMonoidRelations
  Constants := AdditiveMonoidConstantSymbol

Predicate logic (unfolded):

  def additiveMonoidSignature : Signature where
  Functions := additiveMonoidFunctions
  Relations := additiveMonoidRelations
  Constants := AdditiveMonoidConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def additiveMonoidSignature : Signature where
  Functions := additiveMonoidFunctions
  Relations := additiveMonoidRelations
  Constants := AdditiveMonoidConstantSymbol
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
def additiveMonoidSignature : Signature where
  Functions := additiveMonoidFunctions
  Relations := additiveMonoidRelations
  Constants := AdditiveMonoidConstantSymbol

/--
`additiveMonoidSignature.addIsBinary` TODO

Predicate logic:

  additiveMonoidSignature.IsBinaryFunctionSymbol .add

Predicate logic (unfolded):

  LRA.Logic.additiveMonoidSignature.Functions.2 LRA.Logic.AdditiveMonoidFunctionSymbol.add = instOfNatNat 2.1

Logical form (Lean):

```lean
theorem additiveMonoidSignature.addIsBinary :
    additiveMonoidSignature.IsBinaryFunctionSymbol .add
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem additiveMonoidSignature.addIsBinary :
    additiveMonoidSignature.IsBinaryFunctionSymbol .add := rfl

/--
`OrderedRingFunctionSymbol` TODO

Predicate logic:

  inductive OrderedRingFunctionSymbol where
  | add
  | mul
  | neg

Predicate logic (unfolded):

  inductive OrderedRingFunctionSymbol where
  | add
  | mul
  | neg (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive OrderedRingFunctionSymbol where
  | add
  | mul
  | neg
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
inductive OrderedRingFunctionSymbol where
  | add
  | mul
  | neg

/--
`OrderedRingRelationSymbol` TODO

Predicate logic:

  inductive OrderedRingRelationSymbol where
  | lt

Predicate logic (unfolded):

  inductive OrderedRingRelationSymbol where
  | lt (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive OrderedRingRelationSymbol where
  | lt
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
inductive OrderedRingRelationSymbol where
  | lt

/--
`OrderedRingConstantSymbol` TODO

Predicate logic:

  inductive OrderedRingConstantSymbol where
  | zero
  | one

Predicate logic (unfolded):

  inductive OrderedRingConstantSymbol where
  | zero
  | one (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive OrderedRingConstantSymbol where
  | zero
  | one
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
inductive OrderedRingConstantSymbol where
  | zero
  | one

/--
`orderedRingFunctions` TODO

Predicate logic:

  def orderedRingFunctions : ArityIndexedSymbols where
  Symbol := OrderedRingFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
    | .neg => 1

Predicate logic (unfolded):

  def orderedRingFunctions : ArityIndexedSymbols where
  Symbol := OrderedRingFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
    | .neg => 1 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def orderedRingFunctions : ArityIndexedSymbols where
  Symbol := OrderedRingFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
    | .neg => 1
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
def orderedRingFunctions : ArityIndexedSymbols where
  Symbol := OrderedRingFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
    | .neg => 1

/--
`orderedRingRelations` TODO

Predicate logic:

  def orderedRingRelations : ArityIndexedSymbols where
  Symbol := OrderedRingRelationSymbol
  arity
    | .lt => 2

Predicate logic (unfolded):

  def orderedRingRelations : ArityIndexedSymbols where
  Symbol := OrderedRingRelationSymbol
  arity
    | .lt => 2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def orderedRingRelations : ArityIndexedSymbols where
  Symbol := OrderedRingRelationSymbol
  arity
    | .lt => 2
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
def orderedRingRelations : ArityIndexedSymbols where
  Symbol := OrderedRingRelationSymbol
  arity
    | .lt => 2

/--
`orderedRingSignature` TODO

Predicate logic:

  def orderedRingSignature : Signature where
  Functions := orderedRingFunctions
  Relations := orderedRingRelations
  Constants := OrderedRingConstantSymbol

Predicate logic (unfolded):

  def orderedRingSignature : Signature where
  Functions := orderedRingFunctions
  Relations := orderedRingRelations
  Constants := OrderedRingConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def orderedRingSignature : Signature where
  Functions := orderedRingFunctions
  Relations := orderedRingRelations
  Constants := OrderedRingConstantSymbol
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
def orderedRingSignature : Signature where
  Functions := orderedRingFunctions
  Relations := orderedRingRelations
  Constants := OrderedRingConstantSymbol

/--
`orderedRingSignature.addIsBinary` TODO

Predicate logic:

  orderedRingSignature.IsBinaryFunctionSymbol .add

Predicate logic (unfolded):

  LRA.Logic.orderedRingSignature.Functions.2 LRA.Logic.OrderedRingFunctionSymbol.add = instOfNatNat 2.1

Logical form (Lean):

```lean
theorem orderedRingSignature.addIsBinary :
    orderedRingSignature.IsBinaryFunctionSymbol .add
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem orderedRingSignature.addIsBinary :
    orderedRingSignature.IsBinaryFunctionSymbol .add := rfl

/--
`orderedRingSignature.mulIsBinary` TODO

Predicate logic:

  orderedRingSignature.IsBinaryFunctionSymbol .mul

Predicate logic (unfolded):

  LRA.Logic.orderedRingSignature.Functions.2 LRA.Logic.OrderedRingFunctionSymbol.mul = instOfNatNat 2.1

Logical form (Lean):

```lean
theorem orderedRingSignature.mulIsBinary :
    orderedRingSignature.IsBinaryFunctionSymbol .mul
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem orderedRingSignature.mulIsBinary :
    orderedRingSignature.IsBinaryFunctionSymbol .mul := rfl

/--
`orderedRingSignature.negIsUnary` TODO

Predicate logic:

  orderedRingSignature.IsUnaryFunctionSymbol .neg

Predicate logic (unfolded):

  LRA.Logic.orderedRingSignature.Functions.2 LRA.Logic.OrderedRingFunctionSymbol.neg = instOfNatNat 1.1

Logical form (Lean):

```lean
theorem orderedRingSignature.negIsUnary :
    orderedRingSignature.IsUnaryFunctionSymbol .neg
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem orderedRingSignature.negIsUnary :
    orderedRingSignature.IsUnaryFunctionSymbol .neg := rfl

/--
`orderedRingSignature.ltIsBinary` TODO

Predicate logic:

  orderedRingSignature.IsBinaryRelationSymbol .lt

Predicate logic (unfolded):

  LRA.Logic.orderedRingSignature.Relations.2 LRA.Logic.OrderedRingRelationSymbol.lt = instOfNatNat 2.1

Logical form (Lean):

```lean
theorem orderedRingSignature.ltIsBinary :
    orderedRingSignature.IsBinaryRelationSymbol .lt
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem orderedRingSignature.ltIsBinary :
    orderedRingSignature.IsBinaryRelationSymbol .lt := rfl

end LRA.Logic
