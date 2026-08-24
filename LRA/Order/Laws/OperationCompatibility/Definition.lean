import LRA.Operation.Definition

namespace LRA.Order

universe u

/--
`AdditionRespectsOrderLaws` TODO

Predicate logic:

  class AdditionRespectsOrderLaws (R : Type u) [Add R] [LE R] : Prop where
  AddLeAddLeft : forall a b : R, a <= b -> forall c : R, c + a <= c + b
  AddLeAddRight : forall a b : R, a <= b -> forall c : R, a + c <= b + c

Predicate logic (unfolded):

  class AdditionRespectsOrderLaws (R : Type u) [Add R] [LE R] : Prop where
  AddLeAddLeft : forall a b : R, a <= b -> forall c : R, c + a <= c + b
  AddLeAddRight : forall a b : R, a <= b -> forall c : R, a + c <= b + c (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class AdditionRespectsOrderLaws (R : Type u) [Add R] [LE R] : Prop where
  AddLeAddLeft : forall a b : R, a <= b -> forall c : R, c + a <= c + b
  AddLeAddRight : forall a b : R, a <= b -> forall c : R, a + c <= b + c
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
class AdditionRespectsOrderLaws (R : Type u) [Add R] [LE R] : Prop where
  AddLeAddLeft : forall a b : R, a <= b -> forall c : R, c + a <= c + b
  AddLeAddRight : forall a b : R, a <= b -> forall c : R, a + c <= b + c

/--
`MultiplicationRespectsOrderLaws` TODO

Predicate logic:

  class MultiplicationRespectsOrderLaws (R : Type u)
    [Mul R] [LE R] [OfNat R 0] : Prop where
  MulNonneg : forall a b : R, 0 <= a -> 0 <= b -> 0 <= a * b

Predicate logic (unfolded):

  class MultiplicationRespectsOrderLaws (R : Type u)
    [Mul R] [LE R] [OfNat R 0] : Prop where
  MulNonneg : forall a b : R, 0 <= a -> 0 <= b -> 0 <= a * b (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class MultiplicationRespectsOrderLaws (R : Type u)
    [Mul R] [LE R] [OfNat R 0] : Prop where
  MulNonneg : forall a b : R, 0 <= a -> 0 <= b -> 0 <= a * b
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
class MultiplicationRespectsOrderLaws (R : Type u)
    [Mul R] [LE R] [OfNat R 0] : Prop where
  MulNonneg : forall a b : R, 0 <= a -> 0 <= b -> 0 <= a * b

/--
`StrictlyPreservesRightTranslation` TODO

Predicate logic:

  ∀ {R : Type u} (relation : R → R → Prop) (operation : R → R → R) (first second translation : R), relation first second → relation (operation first translation) (operation second translation)

Predicate logic (unfolded):

  ∀ {R : Type u} (relation : R → R → Prop) (operation : R → R → R) (first second translation : R), relation first second → relation (operation first translation) (operation second translation)

Logical form (Lean):

```lean
def StrictlyPreservesRightTranslation {R : Type u}
    (relation : R -> R -> Prop)
    (operation : R -> R -> R) : Prop :=
  forall first second translation,
    relation first second ->
    relation (operation first translation) (operation second translation)
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
def StrictlyPreservesRightTranslation {R : Type u}
    (relation : R -> R -> Prop)
    (operation : R -> R -> R) : Prop :=
  forall first second translation,
    relation first second ->
    relation (operation first translation) (operation second translation)

/--
`PreservesPositiveRightMultiplication` TODO

Predicate logic:

  ∀ {R : Type u} (strictOrderRelation : R → R → Prop) (mul : R → R → R) (zero first second positive : R), (strictOrderRelation zero positive ∧ strictOrderRelation first second) → strictOrderRelation (mul first positive) (mul second positive)

Predicate logic (unfolded):

  ∀ {R : Type u} (strictOrderRelation : R → R → Prop) (mul : R → R → R) (zero first second positive : R), (strictOrderRelation zero positive ∧ strictOrderRelation first second) → strictOrderRelation (mul first positive) (mul second positive)

Logical form (Lean):

```lean
def PreservesPositiveRightMultiplication {R : Type u}
    (strictOrderRelation : R -> R -> Prop)
    (mul : R -> R -> R)
    (zero : R) : Prop :=
  forall first second positive,
    strictOrderRelation zero positive ->
    strictOrderRelation first second ->
    strictOrderRelation (mul first positive) (mul second positive)
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
def PreservesPositiveRightMultiplication {R : Type u}
    (strictOrderRelation : R -> R -> Prop)
    (mul : R -> R -> R)
    (zero : R) : Prop :=
  forall first second positive,
    strictOrderRelation zero positive ->
    strictOrderRelation first second ->
    strictOrderRelation (mul first positive) (mul second positive)

/--
`LeftTranslationPreservesRelation` TODO

Predicate logic:

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) (operation : LRA.Operation.BinaryEndoOperation Carrier) (fixed left right : Carrier), relation left right → relation (operation fixed left) (operation fixed right)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) (operation : Carrier → Carrier → Carrier) (fixed left right : Carrier), relation left right → relation (operation fixed left) (operation fixed right)

