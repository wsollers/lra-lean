import LRA.Relation.Interface.Satisfy_Generic
import LRA.Relation.Interface.Laws
import LRA.Relation.Interface.Operations.Composition.Definition
import LRA.Relation.Interface.Operations.Converse.Definition
import LRA.Relation.Interface.Operations.Boolean.Definition
import LRA.Relation.Interface.Canonical.EmptyRelation.Definition
import LRA.Relation.Interface.Canonical.UniversalRelation.Definition
import LRA.Relation.Interface.Canonical.IdentityRelation.Definition
import LRA.Relation.Interface.UniversalAlgebra
import LRA.Identity.Interface.UniversalAlgebra

namespace LRA.Relation

universe u

/--
`GenericRelationAlgebraicSignature` TODO

Predicate logic:

  abbrev GenericRelationAlgebraicSignature : LRA.Identity.AlgebraicSignature where
    OperationSymbol := LRA.Relation.UniversalAlgebra.RelationOperationSymbol
    arity := LRA.Relation.UniversalAlgebra.relationOperationArity
    ConstantSymbol := LRA.Relation.UniversalAlgebra.RelationConstantSymbol

Predicate logic (unfolded):

  abbrev GenericRelationAlgebraicSignature : LRA.Identity.AlgebraicSignature where
    OperationSymbol := LRA.Relation.UniversalAlgebra.RelationOperationSymbol
    arity := LRA.Relation.UniversalAlgebra.relationOperationArity
    ConstantSymbol := LRA.Relation.UniversalAlgebra.RelationConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev GenericRelationAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := LRA.Relation.UniversalAlgebra.RelationOperationSymbol
  arity := LRA.Relation.UniversalAlgebra.relationOperationArity
  ConstantSymbol := LRA.Relation.UniversalAlgebra.RelationConstantSymbol
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
abbrev GenericRelationAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := LRA.Relation.UniversalAlgebra.RelationOperationSymbol
  arity := LRA.Relation.UniversalAlgebra.relationOperationArity
  ConstantSymbol := LRA.Relation.UniversalAlgebra.RelationConstantSymbol

/--
`genericAlgebra` TODO

Predicate logic:

  def genericAlgebra (Carrier : Type u) :
      LRA.Identity.AlgebraicStructure
        GenericRelationAlgebraicSignature where
    Carrier

Predicate logic (unfolded):

  def genericAlgebra (Carrier : Type u) :
      LRA.Identity.AlgebraicStructure
        GenericRelationAlgebraicSignature where
    Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def genericAlgebra (Carrier : Type u) :
    LRA.Identity.AlgebraicStructure
      GenericRelationAlgebraicSignature where
  Carrier
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
def genericAlgebra (Carrier : Type u) :
    LRA.Identity.AlgebraicStructure
      GenericRelationAlgebraicSignature where
  Carrier := Endorelation Carrier
  carrierNonempty := ⟨EmptyRelation Carrier⟩
  interpretOperation := fun symbol args =>
    match symbol with
    | .converse =>
        Converse (args ⟨0, by decide⟩)
    | .compose =>
        RelationComposition (args ⟨1, by decide⟩) (args ⟨0, by decide⟩)
    | .union =>
        RelationUnion (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .inter =>
        RelationIntersection (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .complement =>
        RelationComplement (args ⟨0, by decide⟩)
  interpretConstant := fun symbol =>
    match symbol with
    | .empty => EmptyRelation Carrier
    | .universal => UniversalRelation Carrier
    | .identity => IdentityRelation Carrier

end LRA.Relation
