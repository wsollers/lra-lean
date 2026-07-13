import LRA.Foundation.Sets

namespace LRA.Foundation

universe u v w

abbrev Function (α β : LRACarrier) := α → β

namespace Function

def domain {α β : LRACarrier} (_function : Function α β) : LRASet α :=
  LRASet.universal α

def range {α β : LRACarrier} (function : Function α β) : LRASet β :=
  fun output => ∃ input, function input = output

def image {α β : LRACarrier} (function : Function α β) (subset : LRASet α) : LRASet β :=
  fun output => ∃ input, LRASet.member input subset ∧ function input = output

def preimage {α β : LRACarrier} (function : Function α β) (subset : LRASet β) : LRASet α :=
  fun input => LRASet.member (function input) subset

def fiber {α β : LRACarrier} (function : Function α β) (output : β) : LRASet α :=
  fun input => function input = output

def injective {α β : LRACarrier} (function : Function α β) : Prop :=
  ∀ ⦃first second⦄, function first = function second → first = second

def surjective {α β : LRACarrier} (function : Function α β) : Prop :=
  ∀ output, ∃ input, function input = output

def bijective {α β : LRACarrier} (function : Function α β) : Prop :=
  injective function ∧ surjective function

def identity (α : LRACarrier) : Function α α :=
  fun input => input

def compose {α β γ : LRACarrier}
    (right : Function β γ) (left : Function α β) : Function α γ :=
  fun input => right (left input)

def restrict {α β : LRACarrier}
    (function : Function α β) (subset : LRASet α) :
    Function { input : α // LRASet.member input subset } β :=
  fun input => function input.val

end Function

end LRA.Foundation
