import LRA.Logic.Language.FirstOrder.Signature
import LRA.ModelTheory.Model
import LRA.Logic.Semantics.Satisfaction
import LRA.Set.Constructions.NBGSet.Axioms.Public

namespace LRA.Set.Constructions.NBG.Interface.ModelTheory

open LRA.Logic
open LRA.Logic.FirstOrder
open LRA.ModelTheory.FirstOrder

/--
`MembershipRelationSymbol` TODO

Predicate logic:

  inductive MembershipRelationSymbol where
    | mem
    deriving DecidableEq

Predicate logic (unfolded):

  inductive MembershipRelationSymbol where
    | mem
    deriving DecidableEq (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive MembershipRelationSymbol where
  | mem
  deriving DecidableEq
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
inductive MembershipRelationSymbol where
  | mem
  deriving DecidableEq

/--
`MembershipFunctions` TODO

Predicate logic:

  def MembershipFunctions : ArityIndexedSymbols where
    Symbol := Empty
    arity := Empty.elim

Predicate logic (unfolded):

  def MembershipFunctions : ArityIndexedSymbols where
    Symbol := Empty
    arity := Empty.elim (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def MembershipFunctions : ArityIndexedSymbols where
  Symbol := Empty
  arity := Empty.elim
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def MembershipFunctions : ArityIndexedSymbols where
  Symbol := Empty
  arity := Empty.elim

/--
`MembershipRelations` TODO

Predicate logic:

  def MembershipRelations : ArityIndexedSymbols where
    Symbol := MembershipRelationSymbol
    arity := fun _ => 2

Predicate logic (unfolded):

  def MembershipRelations : ArityIndexedSymbols where
    Symbol := MembershipRelationSymbol
    arity := fun _ => 2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def MembershipRelations : ArityIndexedSymbols where
  Symbol := MembershipRelationSymbol
  arity := fun _ => 2
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def MembershipRelations : ArityIndexedSymbols where
  Symbol := MembershipRelationSymbol
  arity := fun _ => 2

/--
`MembershipSignature` TODO

Predicate logic:

  def MembershipSignature : Signature where
    Functions := MembershipFunctions
    Relations := MembershipRelations
    Constants := Empty

Predicate logic (unfolded):

  def MembershipSignature : Signature where
    Functions := MembershipFunctions
    Relations := MembershipRelations
    Constants := Empty (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def MembershipSignature : Signature where
  Functions := MembershipFunctions
  Relations := MembershipRelations
  Constants := Empty
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def MembershipSignature : Signature where
  Functions := MembershipFunctions
  Relations := MembershipRelations
  Constants := Empty

/--
`SingleSortedClassLanguage` TODO

Predicate logic:

  abbrev SingleSortedClassLanguage := FirstOrderLanguage

Predicate logic (unfolded):

  abbrev SingleSortedClassLanguage := FirstOrderLanguage (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev SingleSortedClassLanguage := FirstOrderLanguage
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev SingleSortedClassLanguage := FirstOrderLanguage

/--
`SingleSortedClassStructure` TODO

Predicate logic:

  structure SingleSortedClassStructure where
    carrier : Type
    carrierNonempty : Nonempty carrier
    membership : carrier → carrier → Prop

Predicate logic (unfolded):

  structure SingleSortedClassStructure where
    carrier : Type
    carrierNonempty : Nonempty carrier
    membership : carrier → carrier → Prop (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure SingleSortedClassStructure where
  carrier : Type
  carrierNonempty : Nonempty carrier
  membership : carrier → carrier → Prop
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
structure SingleSortedClassStructure where
  carrier : Type
  carrierNonempty : Nonempty carrier
  membership : carrier → carrier → Prop

/--
`TwoSortedClassStructure` TODO

Predicate logic:

  structure TwoSortedClassStructure where
    setCarrier : Type
    setCarrierNonempty : Nonempty setCarrier
    classCarrier : Type
    classOfSet : setCarrier → classCarrier
    setMembership : setCarrier → setCarrier → Prop
    classMembership : setCarrier → classCarrier → Prop
    orderedPair : setCarrier → setCarrier → setCarrier

Predicate logic (unfolded):

  structure TwoSortedClassStructure where
    setCarrier : Type
    setCarrierNonempty : Nonempty setCarrier
    classCarrier : Type
    classOfSet : setCarrier → classCarrier
    setMembership : setCarrier → setCarrier → Prop
    classMembership : setCarrier → classCarrier → Prop
    orderedPair : setCarrier → setCarrier → setCarrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure TwoSortedClassStructure where
  setCarrier : Type
  setCarrierNonempty : Nonempty setCarrier
  classCarrier : Type
  classOfSet : setCarrier → classCarrier
  setMembership : setCarrier → setCarrier → Prop
  classMembership : setCarrier → classCarrier → Prop
  orderedPair : setCarrier → setCarrier → setCarrier
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
structure TwoSortedClassStructure where
  setCarrier : Type
  setCarrierNonempty : Nonempty setCarrier
  classCarrier : Type
  classOfSet : setCarrier → classCarrier
  setMembership : setCarrier → setCarrier → Prop
  classMembership : setCarrier → classCarrier → Prop
  orderedPair : setCarrier → setCarrier → setCarrier

/--
`SetPredicate` TODO

Predicate logic:

  ∀ (M : LRA.Set.Constructions.NBG.Interface.ModelTheory.SingleSortedClassStructure) (X : M.carrier), Exists fun Y => M.membership X Y

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun Y => M.3 X Y

Logical form (Lean):

```lean
def SetPredicate (M : SingleSortedClassStructure) (X : M.carrier) : Prop :=
  ∃ Y : M.carrier, M.membership X Y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases, unfold

-/
def SetPredicate (M : SingleSortedClassStructure) (X : M.carrier) : Prop :=
  ∃ Y : M.carrier, M.membership X Y

/--
`ProperClassPredicate` TODO

Predicate logic:

  ∀ (M : LRA.Set.Constructions.NBG.Interface.ModelTheory.SingleSortedClassStructure) (X : M.carrier), LRA.Set.Constructions.NBG.Interface.ModelTheory.SetPredicate M X → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Exists fun Y => M.3 X Y) → False

Logical form (Lean):

```lean
def ProperClassPredicate (M : SingleSortedClassStructure) (X : M.carrier) : Prop :=
  ¬ SetPredicate M X
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def ProperClassPredicate (M : SingleSortedClassStructure) (X : M.carrier) : Prop :=
  ¬ SetPredicate M X

/--
`DerivedSetSubdomain` TODO

Predicate logic:

  def DerivedSetSubdomain (M : SingleSortedClassStructure) :=
    { X : M.carrier // SetPredicate M X }

Predicate logic (unfolded):

  def DerivedSetSubdomain (M : SingleSortedClassStructure) :=
    { X : M.carrier // SetPredicate M X } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def DerivedSetSubdomain (M : SingleSortedClassStructure) :=
  { X : M.carrier // SetPredicate M X }
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def DerivedSetSubdomain (M : SingleSortedClassStructure) :=
  { X : M.carrier // SetPredicate M X }

/--
`ClassAssignment` TODO

Predicate logic:

  def ClassAssignment (M : SingleSortedClassStructure) :=
    Nat → M.carrier

Predicate logic (unfolded):

  def ClassAssignment (M : SingleSortedClassStructure) :=
    Nat → M.carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def ClassAssignment (M : SingleSortedClassStructure) :=
  Nat → M.carrier
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def ClassAssignment (M : SingleSortedClassStructure) :=
  Nat → M.carrier

/--
`toFirstOrderModel` TODO

Predicate logic:

  def toFirstOrderModel
      (M : SingleSortedClassStructure) :
      Model MembershipSignature where
    Domain := M.carrier
    domainNonempty := M.carrierNonempty
    interpretFunction := fun functionSymbol => Empty.elim functionSymbol
    interpretRelation := fun relationSymbol arguments =>
      match relationSymbol with
      | .mem => M.membership (arguments ⟨0, by decide⟩) (arguments ⟨1, by decide⟩)
    interpretConstant := fun constantSymbol => Empty.elim constantSymbol

Predicate logic (unfolded):

  def toFirstOrderModel
      (M : SingleSortedClassStructure) :
      Model MembershipSignature where
    Domain := M.carrier
    domainNonempty := M.carrierNonempty
    interpretFunction := fun functionSymbol => Empty.elim functionSymbol
    interpretRelation := fun relationSymbol arguments =>
      match relationSymbol with
      | .mem => M.membership (arguments ⟨0, by decide⟩) (arguments ⟨1, by decide⟩)
    interpretConstant := fun constantSymbol => Empty.elim constantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def toFirstOrderModel
    (M : SingleSortedClassStructure) :
    Model MembershipSignature where
  Domain := M.carrier
  domainNonempty := M.carrierNonempty
  interpretFunction := fun functionSymbol => Empty.elim functionSymbol
  interpretRelation := fun relationSymbol arguments =>
    match relationSymbol with
    | .mem => M.membership (arguments ⟨0, by decide⟩) (arguments ⟨1, by decide⟩)
  interpretConstant := fun constantSymbol => Empty.elim constantSymbol
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
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

/--
`SatisfiesSingleSortedFormula` TODO

Predicate logic:

  ∀ (M : LRA.Set.Constructions.NBG.Interface.ModelTheory.SingleSortedClassStructure) {Variable : Type} [inst : DecidableVariable] = assignment : Variable → (LRA.Set.Constructions.NBG.Interface.ModelTheory.toFirstOrderModel M).Domain (formula : LRA.Logic.FirstOrder.Formula LRA.Set.Constructions.NBG.Interface.ModelTheory.MembershipSignature Variable), LRA.Logic.FirstOrder.Satisfies (LRA.Set.Constructions.NBG.Interface.ModelTheory.toFirstOrderModel M) assignment formula

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Logic.FirstOrder.Satisfies { Domain := M.1, domainNonempty := ⋯, equalityIsDiagonal := ⋯, interpretFunction := fun functionSymbol => Empty.rec (fun x => (Fin (LRA.Set.Constructions.NBG.Interface.ModelTheory.MembershipSignature.Functions.2 functionSymbol) → M.1) → M.1) functionSymbol, interpretRelation := fun relationSymbol arguments => LRA.Set.Constructions.NBG.Interface.ModelTheory.MembershipRelationSymbol.rec (motive := fun x => (arguments : Fin (LRA.Set.Constructions.NBG.Interface.ModelTheory.MembershipSignature.Relations.2 x) → M.1) → (fun relationSymbol arguments => Prop) x arguments) (fun arguments => (fun arguments => M.3 (arguments ⟨0, LRA.Set.Constructions.NBG.Interface.ModelTheory.toFirstOrderModel._proof_2⟩) (arguments ⟨1, LRA.Set.Constructions.NBG.Interface.ModelTheory.toFirstOrderModel._proof_3⟩)) arguments) relationSymbol arguments, interpretConstant := fun constantSymbol => Empty.rec (fun x => M.1) constantSymbol } assignment formula

Logical form (Lean):

```lean
abbrev SatisfiesSingleSortedFormula
    (M : SingleSortedClassStructure)
    {Variable : Type}
    [DecidableEq Variable]
    (assignment : Variable → (toFirstOrderModel M).Domain)
    (formula : Formula MembershipSignature Variable) : Prop :=
  Satisfies (toFirstOrderModel M) assignment formula
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
abbrev SatisfiesSingleSortedFormula
    (M : SingleSortedClassStructure)
    {Variable : Type}
    [DecidableEq Variable]
    (assignment : Variable → (toFirstOrderModel M).Domain)
    (formula : Formula MembershipSignature Variable) : Prop :=
  Satisfies (toFirstOrderModel M) assignment formula

/--
`IsNormalClassModel` TODO

Predicate logic:

  structure IsNormalClassModel (M : SingleSortedClassStructure) : Prop where
    membershipInterpretationAgrees :
      ∀ X Y : M.carrier,
        (toFirstOrderModel M).interpretRelation .mem
          (fun
            | ⟨0, _⟩ => X
            | ⟨1, _⟩ => Y) ↔
          M.membership X Y

Predicate logic (unfolded):

  structure IsNormalClassModel (M : SingleSortedClassStructure) : Prop where
    membershipInterpretationAgrees :
      ∀ X Y : M.carrier,
        (toFirstOrderModel M).interpretRelation .mem
          (fun
            | ⟨0, _⟩ => X
            | ⟨1, _⟩ => Y) ↔
          M.membership X Y (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure IsNormalClassModel (M : SingleSortedClassStructure) : Prop where
  membershipInterpretationAgrees :
    ∀ X Y : M.carrier,
      (toFirstOrderModel M).interpretRelation .mem
        (fun
          | ⟨0, _⟩ => X
          | ⟨1, _⟩ => Y) ↔
        M.membership X Y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
structure IsNormalClassModel (M : SingleSortedClassStructure) : Prop where
  membershipInterpretationAgrees :
    ∀ X Y : M.carrier,
      (toFirstOrderModel M).interpretRelation .mem
        (fun
          | ⟨0, _⟩ => X
          | ⟨1, _⟩ => Y) ↔
        M.membership X Y

/--
`IsTransitiveSetModel` TODO

Predicate logic:

  ∀ (M : LRA.Set.Constructions.NBG.Interface.ModelTheory.TwoSortedClassStructure) {x y z : M.setCarrier}, (M.setMembership x y ∧ M.setMembership z x) → M.setMembership z y

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (M.5 x y ∧ M.5 z x) → M.5 z y

Logical form (Lean):

```lean
def IsTransitiveSetModel (M : TwoSortedClassStructure) : Prop :=
  ∀ {x y z : M.setCarrier},
    M.setMembership x y →
    M.setMembership z x →
    M.setMembership z y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def IsTransitiveSetModel (M : TwoSortedClassStructure) : Prop :=
  ∀ {x y z : M.setCarrier},
    M.setMembership x y →
    M.setMembership z x →
    M.setMembership z y

/--
`IsStandardModelPair` TODO

Predicate logic:

  ∀ (M : LRA.Set.Constructions.NBG.Interface.ModelTheory.TwoSortedClassStructure) (A x : M.setCarrier), M.classMembership x (M.classOfSet A) ↔ M.setMembership x A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    M.classMembership x (M.classOfSet A) ↔ M.setMembership x A

Logical form (Lean):

```lean
def IsStandardModelPair (M : TwoSortedClassStructure) : Prop :=
  ∀ A x : M.setCarrier, M.classMembership x (M.classOfSet A) ↔ M.setMembership x A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, unfold

-/
def IsStandardModelPair (M : TwoSortedClassStructure) : Prop :=
  ∀ A x : M.setCarrier, M.classMembership x (M.classOfSet A) ↔ M.setMembership x A

/--
`toSingleSortedClassStructure` TODO

Predicate logic:

  def toSingleSortedClassStructure
      (M : TwoSortedClassStructure) :
      SingleSortedClassStructure where
    carrier := M.classCarrier
    carrierNonempty := by
      rcases M.setCarrierNonempty with ⟨witness⟩
      exact ⟨M.classOfSet witness⟩
    membership := fun X Y =>
      ∃ x : M.setCarrier, X = M.classOfSet x ∧ M.classMembership x Y

Predicate logic (unfolded):

  def toSingleSortedClassStructure
      (M : TwoSortedClassStructure) :
      SingleSortedClassStructure where
    carrier := M.classCarrier
    carrierNonempty := by
      rcases M.setCarrierNonempty with ⟨witness⟩
      exact ⟨M.classOfSet witness⟩
    membership := fun X Y =>
      ∃ x : M.setCarrier, X = M.classOfSet x ∧ M.classMembership x Y (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def toSingleSortedClassStructure
    (M : TwoSortedClassStructure) :
    SingleSortedClassStructure where
  carrier := M.classCarrier
  carrierNonempty := by
    rcases M.setCarrierNonempty with ⟨witness⟩
    exact ⟨M.classOfSet witness⟩
  membership := fun X Y =>
    ∃ x : M.setCarrier, X = M.classOfSet x ∧ M.classMembership x Y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use, unfold

-/
def toSingleSortedClassStructure
    (M : TwoSortedClassStructure) :
    SingleSortedClassStructure where
  carrier := M.classCarrier
  carrierNonempty := by
    rcases M.setCarrierNonempty with ⟨witness⟩
    exact ⟨M.classOfSet witness⟩
  membership := fun X Y =>
    ∃ x : M.setCarrier, X = M.classOfSet x ∧ M.classMembership x Y

/--
`singleSortedClassStructureIsNormal` TODO

Predicate logic:

  ∀ (M : LRA.Set.Constructions.NBG.Interface.ModelTheory.SingleSortedClassStructure), LRA.Set.Constructions.NBG.Interface.ModelTheory.IsNormalClassModel M

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    M : SingleSortedClassStructure
  Prove
    LRA.Set.Constructions.NBG.Interface.ModelTheory.IsNormalClassModel M

Logical form (Lean):

```lean
theorem singleSortedClassStructureIsNormal
    (M : SingleSortedClassStructure) :
    IsNormalClassModel M
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem singleSortedClassStructureIsNormal
    (M : SingleSortedClassStructure) :
    IsNormalClassModel M := by
  sorry

end LRA.Set.Constructions.NBG.Interface.ModelTheory
