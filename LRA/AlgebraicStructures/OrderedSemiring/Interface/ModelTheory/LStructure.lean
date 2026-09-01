import LRA.AlgebraicStructures.OrderedSemiring.Interface.Definitions.Signature
import LRA.AlgebraicStructures.OrderedSemiring.Interface.Definitions.ConceptSignature
import LRA.Operation
import LRA.Relation

namespace LRA.AlgebraicStructures.OrderedSemiring.Interface.ModelTheory

universe u

open LRA.AlgebraicStructures.OrderedSemiring.Interface.Signature

/--
`OrderedSemiringSignature` TODO

Predicate logic:

  structure OrderedSemiringSignature extends
    LRA.AlgebraicStructures.OrderedSemiringConceptSignature where
  StrictOrder : LRA.Relation.Endorelation carrier

Predicate logic (unfolded):

  structure OrderedSemiringSignature extends
    LRA.AlgebraicStructures.OrderedSemiringConceptSignature where
  StrictOrder : LRA.Relation.Endorelation carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure OrderedSemiringSignature extends
    LRA.AlgebraicStructures.OrderedSemiringConceptSignature where
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
structure OrderedSemiringSignature extends
    LRA.AlgebraicStructures.OrderedSemiringConceptSignature where
  StrictOrder : LRA.Relation.Endorelation carrier

/--
`BuildOrderedSemiringModel` TODO

Predicate logic:

  def BuildOrderedSemiringModel
    (signature : OrderedSemiringSignature) :
    LRA.Logic.FirstOrder.Model OrderedSemiringFirstOrderSignature where
  Domain

Predicate logic (unfolded):

  def BuildOrderedSemiringModel
    (signature : OrderedSemiringSignature) :
    LRA.Logic.FirstOrder.Model OrderedSemiringFirstOrderSignature where
  Domain (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BuildOrderedSemiringModel
    (signature : OrderedSemiringSignature) :
    LRA.Logic.FirstOrder.Model OrderedSemiringFirstOrderSignature where
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
def BuildOrderedSemiringModel
    (signature : OrderedSemiringSignature) :
    LRA.Logic.FirstOrder.Model OrderedSemiringFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.add (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation
    | .lt, args =>
        signature.StrictOrder (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

/--
`orderedSemiringFirstOrderModel` TODO

Predicate logic:

  def orderedSemiringFirstOrderModel (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] :
    LRA.Logic.FirstOrder.Model OrderedSemiringFirstOrderSignature :=
  BuildOrderedSemiringModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      multiply := (· * ·), le := (· ≤ ·),
      StrictOrder := (· < ·) }

Predicate logic (unfolded):

  def orderedSemiringFirstOrderModel (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] :
    LRA.Logic.FirstOrder.Model OrderedSemiringFirstOrderSignature :=
  BuildOrderedSemiringModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      multiply := (· * ·), le := (· ≤ ·),
      StrictOrder := (· < ·) } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def orderedSemiringFirstOrderModel (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] :
    LRA.Logic.FirstOrder.Model OrderedSemiringFirstOrderSignature :=
  BuildOrderedSemiringModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      multiply := (· * ·), le := (· ≤ ·),
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
def orderedSemiringFirstOrderModel (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] :
    LRA.Logic.FirstOrder.Model OrderedSemiringFirstOrderSignature :=
  BuildOrderedSemiringModel
    { carrier := R, zero := 0, one := 1, add := (· + ·),
      multiply := (· * ·), le := (· ≤ ·),
      StrictOrder := (· < ·) }

end LRA.AlgebraicStructures.OrderedSemiring.Interface.ModelTheory
