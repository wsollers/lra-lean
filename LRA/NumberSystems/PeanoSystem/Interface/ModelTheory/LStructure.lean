
import LRA.NumberSystems.PeanoSystem.Interface.Signature.Definition
import LRA.Operation
import LRA.AlgebraicStructures.DiscreteInteger.Interface.Laws.Definition

namespace LRA.NumberSystems.PeanoSystem.Interface.ModelTheory

universe u

open LRA.NumberSystems.PeanoSystem.Interface.Signature

/--
`PeanoSignature` TODO

Predicate logic:

  structure PeanoSignature where
  carrier : Type u
  one : LRA.Operation.NullaryOperation carrier
  successor : LRA.Operation.UnaryOperation carrier

Predicate logic (unfolded):

  structure PeanoSignature where
  carrier : Type u
  one : LRA.Operation.NullaryOperation carrier
  successor : LRA.Operation.UnaryOperation carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure PeanoSignature where
  carrier : Type u
  one : LRA.Operation.NullaryOperation carrier
  successor : LRA.Operation.UnaryOperation carrier
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
structure PeanoSignature where
  carrier : Type u
  one : LRA.Operation.NullaryOperation carrier
  successor : LRA.Operation.UnaryOperation carrier

/--
`PeanoLStructure` TODO

Predicate logic:

  abbrev PeanoLStructure :=
  LRA.Logic.FirstOrder.Model PeanoFirstOrderSignature

Predicate logic (unfolded):

  abbrev PeanoLStructure :=
  LRA.Logic.FirstOrder.Model PeanoFirstOrderSignature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev PeanoLStructure :=
  LRA.Logic.FirstOrder.Model PeanoFirstOrderSignature
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
abbrev PeanoLStructure :=
  LRA.Logic.FirstOrder.Model PeanoFirstOrderSignature

/--
`BuildPeanoLStructure` TODO

Predicate logic:

  def BuildPeanoLStructure
    (signature : PeanoSignature) :
    PeanoLStructure where
  Domain := signature.carrier
  domainNonempty := ⟨signature.one⟩
  interpretFunction
    | .successor, args => signature.successor (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .one => signature.one

Predicate logic (unfolded):

  def BuildPeanoLStructure
    (signature : PeanoSignature) :
    PeanoLStructure where
  Domain := signature.carrier
  domainNonempty := ⟨signature.one⟩
  interpretFunction
    | .successor, args => signature.successor (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .one => signature.one (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BuildPeanoLStructure
    (signature : PeanoSignature) :
    PeanoLStructure where
  Domain := signature.carrier
  domainNonempty := ⟨signature.one⟩
  interpretFunction
    | .successor, args => signature.successor (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .one => signature.one
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
def BuildPeanoLStructure
    (signature : PeanoSignature) :
    PeanoLStructure where
  Domain := signature.carrier
  domainNonempty := ⟨signature.one⟩
  interpretFunction
    | .successor, args => signature.successor (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .one => signature.one

/--
`BuildPeanoModel` TODO

Predicate logic:

  abbrev BuildPeanoModel := BuildPeanoLStructure

Predicate logic (unfolded):

  abbrev BuildPeanoModel := BuildPeanoLStructure (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev BuildPeanoModel := BuildPeanoLStructure
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
abbrev BuildPeanoModel := BuildPeanoLStructure

/--
`peanoFirstOrderModel` TODO

Predicate logic:

  def peanoFirstOrderModel (R : Type u) [OfNat R 1]
    [LRA.AlgebraicStructures.HasSuccessor R] :
    PeanoLStructure :=
  BuildPeanoLStructure { carrier := R, one := 1, successor := LRA.AlgebraicStructures.Succ }

Predicate logic (unfolded):

  def peanoFirstOrderModel (R : Type u) [OfNat R 1]
    [LRA.AlgebraicStructures.HasSuccessor R] :
    PeanoLStructure :=
  BuildPeanoLStructure { carrier := R, one := 1, successor := LRA.AlgebraicStructures.Succ } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def peanoFirstOrderModel (R : Type u) [OfNat R 1]
    [LRA.AlgebraicStructures.HasSuccessor R] :
    PeanoLStructure :=
  BuildPeanoLStructure { carrier := R, one := 1, successor := LRA.AlgebraicStructures.Succ }
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
def peanoFirstOrderModel (R : Type u) [OfNat R 1]
    [LRA.AlgebraicStructures.HasSuccessor R] :
    PeanoLStructure :=
  BuildPeanoLStructure { carrier := R, one := 1, successor := LRA.AlgebraicStructures.Succ }

end LRA.NumberSystems.PeanoSystem.Interface.ModelTheory
