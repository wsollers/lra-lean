import LRA.Logic.Language.FirstOrder.Signature

namespace LRA.Logic.SecondOrder

/--
`SecondOrderLanguage` is the ordinary non-logical signature used by general
second-order syntax. The second-order variable families are syntactic binders,
not additional non-logical symbols in the base signature.
-/
abbrev SecondOrderLanguage := Signature

end LRA.Logic.SecondOrder
