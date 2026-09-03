import LRA.AlgebraicStructures.OrderedRing.Interface.Definitions.Signature
import LRA.AlgebraicStructures.OrderedRing.Interface.Definitions.ConceptSignature
import LRA.Operation
import LRA.Relation

namespace LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory

universe u

open LRA.AlgebraicStructures.OrderedRing.Interface.Signature

/--
`OrderedRingSignature` TODO

Predicate logic:

  structure OrderedRingSignature extends
    LRA.AlgebraicStructures.OrderedRingConceptSignature where
  StrictOrder : LRA.Relation.Endorelation carrier

Predicate logic (unfolded):

  structure OrderedRingSignature extends
    LRA.AlgebraicStructures.OrderedRingConceptSignature where
  StrictOrder : LRA.Relation.Endorelation carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure OrderedRingSignature extends
    LRA.AlgebraicStructures.OrderedRingConceptSignature where
  StrictOrder : LRA.Relation.Endorelation carrier
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
structure OrderedRingSignature extends
    LRA.AlgebraicStructures.OrderedRingConceptSignature where
  StrictOrder : LRA.Relation.Endorelation carrier

namespace OrderedRingSignature

/--
`Subtraction` TODO

Predicate logic:

  abbrev Subtraction
    (signature : OrderedRingSignature) :
    LRA.Operation.BinaryOperation signature.carrier :=
  fun first second =>
    signature.add first (signature.neg second)

Predicate logic (unfolded):

  abbrev Subtraction
    (signature : OrderedRingSignature) :
    LRA.Operation.BinaryOperation signature.carrier :=
  fun first second =>
    signature.add first (signature.neg second) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Subtraction
    (signature : OrderedRingSignature) :
    LRA.Operation.BinaryOperation signature.carrier :=
  fun first second =>
    signature.add first (signature.neg second)
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
abbrev Subtraction
    (signature : OrderedRingSignature) :
    LRA.Operation.BinaryOperation signature.carrier :=
  fun first second =>
    signature.add first (signature.neg second)

end OrderedRingSignature

/--
`BuildOrderedRingModel` TODO

Predicate logic:

  def BuildOrderedRingModel
    (signature : OrderedRingSignature) :
    LRA.ModelTheory.FirstOrder.Model OrderedRingFirstOrderSignature where
  Domain

Predicate logic (unfolded):

  def BuildOrderedRingModel
    (signature : OrderedRingSignature) :
    LRA.ModelTheory.FirstOrder.Model OrderedRingFirstOrderSignature where
  Domain (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BuildOrderedRingModel
    (signature : OrderedRingSignature) :
    LRA.ModelTheory.FirstOrder.Model OrderedRingFirstOrderSignature where
  Domain
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
def BuildOrderedRingModel
    (signature : OrderedRingSignature) :
    LRA.ModelTheory.FirstOrder.Model OrderedRingFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.add (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .neg, args => signature.neg (args ⟨0, by decide⟩)
  interpretRelation
    | .lt, args =>
        signature.StrictOrder (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

/--
`orderedRingFirstOrderModel` TODO

Predicate logic:

  def orderedRingFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] :
    LRA.ModelTheory.FirstOrder.Model OrderedRingFirstOrderSignature :=
  BuildOrderedRingModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      neg := (- ·), multiply := (· * ·), le := (· ≤ ·),
      StrictOrder := (· < ·) }

Predicate logic (unfolded):

  def orderedRingFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] :
    LRA.ModelTheory.FirstOrder.Model OrderedRingFirstOrderSignature :=
  BuildOrderedRingModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      neg := (- ·), multiply := (· * ·), le := (· ≤ ·),
      StrictOrder := (· < ·) } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def orderedRingFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] :
    LRA.ModelTheory.FirstOrder.Model OrderedRingFirstOrderSignature :=
  BuildOrderedRingModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      neg := (- ·), multiply := (· * ·), le := (· ≤ ·),
      StrictOrder := (· < ·) }
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
def orderedRingFirstOrderModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] :
    LRA.ModelTheory.FirstOrder.Model OrderedRingFirstOrderSignature :=
  BuildOrderedRingModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      neg := (- ·), multiply := (· * ·), le := (· ≤ ·),
      StrictOrder := (· < ·) }

end LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory
