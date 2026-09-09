import LRA.Set.Constructions.GrothendieckUniverse.Satisfy_ZFC
import LRA.Set.Constructions.TGSet.Theorems
import LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.Theory

namespace LRA.Set.Constructions.TGSet

open LRA.Logic
open LRA.Logic.FirstOrder
open LRA.ModelTheory.FirstOrder
open LRA.Set.ModelTheory
open LRA.Set.Constructions.GrothendieckUniverse
open LRA.Set.Constructions.ZFCSet.Interface.ModelTheory

instance : GrothendieckUniverseAxiom LRA.Set.Constructions.TGSet := by
  sorry

/--
`TGSetCanonicalGrothendieckUniverseMembershipModel` TODO

Predicate logic:

  noncomputable def TGSetCanonicalGrothendieckUniverseMembershipModel
      (A : LRA.Set.Constructions.TGSet) :
      Model MembershipSignature :=
    CanonicalGrothendieckUniverseMembershipModel A

Predicate logic (unfolded):

  noncomputable def TGSetCanonicalGrothendieckUniverseMembershipModel
      (A : LRA.Set.Constructions.TGSet) :
      Model MembershipSignature :=
    CanonicalGrothendieckUniverseMembershipModel A (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def TGSetCanonicalGrothendieckUniverseMembershipModel
    (A : LRA.Set.Constructions.TGSet) :
    Model MembershipSignature :=
  CanonicalGrothendieckUniverseMembershipModel A
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
@[reducible] noncomputable def TGSetCanonicalGrothendieckUniverseMembershipModel
    (A : LRA.Set.Constructions.TGSet) :
    Model MembershipSignature :=
  CanonicalGrothendieckUniverseMembershipModel A

/--
`tgSetCanonicalGrothendieckUniverseModelsZFC` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.TGSet), A.TGSetCanonicalGrothendieckUniverseMembershipModel ∈ LRA.ModelTheory.FirstOrder.ModelsOfFormulaTheory LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.ZFCTheory

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : LRA.Set.Constructions.TGSet
  Prove
    { Domain := Subtype fun x => LRA.Set.Constructions.instMembershipTGSet.1 (Classical.choose ⋯) x, domainNonempty := ⋯, equalityIsDiagonal := ⋯, interpretFunction := fun functionSymbol => Empty.rec (fun x => (Fin (LRA.Set.ModelTheory.MembershipSignature.Functions.arity functionSymbol) → Subtype fun x => LRA.Set.Constructions.instMembershipTGSet.1 (LRA.Set.Constructions.GrothendieckUniverse.TheGrothendieckUniverse A) x) → Subtype fun x => LRA.Set.Constructions.instMembershipTGSet.1 (LRA.Set.Constructions.GrothendieckUniverse.TheGrothendieckUniverse A) x) functionSymbol, interpretRelation := fun relationSymbol arguments => LRA.Set.ModelTheory.MembershipRelationSymbol.rec (motive := fun x => (arguments : Fin (LRA.Set.ModelTheory.MembershipSignature.relationArity x) → Subtype fun x => LRA.Set.Constructions.instMembershipTGSet.mem (LRA.Set.Constructions.GrothendieckUniverse.TheGrothendieckUniverse A) x) → (fun relationSymbol arguments => Prop) x arguments) (fun arguments => (fun arguments => LRA.Set.Constructions.instMembershipTGSet.mem (arguments ⟨1, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_3⟩).val (arguments ⟨0, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_4⟩).val) arguments) relationSymbol arguments, interpretConstant := fun constantSymbol => LRA.Set.ModelTheory.MembershipConstantSymbol.rec ((fun _ => let emptyWitness := Classical.choose ⋯; have emptyWitnessSpec := ⋯; ⟨emptyWitness, ⋯⟩) Unit.unit) constantSymbol } ∈ fun M => ∀ (assignment : Nat → M.1) (φ : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat), φ ∈ LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.ZFCTheory → LRA.Logic.FirstOrder.Satisfies M assignment φ

Logical form (Lean):

```lean
theorem tgSetCanonicalGrothendieckUniverseModelsZFC
    (A : LRA.Set.Constructions.TGSet) :
    TGSetCanonicalGrothendieckUniverseMembershipModel A ∈
      ModelsOfFormulaTheory ZFCTheory
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
theorem tgSetCanonicalGrothendieckUniverseModelsZFC
    (A : LRA.Set.Constructions.TGSet) :
    TGSetCanonicalGrothendieckUniverseMembershipModel A ∈
      ModelsOfFormulaTheory ZFCTheory := by
  sorry

end LRA.Set.Constructions.TGSet
