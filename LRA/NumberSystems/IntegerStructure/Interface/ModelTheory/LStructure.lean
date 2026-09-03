
import LRA.NumberSystems.IntegerStructure.Interface.Signature.Definition
import LRA.Operation
import LRA.AlgebraicStructures.DiscreteInteger.Interface.Laws.Definition

namespace LRA.NumberSystems.IntegerStructure.Interface.ModelTheory

universe u

open LRA.NumberSystems.IntegerStructure.Interface.Signature

/--
`IntegerStructureSignature` TODO

Predicate logic:

  structure IntegerStructureSignature where
  carrier : Type u
  zero : LRA.Operation.NullaryOperation carrier
  one : LRA.Operation.NullaryOperation carrier
  negativeOne : LRA.Operation.NullaryOperation carrier
  successor : LRA.Operation.UnaryOperation carrier
  predecessor : LRA.Operation.UnaryOperation carrier

Predicate logic (unfolded):

  structure IntegerStructureSignature where
  carrier : Type u
  zero : LRA.Operation.NullaryOperation carrier
  one : LRA.Operation.NullaryOperation carrier
  negativeOne : LRA.Operation.NullaryOperation carrier
  successor : LRA.Operation.UnaryOperation carrier
  predecessor : LRA.Operation.UnaryOperation carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure IntegerStructureSignature where
  carrier : Type u
  zero : LRA.Operation.NullaryOperation carrier
  one : LRA.Operation.NullaryOperation carrier
  negativeOne : LRA.Operation.NullaryOperation carrier
  successor : LRA.Operation.UnaryOperation carrier
  predecessor : LRA.Operation.UnaryOperation carrier
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
structure IntegerStructureSignature where
  carrier : Type u
  zero : LRA.Operation.NullaryOperation carrier
  one : LRA.Operation.NullaryOperation carrier
  negativeOne : LRA.Operation.NullaryOperation carrier
  successor : LRA.Operation.UnaryOperation carrier
  predecessor : LRA.Operation.UnaryOperation carrier

/--
`IntegerStructureLStructure` TODO

Predicate logic:

  abbrev IntegerStructureLStructure :=
  LRA.ModelTheory.FirstOrder.Model IntegerFirstOrderSignature

Predicate logic (unfolded):

  abbrev IntegerStructureLStructure :=
  LRA.ModelTheory.FirstOrder.Model IntegerFirstOrderSignature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev IntegerStructureLStructure :=
  LRA.ModelTheory.FirstOrder.Model IntegerFirstOrderSignature
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
abbrev IntegerStructureLStructure :=
  LRA.ModelTheory.FirstOrder.Model IntegerFirstOrderSignature

/--
`BuildIntegerStructureLStructure` TODO

Predicate logic:

  def BuildIntegerStructureLStructure
    (signature : IntegerStructureSignature) :
    IntegerStructureLStructure where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .successor, args => signature.successor (args ⟨0, by decide⟩)
    | .predecessor, args => signature.predecessor (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one
    | .negativeOne => signature.negativeOne

Predicate logic (unfolded):

  def BuildIntegerStructureLStructure
    (signature : IntegerStructureSignature) :
    IntegerStructureLStructure where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .successor, args => signature.successor (args ⟨0, by decide⟩)
    | .predecessor, args => signature.predecessor (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one
    | .negativeOne => signature.negativeOne (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BuildIntegerStructureLStructure
    (signature : IntegerStructureSignature) :
    IntegerStructureLStructure where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .successor, args => signature.successor (args ⟨0, by decide⟩)
    | .predecessor, args => signature.predecessor (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one
    | .negativeOne => signature.negativeOne
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
def BuildIntegerStructureLStructure
    (signature : IntegerStructureSignature) :
    IntegerStructureLStructure where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .successor, args => signature.successor (args ⟨0, by decide⟩)
    | .predecessor, args => signature.predecessor (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one
    | .negativeOne => signature.negativeOne

/--
`BuildIntegerStructureModel` TODO

Predicate logic:

  abbrev BuildIntegerStructureModel := BuildIntegerStructureLStructure

Predicate logic (unfolded):

  abbrev BuildIntegerStructureModel := BuildIntegerStructureLStructure (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev BuildIntegerStructureModel := BuildIntegerStructureLStructure
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
abbrev BuildIntegerStructureModel := BuildIntegerStructureLStructure

/--
`integerStructureFirstOrderModel` TODO

Predicate logic:

  def integerStructureFirstOrderModel (R : Type u) [OfNat R 0] [OfNat R 1]
    [LRA.AlgebraicStructures.HasSuccessor R]
    [LRA.AlgebraicStructures.HasPredecessor R] (negativeOneValue : R) :
    IntegerStructureLStructure :=
  BuildIntegerStructureLStructure
    { carrier := R
      zero := 0
      one := 1
      negativeOne := negativeOneValue
      successor := LRA.AlgebraicStructures.Succ
      predecessor := LRA.AlgebraicStructures.Pred }

Predicate logic (unfolded):

  def integerStructureFirstOrderModel (R : Type u) [OfNat R 0] [OfNat R 1]
    [LRA.AlgebraicStructures.HasSuccessor R]
    [LRA.AlgebraicStructures.HasPredecessor R] (negativeOneValue : R) :
    IntegerStructureLStructure :=
  BuildIntegerStructureLStructure
    { carrier := R
      zero := 0
      one := 1
      negativeOne := negativeOneValue
      successor := LRA.AlgebraicStructures.Succ
      predecessor := LRA.AlgebraicStructures.Pred } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def integerStructureFirstOrderModel (R : Type u) [OfNat R 0] [OfNat R 1]
    [LRA.AlgebraicStructures.HasSuccessor R]
    [LRA.AlgebraicStructures.HasPredecessor R] (negativeOneValue : R) :
    IntegerStructureLStructure :=
  BuildIntegerStructureLStructure
    { carrier := R
      zero := 0
      one := 1
      negativeOne := negativeOneValue
      successor := LRA.AlgebraicStructures.Succ
      predecessor := LRA.AlgebraicStructures.Pred }
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
def integerStructureFirstOrderModel (R : Type u) [OfNat R 0] [OfNat R 1]
    [LRA.AlgebraicStructures.HasSuccessor R]
    [LRA.AlgebraicStructures.HasPredecessor R] (negativeOneValue : R) :
    IntegerStructureLStructure :=
  BuildIntegerStructureLStructure
    { carrier := R
      zero := 0
      one := 1
      negativeOne := negativeOneValue
      successor := LRA.AlgebraicStructures.Succ
      predecessor := LRA.AlgebraicStructures.Pred }

end LRA.NumberSystems.IntegerStructure.Interface.ModelTheory
