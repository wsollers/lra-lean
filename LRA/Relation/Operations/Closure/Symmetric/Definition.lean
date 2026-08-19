import LRA.Relation.Operations.Boolean.Definition
import LRA.Relation.Operations.Converse.Definition

namespace LRA.Relation

universe u

/-- The symmetric closure of `relation`: add all converse pairs. -/
def SymmetricClosure {Alpha : Type u} (relation : Endorelation Alpha) :
    Endorelation Alpha :=
  RelationUnion relation (Converse relation)

end LRA.Relation
