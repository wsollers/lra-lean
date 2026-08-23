import LRA.Relation.Operations.Boolean.Definition
import LRA.Relation.Canonical.IdentityRelation.Definition

namespace LRA.Relation

universe u

                                                                           
def ReflexiveClosure {Alpha : Type u} (relation : Endorelation Alpha) :
    Endorelation Alpha :=
  RelationUnion relation (IdentityRelation Alpha)

end LRA.Relation
