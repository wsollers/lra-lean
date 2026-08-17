namespace LRA.Operation

universe u v w

/-- A general typed operation from a domain to a codomain. -/
abbrev Operation (Domain : Type u) (Codomain : Type v) :=
  Domain → Codomain

/-- A nullary operation is a selected element of the codomain. -/
abbrev NullaryOperation (Codomain : Type u) := Codomain

/-- A unary operation with possibly different domain and codomain. -/
abbrev HeterogeneousUnaryOperation (Domain : Type u) (Codomain : Type v) :=
  Operation Domain Codomain

/-- A unary operation on one carrier. -/
abbrev UnaryOperation (Carrier : Type u) :=
  HeterogeneousUnaryOperation Carrier Carrier

/-- A nullary operation viewed as a constant operation. -/
abbrev ConstantOperation (Codomain : Type u) := NullaryOperation Codomain

/-- A unary endo-operation on a single carrier. -/
abbrev UnaryEndoOperation (Carrier : Type u) := UnaryOperation Carrier

/-- A binary operation with possibly different input and codomain types. -/
abbrev HeterogeneousBinaryOperation
    (Left : Type u) (Right : Type v) (Codomain : Type w) :=
  Left → Right → Codomain

/-- A binary operation on one carrier. -/
abbrev BinaryOperation (Carrier : Type u) :=
  HeterogeneousBinaryOperation Carrier Carrier Carrier

/-- A binary endo-operation on a single carrier. -/
abbrev BinaryEndoOperation (Carrier : Type u) := BinaryOperation Carrier

/-- An external binary operation, such as scalar multiplication. -/
abbrev ExternalBinaryOperation (Scalar : Type u) (Carrier : Type v) :=
  HeterogeneousBinaryOperation Scalar Carrier Carrier

/-- Composition as a binary operation on endomaps. -/
def EndomapComposition (Carrier : Type u) :
    BinaryEndoOperation (Carrier → Carrier) :=
  fun second first input => second (first input)

/-- The identity element for endomap composition. -/
def EndomapIdentity (Carrier : Type u) : Carrier → Carrier :=
  fun input => input

/-- Pointwise transfer of a binary operation to a function space. -/
def PointwiseBinaryOperation {Domain : Type u} {Codomain : Type v}
    (operation : BinaryEndoOperation Codomain) :
    BinaryEndoOperation (Domain → Codomain) :=
  fun first second input => operation (first input) (second input)

/-- Pointwise transfer of a unary operation to a function space. -/
def PointwiseUnaryOperation {Domain : Type u} {Codomain : Type v}
    (operation : UnaryEndoOperation Codomain) :
    UnaryEndoOperation (Domain → Codomain) :=
  fun map input => operation (map input)

/-- A partial unary operation on a carrier. -/
structure PartialUnaryOperation (Carrier : Type u) where
  Domain : Carrier → Prop
  Value : ∀ input, Domain input → Carrier

/-- A partial binary operation on a carrier. -/
structure PartialBinaryOperation (Carrier : Type u) where
  Domain : Carrier → Carrier → Prop
  Value : ∀ left right, Domain left right → Carrier

end LRA.Operation
