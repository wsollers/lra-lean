import LRA.EuclideanSpace.Interface.Signature
import LRA.Logic.Model.Model

namespace LRA.EuclideanSpace

universe u

/-!
`L_geom`-structures for Euclidean space.

At the logic layer, `LRA.Logic.FirstOrder.Model S` already means an
`L`-structure: a domain together with interpretations of the symbols of
`S`. For the Euclidean-space interface it is useful to expose that stage
with Euclidean naming before speaking about any axioms or theories.
-/

/-- An `L_geom`-structure: a point domain interpreting Tarski's
`between`/`congruent` vocabulary. -/
abbrev TarskiStructure := LRA.Logic.FirstOrder.Model TarskiFirstOrderSignature

/-- Build an `L_geom`-structure from a point type together with
interpretations of betweenness and congruence. -/
def BuildTarskiStructure {Point : Type u} [Nonempty Point]
    (between : Point -> Point -> Point -> Prop)
    (congruent : Point -> Point -> Point -> Point -> Prop) :
    TarskiStructure where
  Domain := Point
  domainNonempty := inferInstance
  interpretFunction := fun symbol _ => symbol.elim
  interpretRelation
    | .between, args =>
        between (args ⟨0, by decide⟩) (args ⟨1, by decide⟩) (args ⟨2, by decide⟩)
    | .congruent, args =>
        congruent (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
          (args ⟨2, by decide⟩) (args ⟨3, by decide⟩)
  interpretConstant := fun symbol => symbol.elim

/-- Backward-compatible name: in the underlying logic development, a
first-order `Model` is already an `L`-structure. -/
abbrev BuildTarskiModel := @BuildTarskiStructure

end LRA.EuclideanSpace
