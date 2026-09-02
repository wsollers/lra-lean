
import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.WellDefinedness

namespace LRA.NumberSystems.RealNumbers.Dyadic

variable (dyadicData : RationalDyadicApproximationData)

/--
`Zero` TODO

Predicate logic:

  noncomputable def Zero : Expansion :=
  (BinaryRealBijection dyadicData).Inverse dyadicData.CauchyZero

Predicate logic (unfolded):

  noncomputable def Zero : Expansion :=
  (BinaryRealBijection dyadicData).Inverse dyadicData.CauchyZero (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def Zero : Expansion :=
  (BinaryRealBijection dyadicData).Inverse dyadicData.CauchyZero
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
noncomputable def Zero : Expansion :=
  (BinaryRealBijection dyadicData).Inverse dyadicData.CauchyZero

/--
`One` TODO

Predicate logic:

  noncomputable def One : Expansion :=
  (BinaryRealBijection dyadicData).Inverse dyadicData.CauchyOne

Predicate logic (unfolded):

  noncomputable def One : Expansion :=
  (BinaryRealBijection dyadicData).Inverse dyadicData.CauchyOne (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def One : Expansion :=
  (BinaryRealBijection dyadicData).Inverse dyadicData.CauchyOne
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
noncomputable def One : Expansion :=
  (BinaryRealBijection dyadicData).Inverse dyadicData.CauchyOne

/--
`Addition` TODO

Predicate logic:

  noncomputable def Addition (first second : Expansion) : Expansion :=
  (BinaryRealBijection dyadicData).Inverse
    (dyadicData.CauchyAddition
      ((BinaryRealBijection dyadicData).Forward first)
      ((BinaryRealBijection dyadicData).Forward second))

Predicate logic (unfolded):

  noncomputable def Addition (first second : Expansion) : Expansion :=
  (BinaryRealBijection dyadicData).Inverse
    (dyadicData.CauchyAddition
      ((BinaryRealBijection dyadicData).Forward first)
      ((BinaryRealBijection dyadicData).Forward second)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def Addition (first second : Expansion) : Expansion :=
  (BinaryRealBijection dyadicData).Inverse
    (dyadicData.CauchyAddition
      ((BinaryRealBijection dyadicData).Forward first)
      ((BinaryRealBijection dyadicData).Forward second))
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
noncomputable def Addition (first second : Expansion) : Expansion :=
  (BinaryRealBijection dyadicData).Inverse
    (dyadicData.CauchyAddition
      ((BinaryRealBijection dyadicData).Forward first)
      ((BinaryRealBijection dyadicData).Forward second))

/--
`Negation` TODO

Predicate logic:

  noncomputable def Negation (expansion : Expansion) : Expansion :=
  (BinaryRealBijection dyadicData).Inverse
    (dyadicData.CauchyNegation
      ((BinaryRealBijection dyadicData).Forward expansion))

Predicate logic (unfolded):

  noncomputable def Negation (expansion : Expansion) : Expansion :=
  (BinaryRealBijection dyadicData).Inverse
    (dyadicData.CauchyNegation
      ((BinaryRealBijection dyadicData).Forward expansion)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def Negation (expansion : Expansion) : Expansion :=
  (BinaryRealBijection dyadicData).Inverse
    (dyadicData.CauchyNegation
      ((BinaryRealBijection dyadicData).Forward expansion))
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
noncomputable def Negation (expansion : Expansion) : Expansion :=
  (BinaryRealBijection dyadicData).Inverse
    (dyadicData.CauchyNegation
      ((BinaryRealBijection dyadicData).Forward expansion))

/--
`Multiplication` TODO

Predicate logic:

  noncomputable def Multiplication (first second : Expansion) : Expansion :=
  (BinaryRealBijection dyadicData).Inverse
    (dyadicData.CauchyMultiplication
      ((BinaryRealBijection dyadicData).Forward first)
      ((BinaryRealBijection dyadicData).Forward second))

Predicate logic (unfolded):

  noncomputable def Multiplication (first second : Expansion) : Expansion :=
  (BinaryRealBijection dyadicData).Inverse
    (dyadicData.CauchyMultiplication
      ((BinaryRealBijection dyadicData).Forward first)
      ((BinaryRealBijection dyadicData).Forward second)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def Multiplication (first second : Expansion) : Expansion :=
  (BinaryRealBijection dyadicData).Inverse
    (dyadicData.CauchyMultiplication
      ((BinaryRealBijection dyadicData).Forward first)
      ((BinaryRealBijection dyadicData).Forward second))
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
noncomputable def Multiplication (first second : Expansion) : Expansion :=
  (BinaryRealBijection dyadicData).Inverse
    (dyadicData.CauchyMultiplication
      ((BinaryRealBijection dyadicData).Forward first)
      ((BinaryRealBijection dyadicData).Forward second))

/--
`Inverse` TODO

Predicate logic:

  noncomputable def Inverse (expansion : Expansion) : Expansion :=
  (BinaryRealBijection dyadicData).Inverse
    (dyadicData.CauchyInverse
      ((BinaryRealBijection dyadicData).Forward expansion))

Predicate logic (unfolded):

  noncomputable def Inverse (expansion : Expansion) : Expansion :=
  (BinaryRealBijection dyadicData).Inverse
    (dyadicData.CauchyInverse
      ((BinaryRealBijection dyadicData).Forward expansion)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def Inverse (expansion : Expansion) : Expansion :=
  (BinaryRealBijection dyadicData).Inverse
    (dyadicData.CauchyInverse
      ((BinaryRealBijection dyadicData).Forward expansion))
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
noncomputable def Inverse (expansion : Expansion) : Expansion :=
  (BinaryRealBijection dyadicData).Inverse
    (dyadicData.CauchyInverse
      ((BinaryRealBijection dyadicData).Forward expansion))

/--
`StrictOrder` TODO

Predicate logic:

  ∀ (dyadicData : LRA.NumberSystems.RealNumbers.Dyadic.RationalDyadicApproximationData) (first second : LRA.NumberSystems.RealNumbers.Dyadic.Expansion), dyadicData.CauchyRealExtension.RealModel.ltInst.1 (dyadicData.FromCauchyCarrier ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward first)) (dyadicData.FromCauchyCarrier ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward second))

Predicate logic (unfolded):

  ∀ (dyadicData : LRA.NumberSystems.RealNumbers.Dyadic.RationalDyadicApproximationData) (first second : LRA.NumberSystems.RealNumbers.Dyadic.Expansion), dyadicData.CauchyRealExtension.RealModel.ltInst.1 (.rec = (LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).1 first ⋯) (.rec = (LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).1 second ⋯)

Logical form (Lean):

```lean
def StrictOrder (first second : Expansion) : Prop :=
  dyadicData.CauchyStrictOrder
    ((BinaryRealBijection dyadicData).Forward first)
    ((BinaryRealBijection dyadicData).Forward second)
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
def StrictOrder (first second : Expansion) : Prop :=
  dyadicData.CauchyStrictOrder
    ((BinaryRealBijection dyadicData).Forward first)
    ((BinaryRealBijection dyadicData).Forward second)

/--
`OrderedFieldIsomorphism` TODO

Predicate logic:

  ∀ (dyadicData : LRA.NumberSystems.RealNumbers.Dyadic.RationalDyadicApproximationData), ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward (LRA.NumberSystems.RealNumbers.Dyadic.Zero dyadicData) = dyadicData.CauchyZero ∧ ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward (LRA.NumberSystems.RealNumbers.Dyadic.One dyadicData) = dyadicData.CauchyOne ∧ (∀ (first second : LRA.NumberSystems.RealNumbers.Dyadic.Expansion), (LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward (LRA.NumberSystems.RealNumbers.Dyadic.Addition dyadicData first second) = dyadicData.CauchyAddition ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward first) ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward second) ∧ (∀ (expansion : LRA.NumberSystems.RealNumbers.Dyadic.Expansion), (LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward (LRA.NumberSystems.RealNumbers.Dyadic.Negation dyadicData expansion) = dyadicData.CauchyNegation ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward expansion) ∧ (∀ (first second : LRA.NumberSystems.RealNumbers.Dyadic.Expansion), (LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward (LRA.NumberSystems.RealNumbers.Dyadic.Multiplication dyadicData first second) = dyadicData.CauchyMultiplication ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward first) ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward second) ∧ (∀ (expansion : LRA.NumberSystems.RealNumbers.Dyadic.Expansion), (LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward (LRA.NumberSystems.RealNumbers.Dyadic.Inverse dyadicData expansion) = dyadicData.CauchyInverse ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward expansion) ∧ ∀ (first second : LRA.NumberSystems.RealNumbers.Dyadic.Expansion), LRA.NumberSystems.RealNumbers.Dyadic.StrictOrder dyadicData first second ↔ dyadicData.CauchyStrictOrder ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward first) ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward second)))))))

Predicate logic (unfolded):

  ∀ (dyadicData : LRA.NumberSystems.RealNumbers.Dyadic.RationalDyadicApproximationData), ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).1 ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).2 (.rec = 0⋯)) = .rec = dyadicData.CauchyRealExtension.RealModel.zeroInst.1⋯ ∧ ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).1 ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).2 (.rec = 1⋯)) = .rec = dyadicData.CauchyRealExtension.RealModel.oneInst.1⋯ ∧ (∀ (first second : LRA.NumberSystems.RealNumbers.Dyadic.Expansion), (LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).1 ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).2 (.rec = instHAdd.hAdd (dyadicData.FromCauchyCarrier ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward first)) (dyadicData.FromCauchyCarrier ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward second)) ⋯)) = .rec = instHAdd.1 (.rec = (LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward first ⋯) (.rec = (LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward second ⋯) ⋯ ∧ (∀ (expansion : LRA.NumberSystems.RealNumbers.Dyadic.Expansion), (LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).1 ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).2 (.rec = dyadicData.CauchyRealExtension.RealModel.negInst.neg (dyadicData.FromCauchyCarrier ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward expansion)) ⋯)) = .rec = dyadicData.CauchyRealExtension.RealModel.negInst.1 (.rec = (LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward expansion ⋯) ⋯ ∧ (∀ (first second : LRA.NumberSystems.RealNumbers.Dyadic.Expansion), (LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).1 ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).2 (.rec = instHMul.hMul (dyadicData.FromCauchyCarrier ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward first)) (dyadicData.FromCauchyCarrier ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward second)) ⋯)) = .rec = instHMul.1 (.rec = (LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward first ⋯) (.rec = (LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward second ⋯) ⋯ ∧ (∀ (expansion : LRA.NumberSystems.RealNumbers.Dyadic.Expansion), (LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).1 ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).2 (.rec = dyadicData.CauchyRealExtension.RealModel.invInst.inv (dyadicData.FromCauchyCarrier ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward expansion)) ⋯)) = .rec = dyadicData.CauchyRealExtension.RealModel.invInst.1 (.rec = (LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward expansion ⋯) ⋯ ∧ ∀ (first second : LRA.NumberSystems.RealNumbers.Dyadic.Expansion), dyadicData.CauchyRealExtension.RealModel.ltInst.1 (.rec = (LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).1 first ⋯) (.rec = (LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).1 second ⋯) ↔ dyadicData.CauchyRealExtension.RealModel.ltInst.1 (.rec = (LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).1 first ⋯) (.rec = (LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).1 second ⋯)))))))

Logical form (Lean):

```lean
def OrderedFieldIsomorphism : Prop :=
  (BinaryRealBijection dyadicData).Forward (Zero dyadicData) =
      dyadicData.CauchyZero ∧
  (BinaryRealBijection dyadicData).Forward (One dyadicData) =
      dyadicData.CauchyOne ∧
  (∀ first second : Expansion,
    (BinaryRealBijection dyadicData).Forward
        (Addition dyadicData first second) =
      dyadicData.CauchyAddition
        ((BinaryRealBijection dyadicData).Forward first)
        ((BinaryRealBijection dyadicData).Forward second)) ∧
  (∀ expansion : Expansion,
    (BinaryRealBijection dyadicData).Forward
        (Negation dyadicData expansion) =
      dyadicData.CauchyNegation
        ((BinaryRealBijection dyadicData).Forward expansion)) ∧
  (∀ first second : Expansion,
    (BinaryRealBijection dyadicData).Forward
        (Multiplication dyadicData first second) =
      dyadicData.CauchyMultiplication
        ((BinaryRealBijection dyadicData).Forward first)
        ((BinaryRealBijection dyadicData).Forward second)) ∧
  (∀ expansion : Expansion,
    (BinaryRealBijection dyadicData).Forward
        (Inverse dyadicData expansion) =
      dyadicData.CauchyInverse
        ((BinaryRealBijection dyadicData).Forward expansion)) ∧
  (∀ first second : Expansion,
    StrictOrder dyadicData first second ↔
      dyadicData.CauchyStrictOrder
        ((BinaryRealBijection dyadicData).Forward first)
        ((BinaryRealBijection dyadicData).Forward second))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, unfold

-/
def OrderedFieldIsomorphism : Prop :=
  (BinaryRealBijection dyadicData).Forward (Zero dyadicData) =
      dyadicData.CauchyZero ∧
  (BinaryRealBijection dyadicData).Forward (One dyadicData) =
      dyadicData.CauchyOne ∧
  (∀ first second : Expansion,
    (BinaryRealBijection dyadicData).Forward
        (Addition dyadicData first second) =
      dyadicData.CauchyAddition
        ((BinaryRealBijection dyadicData).Forward first)
        ((BinaryRealBijection dyadicData).Forward second)) ∧
  (∀ expansion : Expansion,
    (BinaryRealBijection dyadicData).Forward
        (Negation dyadicData expansion) =
      dyadicData.CauchyNegation
        ((BinaryRealBijection dyadicData).Forward expansion)) ∧
  (∀ first second : Expansion,
    (BinaryRealBijection dyadicData).Forward
        (Multiplication dyadicData first second) =
      dyadicData.CauchyMultiplication
        ((BinaryRealBijection dyadicData).Forward first)
        ((BinaryRealBijection dyadicData).Forward second)) ∧
  (∀ expansion : Expansion,
    (BinaryRealBijection dyadicData).Forward
        (Inverse dyadicData expansion) =
      dyadicData.CauchyInverse
        ((BinaryRealBijection dyadicData).Forward expansion)) ∧
  (∀ first second : Expansion,
    StrictOrder dyadicData first second ↔
      dyadicData.CauchyStrictOrder
        ((BinaryRealBijection dyadicData).Forward first)
        ((BinaryRealBijection dyadicData).Forward second))

/--
`OrderedFieldIsomorphismHolds` TODO

Predicate logic:

  OrderedFieldIsomorphism dyadicData

Predicate logic (unfolded):

  ∀ (dyadicData : LRA.NumberSystems.RealNumbers.Dyadic.RationalDyadicApproximationData), ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).1 ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).2 (cast ⋯ 0)) = .rec = dyadicData.CauchyRealExtension.RealModel.zeroInst.1⋯ ∧ ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).1 ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).2 (cast ⋯ 1)) = .rec = dyadicData.CauchyRealExtension.RealModel.oneInst.1⋯ ∧ (∀ (first second : LRA.NumberSystems.RealNumbers.Dyadic.Expansion), (LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).1 ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).2 (cast ⋯ (instHAdd.hAdd (dyadicData.FromCauchyCarrier ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward first)) (dyadicData.FromCauchyCarrier ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward second))))) = .rec = instHAdd.1 (cast ⋯ ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward first)) (cast ⋯ ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward second)) ⋯ ∧ (∀ (expansion : LRA.NumberSystems.RealNumbers.Dyadic.Expansion), (LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).1 ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).2 (cast ⋯ (dyadicData.CauchyRealExtension.RealModel.negInst.neg (dyadicData.FromCauchyCarrier ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward expansion))))) = .rec = dyadicData.CauchyRealExtension.RealModel.negInst.1 (cast ⋯ ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward expansion)) ⋯ ∧ (∀ (first second : LRA.NumberSystems.RealNumbers.Dyadic.Expansion), (LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).1 ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).2 (cast ⋯ (instHMul.hMul (dyadicData.FromCauchyCarrier ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward first)) (dyadicData.FromCauchyCarrier ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward second))))) = .rec = instHMul.1 (cast ⋯ ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward first)) (cast ⋯ ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward second)) ⋯ ∧ (∀ (expansion : LRA.NumberSystems.RealNumbers.Dyadic.Expansion), (LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).1 ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).2 (cast ⋯ (dyadicData.CauchyRealExtension.RealModel.invInst.inv (dyadicData.FromCauchyCarrier ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward expansion))))) = .rec = dyadicData.CauchyRealExtension.RealModel.invInst.1 (cast ⋯ ((LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward expansion)) ⋯ ∧ ∀ (first second : LRA.NumberSystems.RealNumbers.Dyadic.Expansion), dyadicData.CauchyRealExtension.RealModel.ltInst.1 (.rec = (LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward first ⋯) (.rec = (LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).Forward second ⋯) ↔ dyadicData.CauchyRealExtension.RealModel.ltInst.1 (.rec = (LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).1 first ⋯) (.rec = (LRA.NumberSystems.RealNumbers.Dyadic.BinaryRealBijection dyadicData).1 second ⋯)))))))

Logical form (Lean):

```lean
theorem OrderedFieldIsomorphismHolds :
    OrderedFieldIsomorphism dyadicData
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
theorem OrderedFieldIsomorphismHolds :
    OrderedFieldIsomorphism dyadicData := by
  sorry
end LRA.NumberSystems.RealNumbers.Dyadic
