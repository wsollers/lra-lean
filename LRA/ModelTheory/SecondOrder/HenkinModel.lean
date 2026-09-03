import Mathlib.Data.Set.Defs
import LRA.ModelTheory.Model

open LRA.Logic

namespace LRA.ModelTheory.SecondOrder

/--
General Henkin second-order models carry designated admissible domains for
relation and function variables at each finite arity.
-/
structure HenkinModel (S : Signature) extends ModelTheory.FirstOrder.Model S where
  RelationDomain : (arity : Nat) → Set ((Fin arity → Domain) → Prop)
  FunctionDomain : (arity : Nat) → Set ((Fin arity → Domain) → Domain)

/-- Compatibility projection for first-order interpretation data. -/
abbrev HenkinModel.toModel {S : Signature} (M : HenkinModel S) :=
  M.toInterpretation

def HasFullSecondOrderSemantics {S : Signature} (M : HenkinModel S) : Prop :=
  (∀ arity (relation_ : (Fin arity → M.Domain) → Prop),
      relation_ ∈ M.RelationDomain arity) ∧
    ∀ arity (function_ : (Fin arity → M.Domain) → M.Domain),
      function_ ∈ M.FunctionDomain arity

end LRA.ModelTheory.SecondOrder
