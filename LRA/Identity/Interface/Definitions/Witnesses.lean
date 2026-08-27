import LRA.Identity.Interface.Definitions.IdentityRelation
import LRA.Identity.Interface.Definitions.Distinctness

namespace LRA.Identity

universe u

def HasWitness {Carrier : Type u} (P : Carrier → Prop) : Prop :=
  ∃ x, P x

def HasNoWitness {Carrier : Type u} (P : Carrier → Prop) : Prop :=
  ¬ ∃ x, P x

section NeedsIdentity

variable {Carrier : Type u} [IdentityRelation Carrier]

def AtMostOne (P : Carrier → Prop) : Prop :=
  ∀ left right, P left → P right → Ident left right

def NotAtMostOne (P : Carrier → Prop) : Prop :=
  ∃ left right, P left ∧ P right ∧ Distinct left right

def ExactlyOne (P : Carrier → Prop) : Prop :=
  HasWitness P ∧ AtMostOne P

end NeedsIdentity

end LRA.Identity
