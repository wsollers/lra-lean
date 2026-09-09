import LRA.Identity.Interface.UniversalAlgebra.Signature.Definition

namespace LRA.Identity

universe u v w

/--
`AlgebraicStructure` TODO

Predicate logic:

  structure AlgebraicStructure (signature : AlgebraicSignature.{v, w}) where
    Carrier : Type u
    carrierNonempty : Nonempty Carrier
    interpretOperation :
      (symbol : signature.OperationSymbol) →
        (Fin (signature.arity symbol) → Carrier) → Carrier
    interpretConstant : signature.ConstantSymbol → Carrier

Predicate logic (unfolded):

  structure AlgebraicStructure (signature : AlgebraicSignature.{v, w}) where
    Carrier : Type u
    carrierNonempty : Nonempty Carrier
    interpretOperation :
      (symbol : signature.OperationSymbol) →
        (Fin (signature.arity symbol) → Carrier) → Carrier
    interpretConstant : signature.ConstantSymbol → Carrier

Logical form (Lean):

```lean
structure AlgebraicStructure (signature : AlgebraicSignature.{v, w}) where
  Carrier : Type u
  carrierNonempty : Nonempty Carrier
  interpretOperation :
    (symbol : signature.OperationSymbol) →
      (Fin (signature.arity symbol) → Carrier) → Carrier
  interpretConstant : signature.ConstantSymbol → Carrier
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
structure AlgebraicStructure (signature : AlgebraicSignature.{v, w}) where
  Carrier : Type u
  carrierNonempty : Nonempty Carrier
  interpretOperation :
    (symbol : signature.OperationSymbol) →
      (Fin (signature.arity symbol) → Carrier) → Carrier
  interpretConstant : signature.ConstantSymbol → Carrier

/--
`RelationReflexive` TODO

Predicate logic:

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) (x : Carrier), relation x x

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) (x : Carrier), relation x x

Logical form (Lean):

```lean
def RelationReflexive {Carrier : Type u} (relation : Carrier → Carrier → Prop) : Prop :=
  ∀ x, relation x x
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
def RelationReflexive {Carrier : Type u} (relation : Carrier → Carrier → Prop) : Prop :=
  ∀ x, relation x x

/--
`RelationSymmetric` TODO

Predicate logic:

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) {x y : Carrier}, relation x y → relation y x

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) {x y : Carrier}, relation x y → relation y x

Logical form (Lean):

```lean
def RelationSymmetric {Carrier : Type u} (relation : Carrier → Carrier → Prop) : Prop :=
  ∀ {x y}, relation x y → relation y x
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
def RelationSymmetric {Carrier : Type u} (relation : Carrier → Carrier → Prop) : Prop :=
  ∀ {x y}, relation x y → relation y x

/--
`RelationTransitive` TODO

Predicate logic:

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) {x y z : Carrier}, (relation x y ∧ relation y z) → relation x z

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) {x y z : Carrier}, (relation x y ∧ relation y z) → relation x z

Logical form (Lean):

```lean
def RelationTransitive {Carrier : Type u} (relation : Carrier → Carrier → Prop) : Prop :=
  ∀ {x y z}, relation x y → relation y z → relation x z
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
def RelationTransitive {Carrier : Type u} (relation : Carrier → Carrier → Prop) : Prop :=
  ∀ {x y z}, relation x y → relation y z → relation x z

/--
`OperationCompatible` TODO

Predicate logic:

  ∀ {signature : LRA.Identity.AlgebraicSignature} (structure_ : LRA.Identity.AlgebraicStructure signature) (relation : structure_.Carrier → structure_.Carrier → Prop) (symbol : signature.OperationSymbol) (left right : Fin (signature.arity symbol) → structure_.Carrier), (∀ (index : Fin (signature.arity symbol)), relation (left index) (right index)) → relation (structure_.interpretOperation symbol left) (structure_.interpretOperation symbol right)

Predicate logic (unfolded):

  ∀ {signature : LRA.Identity.AlgebraicSignature} (structure_ : LRA.Identity.AlgebraicStructure signature) (relation : structure_.Carrier → structure_.Carrier → Prop) (symbol : signature.OperationSymbol) (left right : Fin (signature.arity symbol) → structure_.Carrier), (∀ (index : Fin (signature.arity symbol)), relation (left index) (right index)) → relation (structure_.interpretOperation symbol left) (structure_.interpretOperation symbol right)

Logical form (Lean):

```lean
def OperationCompatible
    {signature : AlgebraicSignature.{v, w}}
    (structure_ : AlgebraicStructure signature)
    (relation : structure_.Carrier → structure_.Carrier → Prop) : Prop :=
  ∀ (symbol : signature.OperationSymbol)
    (left right : Fin (signature.arity symbol) → structure_.Carrier),
      (∀ index, relation (left index) (right index)) →
        relation
          (structure_.interpretOperation symbol left)
          (structure_.interpretOperation symbol right)
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
def OperationCompatible
    {signature : AlgebraicSignature.{v, w}}
    (structure_ : AlgebraicStructure signature)
    (relation : structure_.Carrier → structure_.Carrier → Prop) : Prop :=
  ∀ (symbol : signature.OperationSymbol)
    (left right : Fin (signature.arity symbol) → structure_.Carrier),
      (∀ index, relation (left index) (right index)) →
        relation
          (structure_.interpretOperation symbol left)
          (structure_.interpretOperation symbol right)

/--
`IsCongruence` TODO

Predicate logic:

  ∀ {signature : LRA.Identity.AlgebraicSignature} {structure_ : LRA.Identity.AlgebraicStructure signature} {relation : structure_.Carrier → structure_.Carrier → Prop}, (LRA.Identity.RelationReflexive relation ∧ (LRA.Identity.RelationSymmetric relation ∧ (LRA.Identity.RelationTransitive relation ∧ LRA.Identity.OperationCompatible structure_ relation)))

Predicate logic (unfolded):

  ∀ {signature : LRA.Identity.AlgebraicSignature} {structure_ : LRA.Identity.AlgebraicStructure signature} {relation : structure_.Carrier → structure_.Carrier → Prop}, ((∀ (x : structure_.Carrier), relation x x) ∧ ((∀ {x y : structure_.Carrier}, relation x y → relation y x) ∧ ((∀ {x y z : structure_.Carrier}, relation x y → relation y z → relation x z) ∧ (∀ (symbol : signature.OperationSymbol) (left right : Fin (signature.arity symbol) → structure_.Carrier), (∀ (index : Fin (signature.arity symbol)), relation (left index) (right index)) → relation (structure_.interpretOperation symbol left) (structure_.interpretOperation symbol right)))))

Logical form (Lean):

```lean
structure IsCongruence
    {signature : AlgebraicSignature.{v, w}}
    (structure_ : AlgebraicStructure signature)
    (relation : structure_.Carrier → structure_.Carrier → Prop) : Prop where
  reflexive : RelationReflexive relation
  symmetric : RelationSymmetric relation
  transitive : RelationTransitive relation
  operationCompatible : OperationCompatible structure_ relation
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
structure IsCongruence
    {signature : AlgebraicSignature.{v, w}}
    (structure_ : AlgebraicStructure signature)
    (relation : structure_.Carrier → structure_.Carrier → Prop) : Prop where
  reflexive : RelationReflexive relation
  symmetric : RelationSymmetric relation
  transitive : RelationTransitive relation
  operationCompatible : OperationCompatible structure_ relation

end LRA.Identity