Logical form (Lean):

```lean
def LeftTranslationPreservesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  forall fixed left right,
    relation left right -> relation (operation fixed left) (operation fixed right)
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
def LeftTranslationPreservesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  forall fixed left right,
    relation left right -> relation (operation fixed left) (operation fixed right)

/--
`RightTranslationPreservesRelation` TODO

Predicate logic:

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) (operation : LRA.Operation.BinaryEndoOperation Carrier) (left right fixed : Carrier), relation left right → relation (operation left fixed) (operation right fixed)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) (operation : Carrier → Carrier → Carrier) (left right fixed : Carrier), relation left right → relation (operation left fixed) (operation right fixed)

Logical form (Lean):

```lean
def RightTranslationPreservesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  forall left right fixed,
    relation left right -> relation (operation left fixed) (operation right fixed)
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
def RightTranslationPreservesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  forall left right fixed,
    relation left right -> relation (operation left fixed) (operation right fixed)

/--
`CoordinatewisePreservesRelation` TODO

Predicate logic:

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) (operation : LRA.Operation.BinaryEndoOperation Carrier) (left₁ left₂ right₁ right₂ : Carrier), (relation left₁ left₂ ∧ relation right₁ right₂) → relation (operation left₁ right₁) (operation left₂ right₂)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) (operation : Carrier → Carrier → Carrier) (left₁ left₂ right₁ right₂ : Carrier), (relation left₁ left₂ ∧ relation right₁ right₂) → relation (operation left₁ right₁) (operation left₂ right₂)

Logical form (Lean):

```lean
def CoordinatewisePreservesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  forall left₁ left₂ right₁ right₂,
    relation left₁ left₂ -> relation right₁ right₂ ->
      relation (operation left₁ right₁) (operation left₂ right₂)
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
def CoordinatewisePreservesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  forall left₁ left₂ right₁ right₂,
    relation left₁ left₂ -> relation right₁ right₂ ->
      relation (operation left₁ right₁) (operation left₂ right₂)

/--
`LeftTranslationReversesRelation` TODO

Predicate logic:

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) (operation : LRA.Operation.BinaryEndoOperation Carrier) (fixed left right : Carrier), relation left right → relation (operation fixed right) (operation fixed left)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) (operation : Carrier → Carrier → Carrier) (fixed left right : Carrier), relation left right → relation (operation fixed right) (operation fixed left)

Logical form (Lean):

```lean
def LeftTranslationReversesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  forall fixed left right,
    relation left right -> relation (operation fixed right) (operation fixed left)
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
def LeftTranslationReversesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  forall fixed left right,
    relation left right -> relation (operation fixed right) (operation fixed left)

/--
`RightTranslationReversesRelation` TODO

Predicate logic:

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) (operation : LRA.Operation.BinaryEndoOperation Carrier) (left right fixed : Carrier), relation left right → relation (operation right fixed) (operation left fixed)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) (operation : Carrier → Carrier → Carrier) (left right fixed : Carrier), relation left right → relation (operation right fixed) (operation left fixed)

Logical form (Lean):

```lean
def RightTranslationReversesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  forall left right fixed,
    relation left right -> relation (operation right fixed) (operation left fixed)
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
def RightTranslationReversesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  forall left right fixed,
    relation left right -> relation (operation right fixed) (operation left fixed)

/--
`PositiveRightTranslationPreservesRelation` TODO

Predicate logic:

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) (positive : Carrier → Prop) (operation : LRA.Operation.BinaryEndoOperation Carrier) (left right fixed : Carrier), (positive fixed ∧ relation left right) → relation (operation left fixed) (operation right fixed)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) (positive : Carrier → Prop) (operation : Carrier → Carrier → Carrier) (left right fixed : Carrier), (positive fixed ∧ relation left right) → relation (operation left fixed) (operation right fixed)

Logical form (Lean):

```lean
def PositiveRightTranslationPreservesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (positive : Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  forall left right fixed,
    positive fixed -> relation left right ->
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

Related proof moves: intro, unfold

-/
def PositiveRightTranslationPreservesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (positive : Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  forall left right fixed,
    positive fixed -> relation left right ->
      relation (operation left fixed) (operation right fixed)

/--
`PositiveLeftTranslationPreservesRelation` TODO

Predicate logic:

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) (positive : Carrier → Prop) (operation : LRA.Operation.BinaryEndoOperation Carrier) (fixed left right : Carrier), (positive fixed ∧ relation left right) → relation (operation fixed left) (operation fixed right)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) (positive : Carrier → Prop) (operation : Carrier → Carrier → Carrier) (fixed left right : Carrier), (positive fixed ∧ relation left right) → relation (operation fixed left) (operation fixed right)

