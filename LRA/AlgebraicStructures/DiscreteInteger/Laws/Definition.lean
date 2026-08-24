namespace LRA.AlgebraicStructures

universe u

/--
`HasSuccessor` TODO

Predicate logic:

  class HasSuccessor (R : Type u) where
  Succ : R → R

Predicate logic (unfolded):

  class HasSuccessor (R : Type u) where
  Succ : R → R (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class HasSuccessor (R : Type u) where
  Succ : R → R
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
class HasSuccessor (R : Type u) where
  Succ : R → R

/--
`HasPredecessor` TODO

Predicate logic:

  class HasPredecessor (R : Type u) where
  Pred : R → R

Predicate logic (unfolded):

  class HasPredecessor (R : Type u) where
  Pred : R → R (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class HasPredecessor (R : Type u) where
  Pred : R → R
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
class HasPredecessor (R : Type u) where
  Pred : R → R

/--
`Succ` TODO

Predicate logic:

  def Succ {R : Type u} [HasSuccessor R] : R → R :=
  HasSuccessor.Succ

Predicate logic (unfolded):

  def Succ {R : Type u} [HasSuccessor R] : R → R :=
  HasSuccessor.Succ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Succ {R : Type u} [HasSuccessor R] : R → R :=
  HasSuccessor.Succ
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
def Succ {R : Type u} [HasSuccessor R] : R → R :=
  HasSuccessor.Succ

/--
`Pred` TODO

Predicate logic:

  def Pred {R : Type u} [HasPredecessor R] : R → R :=
  HasPredecessor.Pred

Predicate logic (unfolded):

  def Pred {R : Type u} [HasPredecessor R] : R → R :=
  HasPredecessor.Pred (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Pred {R : Type u} [HasPredecessor R] : R → R :=
  HasPredecessor.Pred
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
def Pred {R : Type u} [HasPredecessor R] : R → R :=
  HasPredecessor.Pred

/--
`SuccIterate` TODO

Predicate logic:

  def SuccIterate {R : Type u} [HasSuccessor R] : Nat → R → R
  | 0, a => a
  | n + 1, a => Succ (SuccIterate n a)

Predicate logic (unfolded):

  def SuccIterate {R : Type u} [HasSuccessor R] : Nat → R → R
  | 0, a => a
  | n + 1, a => Succ (SuccIterate n a) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def SuccIterate {R : Type u} [HasSuccessor R] : Nat → R → R
  | 0, a => a
  | n + 1, a => Succ (SuccIterate n a)
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
def SuccIterate {R : Type u} [HasSuccessor R] : Nat → R → R
  | 0, a => a
  | n + 1, a => Succ (SuccIterate n a)

/--
`SuccessorLaws` TODO

Predicate logic:

  class SuccessorLaws (R : Type u)
    [HasSuccessor R] [HasPredecessor R] : Prop where
  PredSucc : ∀ a : R, Pred (Succ a) = a
  SuccPred : ∀ a : R, Succ (Pred a) = a
  SuccInjective : ∀ a b : R, Succ a = Succ b → a = b
  PredInjective : ∀ a b : R, Pred a = Pred b → a = b

Predicate logic (unfolded):

  class SuccessorLaws (R : Type u)
    [HasSuccessor R] [HasPredecessor R] : Prop where
  PredSucc : ∀ a : R, Pred (Succ a) = a
  SuccPred : ∀ a : R, Succ (Pred a) = a
  SuccInjective : ∀ a b : R, Succ a = Succ b → a = b
  PredInjective : ∀ a b : R, Pred a = Pred b → a = b (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class SuccessorLaws (R : Type u)
    [HasSuccessor R] [HasPredecessor R] : Prop where
  PredSucc : ∀ a : R, Pred (Succ a) = a
  SuccPred : ∀ a : R, Succ (Pred a) = a
  SuccInjective : ∀ a b : R, Succ a = Succ b → a = b
  PredInjective : ∀ a b : R, Pred a = Pred b → a = b
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
class SuccessorLaws (R : Type u)
    [HasSuccessor R] [HasPredecessor R] : Prop where
  PredSucc : ∀ a : R, Pred (Succ a) = a
  SuccPred : ∀ a : R, Succ (Pred a) = a
  SuccInjective : ∀ a b : R, Succ a = Succ b → a = b
  PredInjective : ∀ a b : R, Pred a = Pred b → a = b

/--
`SuccessorAdditionLaw` TODO

Predicate logic:

  class SuccessorAdditionLaw (R : Type u)
    [HasSuccessor R] [Add R] [OfNat R 1] : Prop where
  SuccEqAddOne : ∀ a : R, Succ a = a + 1

Predicate logic (unfolded):

  class SuccessorAdditionLaw (R : Type u)
    [HasSuccessor R] [Add R] [OfNat R 1] : Prop where
  SuccEqAddOne : ∀ a : R, Succ a = a + 1 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class SuccessorAdditionLaw (R : Type u)
    [HasSuccessor R] [Add R] [OfNat R 1] : Prop where
  SuccEqAddOne : ∀ a : R, Succ a = a + 1
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
class SuccessorAdditionLaw (R : Type u)
    [HasSuccessor R] [Add R] [OfNat R 1] : Prop where
  SuccEqAddOne : ∀ a : R, Succ a = a + 1

/--
`SuccessorMultiplicationLaws` TODO

Predicate logic:

  class SuccessorMultiplicationLaws (R : Type u)
    [HasSuccessor R] [HasPredecessor R] [Add R] [Mul R] [Neg R] : Prop where
  MulSucc : ∀ a b : R, a * Succ b = a * b + a
  MulPred : ∀ a b : R, a * Pred b = a * b + -a

Predicate logic (unfolded):

  class SuccessorMultiplicationLaws (R : Type u)
    [HasSuccessor R] [HasPredecessor R] [Add R] [Mul R] [Neg R] : Prop where
  MulSucc : ∀ a b : R, a * Succ b = a * b + a
  MulPred : ∀ a b : R, a * Pred b = a * b + -a (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class SuccessorMultiplicationLaws (R : Type u)
    [HasSuccessor R] [HasPredecessor R] [Add R] [Mul R] [Neg R] : Prop where
  MulSucc : ∀ a b : R, a * Succ b = a * b + a
  MulPred : ∀ a b : R, a * Pred b = a * b + -a
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
class SuccessorMultiplicationLaws (R : Type u)
    [HasSuccessor R] [HasPredecessor R] [Add R] [Mul R] [Neg R] : Prop where
  MulSucc : ∀ a b : R, a * Succ b = a * b + a
  MulPred : ∀ a b : R, a * Pred b = a * b + -a

/--
`DiscretenessLaw` TODO

Predicate logic:

  class DiscretenessLaw (R : Type u)
    [HasSuccessor R] [HasPredecessor R] [OfNat R 0] : Prop where
  SuccAperiodic : ∀ n : Nat, 0 < n → SuccIterate n (0 : R) ≠ 0
  TwoSidedInduction :
    ∀ (motive : R → Prop),
      motive 0 →
      (∀ a, motive a → motive (Succ a)) →
      (∀ a, motive a → motive (Pred a)) →
      ∀ a, motive a

Predicate logic (unfolded):

  class DiscretenessLaw (R : Type u)
    [HasSuccessor R] [HasPredecessor R] [OfNat R 0] : Prop where
  SuccAperiodic : ∀ n : Nat, 0 < n → SuccIterate n (0 : R) ≠ 0
  TwoSidedInduction :
    ∀ (motive : R → Prop),
      motive 0 →
      (∀ a, motive a → motive (Succ a)) →
      (∀ a, motive a → motive (Pred a)) →
      ∀ a, motive a (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class DiscretenessLaw (R : Type u)
    [HasSuccessor R] [HasPredecessor R] [OfNat R 0] : Prop where
  SuccAperiodic : ∀ n : Nat, 0 < n → SuccIterate n (0 : R) ≠ 0
  TwoSidedInduction :
    ∀ (motive : R → Prop),
      motive 0 →
      (∀ a, motive a → motive (Succ a)) →
      (∀ a, motive a → motive (Pred a)) →
      ∀ a, motive a
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
class DiscretenessLaw (R : Type u)
    [HasSuccessor R] [HasPredecessor R] [OfNat R 0] : Prop where
  SuccAperiodic : ∀ n : Nat, 0 < n → SuccIterate n (0 : R) ≠ 0
  TwoSidedInduction :
    ∀ (motive : R → Prop),
      motive 0 →
      (∀ a, motive a → motive (Succ a)) →
      (∀ a, motive a → motive (Pred a)) →
      ∀ a, motive a

section Wrappers

variable {R : Type u}

/--
`PredSucc` TODO

Predicate logic:

  ∀ a : R, Pred (Succ a) = a

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : LRA.AlgebraicStructures.HasSuccessor R] [inst_1 : LRA.AlgebraicStructures.HasPredecessor R], LRA.AlgebraicStructures.SuccessorLaws R → ∀ (a : R), inst_1.1 (inst.1 a) = a

Logical form (Lean):

```lean
theorem PredSucc [HasSuccessor R] [HasPredecessor R] [SuccessorLaws R] :
    ∀ a : R, Pred (Succ a) = a
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
theorem PredSucc [HasSuccessor R] [HasPredecessor R] [SuccessorLaws R] :
    ∀ a : R, Pred (Succ a) = a :=
  sorry

/--
`SuccPred` TODO

Predicate logic:

  ∀ a : R, Succ (Pred a) = a

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : LRA.AlgebraicStructures.HasSuccessor R] [inst_1 : LRA.AlgebraicStructures.HasPredecessor R], LRA.AlgebraicStructures.SuccessorLaws R → ∀ (a : R), inst.1 (inst_1.1 a) = a

Logical form (Lean):

```lean
theorem SuccPred [HasSuccessor R] [HasPredecessor R] [SuccessorLaws R] :
    ∀ a : R, Succ (Pred a) = a
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
theorem SuccPred [HasSuccessor R] [HasPredecessor R] [SuccessorLaws R] :
    ∀ a : R, Succ (Pred a) = a :=
  sorry

/--
`SuccInjective` TODO

Predicate logic:

  ∀ a b : R, Succ a = Succ b → a = b

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : LRA.AlgebraicStructures.HasSuccessor R] [inst_1 : LRA.AlgebraicStructures.HasPredecessor R], LRA.AlgebraicStructures.SuccessorLaws R → ∀ (a b : R), inst.1 a = inst.1 b → a = b

Logical form (Lean):

```lean
theorem SuccInjective [HasSuccessor R] [HasPredecessor R]
    [SuccessorLaws R] :
    ∀ a b : R, Succ a = Succ b → a = b
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
theorem SuccInjective [HasSuccessor R] [HasPredecessor R]
    [SuccessorLaws R] :
    ∀ a b : R, Succ a = Succ b → a = b :=
  sorry

/--
`PredInjective` TODO

Predicate logic:

  ∀ a b : R, Pred a = Pred b → a = b

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : LRA.AlgebraicStructures.HasSuccessor R] [inst_1 : LRA.AlgebraicStructures.HasPredecessor R], LRA.AlgebraicStructures.SuccessorLaws R → ∀ (a b : R), inst_1.1 a = inst_1.1 b → a = b

Logical form (Lean):

```lean
theorem PredInjective [HasSuccessor R] [HasPredecessor R]
    [SuccessorLaws R] :
    ∀ a b : R, Pred a = Pred b → a = b
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
theorem PredInjective [HasSuccessor R] [HasPredecessor R]
    [SuccessorLaws R] :
    ∀ a b : R, Pred a = Pred b → a = b :=
  sorry

/--
`SuccEqAddOne` TODO

Predicate logic:

  ∀ a : R, Succ a = a + 1

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : LRA.AlgebraicStructures.HasSuccessor R] [inst_1 : Add R] [inst_2 : OfNat R (instOfNatNat 1).1], LRA.AlgebraicStructures.SuccessorAdditionLaw R → ∀ (a : R), inst.1 a = instHAdd.1 a inst_2.1

Logical form (Lean):

```lean
theorem SuccEqAddOne [HasSuccessor R] [Add R] [OfNat R 1]
    [SuccessorAdditionLaw R] :
    ∀ a : R, Succ a = a + 1
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
theorem SuccEqAddOne [HasSuccessor R] [Add R] [OfNat R 1]
    [SuccessorAdditionLaw R] :
    ∀ a : R, Succ a = a + 1 :=
  sorry

/--
`MulSucc` TODO

Predicate logic:

  ∀ a b : R, a * Succ b = a * b + a

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : LRA.AlgebraicStructures.HasSuccessor R] [inst_1 : LRA.AlgebraicStructures.HasPredecessor R] [inst_2 : Add R] [inst_3 : Mul R] [inst_4 : Neg R], LRA.AlgebraicStructures.SuccessorMultiplicationLaws R → ∀ (a b : R), instHMul.1 a (inst.1 b) = instHAdd.1 (instHMul.1 a b) a

Logical form (Lean):

```lean
theorem MulSucc [HasSuccessor R] [HasPredecessor R]
    [Add R] [Mul R] [Neg R] [SuccessorMultiplicationLaws R] :
    ∀ a b : R, a * Succ b = a * b + a
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
theorem MulSucc [HasSuccessor R] [HasPredecessor R]
    [Add R] [Mul R] [Neg R] [SuccessorMultiplicationLaws R] :
    ∀ a b : R, a * Succ b = a * b + a :=
  sorry

/--
`MulPred` TODO

Predicate logic:

  ∀ a b : R, a * Pred b = a * b + -a

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : LRA.AlgebraicStructures.HasSuccessor R] [inst_1 : LRA.AlgebraicStructures.HasPredecessor R] [inst_2 : Add R] [inst_3 : Mul R] [inst_4 : Neg R], LRA.AlgebraicStructures.SuccessorMultiplicationLaws R → ∀ (a b : R), instHMul.1 a (inst_1.1 b) = instHAdd.1 (instHMul.1 a b) (inst_4.1 a)

Logical form (Lean):

```lean
theorem MulPred [HasSuccessor R] [HasPredecessor R]
    [Add R] [Mul R] [Neg R] [SuccessorMultiplicationLaws R] :
    ∀ a b : R, a * Pred b = a * b + -a
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
theorem MulPred [HasSuccessor R] [HasPredecessor R]
    [Add R] [Mul R] [Neg R] [SuccessorMultiplicationLaws R] :
    ∀ a b : R, a * Pred b = a * b + -a :=
  sorry

/--
`SuccAperiodic` TODO

Predicate logic:

  ∀ n : Nat, 0 < n → SuccIterate n 0 ∈ R ≠ 0

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : LRA.AlgebraicStructures.HasSuccessor R] [inst_1 : LRA.AlgebraicStructures.HasPredecessor R] [inst_2 : OfNat R (instOfNatNat 0).1], LRA.AlgebraicStructures.DiscretenessLaw R → ∀ (n : Nat), (instLTNat.1 (instOfNatNat 0).1 n ∧ LRA.AlgebraicStructures.SuccIterate n inst_2.1 = inst_2.1) → False

Logical form (Lean):

```lean
theorem SuccAperiodic [HasSuccessor R] [HasPredecessor R] [OfNat R 0]
    [DiscretenessLaw R] :
    ∀ n : Nat, 0 < n → SuccIterate n (0 : R) ≠ 0
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
theorem SuccAperiodic [HasSuccessor R] [HasPredecessor R] [OfNat R 0]
    [DiscretenessLaw R] :
    ∀ n : Nat, 0 < n → SuccIterate n (0 : R) ≠ 0 :=
  sorry

/--
`TwoSidedInduction` TODO

Predicate logic:

  ∀ motive ∈ R → Prop, motive 0 → (∀ a, motive a → motive (Succ a)) → (∀ a, motive a → motive (Pred a)) → ∀ a, motive a

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : LRA.AlgebraicStructures.HasSuccessor R] [inst_1 : LRA.AlgebraicStructures.HasPredecessor R] [inst_2 : OfNat R (instOfNatNat 0).1], LRA.AlgebraicStructures.DiscretenessLaw R → ∀ (motive : R → Prop), (motive inst_2.1 ∧ (∀ (a : R), motive a → motive (inst.1 a) ∧ ∀ (a : R), motive a → motive (inst_1.1 a))) → ∀ (a : R), motive a

Logical form (Lean):

```lean
theorem TwoSidedInduction [HasSuccessor R] [HasPredecessor R]
    [OfNat R 0] [DiscretenessLaw R] :
    ∀ (motive : R → Prop),
      motive 0 →
      (∀ a, motive a → motive (Succ a)) →
      (∀ a, motive a → motive (Pred a)) →
      ∀ a, motive a
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
theorem TwoSidedInduction [HasSuccessor R] [HasPredecessor R]
    [OfNat R 0] [DiscretenessLaw R] :
    ∀ (motive : R → Prop),
      motive 0 →
      (∀ a, motive a → motive (Succ a)) →
      (∀ a, motive a → motive (Pred a)) →
      ∀ a, motive a :=
  sorry
