import LRA.NumberSystems.VonNeumann.Interface.Signature.Definition
import LRA.AlgebraicStructures.DiscreteInteger.Interface.Laws.Definition
import LRA.Operation

namespace LRA.NumberSystems.VonNeumann.Interface.ModelTheory

open LRA.NumberSystems.VonNeumann.Interface.Signature
open LRA.AlgebraicStructures

universe u

/--
`VonNeumannSignature` TODO

Predicate logic:

  structure VonNeumannSignature where
    carrier : Type u
    zero : LRA.Operation.NullaryOperation carrier
    one : LRA.Operation.NullaryOperation carrier
    successor : LRA.Operation.UnaryOperation carrier
    addition : LRA.Operation.BinaryOperation carrier
    multiplication : LRA.Operation.BinaryOperation carrier
    lessThan : carrier → carrier → Prop

Predicate logic (unfolded):

  structure VonNeumannSignature where
    carrier : Type u
    zero : LRA.Operation.NullaryOperation carrier
    one : LRA.Operation.NullaryOperation carrier
    successor : LRA.Operation.UnaryOperation carrier
    addition : LRA.Operation.BinaryOperation carrier
    multiplication : LRA.Operation.BinaryOperation carrier
    lessThan : carrier → carrier → Prop (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure VonNeumannSignature where
  carrier : Type u
  zero : LRA.Operation.NullaryOperation carrier
  one : LRA.Operation.NullaryOperation carrier
  successor : LRA.Operation.UnaryOperation carrier
  addition : LRA.Operation.BinaryOperation carrier
  multiplication : LRA.Operation.BinaryOperation carrier
  lessThan : carrier → carrier → Prop
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
structure VonNeumannSignature where
  carrier : Type u
  zero : LRA.Operation.NullaryOperation carrier
  one : LRA.Operation.NullaryOperation carrier
  successor : LRA.Operation.UnaryOperation carrier
  addition : LRA.Operation.BinaryOperation carrier
  multiplication : LRA.Operation.BinaryOperation carrier
  lessThan : carrier → carrier → Prop

/--
`VonNeumannLStructure` TODO

Predicate logic:

  abbrev VonNeumannLStructure :=
    LRA.ModelTheory.FirstOrder.Model VonNeumannFirstOrderSignature

Predicate logic (unfolded):

  abbrev VonNeumannLStructure :=
    LRA.ModelTheory.FirstOrder.Model VonNeumannFirstOrderSignature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev VonNeumannLStructure :=
  LRA.ModelTheory.FirstOrder.Model VonNeumannFirstOrderSignature
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
abbrev VonNeumannLStructure :=
  LRA.ModelTheory.FirstOrder.Model VonNeumannFirstOrderSignature

/--
`BuildVonNeumannLStructure` TODO

Predicate logic:

  def BuildVonNeumannLStructure
      (signature : VonNeumannSignature) :
      VonNeumannLStructure where
    Domain

Predicate logic (unfolded):

  def BuildVonNeumannLStructure
      (signature : VonNeumannSignature) :
      VonNeumannLStructure where
    Domain (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BuildVonNeumannLStructure
    (signature : VonNeumannSignature) :
    VonNeumannLStructure where
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
def BuildVonNeumannLStructure
    (signature : VonNeumannSignature) :
    VonNeumannLStructure where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .successor, args => signature.successor (args ⟨0, by decide⟩)
    | .addition, args =>
        signature.addition (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .multiplication, args =>
        signature.multiplication (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation
    | .lessThan, args =>
        signature.lessThan (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

/--
`BuildVonNeumannModel` TODO

Predicate logic:

  abbrev BuildVonNeumannModel := BuildVonNeumannLStructure

Predicate logic (unfolded):

  abbrev BuildVonNeumannModel := BuildVonNeumannLStructure (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev BuildVonNeumannModel := BuildVonNeumannLStructure
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
abbrev BuildVonNeumannModel := BuildVonNeumannLStructure

/--
`vonNeumannFirstOrderModel` TODO

Predicate logic:

  def vonNeumannFirstOrderModel (R : Type u) [OfNat R 0] [OfNat R 1]
      [HasSuccessor R] [Add R] [Mul R] (lt : R → R → Prop) :
      VonNeumannLStructure :=
    BuildVonNeumannLStructure
      { carrier := R
        zero := 0
        one := 1
        successor := LRA.AlgebraicStructures.Succ
        addition := (· + ·)
        multiplication := (· * ·)
        lessThan := lt }

Predicate logic (unfolded):

  def vonNeumannFirstOrderModel (R : Type u) [OfNat R 0] [OfNat R 1]
      [HasSuccessor R] [Add R] [Mul R] (lt : R → R → Prop) :
      VonNeumannLStructure :=
    BuildVonNeumannLStructure
      { carrier := R
        zero := 0
        one := 1
        successor := LRA.AlgebraicStructures.Succ
        addition := (· + ·)
        multiplication := (· * ·)
        lessThan := lt } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def vonNeumannFirstOrderModel (R : Type u) [OfNat R 0] [OfNat R 1]
    [HasSuccessor R] [Add R] [Mul R] (lt : R → R → Prop) :
    VonNeumannLStructure :=
  BuildVonNeumannLStructure
    { carrier := R
      zero := 0
      one := 1
      successor := LRA.AlgebraicStructures.Succ
      addition := (· + ·)
      multiplication := (· * ·)
      lessThan := lt }
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
def vonNeumannFirstOrderModel (R : Type u) [OfNat R 0] [OfNat R 1]
    [HasSuccessor R] [Add R] [Mul R] (lt : R → R → Prop) :
    VonNeumannLStructure :=
  BuildVonNeumannLStructure
    { carrier := R
      zero := 0
      one := 1
      successor := LRA.AlgebraicStructures.Succ
      addition := (· + ·)
      multiplication := (· * ·)
      lessThan := lt }

end LRA.NumberSystems.VonNeumann.Interface.ModelTheory
