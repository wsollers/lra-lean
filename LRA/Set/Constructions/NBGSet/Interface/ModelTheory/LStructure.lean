import LRA.Logic.Language.FirstOrder.Signature
import LRA.Logic.Model.Model
import LRA.Logic.Semantics.Satisfaction
import LRA.Set.Constructions.NBGSet.Axioms.Public

namespace LRA.Set.Constructions.NBG.Interface.ModelTheory

open LRA.Logic
open LRA.Logic.FirstOrder

inductive MembershipRelationSymbol where
  | mem
  deriving DecidableEq

def MembershipFunctions : ArityIndexedSymbols where
  Symbol := Empty
  arity := Empty.elim

def MembershipRelations : ArityIndexedSymbols where
  Symbol := MembershipRelationSymbol
  arity := fun _ => 2

def MembershipSignature : Signature where
  Functions := MembershipFunctions
  Relations := MembershipRelations
  Constants := Empty

abbrev SingleSortedClassLanguage := FirstOrderLanguage

structure SingleSortedClassStructure where
  carrier : Type
  carrierNonempty : Nonempty carrier
  membership : carrier → carrier → Prop

structure TwoSortedClassStructure where
  setCarrier : Type
  setCarrierNonempty : Nonempty setCarrier
  classCarrier : Type
  classOfSet : setCarrier → classCarrier
  setMembership : setCarrier → setCarrier → Prop
  classMembership : setCarrier → classCarrier → Prop
  orderedPair : setCarrier → setCarrier → setCarrier

def SetPredicate (M : SingleSortedClassStructure) (X : M.carrier) : Prop :=
  ∃ Y : M.carrier, M.membership X Y

def ProperClassPredicate (M : SingleSortedClassStructure) (X : M.carrier) : Prop :=
  ¬ SetPredicate M X

def DerivedSetSubdomain (M : SingleSortedClassStructure) :=
  { X : M.carrier // SetPredicate M X }

def ClassAssignment (M : SingleSortedClassStructure) :=
  Nat → M.carrier

@[reducible] def toFirstOrderModel
    (M : SingleSortedClassStructure) :
    Model MembershipSignature where
  Domain := M.carrier
  domainNonempty := M.carrierNonempty
  interpretFunction := fun functionSymbol => Empty.elim functionSymbol
  interpretRelation := fun relationSymbol arguments =>
    match relationSymbol with
    | .mem => M.membership (arguments ⟨0, by decide⟩) (arguments ⟨1, by decide⟩)
  interpretConstant := fun constantSymbol => Empty.elim constantSymbol

abbrev SatisfiesSingleSortedFormula
    (M : SingleSortedClassStructure)
    {Variable : Type}
    [DecidableEq Variable]
    (assignment : Variable → (toFirstOrderModel M).Domain)
    (formula : Formula MembershipSignature Variable) : Prop :=
  Satisfies (toFirstOrderModel M) assignment formula

structure IsNormalClassModel (M : SingleSortedClassStructure) : Prop where
  equalityIsDefinitional :
    ∀ X Y : M.carrier, (X = Y) ↔ (X = Y)

def IsTransitiveSetModel (M : TwoSortedClassStructure) : Prop :=
  ∀ {x y z : M.setCarrier},
    M.setMembership x y →
    M.setMembership z x →
    M.setMembership z y

def IsStandardModelPair (M : TwoSortedClassStructure) : Prop :=
  ∀ A x : M.setCarrier, M.classMembership x (M.classOfSet A) ↔ M.setMembership x A

def toSingleSortedClassStructure
    (M : TwoSortedClassStructure) :
    SingleSortedClassStructure where
  carrier := M.classCarrier
  carrierNonempty := by
    rcases M.setCarrierNonempty with ⟨witness⟩
    exact ⟨M.classOfSet witness⟩
  membership := fun X Y =>
    ∃ x : M.setCarrier, X = M.classOfSet x ∧ M.classMembership x Y

end LRA.Set.Constructions.NBG.Interface.ModelTheory
