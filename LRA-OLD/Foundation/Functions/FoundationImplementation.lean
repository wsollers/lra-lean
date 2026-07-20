-- LRA/Foundation/Functions/FoundationImplementation.lean
-- Foundation-backed function implementation.

import LRA.Foundation.Functions.Interface

namespace LRA
namespace Foundation
namespace Functions
namespace FoundationFunctions

/-!
Lean module: LRA.Foundation.Functions.FoundationImplementation
Verification status: checked implementation module

This implementation interprets the switchable function interface by Lean's
ordinary function type, already aliased as `LRA.Foundation.Function`.
-/

abbrev Function (α β : LRACarrier) : LRACarrier :=
  Foundation.Function α β

def implementation : LRAFunctionImplementation where
  Function := Function
  apply := fun function input => function input
  ofNative := fun function => function
  identity := Foundation.Function.identity
  compose := Foundation.Function.compose
  extensionality := by
    intro α β left right sameValues
    funext input
    exact sameValues input

namespace Tests

def double : implementation.Function Nat Nat :=
  implementation.ofNative (fun n => n + n)

example : implementation.apply double 3 = 6 := by
  rfl

example :
    implementation.apply
      (implementation.compose double (implementation.identity Nat)) 4 = 8 := by
  rfl

end Tests

end FoundationFunctions
end Functions
end Foundation
end LRA
