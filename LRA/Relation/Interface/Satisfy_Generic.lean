import LRA.Relation.Interface.Definitions

namespace LRA.Relation

universe u v

/--
Backends satisfy the generic relation interface by providing an interpretation
into the canonical predicate-valued endorelation semantics.
-/
class GenericSemantics (RelationObject : Type v) (Carrier : outParam (Type u)) where
  toEndorelation : RelationObject → Endorelation Carrier

def interpret
    {RelationObject : Type v} {Carrier : Type u}
    [GenericSemantics RelationObject Carrier]
    (relation : RelationObject) : Endorelation Carrier :=
  GenericSemantics.toEndorelation relation

end LRA.Relation
