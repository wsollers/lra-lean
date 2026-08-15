namespace LRA.Map.Operation

universe u v w

/--
A general typed operation from a domain to a codomain.
-/
abbrev Operation (Domain : Type u) (Codomain : Type v) :=
  Domain -> Codomain

/--
A nullary operation is a selected element of the codomain.
-/
abbrev NullaryOperation (Codomain : Type u) :=
  Codomain

/--
A unary operation with possibly different domain and codomain.
-/
abbrev UnaryOperation (Domain : Type u) (Codomain : Type v) :=
  Operation Domain Codomain

/--
A unary operation on a single carrier.
-/
abbrev UnaryEndoOperation (Carrier : Type u) :=
  UnaryOperation Carrier Carrier

/--
A binary operation with possibly different left input, right input, and
codomain types.
-/
abbrev BinaryOperation
    (Left : Type u) (Right : Type v) (Codomain : Type w) :=
  Left -> Right -> Codomain

/--
A binary operation on a single carrier.
-/
abbrev BinaryEndoOperation (Carrier : Type u) :=
  BinaryOperation Carrier Carrier Carrier

/--
An external binary operation, such as scalar multiplication.
-/
abbrev ExternalBinaryOperation (Scalar : Type u) (Carrier : Type v) :=
  BinaryOperation Scalar Carrier Carrier

end LRA.Map.Operation
