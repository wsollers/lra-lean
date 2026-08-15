import LRA.VolumeI.Functions.Functions

namespace LRA.Function

universe u v w x

/-- Composition of typed functions with independent universes. -/
def Composition {First : Type u} {Second : Type v} {Third : Type w}
    (secondMap : LRA.Function Second Third)
    (firstMap : LRA.Function First Second) : LRA.Function First Third :=
  fun input => secondMap (firstMap input)

/-- Function composition is associative. -/
theorem CompositionAssociative
    {First : Type u} {Second : Type v} {Third : Type w} {Fourth : Type x}
    (thirdMap : LRA.Function Third Fourth)
    (secondMap : LRA.Function Second Third)
    (firstMap : LRA.Function First Second) :
    Composition thirdMap (Composition secondMap firstMap) =
      Composition (Composition thirdMap secondMap) firstMap := rfl

end LRA.Function
