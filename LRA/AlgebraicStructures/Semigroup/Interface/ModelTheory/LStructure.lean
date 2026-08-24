import LRA.AlgebraicStructures.Semigroup.Definition
import LRA.AlgebraicStructures.Semigroup.Interface.Signature.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures.Semigroup.Interface.ModelTheory

universe u

open LRA.AlgebraicStructures.Semigroup.Interface.Signature

/--
`BuildSemigroupModel` TODO

Predicate logic:

  def BuildSemigroupModel
    (signature : LRA.AlgebraicStructures.SemigroupConceptSignature)
    (witness : signature.carrier) :
    LRA.Logic.FirstOrder.Model SemigroupFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨witness⟩
  interpretFunction
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant := fun ConstantSymbol => nomatch ConstantSymbol

Predicate logic (unfolded):

  def BuildSemigroupModel
    (signature : LRA.AlgebraicStructures.SemigroupConceptSignature)
    (witness : signature.carrier) :
    LRA.Logic.FirstOrder.Model SemigroupFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨witness⟩
  interpretFunction
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant := fun ConstantSymbol => nomatch ConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BuildSemigroupModel
    (signature : LRA.AlgebraicStructures.SemigroupConceptSignature)
    (witness : signature.carrier) :
    LRA.Logic.FirstOrder.Model SemigroupFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨witness⟩
  interpretFunction
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant := fun ConstantSymbol => nomatch ConstantSymbol
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
def BuildSemigroupModel
    (signature : LRA.AlgebraicStructures.SemigroupConceptSignature)
    (witness : signature.carrier) :
    LRA.Logic.FirstOrder.Model SemigroupFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨witness⟩
  interpretFunction
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant := fun ConstantSymbol => nomatch ConstantSymbol

/--
`semigroupFirstOrderModel` TODO

Predicate logic:

  def semigroupFirstOrderModel (R : Type u) [Inhabited R] [Mul R] :
    LRA.Logic.FirstOrder.Model SemigroupFirstOrderSignature :=
  BuildSemigroupModel { carrier := R, multiply := (· * ·) } default

Predicate logic (unfolded):

  def semigroupFirstOrderModel (R : Type u) [Inhabited R] [Mul R] :
    LRA.Logic.FirstOrder.Model SemigroupFirstOrderSignature :=
  BuildSemigroupModel { carrier := R, multiply := (· * ·) } default (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def semigroupFirstOrderModel (R : Type u) [Inhabited R] [Mul R] :
    LRA.Logic.FirstOrder.Model SemigroupFirstOrderSignature :=
  BuildSemigroupModel { carrier := R, multiply := (· * ·) } default
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
def semigroupFirstOrderModel (R : Type u) [Inhabited R] [Mul R] :
    LRA.Logic.FirstOrder.Model SemigroupFirstOrderSignature :=
  BuildSemigroupModel { carrier := R, multiply := (· * ·) } default

end LRA.AlgebraicStructures.Semigroup.Interface.ModelTheory
