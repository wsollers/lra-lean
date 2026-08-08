import LRA.VolumeI.Set.Implementations.LRASet.Algebra.SetAlgebraProperties

namespace LRA.VolumeI.Set.Implementations.LRASet

/-- A sigma-algebra on `Alpha` is a set algebra closed under countable unions.
Countable closure is represented by `Nat`-indexed families. -/
def SigmaAlgebra {Alpha : LRACarrier}
    (Collection : SetCollection Alpha) : Prop :=
  SetAlgebra Collection ∧ ClosedUnderCountableUnions Collection

/-- Every sigma-algebra is a set algebra. -/
theorem SigmaAlgebraIsSetAlgebra {Alpha : LRACarrier}
    (Collection : SetCollection Alpha)
    (Sigma : SigmaAlgebra Collection) :
    SetAlgebra Collection := by
  sorry

/-- Every sigma-algebra contains the empty set. -/
theorem SigmaAlgebraContainsEmpty {Alpha : LRACarrier}
    (Collection : SetCollection Alpha)
    (Sigma : SigmaAlgebra Collection) :
    LRASet.Member (LRASet.Empty Alpha) Collection := by
  sorry

/-- Every sigma-algebra is closed under complements. -/
theorem SigmaAlgebraClosedUnderComplements {Alpha : LRACarrier}
    (Collection : SetCollection Alpha)
    (Sigma : SigmaAlgebra Collection) :
    ClosedUnderComplements Collection := by
  sorry

/-- Every sigma-algebra is closed under finite unions. -/
theorem SigmaAlgebraClosedUnderFiniteUnions {Alpha : LRACarrier}
    (Collection : SetCollection Alpha)
    (Sigma : SigmaAlgebra Collection) :
    ClosedUnderFiniteUnions Collection := by
  sorry

/-- Every sigma-algebra is closed under finite intersections. -/
theorem SigmaAlgebraClosedUnderFiniteIntersections {Alpha : LRACarrier}
    (Collection : SetCollection Alpha)
    (Sigma : SigmaAlgebra Collection) :
    ClosedUnderFiniteIntersections Collection := by
  sorry

/-- Every sigma-algebra is closed under countable unions. -/
theorem SigmaAlgebraClosedUnderCountableUnions {Alpha : LRACarrier}
    (Collection : SetCollection Alpha)
    (Sigma : SigmaAlgebra Collection) :
    ClosedUnderCountableUnions Collection := by
  sorry

/-- Every sigma-algebra is closed under countable intersections. -/
theorem SigmaAlgebraClosedUnderCountableIntersections {Alpha : LRACarrier}
    (Collection : SetCollection Alpha)
    (Sigma : SigmaAlgebra Collection) :
    ClosedUnderCountableIntersections Collection := by
  sorry

/-- Intersections of collections closed under a fixed unary operation are closed
under that unary operation. -/
theorem UnaryClosureStableUnderCollectionIntersection {Alpha : LRACarrier}
    (System : CollectionSystem Alpha)
    (Operation : LRASet Alpha → LRASet Alpha)
    (EveryMemberClosed :
      ∀ Collection : SetCollection Alpha,
        LRASet.Member Collection System →
          ClosedUnderUnaryOperation Collection Operation) :
    ClosedUnderUnaryOperation (CollectionIntersection System) Operation := by
  sorry

/-- Intersections of collections closed under a fixed binary operation are
closed under that binary operation. -/
theorem BinaryClosureStableUnderCollectionIntersection {Alpha : LRACarrier}
    (System : CollectionSystem Alpha)
    (Operation : LRASet Alpha → LRASet Alpha → LRASet Alpha)
    (EveryMemberClosed :
      ∀ Collection : SetCollection Alpha,
        LRASet.Member Collection System →
          ClosedUnderBinaryOperation Collection Operation) :
    ClosedUnderBinaryOperation (CollectionIntersection System) Operation := by
  sorry

