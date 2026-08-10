import LRA.VolumeI.Set.Foundation.Definitions

universe u

namespace LRA.VolumeI.Set.Foundation

/-!
Named foundation axiom propositions.

These are ordinary propositions over a single-sorted universe. Theorems should
cite the exact axiom hypotheses they use.
-/

/-- Extensionality: sets with the same members are equal. -/
def ExtensionalityAxiom (setUniverse : Universe.{u}) : Prop :=
  ∀ left right : setUniverse.SetObject,
    (∀ w : setUniverse.SetObject, w ∈ left ↔ w ∈ right) →
      left = right

/-- Empty set axiom: there exists a set with no members. -/
def EmptySetAxiom (setUniverse : Universe.{u}) : Prop :=
  ∃ emptySet : setUniverse.SetObject,
    IsEmptySet setUniverse emptySet

/-- Pairing axiom: for any two sets, there exists a set whose members are
exactly those two sets. -/
def PairingAxiom (setUniverse : Universe.{u}) : Prop :=
  ∀ x1 x2 : setUniverse.SetObject,
    ∃ pairSet : setUniverse.SetObject,
      IsPairSet setUniverse x1 x2 pairSet

end LRA.VolumeI.Set.Foundation
