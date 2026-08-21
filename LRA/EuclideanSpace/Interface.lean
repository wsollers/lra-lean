import LRA.EuclideanSpace.Interface.Signature
import LRA.EuclideanSpace.Interface.Model

/-!
Aggregate import for the `Interface` concept: the abstract
model-theoretic characterization of Euclidean space, via Tarski's
`{Between, Congruent}` axiomatization of `E_n`. `TarskiRelationSymbol`
and `TarskiFirstOrderSignature` live in `Interface/Signature.lean`;
`BuildTarskiModel` lives in `Interface/Model.lean`. The theory (Tarski's
eleven axioms) and the standard `Point n` model proving them are later
work -- this concept currently registers only the vocabulary and the
shape of a model, mirroring how `AlgebraicStructures.OrderedField`'s own
`Interface/ModelTheory/Axioms.lean` is empty and the real axiom content
lives in a separate `Laws` layer.
-/
