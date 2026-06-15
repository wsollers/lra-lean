-- LRA/VolumeI/Foundations/IdentityAxioms.lean
--
-- The identity shim: reflexivity + Leibniz substitution over a carrier.
-- Lives at the foundation (no imports beyond core) so every layer above —
-- Sets, the logics, model theory — can consume it and discharge it with its
-- own identity relation. The standard model discharges it with Lean's `Eq`.
--
-- Universal-algebra style: the axioms are FIELDS, satisfied-by-construction in
-- any model. The projection constants read IdentityAxioms.Reflexivity /
-- IdentityAxioms.LeibnizSubstitution — self-documenting in the dependency DAG.

namespace LRA.VolumeI.Foundations

/-- A carrier equipped with an identity relation satisfying reflexivity and
    Leibniz substitution (indiscernibility of identicals). The relation is
    supplied as `Equals`; any consumer fulfils it. -/
structure IdentityAxioms (Carrier : Type) where
  /-- The relation playing the identity role on this carrier. -/
  Equals : Carrier → Carrier → Prop
  /-- `x = x` — every element is identical to itself. -/
  Reflexivity : ∀ x : Carrier, Equals x x
  /-- `x = y → φ x → φ y` — identicals are indiscernible. -/
  LeibnizSubstitution : ∀ (x y : Carrier) (predicate : Carrier → Prop),
    Equals x y → predicate x → predicate y

/-- The standard model: Lean's own equality `Eq` satisfies the identity axioms,
    so the interface is non-vacuous for every carrier. -/
def StandardIdentity (Carrier : Type) : IdentityAxioms Carrier where
  Equals := Eq
  Reflexivity := fun _ => rfl
  LeibnizSubstitution := fun _ _ _ equality holdsAtFirst => equality ▸ holdsAtFirst

/-- Existence witness: every carrier admits the identity axioms (via `Eq`). -/
theorem IdentityAxiomsExist (Carrier : Type) : Nonempty (IdentityAxioms Carrier) :=
  ⟨StandardIdentity Carrier⟩

end LRA.VolumeI.Foundations
