import LRA.NumberSystems.ComplexNumbers.Interface.Signature.Definition
import LRA.AlgebraicStructures.Field.Interface.ModelTheory.Model
import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.Operations

namespace LRA.NumberSystems.ComplexNumbers.Interface.ModelTheory

open LRA.NumberSystems.ComplexNumbers.Interface.Signature
open LRA.AlgebraicStructures.Field.Interface.ModelTheory
open LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs

universe u

/--
`complexNumbersModel` TODO

Predicate logic:

  def complexNumbersModel (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] :
    LRA.ModelTheory.FirstOrder.Model ComplexNumbersFirstOrderSignature :=
  fieldFirstOrderModel (ComplexNumber R)

Predicate logic (unfolded):

  def complexNumbersModel (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] :
    LRA.ModelTheory.FirstOrder.Model ComplexNumbersFirstOrderSignature :=
  fieldFirstOrderModel (ComplexNumber R) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def complexNumbersModel (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] :
    LRA.ModelTheory.FirstOrder.Model ComplexNumbersFirstOrderSignature :=
  fieldFirstOrderModel (ComplexNumber R)
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
def complexNumbersModel (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] :
    LRA.ModelTheory.FirstOrder.Model ComplexNumbersFirstOrderSignature :=
  fieldFirstOrderModel (ComplexNumber R)

/--
`complexNumbersOverMathlibReals` TODO

Predicate logic:

  noncomputable def complexNumbersOverMathlibReals :
    LRA.ModelTheory.FirstOrder.Model ComplexNumbersFirstOrderSignature :=
  complexNumbersModel Real

Predicate logic (unfolded):

  noncomputable def complexNumbersOverMathlibReals :
    LRA.ModelTheory.FirstOrder.Model ComplexNumbersFirstOrderSignature :=
  complexNumbersModel Real (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def complexNumbersOverMathlibReals :
    LRA.ModelTheory.FirstOrder.Model ComplexNumbersFirstOrderSignature :=
  complexNumbersModel Real
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
noncomputable def complexNumbersOverMathlibReals :
    LRA.ModelTheory.FirstOrder.Model ComplexNumbersFirstOrderSignature :=
  complexNumbersModel Real

end LRA.NumberSystems.ComplexNumbers.Interface.ModelTheory