Logical form (Lean):

```lean
def PositiveLeftTranslationPreservesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (positive : Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  forall fixed left right,
    positive fixed -> relation left right ->
      relation (operation fixed left) (operation fixed right)
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
def PositiveLeftTranslationPreservesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (positive : Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  forall fixed left right,
    positive fixed -> relation left right ->
      relation (operation fixed left) (operation fixed right)

/--
`NegativeRightTranslationReversesRelation` TODO

Predicate logic:

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) (negative : Carrier → Prop) (operation : LRA.Operation.BinaryEndoOperation Carrier) (left right fixed : Carrier), (negative fixed ∧ relation left right) → relation (operation right fixed) (operation left fixed)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) (negative : Carrier → Prop) (operation : Carrier → Carrier → Carrier) (left right fixed : Carrier), (negative fixed ∧ relation left right) → relation (operation right fixed) (operation left fixed)

Logical form (Lean):

```lean
def NegativeRightTranslationReversesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (negative : Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  forall left right fixed,
    negative fixed -> relation left right ->
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

Related proof moves: intro, unfold

-/
def NegativeRightTranslationReversesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (negative : Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  forall left right fixed,
    negative fixed -> relation left right ->
      relation (operation right fixed) (operation left fixed)

/--
`NegativeLeftTranslationReversesRelation` TODO

Predicate logic:

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) (negative : Carrier → Prop) (operation : LRA.Operation.BinaryEndoOperation Carrier) (fixed left right : Carrier), (negative fixed ∧ relation left right) → relation (operation fixed right) (operation fixed left)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (relation : Carrier → Carrier → Prop) (negative : Carrier → Prop) (operation : Carrier → Carrier → Carrier) (fixed left right : Carrier), (negative fixed ∧ relation left right) → relation (operation fixed right) (operation fixed left)

Logical form (Lean):

```lean
def NegativeLeftTranslationReversesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (negative : Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  forall fixed left right,
    negative fixed -> relation left right ->
      relation (operation fixed right) (operation fixed left)
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
def NegativeLeftTranslationReversesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (negative : Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  forall fixed left right,
    negative fixed -> relation left right ->
      relation (operation fixed right) (operation fixed left)

section Wrappers

variable {R : Type u}

/--
`AddLeAddLeft` TODO

Predicate logic:

  forall a b : R, a <= b -> forall c : R, c + a <= c + b

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] [inst_1 : LE R], LRA.Order.AdditionRespectsOrderLaws R → ∀ (a b : R), inst_1.1 a b → ∀ (c : R), inst_1.1 (instHAdd.1 c a) (instHAdd.1 c b)

Logical form (Lean):

```lean
theorem AddLeAddLeft [Add R] [LE R] [AdditionRespectsOrderLaws R] :
    forall a b : R, a <= b -> forall c : R, c + a <= c + b
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
theorem AddLeAddLeft [Add R] [LE R] [AdditionRespectsOrderLaws R] :
    forall a b : R, a <= b -> forall c : R, c + a <= c + b := by
  sorry

/--
`AddLeAddRight` TODO

Predicate logic:

  forall a b : R, a <= b -> forall c : R, a + c <= b + c

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] [inst_1 : LE R], LRA.Order.AdditionRespectsOrderLaws R → ∀ (a b : R), inst_1.1 a b → ∀ (c : R), inst_1.1 (instHAdd.1 a c) (instHAdd.1 b c)

Logical form (Lean):

```lean
theorem AddLeAddRight [Add R] [LE R] [AdditionRespectsOrderLaws R] :
    forall a b : R, a <= b -> forall c : R, a + c <= b + c
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
theorem AddLeAddRight [Add R] [LE R] [AdditionRespectsOrderLaws R] :
    forall a b : R, a <= b -> forall c : R, a + c <= b + c := by
  sorry

/--
`MulNonneg` TODO

Predicate logic:

  forall a b : R, 0 <= a -> 0 <= b -> 0 <= a * b

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Mul R] [inst_1 : LE R] [inst_2 : OfNat R (instOfNatNat 0).1], LRA.Order.MultiplicationRespectsOrderLaws R → ∀ (a b : R), (inst_1.1 inst_2.1 a ∧ inst_1.1 inst_2.1 b) → inst_1.1 inst_2.1 (instHMul.1 a b)

Logical form (Lean):

```lean
theorem MulNonneg [Mul R] [LE R] [OfNat R 0]
    [MultiplicationRespectsOrderLaws R] :
    forall a b : R, 0 <= a -> 0 <= b -> 0 <= a * b
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
theorem MulNonneg [Mul R] [LE R] [OfNat R 0]
    [MultiplicationRespectsOrderLaws R] :
    forall a b : R, 0 <= a -> 0 <= b -> 0 <= a * b := by
  sorry

end Wrappers

end LRA.Order
