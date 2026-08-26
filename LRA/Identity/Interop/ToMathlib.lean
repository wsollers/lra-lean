import LRA.Identity.Interface.ModelTheory.Model

namespace LRA.Identity

universe u

def ToMathlibEquality
    (equalityStructure : EqualityStructure.{u}) :
    equalityStructure.Carrier → equalityStructure.Carrier → Prop :=
  equalityStructure.equalityInterpretation

theorem ToMathlibEqualityIsIdentity
    (equalityStructure : EqualityStructure.{u})
    (left right : equalityStructure.Carrier) :
    ToMathlibEquality equalityStructure left right ↔ left = right :=
  equalityStructure.equalityIsDiagonal left right

end LRA.Identity
