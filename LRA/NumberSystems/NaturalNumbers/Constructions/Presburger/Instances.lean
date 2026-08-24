import LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.Operations
import LRA.Logic.Language.FirstOrder.Signature
import LRA.Logic.Model.Model

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Presburger

universe u v
variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`PresburgerFunctionSymbol` TODO

Predicate logic:

  inductive PresburgerFunctionSymbol where
  | successor
  | addition

Predicate logic (unfolded):

  inductive PresburgerFunctionSymbol where
  | successor
  | addition (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive PresburgerFunctionSymbol where
  | successor
  | addition
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
inductive PresburgerFunctionSymbol where
  | successor
  | addition

/--
`PresburgerRelationSymbol` TODO

Predicate logic:

  inductive PresburgerRelationSymbol where
  | lessThan

Predicate logic (unfolded):

  inductive PresburgerRelationSymbol where
  | lessThan (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive PresburgerRelationSymbol where
  | lessThan
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
inductive PresburgerRelationSymbol where
  | lessThan

/--
`PresburgerConstantSymbol` TODO

Predicate logic:

  inductive PresburgerConstantSymbol where
  | zero

Predicate logic (unfolded):

  inductive PresburgerConstantSymbol where
  | zero (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive PresburgerConstantSymbol where
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
inductive PresburgerConstantSymbol where
  | zero

/--
`PresburgerFunctions` TODO

Predicate logic:

  def PresburgerFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := PresburgerFunctionSymbol
  arity
    | .successor => 1
    | .addition => 2

Predicate logic (unfolded):

  def PresburgerFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := PresburgerFunctionSymbol
  arity
    | .successor => 1
    | .addition => 2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PresburgerFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := PresburgerFunctionSymbol
  arity
    | .successor => 1
    | .addition => 2
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
def PresburgerFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := PresburgerFunctionSymbol
  arity
    | .successor => 1
    | .addition => 2

/--
`PresburgerRelations` TODO

Predicate logic:

  def PresburgerRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := PresburgerRelationSymbol
  arity
    | .lessThan => 2

Predicate logic (unfolded):

  def PresburgerRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := PresburgerRelationSymbol
  arity
    | .lessThan => 2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PresburgerRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := PresburgerRelationSymbol
  arity
    | .lessThan => 2
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
def PresburgerRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := PresburgerRelationSymbol
  arity
    | .lessThan => 2

/--
`PresburgerSignature` TODO

Predicate logic:

  def PresburgerSignature : LRA.Logic.Signature where
  Functions := PresburgerFunctions
  Relations := PresburgerRelations
  Constants := PresburgerConstantSymbol

Predicate logic (unfolded):

  def PresburgerSignature : LRA.Logic.Signature where
  Functions := PresburgerFunctions
  Relations := PresburgerRelations
  Constants := PresburgerConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PresburgerSignature : LRA.Logic.Signature where
  Functions := PresburgerFunctions
  Relations := PresburgerRelations
  Constants := PresburgerConstantSymbol
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
def PresburgerSignature : LRA.Logic.Signature where
  Functions := PresburgerFunctions
  Relations := PresburgerRelations
  Constants := PresburgerConstantSymbol

/--
`PresburgerModel.toFirstOrderModel` TODO

Predicate logic:

  noncomputable def PresburgerModel.toFirstOrderModel
    (model : PresburgerModel Element SetObject) :
    LRA.Logic.FirstOrder.Model PresburgerSignature where
  Domain

Predicate logic (unfolded):

  noncomputable def PresburgerModel.toFirstOrderModel
    (model : PresburgerModel Element SetObject) :
    LRA.Logic.FirstOrder.Model PresburgerSignature where
  Domain (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def PresburgerModel.toFirstOrderModel
    (model : PresburgerModel Element SetObject) :
    LRA.Logic.FirstOrder.Model PresburgerSignature where
  Domain
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
noncomputable def PresburgerModel.toFirstOrderModel
    (model : PresburgerModel Element SetObject) :
    LRA.Logic.FirstOrder.Model PresburgerSignature where
  Domain := Element
  domainNonempty := ⟨model.zero⟩
  interpretFunction
    | .successor, args => model.successor (args ⟨0, by decide⟩)
    | .addition, args =>
        PresburgerAddition model (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation
    | .lessThan, args =>
        model.lessThan (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretConstant
    | .zero => model.zero

end LRA.NumberSystems.NaturalNumbers.Constructions.Presburger
