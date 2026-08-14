import Batteries.Lean.NameMapAttribute

/-!
# Pilot semantic metadata

Small Lean-native metadata annotations used to test extracting stable concept
identifiers from compiled declarations.  The string is intentional authored
metadata; declaration signatures and dependencies remain extractable from
Lean itself.
-/

namespace LRA.Pilot.Metadata

open Lean

/-- Attribute syntax associating a canonical Lean declaration with a stable
LRA concept identifier. -/
syntax (name := lraCanonicalAttr) "lraCanonical" str : attr

/-- Compiled mapping from canonical declaration names to stable LRA concept
identifiers. -/
initialize lraCanonicalExtension : NameMapExtension String ←
  registerNameMapAttribute {
    name := `lraCanonicalAttr
    descr := "associate a canonical LRA declaration with its stable concept identifier"
    add := fun _ declarationSyntax => do
      match declarationSyntax with
      | `(attr| lraCanonical $conceptId:str) => pure conceptId.getString
      | _ => throwError "unsupported lraCanonical attribute syntax"
  }

/-- Return the canonical LRA concept identifier attached to a declaration, if
one was registered.

Logical form:

```lean
lraCanonicalExtension.find? environment declarationName
```
-/
def CanonicalConceptId? (environment : Environment) (declarationName : Name) :
    Option String :=
  lraCanonicalExtension.find? environment declarationName

end LRA.Pilot.Metadata
