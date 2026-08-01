import LRA.VolumeI.Set.Algebra
import LRA.VolumeI.Set.ZFC.Semantics

namespace LRA.VolumeI.Set

open LRA.VolumeI.Set.ZFC

/-!
ZFC-backed set objects for set-algebra contracts.

ZFC has no absolute universal set.  To support the algebra-of-sets contract,
this module works relative to a chosen model-internal universe set.  A
`ZFCSet Universe` is a model-internal set whose members all lie in that
universe.  Complements are relative complements inside the chosen universe.

The operation constructors are intentionally backed by existence/specification
theorems.  Their proofs are the load-bearing ZFC work: empty set, binary union,
intersection, and relative complement must be derived from the model's ZFC
axiom readings.  The current declarations expose the exact contract surface and
leave the derivations as accepted proof obligations.
-/

/-- A ZFC model together with a chosen ambient set that acts as the universe
for a relative algebra of model-internal subsets. -/
structure ZFCSetUniverse where
  Model : ZFCModel
  Axioms : SatisfiesZFCAxiomsWithoutChoiceCleanly Model
  UniverseSet : Model.Domain

namespace ZFCSetUniverse

/-- The basic named ZFC axiom sentences available in a `ZFCSetUniverse`. -/
theorem BasicAxiomSentences
    (Universe : ZFCSetUniverse) :
    SatisfiesZFCBasicAxiomSentences Universe.Model :=
  satisfiesZFCAxiomsWithoutChoiceCleanly.basicAxiomSentences Universe.Axioms

/-- The Separation schema available in a `ZFCSetUniverse`. -/
theorem Separation
    (Universe : ZFCSetUniverse) :
    SatisfiesSeparationSchemaCleanly Universe.Model :=
  satisfiesZFCAxiomsWithoutChoiceCleanly.separation Universe.Axioms

/-- The Replacement schema available in a `ZFCSetUniverse`. -/
theorem Replacement
    (Universe : ZFCSetUniverse) :
    SatisfiesReplacementSchemaCleanly Universe.Model :=
  satisfiesZFCAxiomsWithoutChoiceCleanly.replacement Universe.Axioms

end ZFCSetUniverse

/-- A model-internal set all of whose members lie in the chosen universe. -/
structure ZFCSet (Universe : ZFCSetUniverse) where
  SetObject : Universe.Model.Domain
  IsSubsetOfUniverse :
    ∀ Element : Universe.Model.Domain,
      zfcSetMembership Universe.Model Element SetObject →
        zfcSetMembership Universe.Model Element Universe.UniverseSet

namespace ZFCSet

/-- Elementhood in a relative ZFC-backed set. -/
def Member {Universe : ZFCSetUniverse}
    (Element : Universe.Model.Domain)
    (Set : ZFCSet Universe) : Prop :=
  zfcSetMembership Universe.Model Element Set.SetObject

/-- A raw model-internal set is empty when no model object is a member of it. -/
def IsEmptySet {M : ZFCModel} (SetObject : M.Domain) : Prop :=
  ∀ Element : M.Domain, ¬ zfcSetMembership M Element SetObject

/-- A raw model-internal set realizes binary union of two raw set objects. -/
def IsBinaryUnionOf {M : ZFCModel}
    (Candidate Left Right : M.Domain) : Prop :=
  ∀ Element : M.Domain,
    zfcSetMembership M Element Candidate ↔
      zfcSetMembership M Element Left ∨ zfcSetMembership M Element Right

/-- A raw model-internal set realizes binary intersection of two raw set objects. -/
def IsIntersectionOf {M : ZFCModel}
    (Candidate Left Right : M.Domain) : Prop :=
  ∀ Element : M.Domain,
    zfcSetMembership M Element Candidate ↔
      zfcSetMembership M Element Left ∧ zfcSetMembership M Element Right

/-- A raw model-internal set realizes relative complement `Left \ Right`. -/
def IsDifferenceOf {M : ZFCModel}
    (Candidate Left Right : M.Domain) : Prop :=
  ∀ Element : M.Domain,
    zfcSetMembership M Element Candidate ↔
      zfcSetMembership M Element Left ∧ ¬ zfcSetMembership M Element Right

/-- A raw model-internal set realizes symmetric difference. -/
def IsSymmetricDifferenceOf {M : ZFCModel}
    (Candidate Left Right : M.Domain) : Prop :=
  ∀ Element : M.Domain,
    zfcSetMembership M Element Candidate ↔
      (zfcSetMembership M Element Left ∧ ¬ zfcSetMembership M Element Right) ∨
        (zfcSetMembership M Element Right ∧ ¬ zfcSetMembership M Element Left)

/-- Extensional uniqueness for raw ZFC set-objects by member equivalence. -/
theorem RawSetObjectUniqueByMembers
    {Universe : ZFCSetUniverse}
    {Left Right : Universe.Model.Domain}
    (SameMembers :
      ∀ Element : Universe.Model.Domain,
        zfcSetMembership Universe.Model Element Left ↔
          zfcSetMembership Universe.Model Element Right) :
    Left = Right := by
  exact
    extensionalityAxiomReading
      (ZFCSetUniverse.BasicAxiomSentences Universe)
      Left Right SameMembers

/-- Subtype extensionality for relative ZFC-backed sets. -/
theorem EqualByMembers
    {Universe : ZFCSetUniverse}
    {Left Right : ZFCSet Universe}
    (SameMembers :
      ∀ Element : Universe.Model.Domain,
        Member Element Left ↔ Member Element Right) :
    Left = Right := by
  cases Left with
  | mk LeftObject LeftSubset =>
      cases Right with
      | mk RightObject RightSubset =>
          have hObjects :
              LeftObject = RightObject :=
            RawSetObjectUniqueByMembers
              (Universe := Universe) SameMembers
          subst hObjects
          rfl

/-- ZFC supplies an empty relative set. -/
theorem ZFCProvidesEmptySet
    (Universe : ZFCSetUniverse) :
    ∃ EmptySet : ZFCSet Universe,
      IsEmptySet EmptySet.SetObject := by
  sorry

/-- The chosen ambient universe is itself a relative ZFC-backed set. -/
def Universal (Universe : ZFCSetUniverse) : ZFCSet Universe where
  SetObject := Universe.UniverseSet
  IsSubsetOfUniverse := by
    intro Element ElementInUniverse
    exact ElementInUniverse

/-- ZFC supplies binary unions of relative sets. -/
theorem ZFCProvidesUnion
    (Universe : ZFCSetUniverse)
    (Left Right : ZFCSet Universe) :
    ∃ UnionSet : ZFCSet Universe,
      IsBinaryUnionOf UnionSet.SetObject Left.SetObject Right.SetObject := by
  sorry

/-- ZFC supplies binary intersections of relative sets. -/
theorem ZFCProvidesIntersection
    (Universe : ZFCSetUniverse)
    (Left Right : ZFCSet Universe) :
    ∃ IntersectionSet : ZFCSet Universe,
      IsIntersectionOf
        IntersectionSet.SetObject Left.SetObject Right.SetObject := by
  sorry

/-- ZFC supplies relative complements of relative sets. -/
theorem ZFCProvidesDifference
    (Universe : ZFCSetUniverse)
    (Left Right : ZFCSet Universe) :
    ∃ DifferenceSet : ZFCSet Universe,
      IsDifferenceOf DifferenceSet.SetObject Left.SetObject Right.SetObject := by
  sorry

/-- ZFC supplies symmetric differences of relative sets. -/
theorem ZFCProvidesSymmetricDifference
    (Universe : ZFCSetUniverse)
    (Left Right : ZFCSet Universe) :
    ∃ SymmetricDifferenceSet : ZFCSet Universe,
      IsSymmetricDifferenceOf
        SymmetricDifferenceSet.SetObject Left.SetObject Right.SetObject := by
  sorry

/-- Chosen empty relative ZFC-backed set. -/
noncomputable def Empty (Universe : ZFCSetUniverse) : ZFCSet Universe :=
  Classical.choose (ZFCProvidesEmptySet Universe)

/-- Specification for the chosen empty set. -/
theorem EmptySpec
    (Universe : ZFCSetUniverse) :
    IsEmptySet (Empty Universe).SetObject :=
  Classical.choose_spec (ZFCProvidesEmptySet Universe)

/-- Chosen binary union of relative ZFC-backed sets. -/
noncomputable def Union
    (Universe : ZFCSetUniverse)
    (Left Right : ZFCSet Universe) : ZFCSet Universe :=
  Classical.choose (ZFCProvidesUnion Universe Left Right)

