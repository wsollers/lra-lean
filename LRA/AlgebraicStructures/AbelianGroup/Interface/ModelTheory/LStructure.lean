import LRA.AlgebraicStructures.AbelianGroup.Interface.Definitions.ConceptSignature
import LRA.AlgebraicStructures.AbelianGroup.Interface.Definitions.Signature
import LRA.Operation

namespace LRA.AlgebraicStructures.AbelianGroup.Interface.ModelTheory

universe u

open LRA.AlgebraicStructures.AbelianGroup.Interface.Signature

/--
`BuildAbelianGroupModel` TODO

Predicate logic:

  def BuildAbelianGroupModel
    (signature : LRA.AlgebraicStructures.AbelianGroupConceptSignature) :
    LRA.Logic.FirstOrder.Model AbelianGroupFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.add (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .neg, args => signature.neg (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .zero => signature.zero

Predicate logic (unfolded):

  def BuildAbelianGroupModel
    (signature : LRA.AlgebraicStructures.AbelianGroupConceptSignature) :
    LRA.Logic.FirstOrder.Model AbelianGroupFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.add (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .neg, args => signature.neg (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .zero => signature.zero (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BuildAbelianGroupModel
    (signature : LRA.AlgebraicStructures.AbelianGroupConceptSignature) :
    LRA.Logic.FirstOrder.Model AbelianGroupFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.add (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .neg, args => signature.neg (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .zero => signature.zero
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
def BuildAbelianGroupModel
    (signature : LRA.AlgebraicStructures.AbelianGroupConceptSignature) :
    LRA.Logic.FirstOrder.Model AbelianGroupFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .add, args =>
        signature.add (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .neg, args => signature.neg (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .zero => signature.zero

/--
`abelianGroupFirstOrderModel` TODO

Predicate logic:

  def abelianGroupFirstOrderModel (R : Type u) [Add R] [Neg R] [OfNat R 0] :
    LRA.Logic.FirstOrder.Model AbelianGroupFirstOrderSignature :=
  BuildAbelianGroupModel
    { carrier := R, zero := 0, add := (· + ·), neg := (- ·) }

Predicate logic (unfolded):

  def abelianGroupFirstOrderModel (R : Type u) [Add R] [Neg R] [OfNat R 0] :
    LRA.Logic.FirstOrder.Model AbelianGroupFirstOrderSignature :=
  BuildAbelianGroupModel
    { carrier := R, zero := 0, add := (· + ·), neg := (- ·) } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def abelianGroupFirstOrderModel (R : Type u) [Add R] [Neg R] [OfNat R 0] :
    LRA.Logic.FirstOrder.Model AbelianGroupFirstOrderSignature :=
  BuildAbelianGroupModel
    { carrier := R, zero := 0, add := (· + ·), neg := (- ·) }
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
def abelianGroupFirstOrderModel (R : Type u) [Add R] [Neg R] [OfNat R 0] :
    LRA.Logic.FirstOrder.Model AbelianGroupFirstOrderSignature :=
  BuildAbelianGroupModel
    { carrier := R, zero := 0, add := (· + ·), neg := (- ·) }

end LRA.AlgebraicStructures.AbelianGroup.Interface.ModelTheory
