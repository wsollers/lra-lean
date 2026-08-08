import LRA.VolumeI.Set.Implementations

namespace LRA.Tests.VolumeI.Set.CollectionAlgebraAdapters

open LRA.VolumeI.Set.Algebra.Collection

namespace MathlibSmoke

example (Alpha : Type) :
    CollectionBooleanOperations
      (LRA.VolumeI.Set.Implementations.MathlibSet.collectionSetOperations Alpha) :=
  LRA.VolumeI.Set.Implementations.MathlibSet.CollectionAlgebraAdapter.booleanOperations Alpha

example (Alpha : Type) :
    CollectionCountableOperations
      (LRA.VolumeI.Set.Implementations.MathlibSet.collectionSetOperations Alpha) :=
  LRA.VolumeI.Set.Implementations.MathlibSet.CollectionAlgebraAdapter.countableOperations Alpha

example (Alpha : Type) :
    FiniteCollectionPredicate
      (LRA.VolumeI.Set.Implementations.MathlibSet.collectionSetOperations Alpha) :=
  LRA.VolumeI.Set.Implementations.MathlibSet.CollectionAlgebraAdapter.finiteCollectionPredicate Alpha

example (Alpha : Type) :
    NonemptySetPredicate
      (LRA.VolumeI.Set.Implementations.MathlibSet.collectionSetOperations Alpha) :=
  LRA.VolumeI.Set.Implementations.MathlibSet.CollectionAlgebraAdapter.nonemptySetPredicate Alpha

example (Alpha : Type) :
    CollectionCountableOperationLaws
      (LRA.VolumeI.Set.Implementations.MathlibSet.collectionSetOperations Alpha)
      (LRA.VolumeI.Set.Implementations.MathlibSet.CollectionAlgebraAdapter.booleanOperations Alpha)
      (LRA.VolumeI.Set.Implementations.MathlibSet.CollectionAlgebraAdapter.countableOperations Alpha) :=
  LRA.VolumeI.Set.Implementations.MathlibSet.CollectionAlgebraAdapter.countableOperationLaws Alpha

example (Alpha : Type) :
    FiniteCollectionLaws
      (LRA.VolumeI.Set.Implementations.MathlibSet.collectionSetOperations Alpha)
      (LRA.VolumeI.Set.Implementations.MathlibSet.CollectionAlgebraAdapter.finiteCollectionPredicate Alpha) :=
  LRA.VolumeI.Set.Implementations.MathlibSet.CollectionAlgebraAdapter.finiteCollectionLaws Alpha

example (Alpha : Type) :
    NonemptySetLaws
      (LRA.VolumeI.Set.Implementations.MathlibSet.collectionSetOperations Alpha)
      (LRA.VolumeI.Set.Implementations.MathlibSet.CollectionAlgebraAdapter.nonemptySetPredicate Alpha) :=
  LRA.VolumeI.Set.Implementations.MathlibSet.CollectionAlgebraAdapter.nonemptySetLaws Alpha

example (Alpha : Type) :
    RelativeComplementCollectionLaws
      (LRA.VolumeI.Set.Implementations.MathlibSet.collectionSetOperations Alpha) :=
  LRA.VolumeI.Set.Implementations.MathlibSet.CollectionAlgebraAdapter.relativeComplementCollectionLaws Alpha

end MathlibSmoke

namespace LRASetSmoke

example (Alpha : LRA.VolumeI.Set.Implementations.LRASet.LRACarrier) :
    CollectionBooleanOperations
      (LRA.VolumeI.Set.Implementations.LRASet.collectionSetOperations Alpha) :=
  LRA.VolumeI.Set.Implementations.LRASet.CollectionAlgebraAdapter.booleanOperations Alpha

example (Alpha : LRA.VolumeI.Set.Implementations.LRASet.LRACarrier) :
    CollectionCountableOperations
      (LRA.VolumeI.Set.Implementations.LRASet.collectionSetOperations Alpha) :=
  LRA.VolumeI.Set.Implementations.LRASet.CollectionAlgebraAdapter.countableOperations Alpha

example (Alpha : LRA.VolumeI.Set.Implementations.LRASet.LRACarrier) :
    FiniteCollectionPredicate
      (LRA.VolumeI.Set.Implementations.LRASet.collectionSetOperations Alpha) :=
  LRA.VolumeI.Set.Implementations.LRASet.CollectionAlgebraAdapter.finiteCollectionPredicate Alpha

example (Alpha : LRA.VolumeI.Set.Implementations.LRASet.LRACarrier) :
    NonemptySetPredicate
      (LRA.VolumeI.Set.Implementations.LRASet.collectionSetOperations Alpha) :=
  LRA.VolumeI.Set.Implementations.LRASet.CollectionAlgebraAdapter.nonemptySetPredicate Alpha

example (Alpha : LRA.VolumeI.Set.Implementations.LRASet.LRACarrier) :
    CollectionCountableOperationLaws
      (LRA.VolumeI.Set.Implementations.LRASet.collectionSetOperations Alpha)
      (LRA.VolumeI.Set.Implementations.LRASet.CollectionAlgebraAdapter.booleanOperations Alpha)
      (LRA.VolumeI.Set.Implementations.LRASet.CollectionAlgebraAdapter.countableOperations Alpha) :=
  LRA.VolumeI.Set.Implementations.LRASet.CollectionAlgebraAdapter.countableOperationLaws Alpha

example (Alpha : LRA.VolumeI.Set.Implementations.LRASet.LRACarrier) :
    FiniteCollectionLaws
      (LRA.VolumeI.Set.Implementations.LRASet.collectionSetOperations Alpha)
      (LRA.VolumeI.Set.Implementations.LRASet.CollectionAlgebraAdapter.finiteCollectionPredicate Alpha) :=
  LRA.VolumeI.Set.Implementations.LRASet.CollectionAlgebraAdapter.finiteCollectionLaws Alpha

