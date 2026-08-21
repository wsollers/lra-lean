import LRA.EuclideanSpace.Interface.ModelTheory.Structure
import LRA.Logic.Theory

namespace LRA.EuclideanSpace

/-!
`L_geom` theories and the satisfaction relation between theories and
structures.

This file intentionally supplies only the model-theory scaffolding. The
actual Euclidean/Tarski axiom sets can be added later as concrete
elements of these types.
-/

/-- A first-order formula theory over the Euclidean language `L_geom`. -/
abbrev TarskiFormulaTheory (Variable : Type) :=
  LRA.Logic.FirstOrder.FormulaTheory TarskiFirstOrderSignature Variable

/-- A first-order sentence theory over the Euclidean language `L_geom`. -/
abbrev TarskiTheory (Variable : Type) [DecidableEq Variable] :=
  LRA.Logic.FirstOrder.Theory TarskiFirstOrderSignature Variable

/-- The class of `L_geom`-structures satisfying a Euclidean sentence
theory. -/
abbrev TarskiStructuresOfTheory {Variable : Type} [DecidableEq Variable]
    (Γ : TarskiTheory Variable) :
    Set TarskiStructure :=
  LRA.Logic.FirstOrder.ModelsOfTheory Γ

/-- A given `L_geom`-structure is a model of the Euclidean theory `Γ`. -/
def IsTarskiModelOf {Variable : Type} [DecidableEq Variable]
    (M : TarskiStructure) (Γ : TarskiTheory Variable) : Prop :=
  M ∈ TarskiStructuresOfTheory Γ

/-- A concrete model of a Euclidean theory: an `L_geom`-structure
together with a proof that it satisfies the theory. -/
structure TarskiModelOf {Variable : Type} [DecidableEq Variable]
    (Γ : TarskiTheory Variable) where
  toStructure : TarskiStructure
  isModel : IsTarskiModelOf toStructure Γ

end LRA.EuclideanSpace
