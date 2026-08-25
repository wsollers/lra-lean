import Lean
import LRA.AlgebraicStructures.BooleanAlgebra.Laws.Definition

open Lean

unsafe def main : IO Unit := do
  let env <- importModules #[{ module := `LRA.AlgebraicStructures.BooleanAlgebra.Laws.Definition }] {}
  let name := `LRA.AlgebraicStructures.BooleanAlgebraLaws
  match env.find? name with
  | none =>
      IO.println "NOT_FOUND"
  | some info =>
      IO.println s!"name={name}"
      match info with
      | .defnInfo defn =>
          IO.println "kind=defnInfo"
          IO.println s!"type={defn.type}"
      | .thmInfo thm =>
          IO.println "kind=thmInfo"
          IO.println s!"type={thm.type}"
      | .axiomInfo ax =>
          IO.println "kind=axiomInfo"
          IO.println s!"type={ax.type}"
      | other =>
          IO.println s!"kind=other {repr other}"
