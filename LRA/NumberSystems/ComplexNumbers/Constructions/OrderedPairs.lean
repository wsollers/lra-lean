import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.Carrier
import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.Equivalence
import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.WellFoundedness
import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.Operations
import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.WellDefinedness
import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.Laws
import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.Behavior
import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.Instances

/-!
Canonical import route for the ordered-pair construction of the complex
numbers over any certified carrier `R`. Moved from
`LRA.VolumeII.ComplexNumbers.Construction.Construction` (previously one
636-line file) and split into the §1.6.1 pipeline. See
`ComplexNumbers/ProofOrder.md`.
-/
