import LRA.NumberSystems.SuccessorArithmetic.Interface.Signature.Definition
import LRA.AlgebraicStructures.DiscreteInteger.Interface.Laws.Definition
import LRA.Operation

namespace LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory

open LRA.NumberSystems.SuccessorArithmetic.Interface.Signature
open LRA.AlgebraicStructures

universe u

/--
`SuccessorArithmeticSignature` TODO

Predicate logic:

  structure SuccessorArithmeticSignature where
    carrier : Type u
    zero : LRA.Operation.NullaryOperation carrier
    successor : LRA.Operation.UnaryOperation carrier

Predicate logic (unfolded):

  structure SuccessorArithmeticSignature where
    carrier : Type u
    zero : LRA.Operation.NullaryOperation carrier
    successor : LRA.Operation.UnaryOperation carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure SuccessorArithmeticSignature where
  carrier : Type u
  zero : LRA.Operation.NullaryOperation carrier
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
structure SuccessorArithmeticSignature where
  carrier : Type u
  zero : LRA.Operation.NullaryOperation carrier
  successor : LRA.Operation.UnaryOperation carrier

/--
`SuccessorArithmeticLStructure` TODO

Predicate logic:

  abbrev SuccessorArithmeticLStructure :=
    LRA.ModelTheory.FirstOrder.Model SuccessorArithmeticFirstOrderSignature

Predicate logic (unfolded):

  abbrev SuccessorArithmeticLStructure :=
    LRA.ModelTheory.FirstOrder.Model SuccessorArithmeticFirstOrderSignature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev SuccessorArithmeticLStructure :=
  LRA.ModelTheory.FirstOrder.Model SuccessorArithmeticFirstOrderSignature
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
abbrev SuccessorArithmeticLStructure :=
  LRA.ModelTheory.FirstOrder.Model SuccessorArithmeticFirstOrderSignature

/--
`BuildSuccessorArithmeticLStructure` TODO

Predicate logic:

  def BuildSuccessorArithmeticLStructure
      (signature : SuccessorArithmeticSignature) :
      SuccessorArithmeticLStructure where
    Domain := signature.carrier
    domainNonempty := ⟨signature.zero⟩
    interpretFunction
      | .successor, args => signature.successor (args ⟨0, by decide⟩)
    interpretRelation := fun relation => nomatch relation
    interpretConstant
      | .zero => signature.zero

Predicate logic (unfolded):

  def BuildSuccessorArithmeticLStructure
      (signature : SuccessorArithmeticSignature) :
      SuccessorArithmeticLStructure where
    Domain := signature.carrier
    domainNonempty := ⟨signature.zero⟩
    interpretFunction
      | .successor, args => signature.successor (args ⟨0, by decide⟩)
    interpretRelation := fun relation => nomatch relation
    interpretConstant
      | .zero => signature.zero (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BuildSuccessorArithmeticLStructure
    (signature : SuccessorArithmeticSignature) :
    SuccessorArithmeticLStructure where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .successor, args => signature.successor (args ⟨0, by decide⟩)
  interpretRelation := fun relation => nomatch relation
  interpretConstant
    | .zero => signature.zero
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
def BuildSuccessorArithmeticLStructure
    (signature : SuccessorArithmeticSignature) :
    SuccessorArithmeticLStructure where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .successor, args => signature.successor (args ⟨0, by decide⟩)
  interpretRelation := fun relation => nomatch relation
  interpretConstant
    | .zero => signature.zero

/--
`BuildSuccessorArithmeticModel` TODO

Predicate logic:

  abbrev BuildSuccessorArithmeticModel := BuildSuccessorArithmeticLStructure

Predicate logic (unfolded):

  abbrev BuildSuccessorArithmeticModel := BuildSuccessorArithmeticLStructure (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev BuildSuccessorArithmeticModel := BuildSuccessorArithmeticLStructure
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
abbrev BuildSuccessorArithmeticModel := BuildSuccessorArithmeticLStructure

/--
`successorArithmeticFirstOrderModel` TODO

Predicate logic:

  def successorArithmeticFirstOrderModel (R : Type u) [OfNat R 0]
      [HasSuccessor R] : SuccessorArithmeticLStructure :=
    BuildSuccessorArithmeticLStructure
      { carrier := R, zero := 0, successor := LRA.AlgebraicStructures.Succ }

Predicate logic (unfolded):

  def successorArithmeticFirstOrderModel (R : Type u) [OfNat R 0]
      [HasSuccessor R] : SuccessorArithmeticLStructure :=
    BuildSuccessorArithmeticLStructure
      { carrier := R, zero := 0, successor := LRA.AlgebraicStructures.Succ } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def successorArithmeticFirstOrderModel (R : Type u) [OfNat R 0]
    [HasSuccessor R] : SuccessorArithmeticLStructure :=
  BuildSuccessorArithmeticLStructure
    { carrier := R, zero := 0, successor := LRA.AlgebraicStructures.Succ }
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
def successorArithmeticFirstOrderModel (R : Type u) [OfNat R 0]
    [HasSuccessor R] : SuccessorArithmeticLStructure :=
  BuildSuccessorArithmeticLStructure
    { carrier := R, zero := 0, successor := LRA.AlgebraicStructures.Succ }

end LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory
