import LRA.NumberSystems.Presburger.Interface.Signature.Definition
import LRA.AlgebraicStructures.DiscreteInteger.Interface.Laws.Definition
import LRA.Operation

namespace LRA.NumberSystems.Presburger.Interface.ModelTheory

open LRA.NumberSystems.Presburger.Interface.Signature
open LRA.AlgebraicStructures

universe u

/--
`PresburgerSignature` TODO

Predicate logic:

  structure PresburgerSignature where
    carrier : Type u
    zero : LRA.Operation.NullaryOperation carrier
    successor : LRA.Operation.UnaryOperation carrier
    addition : LRA.Operation.BinaryOperation carrier
    lessThan : carrier → carrier → Prop

Predicate logic (unfolded):

  structure PresburgerSignature where
    carrier : Type u
    zero : LRA.Operation.NullaryOperation carrier
    successor : LRA.Operation.UnaryOperation carrier
    addition : LRA.Operation.BinaryOperation carrier
    lessThan : carrier → carrier → Prop (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure PresburgerSignature where
  carrier : Type u
  zero : LRA.Operation.NullaryOperation carrier
  successor : LRA.Operation.UnaryOperation carrier
  addition : LRA.Operation.BinaryOperation carrier
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
structure PresburgerSignature where
  carrier : Type u
  zero : LRA.Operation.NullaryOperation carrier
  successor : LRA.Operation.UnaryOperation carrier
  addition : LRA.Operation.BinaryOperation carrier
  lessThan : carrier → carrier → Prop

/--
`PresburgerLStructure` TODO

Predicate logic:

  abbrev PresburgerLStructure :=
    LRA.ModelTheory.FirstOrder.Model PresburgerFirstOrderSignature

Predicate logic (unfolded):

  abbrev PresburgerLStructure :=
    LRA.ModelTheory.FirstOrder.Model PresburgerFirstOrderSignature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev PresburgerLStructure :=
  LRA.ModelTheory.FirstOrder.Model PresburgerFirstOrderSignature
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
abbrev PresburgerLStructure :=
  LRA.ModelTheory.FirstOrder.Model PresburgerFirstOrderSignature

/--
`BuildPresburgerLStructure` TODO

Predicate logic:

  def BuildPresburgerLStructure
      (signature : PresburgerSignature) :
      PresburgerLStructure where
    Domain

Predicate logic (unfolded):

  def BuildPresburgerLStructure
      (signature : PresburgerSignature) :
      PresburgerLStructure where
    Domain (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BuildPresburgerLStructure
    (signature : PresburgerSignature) :
    PresburgerLStructure where
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
def BuildPresburgerLStructure
    (signature : PresburgerSignature) :
    PresburgerLStructure where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .successor, args => signature.successor (args ⟨0, by decide⟩)
    | .addition, args =>
        signature.addition (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation
    | .lessThan, args =>
        signature.lessThan (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretConstant
    | .zero => signature.zero

/--
`BuildPresburgerModel` TODO

Predicate logic:

  def BuildPresburgerModel := BuildPresburgerLStructure

Predicate logic (unfolded):

  def BuildPresburgerModel := BuildPresburgerLStructure (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BuildPresburgerModel := BuildPresburgerLStructure
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
def BuildPresburgerModel := BuildPresburgerLStructure

/--
`presburgerFirstOrderModel` TODO

Predicate logic:

  def presburgerFirstOrderModel (R : Type u) [OfNat R 0]
      [HasSuccessor R] [Add R] (lt : R → R → Prop) :
      PresburgerLStructure :=
    BuildPresburgerLStructure
      { carrier := R
        zero := 0
        successor := LRA.AlgebraicStructures.Succ
        addition := (· + ·)
        lessThan := lt }

Predicate logic (unfolded):

  def presburgerFirstOrderModel (R : Type u) [OfNat R 0]
      [HasSuccessor R] [Add R] (lt : R → R → Prop) :
      PresburgerLStructure :=
    BuildPresburgerLStructure
      { carrier := R
        zero := 0
        successor := LRA.AlgebraicStructures.Succ
        addition := (· + ·)
        lessThan := lt } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def presburgerFirstOrderModel (R : Type u) [OfNat R 0]
    [HasSuccessor R] [Add R] (lt : R → R → Prop) :
    PresburgerLStructure :=
  BuildPresburgerLStructure
    { carrier := R
      zero := 0
      successor := LRA.AlgebraicStructures.Succ
      addition := (· + ·)
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
def presburgerFirstOrderModel (R : Type u) [OfNat R 0]
    [HasSuccessor R] [Add R] (lt : R → R → Prop) :
    PresburgerLStructure :=
  BuildPresburgerLStructure
    { carrier := R
      zero := 0
      successor := LRA.AlgebraicStructures.Succ
      addition := (· + ·)
      lessThan := lt }

end LRA.NumberSystems.Presburger.Interface.ModelTheory
