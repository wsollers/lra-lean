import LRA.Operation.Multiplication.Interface.Signature.Definition
import LRA.ModelTheory.Model

namespace LRA.Operation.Multiplication.Interface.ModelTheory

/--
`MultiplicationFunctionSymbol` First-order function symbols for the promoted multiplication interface.

Predicate logic:

  inductive MultiplicationFunctionSymbol where
    | mul

Predicate logic (unfolded):

  inductive MultiplicationFunctionSymbol where
    | mul (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive MultiplicationFunctionSymbol where
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
inductive MultiplicationFunctionSymbol where
  | mul

/--
`MultiplicationRelationSymbol` The promoted multiplication interface has no primitive relations.

Predicate logic:

  def MultiplicationRelationSymbol : Type := Empty

Predicate logic (unfolded):

  def MultiplicationRelationSymbol : Type := Empty (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def MultiplicationRelationSymbol : Type := Empty
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
def MultiplicationRelationSymbol : Type := Empty

/--
`MultiplicationConstantSymbol` The promoted multiplication interface has no primitive constants.

Predicate logic:

  def MultiplicationConstantSymbol : Type := Empty

Predicate logic (unfolded):

  def MultiplicationConstantSymbol : Type := Empty (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def MultiplicationConstantSymbol : Type := Empty
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
def MultiplicationConstantSymbol : Type := Empty

/--
`MultiplicationFirstOrderFunctions` First-order function arities for promoted multiplication.

Predicate logic:

  def MultiplicationFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
    Symbol := MultiplicationFunctionSymbol
    arity
      | .mul => 2

Predicate logic (unfolded):

  def MultiplicationFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
    Symbol := MultiplicationFunctionSymbol
    arity
      | .mul => 2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def MultiplicationFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := MultiplicationFunctionSymbol
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
def MultiplicationFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := MultiplicationFunctionSymbol
  arity
    | .mul => 2

/--
`MultiplicationFirstOrderRelations` First-order relation arities for promoted multiplication.

Predicate logic:

  def MultiplicationFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
    Symbol := MultiplicationRelationSymbol
    arity := Empty.elim

Predicate logic (unfolded):

  def MultiplicationFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
    Symbol := MultiplicationRelationSymbol
    arity := Empty.elim (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def MultiplicationFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := MultiplicationRelationSymbol
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
def MultiplicationFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := MultiplicationRelationSymbol
  arity := Empty.elim

/--
`MultiplicationFirstOrderSignature` First-order signature for promoted multiplication.

Predicate logic:

  def MultiplicationFirstOrderSignature : LRA.Logic.Signature where
    Functions := MultiplicationFirstOrderFunctions
    Relations := MultiplicationFirstOrderRelations
    Constants := MultiplicationConstantSymbol

Predicate logic (unfolded):

  def MultiplicationFirstOrderSignature : LRA.Logic.Signature where
    Functions := MultiplicationFirstOrderFunctions
    Relations := MultiplicationFirstOrderRelations
    Constants := MultiplicationConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def MultiplicationFirstOrderSignature : LRA.Logic.Signature where
  Functions := MultiplicationFirstOrderFunctions
  Relations := MultiplicationFirstOrderRelations
  Constants := MultiplicationConstantSymbol
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
def MultiplicationFirstOrderSignature : LRA.Logic.Signature where
  Functions := MultiplicationFirstOrderFunctions
  Relations := MultiplicationFirstOrderRelations
  Constants := MultiplicationConstantSymbol

/--
`BuildMultiplicationModel` Interpret a promoted multiplication signature as a first-order model.

Predicate logic:

  def BuildMultiplicationModel
      (signature : LRA.Operation.Multiplication.Interface.Signature.MultiplicationConceptSignature) :
      LRA.ModelTheory.FirstOrder.Model MultiplicationFirstOrderSignature where
    Domain := signature.carrier
    domainNonempty := signature.carrierNonempty
    interpretFunction
      | .mul, args =>
          signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    interpretRelation := fun relation => nomatch relation
    interpretConstant := fun constant => nomatch constant

Predicate logic (unfolded):

  def BuildMultiplicationModel
      (signature : LRA.Operation.Multiplication.Interface.Signature.MultiplicationConceptSignature) :
      LRA.ModelTheory.FirstOrder.Model MultiplicationFirstOrderSignature where
    Domain := signature.carrier
    domainNonempty := signature.carrierNonempty
    interpretFunction
      | .mul, args =>
          signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    interpretRelation := fun relation => nomatch relation
    interpretConstant := fun constant => nomatch constant (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BuildMultiplicationModel
    (signature : LRA.Operation.Multiplication.Interface.Signature.MultiplicationConceptSignature) :
    LRA.ModelTheory.FirstOrder.Model MultiplicationFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := signature.carrierNonempty
  interpretFunction
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
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
def BuildMultiplicationModel
    (signature : LRA.Operation.Multiplication.Interface.Signature.MultiplicationConceptSignature) :
    LRA.ModelTheory.FirstOrder.Model MultiplicationFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := signature.carrierNonempty
  interpretFunction
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation := fun relation => nomatch relation
  interpretConstant := fun constant => nomatch constant

end LRA.Operation.Multiplication.Interface.ModelTheory
