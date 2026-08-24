import LRA.AlgebraicStructures.OrderedGroup.Interface.Signature.Definition
import LRA.AlgebraicStructures.Group.Definition
import LRA.Operation
import LRA.Relation

namespace LRA.AlgebraicStructures.OrderedGroup.Interface.ModelTheory

universe u

open LRA.AlgebraicStructures.OrderedGroup.Interface.Signature

/--
`OrderedGroupSignature` TODO

Predicate logic:

  structure OrderedGroupSignature extends LRA.AlgebraicStructures.GroupConceptSignature where
  StrictOrder : LRA.Relation.Endorelation carrier
  NonstrictOrder : LRA.Relation.Endorelation carrier

Predicate logic (unfolded):

  structure OrderedGroupSignature extends LRA.AlgebraicStructures.GroupConceptSignature where
  StrictOrder : LRA.Relation.Endorelation carrier
  NonstrictOrder : LRA.Relation.Endorelation carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure OrderedGroupSignature extends LRA.AlgebraicStructures.GroupConceptSignature where
  StrictOrder : LRA.Relation.Endorelation carrier
  NonstrictOrder : LRA.Relation.Endorelation carrier
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
structure OrderedGroupSignature extends LRA.AlgebraicStructures.GroupConceptSignature where
  StrictOrder : LRA.Relation.Endorelation carrier
  NonstrictOrder : LRA.Relation.Endorelation carrier

/--
`BuildOrderedGroupModel` TODO

Predicate logic:

  def BuildOrderedGroupModel
    (signature : OrderedGroupSignature) :
    LRA.Logic.FirstOrder.Model OrderedGroupFirstOrderSignature where
  Domain

Predicate logic (unfolded):

  def BuildOrderedGroupModel
    (signature : OrderedGroupSignature) :
    LRA.Logic.FirstOrder.Model OrderedGroupFirstOrderSignature where
  Domain (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BuildOrderedGroupModel
    (signature : OrderedGroupSignature) :
    LRA.Logic.FirstOrder.Model OrderedGroupFirstOrderSignature where
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
def BuildOrderedGroupModel
    (signature : OrderedGroupSignature) :
    LRA.Logic.FirstOrder.Model OrderedGroupFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.one⟩
  interpretFunction
    | .mul, args =>
        signature.multiply (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .inv, args => signature.inverse (args ⟨0, by decide⟩)
  interpretRelation
    | .lt, args =>
        signature.StrictOrder (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretConstant
    | .one => signature.one

/--
`orderedGroupFirstOrderModel` TODO

Predicate logic:

  def orderedGroupFirstOrderModel (R : Type u) [Mul R] [Inv R] [OfNat R 1] [LT R] [LE R] :
    LRA.Logic.FirstOrder.Model OrderedGroupFirstOrderSignature :=
  BuildOrderedGroupModel
    { carrier := R, one := 1, multiply := (· * ·), inverse := (·⁻¹),
      StrictOrder := (· < ·), NonstrictOrder := (· ≤ ·) }

Predicate logic (unfolded):

  def orderedGroupFirstOrderModel (R : Type u) [Mul R] [Inv R] [OfNat R 1] [LT R] [LE R] :
    LRA.Logic.FirstOrder.Model OrderedGroupFirstOrderSignature :=
  BuildOrderedGroupModel
    { carrier := R, one := 1, multiply := (· * ·), inverse := (·⁻¹),
      StrictOrder := (· < ·), NonstrictOrder := (· ≤ ·) } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def orderedGroupFirstOrderModel (R : Type u) [Mul R] [Inv R] [OfNat R 1] [LT R] [LE R] :
    LRA.Logic.FirstOrder.Model OrderedGroupFirstOrderSignature :=
  BuildOrderedGroupModel
    { carrier := R, one := 1, multiply := (· * ·), inverse := (·⁻¹),
      StrictOrder := (· < ·), NonstrictOrder := (· ≤ ·) }
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
def orderedGroupFirstOrderModel (R : Type u) [Mul R] [Inv R] [OfNat R 1] [LT R] [LE R] :
    LRA.Logic.FirstOrder.Model OrderedGroupFirstOrderSignature :=
  BuildOrderedGroupModel
    { carrier := R, one := 1, multiply := (· * ·), inverse := (·⁻¹),
      StrictOrder := (· < ·), NonstrictOrder := (· ≤ ·) }

end LRA.AlgebraicStructures.OrderedGroup.Interface.ModelTheory
