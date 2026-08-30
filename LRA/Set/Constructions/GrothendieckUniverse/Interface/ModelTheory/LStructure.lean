import LRA.Set.Constructions.GrothendieckUniverse.Definitions
import LRA.Set.Interface.ModelTheory.LStructure

namespace LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory

open LRA.Logic
open LRA.Logic.FirstOrder
open LRA.Set.Constructions.GrothendieckUniverse

universe u

inductive PureMembershipRelationSymbol : Type where
  | mem
  deriving DecidableEq

def PureMembershipFunctions : ArityIndexedSymbols where
  Symbol := Empty
  arity := Empty.elim

def PureMembershipRelations : ArityIndexedSymbols where
  Symbol := PureMembershipRelationSymbol
  arity := fun _ => 2

def PureMembershipSignature : Signature where
  Functions := PureMembershipFunctions
  Relations := PureMembershipRelations
  Constants := Empty

abbrev ExpandedMembershipSignature := LRA.Set.ModelTheory.MembershipSignature

theorem pureMembershipLanguageHasNoFunctionSymbols :
    IsEmpty PureMembershipFunctions.Symbol := by
  sorry

theorem pureMembershipLanguageHasNoConstantSymbols :
    IsEmpty PureMembershipSignature.Constants := by
  sorry

theorem pureMembershipRelationSymbolIsBinary :
    PureMembershipSignature.IsBinaryRelationSymbol .mem := by
  sorry

structure UniverseLStructure (SetObject : Type u) [Membership SetObject SetObject] where
  base : SetObject
  carrier : SetObject
  carrierHypothesis : IsGrothendieckUniverseFor base carrier

def UniverseDomain {SetObject : Type u} [Membership SetObject SetObject]
    (structureData : UniverseLStructure SetObject) : Type u :=
  { x : SetObject // x ∈ structureData.carrier }

def universeMembershipInterpretation
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (structureData : UniverseLStructure SetObject) :
    UniverseDomain structureData → UniverseDomain structureData → Prop :=
  fun (left right : UniverseDomain structureData) => left.1 ∈ right.1

theorem universeDomainNonempty
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (structureData : UniverseLStructure SetObject) :
    Nonempty (UniverseDomain structureData) := by
  sorry

def IsNormalMembershipStructure
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (structureData : UniverseLStructure SetObject) : Prop :=
  ∀ left right : UniverseDomain structureData,
    universeMembershipInterpretation structureData left right ↔ left.1 ∈ right.1

def IsStandardTransitiveMembershipStructure
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (structureData : UniverseLStructure SetObject) : Prop :=
  IsNormalMembershipStructure structureData ∧
    IsTransitiveUniverse structureData.carrier

theorem universeStructureIsNormal
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (structureData : UniverseLStructure SetObject) :
    IsNormalMembershipStructure structureData := by
  sorry

theorem universeStructureIsStandardTransitive
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (structureData : UniverseLStructure SetObject) :
    IsStandardTransitiveMembershipStructure structureData := by
  sorry

end LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory
