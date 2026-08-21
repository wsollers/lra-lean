import LRA.EuclideanSpace.Interface.Signature
import LRA.Logic.Model.Model

namespace LRA.EuclideanSpace

universe u

/-!
A model (`L_geom`-structure) of `TarskiFirstOrderSignature`: any point
domain together with interpretations of `between`/`congruent`. Building
a `Model` only registers a vocabulary interpretation -- it asserts
nothing yet about whether those relations actually satisfy Tarski's
axioms. Proving that for the concrete `Point n` domain (built from `ℝ`'s
field/order structure) is later work.
-/

/-- Build a model of `L_geom` from a point type together with
interpretations of betweenness and congruence.

Logical form:

```lean
def BuildTarskiModel {Point : Type u} [Nonempty Point]
    (between : Point -> Point -> Point -> Prop)
    (congruent : Point -> Point -> Point -> Point -> Prop) :
    LRA.Logic.FirstOrder.Model TarskiFirstOrderSignature where
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
```
-/
def BuildTarskiModel {Point : Type u} [Nonempty Point]
    (between : Point -> Point -> Point -> Prop)
    (congruent : Point -> Point -> Point -> Point -> Prop) :
    LRA.Logic.FirstOrder.Model TarskiFirstOrderSignature where
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

end LRA.EuclideanSpace
