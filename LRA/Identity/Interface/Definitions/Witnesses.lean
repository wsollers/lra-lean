import LRA.Identity.Interface.Definitions.IdentityRelation
import LRA.Identity.Interface.Definitions.Distinctness

namespace LRA.Identity

universe u

/-- `HasWitness P` states that at least one element of `Carrier` satisfies `P`. -/
def HasWitness {Carrier : Type u} (P : Carrier → Prop) : Prop :=
  ∃ x, P x

def HasNoWitness {Carrier : Type u} (P : Carrier → Prop) : Prop :=
  ¬ ∃ x, P x

section NeedsIdentity

variable {Carrier : Type u} [IdentityRelation Carrier]

/--
`AtMostOne P` states that any two witnesses of `P` are identified by the
active `IdentityRelation`.

It does not assert that a witness exists.
-/
def AtMostOne (P : Carrier → Prop) : Prop :=
  ∀ left right, P left → P right → Ident left right

def NotAtMostOne (P : Carrier → Prop) : Prop :=
  ∃ left right, P left ∧ P right ∧ Distinct left right

/--
`ExactlyOne P` states that `P` has a witness and that all its witnesses are
identified by the active `IdentityRelation`.

Use this identity-polymorphic notion when uniqueness should be expressed via
`Ident`; use Lean's `ExistsAndUnique` when native equality is intended.
-/
def ExactlyOne (P : Carrier → Prop) : Prop :=
  HasWitness P ∧ AtMostOne P

end NeedsIdentity

end LRA.Identity
