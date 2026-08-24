import LRA.NumberSystems.Interface.ModelTheory.Model
import LRA.NumberSystems.Integers.Interface.Signature.Definition
import LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory.Model

namespace LRA.NumberSystems.Integers.Interface.ModelTheory

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.Integers.Interface.Signature
open LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory

/--
`integersModel` TODO

Predicate logic:

  def integersModel
    (integer_model : DiscretelyOrderedIntegralDomainModel) :
    LRA.Logic.FirstOrder.Model IntegersFirstOrderSignature :=
  BuildOrderedRingModel integer_model.signature

Predicate logic (unfolded):

  def integersModel
    (integer_model : DiscretelyOrderedIntegralDomainModel) :
    LRA.Logic.FirstOrder.Model IntegersFirstOrderSignature :=
  BuildOrderedRingModel integer_model.signature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def integersModel
    (integer_model : DiscretelyOrderedIntegralDomainModel) :
    LRA.Logic.FirstOrder.Model IntegersFirstOrderSignature :=
  BuildOrderedRingModel integer_model.signature
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
def integersModel
    (integer_model : DiscretelyOrderedIntegralDomainModel) :
    LRA.Logic.FirstOrder.Model IntegersFirstOrderSignature :=
  BuildOrderedRingModel integer_model.signature

end LRA.NumberSystems.Integers.Interface.ModelTheory
