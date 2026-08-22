import LRA.EuclideanSpace.Tarski.Axioms
import LRA.EuclideanSpace.Interface.Laws

/-!
Proof that the in-house `TarskiPoint` realization satisfies the generic
`Interface` law-classes -- the same role `LRA.Set.ZFCSet.Laws` plays for
`ZFCSet` against `LRA.Set.Interface`. Since `TarskiPoint`'s axioms were
stated in exactly the shape the generic classes expect, every instance
here is a direct reference to its matching axiom, not a fresh proof.
-/

namespace LRA.EuclideanSpace

instance : CongruenceLaws TarskiPoint where
  CongruenceReflexivity := CongruenceReflexivity
  CongruenceTransitivity := CongruenceTransitivity
  CongruenceIdentity := CongruenceIdentity

instance : SegmentConstructionLaw TarskiPoint where
  SegmentConstruction := SegmentConstruction

instance : FiveSegmentLaw TarskiPoint where
  FiveSegment := FiveSegment

instance : BetweennessLaws TarskiPoint where
  BetweennessIdentity := BetweennessIdentity
  InnerPasch := InnerPasch

instance : ParallelLaw TarskiPoint where
  Playfair := Playfair

instance : ContinuityLaw TarskiPoint where
  Continuity := Continuity

instance (n : Nat) : DimensionLaws TarskiPoint n where
  LowerDimension := LowerDimension n
  UpperDimension := UpperDimension n

end LRA.EuclideanSpace
