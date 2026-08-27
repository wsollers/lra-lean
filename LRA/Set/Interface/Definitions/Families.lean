import LRA.Set.Interface.Definitions.Operations

namespace LRA.Set

universe u v w

section Covers

variable {SetObject : Type v} {Collection : Type w}

def Covers [HasSubset SetObject]
    [HasCollectionUnion SetObject Collection]
    (collection : Collection) (target : SetObject) : Prop :=
  target ⊆ HasCollectionUnion.collectionUnion collection

def Subcover [HasSubset SetObject] [HasSubset Collection]
    [HasCollectionUnion SetObject Collection]
    (subcollection collection : Collection) (target : SetObject) : Prop :=
  subcollection ⊆ collection ∧ Covers subcollection target

end Covers

end LRA.Set
