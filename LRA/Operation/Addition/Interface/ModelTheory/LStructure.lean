import LRA.Operation.Addition.Interface.Signature.Definition
import LRA.ModelTheory.Model

namespace LRA.Operation.Addition.Interface.ModelTheory

/--
`AdditionFunctionSymbol` First-order function symbols for the promoted addition interface.

Predicate logic:

  inductive AdditionFunctionSymbol where
    | add

Predicate logic (unfolded):

  inductive AdditionFunctionSymbol where
    | add (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive AdditionFunctionSymbol where
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
inductive AdditionFunctionSymbol where
  | add

/--
`AdditionRelationSymbol` The promoted addition interface has no primitive relations.

Predicate logic:

  def AdditionRelationSymbol : Type := Empty

Predicate logic (unfolded):

  def AdditionRelationSymbol : Type := Empty (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def AdditionRelationSymbol : Type := Empty
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
def AdditionRelationSymbol : Type := Empty

/--
`AdditionConstantSymbol` The promoted addition interface has no primitive constants.

Predicate logic:

  def AdditionConstantSymbol : Type := Empty

Predicate logic (unfolded):

  def AdditionConstantSymbol : Type := Empty (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def AdditionConstantSymbol : Type := Empty
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
def AdditionConstantSymbol : Type := Empty

/--
`AdditionFirstOrderFunctions` First-order function arities for promoted addition.

Predicate logic:

  def AdditionFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
    Symbol := AdditionFunctionSymbol
    arity
      | .add => 2

Predicate logic (unfolded):

  def AdditionFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
    Symbol := AdditionFunctionSymbol
    arity
      | .add => 2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def AdditionFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := AdditionFunctionSymbol
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
def AdditionFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := AdditionFunctionSymbol
  arity
    | .add => 2

/--
`AdditionFirstOrderRelations` First-order relation arities for promoted addition.

Predicate logic:

  def AdditionFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
    Symbol := AdditionRelationSymbol
    arity := Empty.elim

Predicate logic (unfolded):

  def AdditionFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
    Symbol := AdditionRelationSymbol
    arity := Empty.elim (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def AdditionFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := AdditionRelationSymbol
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
def AdditionFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := AdditionRelationSymbol
  arity := Empty.elim

/--
`AdditionFirstOrderSignature` First-order signature for promoted addition.

Predicate logic:

  def AdditionFirstOrderSignature : LRA.Logic.Signature where
    Functions := AdditionFirstOrderFunctions
    Relations := AdditionFirstOrderRelations
    Constants := AdditionConstantSymbol

Predicate logic (unfolded):

  def AdditionFirstOrderSignature : LRA.Logic.Signature where
    Functions := AdditionFirstOrderFunctions
    Relations := AdditionFirstOrderRelations
    Constants := AdditionConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def AdditionFirstOrderSignature : LRA.Logic.Signature where
  Functions := AdditionFirstOrderFunctions
  Relations := AdditionFirstOrderRelations
  Constants := AdditionConstantSymbol
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
def AdditionFirstOrderSignature : LRA.Logic.Signature where
  Functions := AdditionFirstOrderFunctions
  Relations := AdditionFirstOrderRelations
  Constants := AdditionConstantSymbol

/--
`BuildAdditionModel` Interpret a promoted addition signature as a first-order model.

Predicate logic:

  def BuildAdditionModel
      (signature : LRA.Operation.Addition.Interface.Signature.AdditionConceptSignature) :
      LRA.ModelTheory.FirstOrder.Model AdditionFirstOrderSignature where
    Domain := signature.carrier
    domainNonempty := signature.carrierNonempty
    interpretFunction
      | .add, args =>
          signature.add (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    interpretRelation := fun relation => nomatch relation
    interpretConstant := fun constant => nomatch constant

Predicate logic (unfolded):

  def BuildAdditionModel
      (signature : LRA.Operation.Addition.Interface.Signature.AdditionConceptSignature) :
      LRA.ModelTheory.FirstOrder.Model AdditionFirstOrderSignature where
    Domain := signature.carrier
    domainNonempty := signature.carrierNonempty
    interpretFunction
      | .add, args =>
          signature.add (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    interpretRelation := fun relation => nomatch relation
    interpretConstant := fun constant => nomatch constant (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BuildAdditionModel
    (signature : LRA.Operation.Addition.Interface.Signature.AdditionConceptSignature) :
    LRA.ModelTheory.FirstOrder.Model AdditionFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := signature.carrierNonempty
  interpretFunction
    | .add, args =>
        signature.add (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation := fun relation => nomatch relation
  interpretConstant := fun constant => nomatch constant
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
def BuildAdditionModel
    (signature : LRA.Operation.Addition.Interface.Signature.AdditionConceptSignature) :
    LRA.ModelTheory.FirstOrder.Model AdditionFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := signature.carrierNonempty
  interpretFunction
    | .add, args =>
        signature.add (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation := fun relation => nomatch relation
  interpretConstant := fun constant => nomatch constant

end LRA.Operation.Addition.Interface.ModelTheory
