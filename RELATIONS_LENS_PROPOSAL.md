# Relations Lens Proposal

## Goal

Add a Sets-level relation lens that treats a relation as a set of tuples with
an explicit arity.

This separates two concepts:

- `LRA.VolumeI.Sets.Relations`: set-theoretic relations on a type.
- `LRA.VolumeI.FirstOrderLogic.Relations`: model-theoretic relation symbols
  interpreted by a first-order structure.

The Sets package should be the canonical home for properties such as
reflexive, symmetric, antisymmetric, transitive, preorder, partial order, and
equivalence relation.

## Core Representation

In the Sets package, an `arity`-ary relation on a type `alpha` should be a set
of `arity`-tuples:

```lean
import LRA.VolumeI.Sets.SetDefinitions

namespace LRA.VolumeI.Sets.Relations
open LRA.VolumeI.Sets

abbrev Relation (alpha : Type) (arity : Nat) : Type :=
  Set (Fin arity -> alpha)

abbrev UnaryRelation (alpha : Type) : Type :=
  Relation alpha 1

abbrev BinaryRelation (alpha : Type) : Type :=
  Relation alpha 2
```

This makes arity part of the type:

```lean
BinaryRelation alpha = Relation alpha 2
```

## Binary Tuple Helper

For binary relation properties, use a helper that builds the tuple
corresponding to an ordered pair:

```lean
def orderedPair {alpha : Type} (first second : alpha) : Fin 2 -> alpha :=
  fun index =>
    if index.val = 0 then first else second

def BinaryRelationHolds {alpha : Type}
    (relation : BinaryRelation alpha)
    (first second : alpha) : Prop :=
  memberOf (orderedPair first second) relation
```

## Arity-Tagged Relation Properties

A relation property should record the arity of relation it applies to, and the
proposition that relation must satisfy:

```lean
structure RelationProperty (alpha : Type) where
  arity : Nat
  proposition : Relation alpha arity -> Prop
```

Then `symmetric` is explicitly an arity-2 property:

```lean
def symmetric {alpha : Type} : RelationProperty alpha := {
  arity := 2
  proposition := fun relation =>
    forall first second : alpha,
      BinaryRelationHolds relation first second ->
      BinaryRelationHolds relation second first
}
```

So the repository can state:

```lean
Relations.symmetric.arity = 2
```

and apply the property as:

```lean
Relations.symmetric.proposition relation
```

where:

```lean
relation : Relation alpha Relations.symmetric.arity
```

## Proposed Atomic Properties

The first pass should define:

```lean
def reflexive {alpha : Type} : RelationProperty alpha := {
  arity := 2
  proposition := fun relation =>
    forall element : alpha,
      BinaryRelationHolds relation element element
}

def irreflexive {alpha : Type} : RelationProperty alpha := {
  arity := 2
  proposition := fun relation =>
    forall element : alpha,
      not (BinaryRelationHolds relation element element)
}

def symmetric {alpha : Type} : RelationProperty alpha := {
  arity := 2
  proposition := fun relation =>
    forall first second : alpha,
      BinaryRelationHolds relation first second ->
      BinaryRelationHolds relation second first
}

def antisymmetric {alpha : Type} : RelationProperty alpha := {
  arity := 2
  proposition := fun relation =>
    forall first second : alpha,
      BinaryRelationHolds relation first second ->
      BinaryRelationHolds relation second first ->
      first = second
}

def asymmetric {alpha : Type} : RelationProperty alpha := {
  arity := 2
  proposition := fun relation =>
    forall first second : alpha,
      BinaryRelationHolds relation first second ->
      not (BinaryRelationHolds relation second first)
}

def transitive {alpha : Type} : RelationProperty alpha := {
  arity := 2
  proposition := fun relation =>
    forall first second third : alpha,
      BinaryRelationHolds relation first second ->
      BinaryRelationHolds relation second third ->
      BinaryRelationHolds relation first third
}

def total {alpha : Type} : RelationProperty alpha := {
  arity := 2
  proposition := fun relation =>
    forall first second : alpha,
      BinaryRelationHolds relation first second or
      BinaryRelationHolds relation second first
}
```

Note that `transitive` quantifies over three elements, but its arity is still
`2`, because it is a property of a binary relation.

## Proposed Bundled Properties

Bundled properties should compose the atomic property propositions:

```lean
def equivalence {alpha : Type} : RelationProperty alpha := {
  arity := 2
  proposition := fun relation =>
    reflexive.proposition relation and
    symmetric.proposition relation and
    transitive.proposition relation
}

def preorder {alpha : Type} : RelationProperty alpha := {
  arity := 2
  proposition := fun relation =>
    reflexive.proposition relation and
    transitive.proposition relation
}

def partialOrder {alpha : Type} : RelationProperty alpha := {
  arity := 2
  proposition := fun relation =>
    preorder.proposition relation and
    antisymmetric.proposition relation
}

def totalOrder {alpha : Type} : RelationProperty alpha := {
  arity := 2
  proposition := fun relation =>
    partialOrder.proposition relation and
    total.proposition relation
}

def strictOrder {alpha : Type} : RelationProperty alpha := {
  arity := 2
  proposition := fun relation =>
    irreflexive.proposition relation and
    transitive.proposition relation
}
```

## First-Order Logic Integration

`LRA.VolumeI.FirstOrderLogic.Relations` should not be the canonical home for
ordinary relation properties.

Instead, it should import both:

```lean
import LRA.VolumeI.FirstOrderLogic.Model
import LRA.VolumeI.Sets.Relations
```

Its job should be to bridge a first-order relation symbol to a Sets relation
when the language proves that the symbol has the relevant arity:

```lean
def RelationSymbolHasArity
    {language : FirstOrderLanguage}
    (relationSymbol : language.RelationSymbols)
    (arity : Nat) : Prop :=
  language.arityOfRelationSymbol relationSymbol = arity

def RelationSymbolIsBinary
    {language : FirstOrderLanguage}
    (relationSymbol : language.RelationSymbols) : Prop :=
  RelationSymbolHasArity relationSymbol 2
```

Then model-theoretic predicates can be stated by interpreting an arity-2
relation symbol in a structure and applying the Sets-level property:

```lean
def InterpretedRelationSymbolIsSymmetric
    {language : FirstOrderLanguage}
    (interpretation : FirstOrderStructure language)
    (relationSymbol : language.RelationSymbols)
    (symbolIsBinary : RelationSymbolIsBinary relationSymbol) : Prop :=
  -- Convert the interpreted relation symbol into
  -- LRA.VolumeI.Sets.Relations.Relation interpretation.Domain 2,
  -- then apply Relations.symmetric.proposition.
```

That keeps the layers clean:

- Sets defines relations as sets of tuples.
- Sets defines relation properties with explicit arity.
- First-order logic defines languages, relation symbols, arities, structures,
  and interpretations.
- First-order relation code connects interpreted relation symbols to the
  set-theoretic relation lens.

