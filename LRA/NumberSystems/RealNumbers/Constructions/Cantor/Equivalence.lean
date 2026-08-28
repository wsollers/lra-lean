
import LRA.NumberSystems.RealNumbers.Constructions.Cantor.Carrier

namespace LRA.NumberSystems.RealNumbers.Cantor

open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

/--
`EndpointEquivalent` TODO

Predicate logic:

  ∀ (fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (first second : LRA.NumberSystems.RealNumbers.Cantor.NestedIntervalSequence fieldModel) (tolerance : fieldModel.Carrier), fieldModel.ltInst.lt 0 tolerance → Exists fun index => (fieldModel.signature.StrictOrder (fieldModel.signature.add (first.interval index).lower (fieldModel.signature.neg (second.interval index).upper)) tolerance ∧ fieldModel.signature.StrictOrder (fieldModel.signature.add (second.interval index).lower (fieldModel.signature.neg (first.interval index).upper)) tolerance)

Predicate logic (unfolded):

  ∀ (fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (first second : LRA.NumberSystems.RealNumbers.Cantor.NestedIntervalSequence fieldModel) (tolerance : fieldModel.1), fieldModel.ltInst.1 fieldModel.zeroInst.1 tolerance → Exists fun index => (fieldModel.signature.toOrderedRingSignature.2 (fieldModel.signature.toBooleanRingOperationBundle.2 (first.interval index).1 (fieldModel.signature.toRingConceptSignature.2 (second.interval index).2)) tolerance ∧ fieldModel.signature.toOrderedRingSignature.2 (fieldModel.signature.toBooleanRingOperationBundle.2 (second.interval index).1 (fieldModel.signature.toRingConceptSignature.2 (first.interval index).2)) tolerance)

Logical form (Lean):

```lean
def EndpointEquivalent
    (fieldModel : RationalModel)
    (first second : NestedIntervalSequence fieldModel) : Prop :=
  ∀ tolerance : fieldModel.Carrier,
    0 < tolerance →
      ∃ index : Nat,
        fieldModel.signature.StrictOrder
          (fieldModel.signature.add
            (first.interval index).lower
            (fieldModel.signature.neg (second.interval index).upper))
          tolerance ∧
        fieldModel.signature.StrictOrder
          (fieldModel.signature.add
            (second.interval index).lower
            (fieldModel.signature.neg (first.interval index).upper))
          tolerance
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def EndpointEquivalent
    (fieldModel : RationalModel)
    (first second : NestedIntervalSequence fieldModel) : Prop :=
  ∀ tolerance : fieldModel.Carrier,
    0 < tolerance →
      ∃ index : Nat,
        fieldModel.signature.StrictOrder
          (fieldModel.signature.add
            (first.interval index).lower
            (fieldModel.signature.neg (second.interval index).upper))
          tolerance ∧
        fieldModel.signature.StrictOrder
          (fieldModel.signature.add
            (second.interval index).lower
            (fieldModel.signature.neg (first.interval index).upper))
          tolerance

/--
`EndpointEquivalentIsEquivalence` TODO

Predicate logic:

  (∀ fieldModel ∈ RationalModel), Equivalence (EndpointEquivalent fieldModel)

Predicate logic (unfolded):

  ∀ (fieldModel : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), Equivalence fun first second => ∀ (tolerance : fieldModel.1), fieldModel.ltInst.1 fieldModel.zeroInst.1 tolerance → Exists fun index => (fieldModel.signature.toOrderedRingSignature.2 (fieldModel.signature.toBooleanRingOperationBundle.2 (first.interval index).1 (fieldModel.signature.toRingConceptSignature.2 (second.interval index).2)) tolerance ∧ fieldModel.signature.toOrderedRingSignature.2 (fieldModel.signature.toBooleanRingOperationBundle.2 (second.interval index).1 (fieldModel.signature.toRingConceptSignature.2 (first.interval index).2)) tolerance)

Logical form (Lean):

```lean
theorem EndpointEquivalentIsEquivalence
    (fieldModel : RationalModel) :
    Equivalence (EndpointEquivalent fieldModel)
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
theorem EndpointEquivalentIsEquivalence
    (fieldModel : RationalModel) :
    Equivalence (EndpointEquivalent fieldModel) := by
  sorry

/--
`EndpointSetoid` TODO

Predicate logic:

  def EndpointSetoid (fieldModel : RationalModel) :
    Setoid (NestedIntervalSequence fieldModel) where
  r := EndpointEquivalent fieldModel
  iseqv := EndpointEquivalentIsEquivalence fieldModel

Predicate logic (unfolded):

  def EndpointSetoid (fieldModel : RationalModel) :
    Setoid (NestedIntervalSequence fieldModel) where
  r := EndpointEquivalent fieldModel
  iseqv := EndpointEquivalentIsEquivalence fieldModel (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def EndpointSetoid (fieldModel : RationalModel) :
    Setoid (NestedIntervalSequence fieldModel) where
  r := EndpointEquivalent fieldModel
  iseqv := EndpointEquivalentIsEquivalence fieldModel
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
def EndpointSetoid (fieldModel : RationalModel) :
    Setoid (NestedIntervalSequence fieldModel) where
  r := EndpointEquivalent fieldModel
  iseqv := EndpointEquivalentIsEquivalence fieldModel

/--
`Carrier` TODO

Predicate logic:

  abbrev Carrier (fieldModel : RationalModel) :=
  Quotient (EndpointSetoid fieldModel)

Predicate logic (unfolded):

  abbrev Carrier (fieldModel : RationalModel) :=
  Quotient (EndpointSetoid fieldModel) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Carrier (fieldModel : RationalModel) :=
  Quotient (EndpointSetoid fieldModel)
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
abbrev Carrier (fieldModel : RationalModel) :=
  Quotient (EndpointSetoid fieldModel)

end LRA.NumberSystems.RealNumbers.Cantor
