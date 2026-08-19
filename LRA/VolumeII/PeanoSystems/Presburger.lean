import LRA.VolumeII.PeanoSystems.Presburger.ModelTheory.All
import LRA.NumberSystems.NaturalNumbers.Constructions.Presburger

/-!
Aggregate import for Peano-system Presburger material.

The Presburger construction itself (signature, model, addition) has
promoted to `LRA.NumberSystems.NaturalNumbers.Constructions.Presburger`.
`ModelTheory/FirstOrderSignature.lean` stays here: despite living in this
directory, `AdditiveOrderedSignature` is generic additive-ordered
vocabulary consumed by `LRA.VolumeII.Integers.Construction.Model`, not
Presburger-specific content, so it did not move with the rest.
-/
