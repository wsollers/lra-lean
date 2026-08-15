import LRA.VolumeI.Functions.Fibers

namespace LRA.Function

open LRA.Set

universe u v w

/-- Injectivity of a typed function. -/
def Injective {Domain : Type u} {Codomain : Type v}
    (map : LRA.Function Domain Codomain) : Prop :=
  ∀ left right, map left = map right → left = right

/-- The LRA definition agrees with Lean's standard predicate. -/
theorem injective_iff_standard {Domain : Type u} {Codomain : Type v}
    (map : LRA.Function Domain Codomain) :
    Injective map ↔ _root_.Function.Injective map := Iff.rfl

/-- Fiber formulation of injectivity. -/
def InjectiveByFibers {Element : Type u} {Codomain : Type v}
    {SetObject : Type w}
    [Membership Element SetObject] [HasSeparation Element SetObject]
    (ambientDomain : SetObject)
    (map : LRA.Function Element Codomain) : Prop :=
  ∀ (output : Codomain) (left right : Element),
    left ∈ Fiber ambientDomain map output →
    right ∈ Fiber ambientDomain map output → left = right

end LRA.Function
