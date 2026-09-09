import LRA.Identity.Interface.UniversalAlgebra.Signature.Definition

namespace LRA.Set.Constructions.NBG.Interface.UniversalAlgebra

/--
`RelationalSignature` TODO

Predicate logic:

  structure RelationalSignature where
    RelationSymbol : Type
    relationArity : RelationSymbol → Nat

Predicate logic (unfolded):

  structure RelationalSignature where
    RelationSymbol : Type
    relationArity : RelationSymbol → Nat (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure RelationalSignature where
  RelationSymbol : Type
  relationArity : RelationSymbol → Nat
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
structure RelationalSignature where
  RelationSymbol : Type
  relationArity : RelationSymbol → Nat

/--
`PureMembershipRelationSymbol` TODO

Predicate logic:

  inductive PureMembershipRelationSymbol where
    | mem
    deriving DecidableEq

Predicate logic (unfolded):

  inductive PureMembershipRelationSymbol where
    | mem
    deriving DecidableEq (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive PureMembershipRelationSymbol where
  | mem
  deriving DecidableEq
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
inductive PureMembershipRelationSymbol where
  | mem
  deriving DecidableEq

/--
`pureMembershipRelationArity` TODO

Predicate logic:

  def pureMembershipRelationArity : PureMembershipRelationSymbol → Nat
    | .mem => 2

Predicate logic (unfolded):

  def pureMembershipRelationArity : PureMembershipRelationSymbol → Nat
    | .mem => 2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def pureMembershipRelationArity : PureMembershipRelationSymbol → Nat
  | .mem => 2
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def pureMembershipRelationArity : PureMembershipRelationSymbol → Nat
  | .mem => 2

/--
`PureRelationalNBGSignature` TODO

Predicate logic:

  def PureRelationalNBGSignature : RelationalSignature where
    RelationSymbol := PureMembershipRelationSymbol
    relationArity := pureMembershipRelationArity

Predicate logic (unfolded):

  def PureRelationalNBGSignature : RelationalSignature where
    RelationSymbol := PureMembershipRelationSymbol
    relationArity := pureMembershipRelationArity (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PureRelationalNBGSignature : RelationalSignature where
  RelationSymbol := PureMembershipRelationSymbol
  relationArity := pureMembershipRelationArity
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
def PureRelationalNBGSignature : RelationalSignature where
  RelationSymbol := PureMembershipRelationSymbol
  relationArity := pureMembershipRelationArity

/--
`ExpandedClassOperationSymbol` TODO

Predicate logic:

  inductive ExpandedClassOperationSymbol where
    | intersection
    | complement
    | domain
    | converse
    | permuteFirst
    | permuteSecond
    | cartesianExtension
    deriving DecidableEq

Predicate logic (unfolded):

  inductive ExpandedClassOperationSymbol where
    | intersection
    | complement
    | domain
    | converse
    | permuteFirst
    | permuteSecond
    | cartesianExtension
    deriving DecidableEq (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive ExpandedClassOperationSymbol where
  | intersection
  | complement
  | domain
  | converse
  | permuteFirst
  | permuteSecond
  | cartesianExtension
  deriving DecidableEq
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
inductive ExpandedClassOperationSymbol where
  | intersection
  | complement
  | domain
  | converse
  | permuteFirst
  | permuteSecond
  | cartesianExtension
  deriving DecidableEq

/--
`expandedClassOperationArity` TODO

Predicate logic:

  def expandedClassOperationArity : ExpandedClassOperationSymbol → Nat
    | .intersection => 2
    | .complement => 1
    | .domain => 1
    | .converse => 1
    | .permuteFirst => 1
    | .permuteSecond => 1
    | .cartesianExtension => 2

Predicate logic (unfolded):

  def expandedClassOperationArity : ExpandedClassOperationSymbol → Nat
    | .intersection => 2
    | .complement => 1
    | .domain => 1
    | .converse => 1
    | .permuteFirst => 1
    | .permuteSecond => 1
    | .cartesianExtension => 2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def expandedClassOperationArity : ExpandedClassOperationSymbol → Nat
  | .intersection => 2
  | .complement => 1
  | .domain => 1
  | .converse => 1
  | .permuteFirst => 1
  | .permuteSecond => 1
  | .cartesianExtension => 2
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def expandedClassOperationArity : ExpandedClassOperationSymbol → Nat
  | .intersection => 2
  | .complement => 1
  | .domain => 1
  | .converse => 1
  | .permuteFirst => 1
  | .permuteSecond => 1
  | .cartesianExtension => 2

/--
`ExpandedClassConstantSymbol` TODO

Predicate logic:

  inductive ExpandedClassConstantSymbol where
    | universalClass
    | elementhoodClass
    deriving DecidableEq

Predicate logic (unfolded):

  inductive ExpandedClassConstantSymbol where
    | universalClass
    | elementhoodClass
    deriving DecidableEq (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive ExpandedClassConstantSymbol where
  | universalClass
  | elementhoodClass
  deriving DecidableEq
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
inductive ExpandedClassConstantSymbol where
  | universalClass
  | elementhoodClass
  deriving DecidableEq

/--
`ExpandedClassAlgebraicSignature` TODO

Predicate logic:

  abbrev ExpandedClassAlgebraicSignature : LRA.Identity.AlgebraicSignature where
    OperationSymbol := ExpandedClassOperationSymbol
    arity := expandedClassOperationArity
    ConstantSymbol := ExpandedClassConstantSymbol

Predicate logic (unfolded):

  abbrev ExpandedClassAlgebraicSignature : LRA.Identity.AlgebraicSignature where
    OperationSymbol := ExpandedClassOperationSymbol
    arity := expandedClassOperationArity
    ConstantSymbol := ExpandedClassConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev ExpandedClassAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := ExpandedClassOperationSymbol
  arity := expandedClassOperationArity
  ConstantSymbol := ExpandedClassConstantSymbol
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
abbrev ExpandedClassAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := ExpandedClassOperationSymbol
  arity := expandedClassOperationArity
  ConstantSymbol := ExpandedClassConstantSymbol

end LRA.Set.Constructions.NBG.Interface.UniversalAlgebra
