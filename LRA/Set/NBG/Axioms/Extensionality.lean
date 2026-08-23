import LRA.Set.NBGSet.Primitives

namespace LRA.Set.NBG

                                                   
axiom ClassExtensionality (A B : NBGClass) :
  (forall x : NBGSet, x ∈ A <-> x ∈ B) -> A = B

                                            
axiom Extensionality (A B : NBGSet) :
  (forall x : NBGSet, x ∈ A <-> x ∈ B) -> A = B

end LRA.Set.NBG
