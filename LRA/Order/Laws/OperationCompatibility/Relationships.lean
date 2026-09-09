import LRA.Order.Laws.OperationCompatibility.Theorems
import LRA.Operation.Laws.Commutative.Definition

namespace LRA.Order

universe u

/--
`Commutative.left_preservation_to_right_preservation` TODO

Predicate logic:

  ∀ {Carrier : Type u} {relation : Carrier → Carrier → Prop} {operation : LRA.Operation.BinaryEndoOperation Carrier}, (LRA.Operation.Laws.Commutative.Commutative operation ∧ LRA.Order.LeftTranslationPreservesRelation relation operation) → LRA.Order.RightTranslationPreservesRelation relation operation

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    relation : Carrier -> Carrier -> Prop
    operation : LRA.Operation.BinaryEndoOperation Carrier
    commutative : LRA.Operation.Laws.Commutative.Commutative operation
    leftLaw : LeftTranslationPreservesRelation relation operation
  Prove
    ((∀ (first second : Carrier), operation first second = operation second first) ∧ (∀ (fixed left right : Carrier), relation left right → relation (operation fixed left) (operation fixed right))) → ∀ (left right fixed : Carrier), relation left right → relation (operation left fixed) (operation right fixed)

Logical form (Lean):

```lean
theorem Commutative.left_preservation_to_right_preservation {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (commutative :
      LRA.Operation.Laws.Commutative.Commutative operation)
    (leftLaw : LeftTranslationPreservesRelation relation operation) :
    RightTranslationPreservesRelation relation operation
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
theorem Commutative.left_preservation_to_right_preservation {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (commutative :
      LRA.Operation.Laws.Commutative.Commutative operation)
    (leftLaw : LeftTranslationPreservesRelation relation operation) :
    RightTranslationPreservesRelation relation operation := by
  sorry
/--
`Commutative.right_preservation_to_left_preservation` TODO

Predicate logic:

  ∀ {Carrier : Type u} {relation : Carrier → Carrier → Prop} {operation : LRA.Operation.BinaryEndoOperation Carrier}, (LRA.Operation.Laws.Commutative.Commutative operation ∧ LRA.Order.RightTranslationPreservesRelation relation operation) → LRA.Order.LeftTranslationPreservesRelation relation operation

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    relation : Carrier -> Carrier -> Prop
    operation : LRA.Operation.BinaryEndoOperation Carrier
    commutative : LRA.Operation.Laws.Commutative.Commutative operation
    rightLaw : RightTranslationPreservesRelation relation operation
  Prove
    ((∀ (first second : Carrier), operation first second = operation second first) ∧ (∀ (left right fixed : Carrier), relation left right → relation (operation left fixed) (operation right fixed))) → ∀ (fixed left right : Carrier), relation left right → relation (operation fixed left) (operation fixed right)

Logical form (Lean):

```lean
theorem Commutative.right_preservation_to_left_preservation {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (commutative :
      LRA.Operation.Laws.Commutative.Commutative operation)
    (rightLaw : RightTranslationPreservesRelation relation operation) :
    LeftTranslationPreservesRelation relation operation
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
theorem Commutative.right_preservation_to_left_preservation {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (commutative :
      LRA.Operation.Laws.Commutative.Commutative operation)
    (rightLaw : RightTranslationPreservesRelation relation operation) :
    LeftTranslationPreservesRelation relation operation := by
  sorry
/--
`PositiveRightTranslationPreservesRelation.to_right_preservation_on_positive` TODO

Predicate logic:

  ∀ {Carrier : Type u} {relation : Carrier → Carrier → Prop} {positive : Carrier → Prop} {operation : LRA.Operation.BinaryEndoOperation Carrier}, LRA.Order.PositiveRightTranslationPreservesRelation relation positive operation → ∀ (fixed : Carrier), positive fixed → ∀ (left right : Carrier), relation left right → relation (operation left fixed) (operation right fixed)

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    relation : Carrier -> Carrier -> Prop
    positive : Carrier -> Prop
    operation : LRA.Operation.BinaryEndoOperation Carrier
    law : PositiveRightTranslationPreservesRelation relation positive operation
  Prove
    (∀ (left right fixed : Carrier), positive fixed → relation left right → relation (operation left fixed) (operation right fixed)) → ∀ (fixed : Carrier), positive fixed → ∀ (left right : Carrier), relation left right → relation (operation left fixed) (operation right fixed)

Logical form (Lean):

```lean
theorem PositiveRightTranslationPreservesRelation.to_right_preservation_on_positive
    {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {positive : Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (law : PositiveRightTranslationPreservesRelation relation positive operation) :
    forall fixed, positive fixed ->
      forall left right, relation left right ->
        relation (operation left fixed) (operation right fixed)
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
theorem PositiveRightTranslationPreservesRelation.to_right_preservation_on_positive
    {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {positive : Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (law : PositiveRightTranslationPreservesRelation relation positive operation) :
    forall fixed, positive fixed ->
      forall left right, relation left right ->
        relation (operation left fixed) (operation right fixed) := by
  sorry
/--
`NegativeRightTranslationReversesRelation.to_right_reversal_on_negative` TODO

Predicate logic:

  ∀ {Carrier : Type u} {relation : Carrier → Carrier → Prop} {negative : Carrier → Prop} {operation : LRA.Operation.BinaryEndoOperation Carrier}, LRA.Order.NegativeRightTranslationReversesRelation relation negative operation → ∀ (fixed : Carrier), negative fixed → ∀ (left right : Carrier), relation left right → relation (operation right fixed) (operation left fixed)

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    relation : Carrier -> Carrier -> Prop
    negative : Carrier -> Prop
    operation : LRA.Operation.BinaryEndoOperation Carrier
    law : NegativeRightTranslationReversesRelation relation negative operation
  Prove
    (∀ (left right fixed : Carrier), negative fixed → relation left right → relation (operation right fixed) (operation left fixed)) → ∀ (fixed : Carrier), negative fixed → ∀ (left right : Carrier), relation left right → relation (operation right fixed) (operation left fixed)

Logical form (Lean):

```lean
theorem NegativeRightTranslationReversesRelation.to_right_reversal_on_negative
    {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {negative : Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (law : NegativeRightTranslationReversesRelation relation negative operation) :
    forall fixed, negative fixed ->
      forall left right, relation left right ->
        relation (operation right fixed) (operation left fixed)
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
theorem NegativeRightTranslationReversesRelation.to_right_reversal_on_negative
    {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {negative : Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    (law : NegativeRightTranslationReversesRelation relation negative operation) :
    forall fixed, negative fixed ->
      forall left right, relation left right ->
        relation (operation right fixed) (operation left fixed) := by
  sorry
/--
`CoordinatewisePreservesRelation.of_left_and_right_translation` TODO

Predicate logic:

  ∀ {Carrier : Type u} {relation : Carrier → Carrier → Prop} {operation : LRA.Operation.BinaryEndoOperation Carrier} [Trans relation relation relation], LRA.Order.LeftTranslationPreservesRelation relation operation → LRA.Order.RightTranslationPreservesRelation relation operation → LRA.Order.CoordinatewisePreservesRelation relation operation

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {relation : Carrier → Carrier → Prop} {operation : LRA.Operation.BinaryEndoOperation Carrier} [Trans relation relation relation], LRA.Order.LeftTranslationPreservesRelation relation operation → LRA.Order.RightTranslationPreservesRelation relation operation → LRA.Order.CoordinatewisePreservesRelation relation operation (compiled unfold unavailable; showing predicate logic)

Logical form (Lean):

```lean
theorem CoordinatewisePreservesRelation.of_left_and_right_translation
    {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    [Trans relation relation relation]
    (leftLaw : LeftTranslationPreservesRelation relation operation)
    (rightLaw : RightTranslationPreservesRelation relation operation) :
    CoordinatewisePreservesRelation relation operation
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
theorem CoordinatewisePreservesRelation.of_left_and_right_translation
    {Carrier : Type u}
    {relation : Carrier -> Carrier -> Prop}
    {operation : LRA.Operation.BinaryEndoOperation Carrier}
    [Trans relation relation relation]
    (leftLaw : LeftTranslationPreservesRelation relation operation)
    (rightLaw : RightTranslationPreservesRelation relation operation) :
    CoordinatewisePreservesRelation relation operation := by
  sorry
/--
`AdditionRespectsOrderLaws.to_left_translation` TODO

Predicate logic:

  ∀ {R : Type u} [inst : Add R] [inst_1 : LE R], LRA.Order.AdditionRespectsOrderLaws R → LRA.Order.LeftTranslationPreservesRelation (fun x1 x2 => inst_1.le x1 x2) fun a b => instHAdd.hAdd a b

Predicate logic (unfolded):

  Ambient
    (R, ≤)
  Objects
    (none)
  Prove
    LRA.Order.AdditionRespectsOrderLaws R → ∀ (fixed left right : R), inst_1.le left right → (fun x1 x2 => inst_1.le x1 x2) ((fun a b => { hAdd := fun a b => inst.add a b }.hAdd a b) fixed left) ((fun a b => { hAdd := fun a b => inst.add a b }.hAdd a b) fixed right)

Logical form (Lean):

```lean
theorem AdditionRespectsOrderLaws.to_left_translation
    {R : Type u} [Add R] [LE R] [AdditionRespectsOrderLaws R] :
    LeftTranslationPreservesRelation (· <= · : R -> R -> Prop)
      (fun a b => a + b)
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
theorem AdditionRespectsOrderLaws.to_left_translation
    {R : Type u} [Add R] [LE R] [AdditionRespectsOrderLaws R] :
    LeftTranslationPreservesRelation (· <= · : R -> R -> Prop)
      (fun a b => a + b) := by
  sorry
/--
`AdditionRespectsOrderLaws.to_right_translation` TODO

Predicate logic:

  ∀ {R : Type u} [inst : Add R] [inst_1 : LE R], LRA.Order.AdditionRespectsOrderLaws R → LRA.Order.RightTranslationPreservesRelation (fun x1 x2 => inst_1.le x1 x2) fun a b => instHAdd.hAdd a b

Predicate logic (unfolded):

  Ambient
    (R, ≤)
  Objects
    (none)
  Prove
    LRA.Order.AdditionRespectsOrderLaws R → ∀ (left right fixed : R), inst_1.le left right → (fun x1 x2 => inst_1.le x1 x2) ((fun a b => { hAdd := fun a b => inst.add a b }.hAdd a b) left fixed) ((fun a b => { hAdd := fun a b => inst.add a b }.hAdd a b) right fixed)

Logical form (Lean):

```lean
theorem AdditionRespectsOrderLaws.to_right_translation
    {R : Type u} [Add R] [LE R] [AdditionRespectsOrderLaws R] :
    RightTranslationPreservesRelation (· <= · : R -> R -> Prop)
      (fun a b => a + b)
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
theorem AdditionRespectsOrderLaws.to_right_translation
    {R : Type u} [Add R] [LE R] [AdditionRespectsOrderLaws R] :
    RightTranslationPreservesRelation (· <= · : R -> R -> Prop)
      (fun a b => a + b) := by
  sorry
end LRA.Order
