import LRA.Function.Calculus.Finiteness.Definition
import LRA.Set.SetClass.Operations

namespace LRA.Function

open LRA.Set
universe u v

/-- Image finiteness is finiteness of the class of attained values. -/
theorem FiniteImageIffEnumerable {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (source : SetClass Domain) :
    FiniteImage function source ↔
      HasFiniteEnumeration
        (fun output : Codomain => ∃ input : Domain,
          source input ∧ function input = output) := by
  sorry

/-- Range finiteness is image finiteness over the universal source class. -/
theorem FiniteRangeIffFiniteImageOfUniversal {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    FiniteRange function ↔
      FiniteImage function (SetClass.Universal : SetClass Domain) := by
  sorry

end LRA.Function
