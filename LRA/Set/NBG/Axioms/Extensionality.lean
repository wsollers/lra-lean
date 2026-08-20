import LRA.Set.NBGSet.Primitives

namespace LRA.Set.NBG

/-- Classes with the same set members are equal. -/
axiom ClassExtensionality (A B : NBGClass) :
  (forall x : NBGSet, x ∈ A <-> x ∈ B) -> A = B

/-- Sets with the same members are equal. -/
axiom Extensionality (A B : NBGSet) :
  (forall x : NBGSet, x ∈ A <-> x ∈ B) -> A = B

end LRA.Set.NBG
