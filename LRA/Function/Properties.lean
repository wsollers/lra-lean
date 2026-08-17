import LRA.Function.Definition

namespace LRA.Function

universe u v

/-- A function is injective when no output is related to two distinct inputs. -/
def Injective {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain) : Prop :=
  ∀ firstInput secondInput output,
    function.graph firstInput output →
    function.graph secondInput output →
    firstInput = secondInput

/-- A function is surjective when every codomain value occurs as an output. -/
def Surjective {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain) : Prop :=
  ∀ output, ∃ input, function.graph input output

/-- A function is bijective exactly when it is injective and surjective. -/
def Bijective {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain) : Prop :=
  Injective function ∧ Surjective function

end LRA.Function
