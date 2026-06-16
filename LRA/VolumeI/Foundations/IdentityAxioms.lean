namespace LRA.VolumeI.Foundations

structure IdentityAxioms (Carrier : Type) where

  Equals : Carrier → Carrier → Prop

  Reflexivity : ∀ x : Carrier, Equals x x

  LeibnizSubstitution : ∀ (x y : Carrier) (predicate : Carrier → Prop),
    Equals x y → predicate x → predicate y

def StandardIdentity (Carrier : Type) : IdentityAxioms Carrier where
  Equals := Eq
  Reflexivity := fun _ => rfl
  LeibnizSubstitution := fun _ _ _ equality holdsAtFirst => equality ▸ holdsAtFirst

theorem IdentityAxiomsExist (Carrier : Type) : Nonempty (IdentityAxioms Carrier) :=
  ⟨StandardIdentity Carrier⟩

end LRA.VolumeI.Foundations
