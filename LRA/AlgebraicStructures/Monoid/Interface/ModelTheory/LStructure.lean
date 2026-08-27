import LRA.AlgebraicStructures.Monoid.Interface.Definitions.ConceptSignature
import LRA.AlgebraicStructures.Monoid.Interface.Definitions.Signature
import LRA.Operation

namespace LRA.AlgebraicStructures.Monoid.Interface.ModelTheory

universe u

open LRA.AlgebraicStructures.Monoid.Interface.Signature

/--
`BuildMonoidModel` TODO

Predicate logic:

  def BuildMonoidModel
    (signature : LRA.AlgebraicStructures.MonoidConceptSignature) :
    LRA.Logic.FirstOrder.Model MonoidFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.one⟩
  interpretFunction
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .one => signature.one

Predicate logic (unfolded):

  def BuildMonoidModel
    (signature : LRA.AlgebraicStructures.MonoidConceptSignature) :
    LRA.Logic.FirstOrder.Model MonoidFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.one⟩
  interpretFunction
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .one => signature.one (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BuildMonoidModel
    (signature : LRA.AlgebraicStructures.MonoidConceptSignature) :
    LRA.Logic.FirstOrder.Model MonoidFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.one⟩
  interpretFunction
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .one => signature.one
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
def BuildMonoidModel
    (signature : LRA.AlgebraicStructures.MonoidConceptSignature) :
    LRA.Logic.FirstOrder.Model MonoidFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.one⟩
  interpretFunction
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .one => signature.one

/--
`monoidFirstOrderModel` TODO

Predicate logic:

  def monoidFirstOrderModel (R : Type u) [Mul R] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model MonoidFirstOrderSignature :=
  BuildMonoidModel
    { carrier := R, one := 1, multiply := (· * ·) }

Predicate logic (unfolded):

  def monoidFirstOrderModel (R : Type u) [Mul R] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model MonoidFirstOrderSignature :=
  BuildMonoidModel
    { carrier := R, one := 1, multiply := (· * ·) } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def monoidFirstOrderModel (R : Type u) [Mul R] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model MonoidFirstOrderSignature :=
  BuildMonoidModel
    { carrier := R, one := 1, multiply := (· * ·) }
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
def monoidFirstOrderModel (R : Type u) [Mul R] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model MonoidFirstOrderSignature :=
  BuildMonoidModel
    { carrier := R, one := 1, multiply := (· * ·) }

end LRA.AlgebraicStructures.Monoid.Interface.ModelTheory
