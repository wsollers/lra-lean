import LRA.Set.ZFC

/-!
The von Neumann carrier: an Infinity witness, the successor operation
`x ↦ x ∪ {x}`, and ω itself as the smallest inductive subset of that
witness.

Per §1.6.1 this is the pre-carrier stage. There is no separate equivalence
relation to quotient by here -- `ZFCSet` already carries its own equality
via Extensionality -- so `Equivalence.lean` in this directory is a thin
note rather than a real quotient construction, and everything about ω's
carrier-level structure lives here instead of being split across the two.

Every theorem below is `sorry`. See `LRA/NumberSystems/NaturalNumbers/ProofOrder.md` for
the order they are meant to be discharged in; nothing here jumps ahead of
that order.
-/

namespace LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann

open LRA.Set.ZFC

/-- A chosen witness to the Axiom of Infinity: some inductive set. -/
noncomputable def TheInfinityWitness : LRA.Set.ZFCSet :=
  Classical.choose Infinity

/-- The chosen Infinity witness is inductive -- `Infinity`'s statement
unfolds to exactly `IsInductiveSet`. -/
theorem TheInfinityWitnessIsInductiveSet :
    IsInductiveSet TheInfinityWitness := by
  sorry

/-- The von Neumann successor of `x`: `x ∪ {x}`. -/
noncomputable def VonNeumannSuccessor (x : LRA.Set.ZFCSet) : LRA.Set.ZFCSet :=
  TheUnion x (TheSingleton x)

/-- The von Neumann successor of `x` is a successor of `x` in the ZFC
sense: it contains exactly `x`'s members plus `x` itself. -/
theorem VonNeumannSuccessorIsSuccessorOf (x : LRA.Set.ZFCSet) :
    IsSuccessorOf x (VonNeumannSuccessor x) := by
  sorry

/-- ω: the elements of the Infinity witness that lie in every inductive
subset of it -- the minimal inductive set, via a single Separation
application (no new ZFC primitive needed for "smallest"). -/
noncomputable def Omega : LRA.Set.ZFCSet :=
  TheSeparatedSubset TheInfinityWitness
    (fun x => ∀ B : LRA.Set.ZFCSet, IsInductiveSet B → Subset B TheInfinityWitness → x ∈ B)

/-- ω is itself an inductive set: it contains ∅ and is closed under the
von Neumann successor. -/
theorem OmegaIsInductiveSet : IsInductiveSet Omega := by
  sorry

/-- The empty set is a member of ω -- the base case of `OmegaIsInductiveSet`,
pulled out because `NaturalElement` below needs it directly. -/
theorem TheEmptySetInOmega : TheEmptySet ∈ Omega := by
  sorry

/-- ω is closed under the von Neumann successor -- the closure case of
`OmegaIsInductiveSet`, pulled out for the same reason. -/
theorem OmegaClosedUnderSuccessor :
    ∀ x : LRA.Set.ZFCSet, x ∈ Omega → VonNeumannSuccessor x ∈ Omega := by
  sorry

/-!
The actual carrier `PeanoSystem` will be built over: not `ZFCSet` itself
(which contains every ZFC set, not just the naturals), but the subtype of
ω's members. `PeanoSystem`'s `induction` field quantifies over its entire
`Element` type, so `Element` has to *be* ω, not merely relate to it.
-/

/-- The von Neumann natural numbers: elements of `ZFCSet` that lie in ω. -/
def NaturalElement : Type := {x : LRA.Set.ZFCSet // x ∈ Omega}

/-- Membership of a natural element in an arbitrary `ZFCSet`, read off the
underlying set's native ZFC membership.

`Membership`'s element-type parameter is `outParam`, so resolving `∈`
searches only on the container type (`ZFCSet`) and infers the element type
from whatever instance it finds. `LRA.Set.ZFCSet.Primitives` already
declares `Membership ZFCSet ZFCSet` (the native "set contains set" ZFC
membership) for that same container type, so an unprioritized instance
here is a coin flip against it -- and losing that flip surfaces as
"failed to synthesize `Membership NaturalElement ZFCSet`" even though this
instance exists, because outParam resolution tried the *other* instance
first, inferred `α := ZFCSet`, and then failed to unify that against the
actual `NaturalElement` operand. `priority := high` forces this instance to
be tried first for this container type, so it wins deterministically. -/
instance (priority := high) : Membership NaturalElement LRA.Set.ZFCSet where
  mem containingSet element := element.val ∈ containingSet

/-- The distinguished element: ∅, viewed as a natural element via
`TheEmptySetInOmega`. -/
noncomputable def NaturalZero : NaturalElement :=
  ⟨TheEmptySet, TheEmptySetInOmega⟩

/-- Successor on natural elements, viewed as such via
`OmegaClosedUnderSuccessor`. -/
noncomputable def NaturalSuccessor (element : NaturalElement) : NaturalElement :=
  ⟨VonNeumannSuccessor element.val, OmegaClosedUnderSuccessor element.val element.property⟩

end LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann
