import LRA.VolumeI.Set.LRASet.LRASet
import LRA.VolumeI.Logic.Model.Comparison.ModelIsomorphismSymmetric
import LRA.VolumeI.Set.ZFC.Model.ZFSetModel
import LRA.VolumeI.Set.ZFC.Semantics.AxiomReadings
import LRA.VolumeI.Set.ZFC.Semantics.SchemaCorrectness

universe u

namespace LRA.VolumeI.Set.ZFC

open LRA.VolumeI.Logic
open LRA.VolumeI.Set
open LRA.VolumeI.Set.LRASet

/-!
Bridge from ZFC set-objects to predicate-sets.

`ToPredicateSet` is the always-valid direction: a model-internal set-object
determines the predicate of being a member of that object, with membership
interpreted by the model's ZFC membership relation.

There is deliberately no general
`FromPredicateSet : LRASet M.Domain -> M.Domain`. A predicate over a model
domain can describe an external class, a definable subclass, or an arbitrary
Lean-level collection; it is not automatically a set-object of the model.
Going from a predicate to a model-internal set-object requires a bounded
formula together with the appropriate ZFC set-existence theorem, such as
Separation, Pairing, Union, Replacement, or a construction derived from them.

Predicate-set algebra remains the working proof layer for ordinary subset and
class manipulations. The bridge theorems below state when a supplied
model-internal witness realizes a corresponding predicate-set operation.
For binary union, the ZFC construction is Pairing followed by Union; this file
therefore records the witness/spec bridge rather than pretending binary union
is a primitive ZFC set-former.
-/

/-- The predicate-set realized by a model-internal ZFC set-object. -/
def ToPredicateSet {M : ZFCModel} (SetObject : M.Domain) : LRASet M.Domain :=
  fun Element => zfcSetMembership M Element SetObject

/-- Membership in `ToPredicateSet SetObject` is exactly model-interpreted
ZFC membership in `SetObject`. -/
theorem ToPredicateSetMembershipIff {M : ZFCModel}
    (SetObject Element : M.Domain) :
    Member Element (ToPredicateSet SetObject) ↔
      zfcSetMembership M Element SetObject := by
  sorry

/-- The concrete `ZFSet` specialization of `ToPredicateSet`. -/
def ToPredicateSetZFSet (SetObject : ZFSet) : LRASet ZFSet :=
  ToPredicateSet (M := zfSetModel) SetObject

/-- Over Mathlib's concrete `ZFSet` model, the bridge unfolds to ordinary
`ZFSet` membership. -/
theorem ZFSetToPredicateSetMembershipIff
    (SetObject Element : ZFSet) :
    Member Element (ToPredicateSetZFSet SetObject) ↔ Element ∈ SetObject := by
  sorry

/-- In a model satisfying ZFC extensionality, equality of the realized
predicate-sets implies equality of the underlying model-internal set-objects. -/
theorem SetObjectExtensionalityFromPredicateSet {M : ZFCModel}
    (BasicAxioms : SatisfiesZFCBasicAxiomSentences M)
    {LeftSet RightSet : M.Domain}
    (SamePredicateSet :
      ToPredicateSet LeftSet = ToPredicateSet RightSet) :
    LeftSet = RightSet := by
  sorry

/-- In a model satisfying Pairing, the pair-set witness realizes the
predicate-set union of two singletons. -/
theorem PairSetWitnessToPredicateSet {M : ZFCModel}
    {LeftSet RightSet PairSet : M.Domain}
    (PairWitness :
      ∀ Element : M.Domain,
        zfcSetMembership M Element PairSet ↔
          Element = LeftSet ∨ Element = RightSet) :
    ToPredicateSet PairSet =
      LRASet.Union (LRASet.Singleton LeftSet) (LRASet.Singleton RightSet) := by
  sorry

/-- The Pairing axiom supplies a model-internal pair set realizing the
corresponding predicate-set singleton union. -/
theorem BasicAxiomsProvidePairSetWitness {M : ZFCModel}
    (BasicAxioms : SatisfiesZFCBasicAxiomSentences M)
    (LeftSet RightSet : M.Domain) :
    ∃ PairSet : M.Domain,
      ToPredicateSet PairSet =
        LRASet.Union (LRASet.Singleton LeftSet) (LRASet.Singleton RightSet) := by
  sorry

/-- A model-internal union witness realizes the predicate-set indexed union
over the members of the family set. -/
theorem UnionSetWitnessToPredicateSet {M : ZFCModel}
    {FamilySet UnionSet : M.Domain}
    (UnionWitness :
      ∀ Element : M.Domain,
        zfcSetMembership M Element UnionSet ↔
          ∃ MemberSet : M.Domain,
            zfcSetMembership M MemberSet FamilySet ∧
              zfcSetMembership M Element MemberSet) :
    ToPredicateSet UnionSet =
      LRASet.IndexedUnion
        (fun MemberSet :
          {MemberSet : M.Domain //
            zfcSetMembership M MemberSet FamilySet} =>
          ToPredicateSet MemberSet.val) := by
  sorry

/-- The Union axiom supplies a model-internal union set realizing the
indexed predicate-set union over the members of a family set. -/
theorem BasicAxiomsProvideUnionSetWitness {M : ZFCModel}
    (BasicAxioms : SatisfiesZFCBasicAxiomSentences M)
    (FamilySet : M.Domain) :
    ∃ UnionSet : M.Domain,
      ToPredicateSet UnionSet =
        LRASet.IndexedUnion
          (fun MemberSet :
            {MemberSet : M.Domain //
              zfcSetMembership M MemberSet FamilySet} =>
            ToPredicateSet MemberSet.val) := by
  sorry

/-- A binary-union witness realizes predicate-set binary union. In ZFC this
witness is normally obtained by Pairing the two inputs and then applying
Union. -/
theorem BinaryUnionSetWitnessToPredicateSet {M : ZFCModel}
    {LeftSet RightSet UnionSet : M.Domain}
    (UnionWitness :
      ∀ Element : M.Domain,
        zfcSetMembership M Element UnionSet ↔
          zfcSetMembership M Element LeftSet ∨
            zfcSetMembership M Element RightSet) :
    ToPredicateSet UnionSet =
      LRASet.Union (ToPredicateSet LeftSet) (ToPredicateSet RightSet) := by
  sorry

/-- Pairing followed by Union supplies a model-internal binary union set.
This is the switch-ready existence surface; the actual ZFC derivation is left
as proof work. -/
theorem BasicAxiomsProvideBinaryUnionSetWitness {M : ZFCModel}
    (BasicAxioms : SatisfiesZFCBasicAxiomSentences M)
    (LeftSet RightSet : M.Domain) :
    ∃ UnionSet : M.Domain,
      ToPredicateSet UnionSet =
        LRASet.Union (ToPredicateSet LeftSet) (ToPredicateSet RightSet) := by
  sorry

/-- An intersection witness realizes predicate-set binary intersection. The
witness itself must come from a set-existence principle such as Separation. -/
theorem IntersectionSetWitnessToPredicateSet {M : ZFCModel}
    {LeftSet RightSet IntersectionSet : M.Domain}
    (IntersectionWitness :
      ∀ Element : M.Domain,
        zfcSetMembership M Element IntersectionSet ↔
          zfcSetMembership M Element LeftSet ∧
            zfcSetMembership M Element RightSet) :
    ToPredicateSet IntersectionSet =
      LRASet.Intersection (ToPredicateSet LeftSet) (ToPredicateSet RightSet) := by
  sorry

/-- A relative-complement witness realizes predicate-set difference. The
witness itself must come from a bounded set-existence principle such as
Separation. -/
theorem RelativeComplementWitnessToPredicateSet {M : ZFCModel}
    {LeftSet RightSet ComplementSet : M.Domain}
    (ComplementWitness :
      ∀ Element : M.Domain,
        zfcSetMembership M Element ComplementSet ↔
          zfcSetMembership M Element LeftSet ∧
            ¬ zfcSetMembership M Element RightSet) :
    ToPredicateSet ComplementSet =
      LRASet.Difference (ToPredicateSet LeftSet) (ToPredicateSet RightSet) := by
  sorry

/-- A Separation witness realizes the intersection of a model-internal source
set with an externally presented predicate-set. A stronger version should use
the syntax/semantics layer to connect `PredicateSet` to a bounded ZFC formula. -/
theorem SeparationWitnessToPredicateSet {M : ZFCModel}
    {SourceSet SeparatedSet : M.Domain}
    (PredicateSet : LRASet M.Domain)
    (SeparationWitness :
      ∀ Element : M.Domain,
        zfcSetMembership M Element SeparatedSet ↔
          zfcSetMembership M Element SourceSet ∧
            Member Element PredicateSet) :
    ToPredicateSet SeparatedSet =
      LRASet.Intersection (ToPredicateSet SourceSet) PredicateSet := by
  sorry