example (Alpha : LRA.VolumeI.Set.Implementations.LRASet.LRACarrier) :
    NonemptySetLaws
      (LRA.VolumeI.Set.Implementations.LRASet.collectionSetOperations Alpha)
      (LRA.VolumeI.Set.Implementations.LRASet.CollectionAlgebraAdapter.nonemptySetPredicate Alpha) :=
  LRA.VolumeI.Set.Implementations.LRASet.CollectionAlgebraAdapter.nonemptySetLaws Alpha

example (Alpha : LRA.VolumeI.Set.Implementations.LRASet.LRACarrier) :
    RelativeComplementCollectionLaws
      (LRA.VolumeI.Set.Implementations.LRASet.collectionSetOperations Alpha) :=
  LRA.VolumeI.Set.Implementations.LRASet.CollectionAlgebraAdapter.relativeComplementCollectionLaws Alpha

end LRASetSmoke

namespace TTSmoke

example (Alpha : LRA.VolumeI.Set.TTCarrier) :
    CollectionBooleanOperations
      (LRA.VolumeI.Set.TTSet.collectionSetOperations Alpha) :=
  LRA.VolumeI.Set.TTSet.CollectionAlgebraAdapter.booleanOperations Alpha

example (Alpha : LRA.VolumeI.Set.TTCarrier) :
    CollectionCountableOperations
      (LRA.VolumeI.Set.TTSet.collectionSetOperations Alpha) :=
  LRA.VolumeI.Set.TTSet.CollectionAlgebraAdapter.countableOperations Alpha

example (Alpha : LRA.VolumeI.Set.TTCarrier) :
    FiniteCollectionPredicate
      (LRA.VolumeI.Set.TTSet.collectionSetOperations Alpha) :=
  LRA.VolumeI.Set.TTSet.CollectionAlgebraAdapter.finiteCollectionPredicate Alpha

example (Alpha : LRA.VolumeI.Set.TTCarrier) :
    NonemptySetPredicate
      (LRA.VolumeI.Set.TTSet.collectionSetOperations Alpha) :=
  LRA.VolumeI.Set.TTSet.CollectionAlgebraAdapter.nonemptySetPredicate Alpha

example (Alpha : LRA.VolumeI.Set.TTCarrier) :
    CollectionCountableOperationLaws
      (LRA.VolumeI.Set.TTSet.collectionSetOperations Alpha)
      (LRA.VolumeI.Set.TTSet.CollectionAlgebraAdapter.booleanOperations Alpha)
      (LRA.VolumeI.Set.TTSet.CollectionAlgebraAdapter.countableOperations Alpha) :=
  LRA.VolumeI.Set.TTSet.CollectionAlgebraAdapter.countableOperationLaws Alpha

example (Alpha : LRA.VolumeI.Set.TTCarrier) :
    FiniteCollectionLaws
      (LRA.VolumeI.Set.TTSet.collectionSetOperations Alpha)
      (LRA.VolumeI.Set.TTSet.CollectionAlgebraAdapter.finiteCollectionPredicate Alpha) :=
  LRA.VolumeI.Set.TTSet.CollectionAlgebraAdapter.finiteCollectionLaws Alpha

example (Alpha : LRA.VolumeI.Set.TTCarrier) :
    NonemptySetLaws
      (LRA.VolumeI.Set.TTSet.collectionSetOperations Alpha)
      (LRA.VolumeI.Set.TTSet.CollectionAlgebraAdapter.nonemptySetPredicate Alpha) :=
  LRA.VolumeI.Set.TTSet.CollectionAlgebraAdapter.nonemptySetLaws Alpha

example (Alpha : LRA.VolumeI.Set.TTCarrier) :
    RelativeComplementCollectionLaws
      (LRA.VolumeI.Set.TTSet.collectionSetOperations Alpha) :=
  LRA.VolumeI.Set.TTSet.CollectionAlgebraAdapter.relativeComplementCollectionLaws Alpha

end TTSmoke

namespace ZFCSmoke

example (native : LRA.VolumeI.Set.Implementations.ZFC.NativeSetOperations) :
    NonemptySetPredicate
      (LRA.VolumeI.Set.Implementations.ZFC.collectionSetOperations native) :=
  LRA.VolumeI.Set.Implementations.ZFC.CollectionAlgebraAdapter.nonemptySetPredicate native

example (native : LRA.VolumeI.Set.Implementations.ZFC.NativeSetOperations) :
    LRA.VolumeI.Set.Operations.CollectionSetOperations :=
  LRA.VolumeI.Set.Implementations.ZFC.collectionSetOperations native

example (native : LRA.VolumeI.Set.Implementations.ZFC.NativeSetOperations) :
    NonemptySetLaws
      (LRA.VolumeI.Set.Implementations.ZFC.collectionSetOperations native)
      (LRA.VolumeI.Set.Implementations.ZFC.CollectionAlgebraAdapter.nonemptySetPredicate native) :=
  LRA.VolumeI.Set.Implementations.ZFC.CollectionAlgebraAdapter.nonemptySetLaws native

example (native : LRA.VolumeI.Set.Implementations.ZFC.NativeSetOperations) :
    RelativeComplementCollectionLaws
      (LRA.VolumeI.Set.Implementations.ZFC.collectionSetOperations native) :=
  LRA.VolumeI.Set.Implementations.ZFC.CollectionAlgebraAdapter.relativeComplementCollectionLaws native

end ZFCSmoke

end LRA.Tests.VolumeI.Set.CollectionAlgebraAdapters