/-- Intersections of collections closed under a fixed indexed operation are
closed under that indexed operation. -/
theorem IndexedClosureStableUnderCollectionIntersection
    {Index Alpha : LRACarrier}
    (System : CollectionSystem Alpha)
    (Operation : IndexedFamily Index Alpha → LRASet Alpha)
    (EveryMemberClosed :
      ∀ Collection : SetCollection Alpha,
        LRASet.Member Collection System →
          ClosedUnderIndexedOperation Collection Operation) :
    ClosedUnderIndexedOperation (CollectionIntersection System) Operation := by
  sorry

/-- Intersections of collections closed under a fixed collection operation are
closed under that collection operation. -/
theorem CollectionClosureStableUnderCollectionIntersection {Alpha : LRACarrier}
    (System : CollectionSystem Alpha)
    (Operation : SetCollection Alpha → LRASet Alpha)
    (EveryMemberClosed :
      ∀ Collection : SetCollection Alpha,
        LRASet.Member Collection System →
          ClosedUnderCollectionOperation Collection Operation) :
    ClosedUnderCollectionOperation (CollectionIntersection System) Operation := by
  sorry

/-- The intersection of any system of sigma-algebras is a sigma-algebra,
provided every collection in the system is a sigma-algebra. -/
theorem SigmaAlgebrasClosedUnderIntersection {Alpha : LRACarrier}
    (System : CollectionSystem Alpha)
    (EveryMemberSigma :
      ∀ Collection : SetCollection Alpha,
        LRASet.Member Collection System → SigmaAlgebra Collection) :
    SigmaAlgebra (CollectionIntersection System) := by
  sorry

/-- The collection system whose members are exactly the sigma-algebras on
`Alpha`. -/
def SigmaAlgebraSystem (Alpha : LRACarrier) : CollectionSystem Alpha :=
  fun Collection => SigmaAlgebra Collection

/-- The sigma-algebra generated by `Generator` is the intersection of all
sigma-algebras containing `Generator`. -/
def GeneratedSigmaAlgebra {Alpha : LRACarrier}
    (Generator : SetCollection Alpha) : SetCollection Alpha :=
  GeneratedCollection (SigmaAlgebraSystem Alpha) Generator

/-- There is at least one sigma-algebra containing any chosen generator. -/
theorem GeneratedSigmaAlgebraCandidateNonempty {Alpha : LRACarrier}
    (Generator : SetCollection Alpha) :
    LRASet.Nonempty
      (fun ClosedCollection =>
        LRASet.Member ClosedCollection (SigmaAlgebraSystem Alpha) ∧
          ContainsGeneratingFamily Generator ClosedCollection) := by
  sorry

/-- A generating family is contained in the sigma-algebra it generates. -/
theorem GeneratedSigmaAlgebraExtensive {Alpha : LRACarrier}
    (Generator : SetCollection Alpha) :
    LRASet.Subset Generator (GeneratedSigmaAlgebra Generator) := by
  sorry

/-- Generated sigma-algebras are monotone in the generating family. -/
theorem GeneratedSigmaAlgebraMonotone {Alpha : LRACarrier}
    {LeftGenerator RightGenerator : SetCollection Alpha}
    (LeftSubsetRight : LRASet.Subset LeftGenerator RightGenerator) :
    LRASet.Subset
      (GeneratedSigmaAlgebra LeftGenerator)
      (GeneratedSigmaAlgebra RightGenerator) := by
  sorry

/-- The sigma-algebra generated by a family is itself a sigma-algebra. -/
theorem GeneratedSigmaAlgebraIsSigmaAlgebra {Alpha : LRACarrier}
    (Generator : SetCollection Alpha) :
    SigmaAlgebra (GeneratedSigmaAlgebra Generator) := by
  sorry

/-- Generating a generated sigma-algebra is idempotent. -/
theorem GeneratedSigmaAlgebraIdempotent {Alpha : LRACarrier}
    (Generator : SetCollection Alpha) :
    GeneratedSigmaAlgebra (GeneratedSigmaAlgebra Generator) =
      GeneratedSigmaAlgebra Generator := by
  sorry

end LRA.VolumeI.Set.Implementations.LRASet
