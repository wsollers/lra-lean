import LRA.AlgebraicStructures.IntegralDomain.Interface.Signature.Definition

namespace LRA.NumberSystems.GaussianIntegers.Interface.Signature

abbrev GaussianIntegersFunctionSymbol :=
  LRA.AlgebraicStructures.Ring.Interface.Signature.RingFunctionSymbol

abbrev GaussianIntegersRelationSymbol :=
  LRA.AlgebraicStructures.Ring.Interface.Signature.RingRelationSymbol

abbrev GaussianIntegersConstantSymbol :=
  LRA.AlgebraicStructures.Ring.Interface.Signature.RingConstantSymbol

def GaussianIntegersFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.Ring.Interface.Signature.RingFirstOrderFunctions

def GaussianIntegersFirstOrderRelations : LRA.Logic.ArityIndexedSymbols :=
  LRA.AlgebraicStructures.Ring.Interface.Signature.RingFirstOrderRelations

/-- Previously `NumberSystems.Arithmetic.Model.ArithmeticRingFirstOrderSignature`
(`add`/`mul` only, no `neg` — a rig, not a ring, despite the name), which
made `GaussianIntegers` unable to compose `IntegralDomain`'s
`Interface/ModelTheory` the way `Integers` composes
`DiscretelyOrderedIntegralDomainModel`. Repointed to the canonical
`IntegralDomainFirstOrderSignature` (`add`/`mul`/`neg`, via `Ring`'s
signature) instead of patching the old one in place, since it's already
built and exactly matches what `GaussianInteger R`'s own `Add`/`Mul`/`Neg`
instances (`Constructions/OrderedPairs/Operations.lean`) provide. -/
def GaussianIntegersFirstOrderSignature : LRA.Logic.Signature :=
  LRA.AlgebraicStructures.IntegralDomain.Interface.Signature.IntegralDomainFirstOrderSignature

end LRA.NumberSystems.GaussianIntegers.Interface.Signature
