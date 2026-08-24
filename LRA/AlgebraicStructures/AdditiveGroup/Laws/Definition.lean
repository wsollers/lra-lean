import LRA.AlgebraicStructures.AdditiveMonoid.Laws.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/--
`AdditiveInverseLaws` TODO

Predicate logic:

  class AdditiveInverseLaws (R : Type u)
    [Add R] [Neg R] [OfNat R 0] : Prop where
  NegAddCancel :
    LRA.Operation.Laws.Inverse.LeftInverse
      (fun a b : R => a + b) 0 (fun a : R => -a)
  AddNegCancel :
    LRA.Operation.Laws.Inverse.RightInverse
      (fun a b : R => a + b) 0 (fun a : R => -a)

Predicate logic (unfolded):

  class AdditiveInverseLaws (R : Type u)
    [Add R] [Neg R] [OfNat R 0] : Prop where
  NegAddCancel :
    LRA.Operation.Laws.Inverse.LeftInverse
      (fun a b : R => a + b) 0 (fun a : R => -a)
  AddNegCancel :
    LRA.Operation.Laws.Inverse.RightInverse
      (fun a b : R => a + b) 0 (fun a : R => -a) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class AdditiveInverseLaws (R : Type u)
    [Add R] [Neg R] [OfNat R 0] : Prop where
  NegAddCancel :
    LRA.Operation.Laws.Inverse.LeftInverse
      (fun a b : R => a + b) 0 (fun a : R => -a)
  AddNegCancel :
    LRA.Operation.Laws.Inverse.RightInverse
      (fun a b : R => a + b) 0 (fun a : R => -a)
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
class AdditiveInverseLaws (R : Type u)
    [Add R] [Neg R] [OfNat R 0] : Prop where
  NegAddCancel :
    LRA.Operation.Laws.Inverse.LeftInverse
      (fun a b : R => a + b) 0 (fun a : R => -a)
  AddNegCancel :
    LRA.Operation.Laws.Inverse.RightInverse
      (fun a b : R => a + b) 0 (fun a : R => -a)

/--
`SubtractionCompatibilityLaw` TODO

Predicate logic:

  class SubtractionCompatibilityLaw (R : Type u)
    [Sub R] [Add R] [Neg R] : Prop where
  SubEqAddNeg : ∀ a b : R, a - b = a + -b

Predicate logic (unfolded):

  class SubtractionCompatibilityLaw (R : Type u)
    [Sub R] [Add R] [Neg R] : Prop where
  SubEqAddNeg : ∀ a b : R, a - b = a + -b (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class SubtractionCompatibilityLaw (R : Type u)
    [Sub R] [Add R] [Neg R] : Prop where
  SubEqAddNeg : ∀ a b : R, a - b = a + -b
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
class SubtractionCompatibilityLaw (R : Type u)
    [Sub R] [Add R] [Neg R] : Prop where
  SubEqAddNeg : ∀ a b : R, a - b = a + -b

/--
`AdditiveGroupLaws` TODO

Predicate logic:

  class abbrev AdditiveGroupLaws (R : Type u)
    [Add R] [Neg R] [OfNat R 0] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R, AdditiveInverseLaws R

Predicate logic (unfolded):

  class abbrev AdditiveGroupLaws (R : Type u)
    [Add R] [Neg R] [OfNat R 0] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R, AdditiveInverseLaws R (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class abbrev AdditiveGroupLaws (R : Type u)
    [Add R] [Neg R] [OfNat R 0] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R, AdditiveInverseLaws R
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
class abbrev AdditiveGroupLaws (R : Type u)
    [Add R] [Neg R] [OfNat R 0] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R, AdditiveInverseLaws R

section Wrappers

variable {R : Type u}

/--
`NegAddCancel` TODO

Predicate logic:

  ∀ a : R, -a + a = 0

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] [inst_1 : Neg R] [inst_2 : OfNat R (instOfNatNat 0).1], LRA.AlgebraicStructures.AdditiveInverseLaws R → ∀ (a : R), instHAdd.1 (inst_1.1 a) a = inst_2.1

Logical form (Lean):

```lean
theorem NegAddCancel [Add R] [Neg R] [OfNat R 0]
    [AdditiveInverseLaws R] :
    ∀ a : R, -a + a = 0
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
theorem NegAddCancel [Add R] [Neg R] [OfNat R 0]
    [AdditiveInverseLaws R] :
    ∀ a : R, -a + a = 0 :=
  sorry

/--
`AddNegCancel` TODO

Predicate logic:

  ∀ a : R, a + -a = 0

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] [inst_1 : Neg R] [inst_2 : OfNat R (instOfNatNat 0).1], LRA.AlgebraicStructures.AdditiveInverseLaws R → ∀ (a : R), instHAdd.1 a (inst_1.1 a) = inst_2.1

Logical form (Lean):

```lean
theorem AddNegCancel [Add R] [Neg R] [OfNat R 0]
    [AdditiveInverseLaws R] :
    ∀ a : R, a + -a = 0
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
theorem AddNegCancel [Add R] [Neg R] [OfNat R 0]
    [AdditiveInverseLaws R] :
    ∀ a : R, a + -a = 0 :=
  sorry

/--
`SubEqAddNeg` TODO

Predicate logic:

  ∀ a b : R, a - b = a + -b

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Sub R] [inst_1 : Add R] [inst_2 : Neg R], LRA.AlgebraicStructures.SubtractionCompatibilityLaw R → ∀ (a b : R), instHSub.1 a b = instHAdd.1 a (inst_2.1 b)

Logical form (Lean):

```lean
theorem SubEqAddNeg [Sub R] [Add R] [Neg R]
    [SubtractionCompatibilityLaw R] :
    ∀ a b : R, a - b = a + -b
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
theorem SubEqAddNeg [Sub R] [Add R] [Neg R]
    [SubtractionCompatibilityLaw R] :
    ∀ a b : R, a - b = a + -b :=
  sorry
