-- LRA/NumberSystems/GaussianIntegers/Constructions/OrderedPairs/Equivalence.lean
-- GaussianInteger is a plain structure, not built from a coarser
-- representative type quotiented by an equivalence relation, so there is
-- no equivalence relation to state and prove -- coordinatewise equality
-- (Lean's own structure equality) is already the carrier's notion of
-- sameness.
--
-- Unlike its sibling `ComplexNumbers.Constructions.OrderedPairs`, the
-- source here never stated a coordinatewise-equality `ext` lemma either
-- (Complex's `Equivalence.lean` carries one, proved outright in the
-- source, not new content). Not added here: adding one would be new
-- content invented for symmetry with Complex rather than something this
-- migration's source called for.

import LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.Carrier

namespace LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs

end LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs
