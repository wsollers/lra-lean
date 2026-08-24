import LRA.NumberSystems.NaturalNumbers.Interface.Signature.Definition
import LRA.AlgebraicStructures.CommutativeSemiringWithoutZero.Interface.ModelTheory.Model

namespace LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory

open LRA.NumberSystems.NaturalNumbers.Interface.Signature
open LRA.AlgebraicStructures.CommutativeSemiringWithoutZero.Interface.ModelTheory

/--
`naturalNumbersModel` TODO

Predicate logic:

  def naturalNumbersModel
    (natural_model : LRA.AlgebraicStructures.CommutativeSemiringWithoutZeroConceptSignature) :
    LRA.Logic.FirstOrder.Model NaturalNumbersFirstOrderSignature :=
  BuildCommutativeSemiringWithoutZeroModel natural_model

Predicate logic (unfolded):

  def naturalNumbersModel
    (natural_model : LRA.AlgebraicStructures.CommutativeSemiringWithoutZeroConceptSignature) :
    LRA.Logic.FirstOrder.Model NaturalNumbersFirstOrderSignature :=
  BuildCommutativeSemiringWithoutZeroModel natural_model (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def naturalNumbersModel
    (natural_model : LRA.AlgebraicStructures.CommutativeSemiringWithoutZeroConceptSignature) :
    LRA.Logic.FirstOrder.Model NaturalNumbersFirstOrderSignature :=
  BuildCommutativeSemiringWithoutZeroModel natural_model
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
def naturalNumbersModel
    (natural_model : LRA.AlgebraicStructures.CommutativeSemiringWithoutZeroConceptSignature) :
    LRA.Logic.FirstOrder.Model NaturalNumbersFirstOrderSignature :=
  BuildCommutativeSemiringWithoutZeroModel natural_model

end LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory
