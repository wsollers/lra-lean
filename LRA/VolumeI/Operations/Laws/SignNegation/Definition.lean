import LRA.VolumeI.Operations.Definition

namespace LRA.Operation.Laws.SignNegation

open LRA.Operation

universe u

/-- Additive inverse is involutive. -/
def AdditiveInverseInvolutive {Carrier : Type u}
    (negation : UnaryEndoOperation Carrier) : Prop :=
  forall element, negation (negation element) = element

/-- A unary map is anchored as additive inverse by an addition operation and zero. -/
def AdditiveInverseAnchor {Carrier : Type u}
    (addition : BinaryEndoOperation Carrier)
    (negation : UnaryEndoOperation Carrier)
    (zero : Carrier) : Prop :=
  forall element,
    addition element (negation element) = zero /\
      addition (negation element) element = zero

/-- Left multiplication by negative one produces additive inverse. -/
def MulNegativeOneLeft {Carrier : Type u}
    (multiplication : BinaryEndoOperation Carrier)
    (negation : UnaryEndoOperation Carrier)
    (one : Carrier) : Prop :=
  forall element, multiplication (negation one) element = negation element

/-- Right multiplication by negative one produces additive inverse. -/
def MulNegativeOneRight {Carrier : Type u}
    (multiplication : BinaryEndoOperation Carrier)
    (negation : UnaryEndoOperation Carrier)
    (one : Carrier) : Prop :=
  forall element, multiplication element (negation one) = negation element

/-- Negating the left factor negates the product. -/
def MulNegatedLeft {Carrier : Type u}
    (multiplication : BinaryEndoOperation Carrier)
    (negation : UnaryEndoOperation Carrier) : Prop :=
  forall left right,
    multiplication (negation left) right =
      negation (multiplication left right)

/-- Negating the right factor negates the product. -/
def MulNegatedRight {Carrier : Type u}
    (multiplication : BinaryEndoOperation Carrier)
    (negation : UnaryEndoOperation Carrier) : Prop :=
  forall left right,
    multiplication left (negation right) =
      negation (multiplication left right)

/-- The product of two negated factors returns the original product. -/
def MulNegatedBoth {Carrier : Type u}
    (multiplication : BinaryEndoOperation Carrier)
    (negation : UnaryEndoOperation Carrier) : Prop :=
  forall left right,
    multiplication (negation left) (negation right) =
      multiplication left right

/-- Left distributivity over subtraction. -/
def LeftDistributiveOverSubtraction {Carrier : Type u}
    (multiplication subtraction : BinaryEndoOperation Carrier) : Prop :=
  forall left right third,
    multiplication left (subtraction right third) =
      subtraction (multiplication left right) (multiplication left third)

/-- Right distributivity over subtraction. -/
def RightDistributiveOverSubtraction {Carrier : Type u}
    (multiplication subtraction : BinaryEndoOperation Carrier) : Prop :=
  forall left right third,
    multiplication (subtraction left right) third =
      subtraction (multiplication left third) (multiplication right third)

/-- The standard sign-negation contract bundle. -/
def SignNegationLaws {Carrier : Type u}
    (addition multiplication subtraction : BinaryEndoOperation Carrier)
    (negation : UnaryEndoOperation Carrier)
    (zero one : Carrier) : Prop :=
  AdditiveInverseAnchor addition negation zero /\
    AdditiveInverseInvolutive negation /\
    MulNegativeOneLeft multiplication negation one /\
    MulNegativeOneRight multiplication negation one /\
    MulNegatedLeft multiplication negation /\
    MulNegatedRight multiplication negation /\
    MulNegatedBoth multiplication negation /\
    LeftDistributiveOverSubtraction multiplication subtraction /\
    RightDistributiveOverSubtraction multiplication subtraction

end LRA.Operation.Laws.SignNegation
