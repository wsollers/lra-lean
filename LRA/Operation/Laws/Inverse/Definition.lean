import LRA.Operation.Definition

namespace LRA.Operation.Laws.Inverse

open LRA.Operation

universe u

def LeftInverse {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier)
    (inverse : UnaryEndoOperation Carrier) : Prop :=
  ∀ element, operation (inverse element) element = identity

def RightInverse {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier)
    (inverse : UnaryEndoOperation Carrier) : Prop :=
  ∀ element, operation element (inverse element) = identity

def LeftInverseOf {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity element inverse : Carrier) : Prop :=
  operation inverse element = identity

def RightInverseOf {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity element inverse : Carrier) : Prop :=
  operation element inverse = identity

def TwoSidedInverseOf {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity element inverse : Carrier) : Prop :=
  LeftInverseOf operation identity element inverse ∧
    RightInverseOf operation identity element inverse

def LeftInvertibleOn {Carrier : Type u}
    (eligible : Carrier → Prop)
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier) : Prop :=
  ∀ element, eligible element →
    ∃ inverse, LeftInverseOf operation identity element inverse

def RightInvertibleOn {Carrier : Type u}
    (eligible : Carrier → Prop)
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier) : Prop :=
  ∀ element, eligible element →
    ∃ inverse, RightInverseOf operation identity element inverse

def TwoSidedInvertibleOn {Carrier : Type u}
    (eligible : Carrier → Prop)
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier) : Prop :=
  ∀ element, eligible element →
    ∃ inverse, TwoSidedInverseOf operation identity element inverse

def TwoSidedInverse {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier)
    (inverse : UnaryEndoOperation Carrier) : Prop :=
  LeftInverse operation identity inverse ∧
    RightInverse operation identity inverse

end LRA.Operation.Laws.Inverse
