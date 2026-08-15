import LRA.VolumeI.Functions.Fibers

namespace LRA.Function

open LRA.Set

universe u v w

/-- Surjectivity of a typed function. -/
def Surjective {Domain : Type u} {Codomain : Type v}
    (map : LRA.Function Domain Codomain) : Prop :=
  ∀ output, ∃ input, map input = output

/-- The LRA definition agrees with Lean's standard predicate. -/
theorem surjective_iff_standard {Domain : Type u} {Codomain : Type v}
    (map : LRA.Function Domain Codomain) :
    Surjective map ↔ _root_.Function.Surjective map := Iff.rfl

/-- Fiber formulation of surjectivity. -/
def SurjectiveByFibers {Element : Type u} {Codomain : Type v}
    {SetObject : Type w}
    [Membership Element SetObject] [HasSeparation Element SetObject]
    (ambientDomain : SetObject)
    (map : LRA.Function Element Codomain) : Prop :=
  ∀ output : Codomain, ∃ input : Element,
    input ∈ Fiber ambientDomain map output

end LRA.Function
