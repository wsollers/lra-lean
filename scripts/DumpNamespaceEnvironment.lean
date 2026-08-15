import Lean

open Lean

private def clean (value : String) : String :=
  (value.replace "\t" " ").replace "\r" " " |>.replace "\n" " "

private def declarationKind : ConstantInfo → String
  | .axiomInfo _ => "axiom"
  | .defnInfo _ => "definition"
  | .thmInfo _ => "theorem"
  | .opaqueInfo _ => "opaque"
  | .quotInfo _ => "quotient"
  | .inductInfo _ => "inductive"
  | .ctorInfo _ => "constructor"
  | .recInfo _ => "recursor"

private def evidenceClass (env : Environment) (name : Name)
    (info : ConstantInfo) : String :=
  if isPrivateName name then
    "private_implementation"
  else if (env.getProjectionFnInfo? name).isSome then
    "generated_projection"
  else
    match info with
    | .ctorInfo _ => "generated_constructor"
    | .recInfo _ => "generated_recursor"
    | _ => "authored_candidate"

private def apiStatus (name : Name) : String :=
  let rendered := name.toString
  if isPrivateName name then
    "private"
  else if rendered.startsWith "LRA.Internal" then
    "internal"
  else
    "public"

unsafe def main : IO Unit := do
  let env ← importModules #[{ module := `LRA }] {} (trustLevel := 0)
  let mut rows : Array String := #[]
  for h : moduleIndex in *...env.header.moduleNames.size do
    let moduleName := env.header.moduleNames[moduleIndex]
    let renderedModule := moduleName.toString
    if renderedModule == "LRA" || renderedModule.startsWith "LRA." then
      let moduleData := env.header.moduleData[moduleIndex]!
      for h : constantIndex in *...moduleData.constNames.size do
        let name := moduleData.constNames[constantIndex]
        let info := moduleData.constants[constantIndex]!
        let levelParams := String.intercalate "," (info.levelParams.map Name.toString)
        rows := rows.push <| String.intercalate "\t" [
          clean name.toString,
          clean renderedModule,
          declarationKind info,
          evidenceClass env name info,
          apiStatus name,
          clean (toString info.type),
          clean levelParams
        ]
  IO.FS.createDirAll "build"
  IO.FS.writeFile "build/namespace-environment.tsv" <|
    "fq_name\tmodule\tkind\tenvironment_class\tapi_status\ttype_summary\tuniverse_params\n" ++
      String.intercalate "\n" rows.toList ++ "\n"
