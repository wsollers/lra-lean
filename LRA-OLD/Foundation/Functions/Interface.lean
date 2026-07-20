-- LRA/Foundation/Functions/Interface.lean
-- Common interface for function implementations.

import LRA.Foundation.Functions

namespace LRA
namespace Foundation
namespace Functions

/-!
Lean module: LRA.Foundation.Functions.Interface
Verification status: checked interface module

`LRAFunctionImplementation` is the common public shape for switchable function
implementations. The initial implementation is the ordinary Lean function
space, but downstream modules depend only on this interface.
-/

structure LRAFunctionImplementation where
  Function : LRACarrier → LRACarrier → LRACarrier
  apply : {α β : LRACarrier} → Function α β → α → β
  ofNative : {α β : LRACarrier} → (α → β) → Function α β
  identity : (α : LRACarrier) → Function α α
  compose :
    {α β γ : LRACarrier} →
      Function β γ → Function α β → Function α γ
  extensionality :
    {α β : LRACarrier} →
      {left right : Function α β} →
        (∀ input, apply left input = apply right input) → left = right

end Functions
end Foundation
end LRA