/-- A clean Separation schema instance supplies a separated set realizing the
intersection of the source set with the predicate read from the schema formula.
This is intentionally formula-bounded; it is not a general conversion from
arbitrary predicate-sets to model-internal set-objects. -/
theorem SeparationSchemaProvidesPredicateSetWitness {M : ZFCModel}
    (SeparationAxioms : SatisfiesSeparationSchemaCleanly M)
    (Assignment : ZFCVariable -> M.Domain)
    (ElementVariable : ZFCVariable)
    (Predicate : ZFCFormula)
    (SourceSet : M.Domain) :
    ∃ SeparatedSet : M.Domain,
      ToPredicateSet SeparatedSet =
        LRASet.Intersection (ToPredicateSet SourceSet)
          (fun Element : M.Domain =>
            satisfiesZFCFormula M
              (updateAssignment Assignment ElementVariable Element)
              Predicate) := by
  sorry

/-- ZFC-model isomorphism, reusing the generic first-order model
isomorphism over the ZFC signature. This is the planned switch abstraction
between concrete model-internal set implementations. -/
abbrev ZFCModelIsomorphism (Source Target : ZFCModel) :=
  FirstOrder.ModelIsomorphism Source Target

/-- Push a model-internal set-object forward along a ZFC-model isomorphism. -/
def PushForwardSetObject {Source Target : ZFCModel}
    (Iso : ZFCModelIsomorphism Source Target)
    (SetObject : Source.Domain) : Target.Domain :=
  Iso.toFun SetObject

/-- Pull a predicate-set on the target model back along a ZFC-model
isomorphism. -/
def PullbackPredicateSet {Source Target : ZFCModel}
    (Iso : ZFCModelIsomorphism Source Target)
    (TargetPredicateSet : LRASet Target.Domain) : LRASet Source.Domain :=
  fun Element => TargetPredicateSet (Iso.toFun Element)

/-- Push a predicate-set on the source model forward along a ZFC-model
isomorphism. This uses the inverse equivalence supplied by bijectivity, so it
is noncomputable. -/
noncomputable def PushForwardPredicateSet {Source Target : ZFCModel}
    (Iso : ZFCModelIsomorphism Source Target)
    (SourcePredicateSet : LRASet Source.Domain) : LRASet Target.Domain :=
  fun Element => SourcePredicateSet (Iso.toEquiv.symm Element)

/-- A ZFC-model isomorphism preserves and reflects interpreted membership. -/
theorem ZFCModelIsomorphismMembershipIff {Source Target : ZFCModel}
    (Iso : ZFCModelIsomorphism Source Target)
    (Element SetObject : Source.Domain) :
    zfcSetMembership Target (Iso.toFun Element) (Iso.toFun SetObject) ↔
      zfcSetMembership Source Element SetObject := by
  sorry

/-- `ToPredicateSet` commutes with pushing set-objects forward, after pulling
the target predicate-set back along the isomorphism. -/
theorem PullbackToPredicateSetPushForward {Source Target : ZFCModel}
    (Iso : ZFCModelIsomorphism Source Target)
    (SetObject : Source.Domain) :
    PullbackPredicateSet Iso
        (ToPredicateSet (PushForwardSetObject Iso SetObject)) =
      ToPredicateSet SetObject := by
  sorry

/-- `ToPredicateSet` commutes with the forward switch along a ZFC-model
isomorphism. This is the predicate-level statement downstream consumers should
use when comparing two concrete ZFC model backends. -/
theorem PushForwardToPredicateSet {Source Target : ZFCModel}
    (Iso : ZFCModelIsomorphism Source Target)
    (SetObject : Source.Domain) :
    PushForwardPredicateSet Iso (ToPredicateSet SetObject) =
      ToPredicateSet (PushForwardSetObject Iso SetObject) := by
  sorry

/-- Specialized spelling for switching from an arbitrary ZFC model into the
Mathlib `ZFSet` model. Existence of such an isomorphism is a real mathematical
input, not constructed here. -/
abbrev ZFCModelSwitchToZFSet (Source : ZFCModel) :=
  ZFCModelIsomorphism Source zfSetModel

/-- A supplied switch into `zfSetModel` preserves the bridge to concrete
`ZFSet` membership. -/
theorem ZFCModelSwitchToZFSetMembershipIff {Source : ZFCModel}
    (Switch : ZFCModelSwitchToZFSet Source)
    (Element SetObject : Source.Domain) :
    Member (Switch.toFun Element)
        (ToPredicateSetZFSet (Switch.toFun SetObject)) ↔
      Member Element (ToPredicateSet SetObject) := by
  sorry

end LRA.VolumeI.Set.ZFC
