import LRA.Relation.Definition

namespace LRA.Relation

universe u

                                                                            
                                        
inductive TransitiveClosure {Alpha : Type u}
    (relation : Endorelation Alpha) : Endorelation Alpha
  | base {left right : Alpha} :
      relation left right → TransitiveClosure relation left right
  | trans {left middle right : Alpha} :
      TransitiveClosure relation left middle →
      TransitiveClosure relation middle right →
      TransitiveClosure relation left right

end LRA.Relation