/-- Specification for the chosen binary union. -/
theorem UnionSpec
    (Universe : ZFCSetUniverse)
    (Left Right : ZFCSet Universe) :
    IsBinaryUnionOf
      (Union Universe Left Right).SetObject
      Left.SetObject
      Right.SetObject :=
  Classical.choose_spec (ZFCProvidesUnion Universe Left Right)

/-- Chosen binary intersection of relative ZFC-backed sets. -/
noncomputable def Intersection
    (Universe : ZFCSetUniverse)
    (Left Right : ZFCSet Universe) : ZFCSet Universe :=
  Classical.choose (ZFCProvidesIntersection Universe Left Right)

/-- Specification for the chosen binary intersection. -/
theorem IntersectionSpec
    (Universe : ZFCSetUniverse)
    (Left Right : ZFCSet Universe) :
    IsIntersectionOf
      (Intersection Universe Left Right).SetObject
      Left.SetObject
      Right.SetObject :=
  Classical.choose_spec (ZFCProvidesIntersection Universe Left Right)

/-- Chosen relative complement `Left \ Right` of relative ZFC-backed sets. -/
noncomputable def Difference
    (Universe : ZFCSetUniverse)
    (Left Right : ZFCSet Universe) : ZFCSet Universe :=
  Classical.choose (ZFCProvidesDifference Universe Left Right)

/-- Specification for the chosen relative complement. -/
theorem DifferenceSpec
    (Universe : ZFCSetUniverse)
    (Left Right : ZFCSet Universe) :
    IsDifferenceOf
      (Difference Universe Left Right).SetObject
      Left.SetObject
      Right.SetObject :=
  Classical.choose_spec (ZFCProvidesDifference Universe Left Right)

/-- Chosen complement of a relative ZFC-backed set inside the ambient universe. -/
noncomputable def Complement
    (Universe : ZFCSetUniverse)
    (Set : ZFCSet Universe) : ZFCSet Universe :=
  Difference Universe (Universal Universe) Set

/-- Specification for the chosen relative complement inside the universe. -/
theorem ComplementSpec
    (Universe : ZFCSetUniverse)
    (Set : ZFCSet Universe) :
    IsDifferenceOf
      (Complement Universe Set).SetObject
      Universe.UniverseSet
      Set.SetObject :=
  DifferenceSpec Universe (Universal Universe) Set

/-- Chosen symmetric difference of relative ZFC-backed sets. -/
noncomputable def SymmetricDifference
    (Universe : ZFCSetUniverse)
    (Left Right : ZFCSet Universe) : ZFCSet Universe :=
  Classical.choose (ZFCProvidesSymmetricDifference Universe Left Right)

/-- Specification for the chosen symmetric difference. -/
theorem SymmetricDifferenceSpec
    (Universe : ZFCSetUniverse)
    (Left Right : ZFCSet Universe) :
    IsSymmetricDifferenceOf
      (SymmetricDifference Universe Left Right).SetObject
      Left.SetObject
      Right.SetObject :=
  Classical.choose_spec (ZFCProvidesSymmetricDifference Universe Left Right)

/-- Relative ZFC-backed subsets of a universe as a set-algebra signature. -/
noncomputable def SetAlgebraSignature
    (Universe : ZFCSetUniverse) :
    LRA.VolumeI.Set.Algebra.SetAlgebraSignature where
  carrier := ZFCSet Universe
  IsMember := fun _ => True
  empty := Empty Universe
  universal := Universal Universe
  union := Union Universe
  intersection := Intersection Universe
  complement := Complement Universe
  difference := Difference Universe
  symmetricDifference := SymmetricDifference Universe

/-- Relative ZFC-backed subsets satisfy the set-algebra closure contract. -/
theorem SetAlgebraLaws
    (Universe : ZFCSetUniverse) :
    LRA.VolumeI.Set.Algebra.SetAlgebraLaws
      (SetAlgebraSignature Universe) := by
  constructor <;> intros <;> trivial

/-- Bundled model for the ZFC-backed algebra of subsets of a chosen universe. -/
noncomputable def SetAlgebraModel
    (Universe : ZFCSetUniverse) :
    LRA.VolumeI.Set.Algebra.SetAlgebraModel where
  signature := SetAlgebraSignature Universe
  laws := SetAlgebraLaws Universe

end ZFCSet

end LRA.VolumeI.Set
