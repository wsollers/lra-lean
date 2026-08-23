import LRA.EuclideanSpace.Tarski.Axioms
import LRA.EuclideanSpace.Interface.Laws

   
                                                                       
                                                                        
                                                                       
                                                                      
                                                                    
  

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
