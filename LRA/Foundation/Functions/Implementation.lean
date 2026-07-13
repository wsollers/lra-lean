-- LRA/Foundation/Functions/Implementation.lean
-- Active function implementation switch.

import LRA.Foundation.Functions.FoundationImplementation

namespace LRA
namespace Foundation
namespace Functions

/-!
Lean module: LRA.Foundation.Functions.Implementation
Verification status: checked switch module

This module is the shared implementation switch for function construction work.
Change the abbreviations in `Active` to make another function representation
the default target for later volumes.
-/

namespace Active

abbrev FunctionImpl : LRAFunctionImplementation := FoundationFunctions.implementation

abbrev Function (α β : LRACarrier) : LRACarrier :=
  FunctionImpl.Function α β

abbrev apply {α β : LRACarrier} (function : Function α β) (input : α) : β :=
  FunctionImpl.apply function input

abbrev ofNative {α β : LRACarrier} (function : α → β) : Function α β :=
  FunctionImpl.ofNative function

abbrev identity (α : LRACarrier) : Function α α :=
  FunctionImpl.identity α

abbrev compose {α β γ : LRACarrier}
    (right : Function β γ) (left : Function α β) : Function α γ :=
  FunctionImpl.compose right left

abbrev extensionality {α β : LRACarrier} {left right : Function α β}
    (sameValues : ∀ input, apply left input = apply right input) :
    left = right :=
  FunctionImpl.extensionality sameValues

end Active

end Functions
end Foundation
end LRA
