namespace LRA.Identity

universe u

/-- TeX label: `ax:equality-reflexivity`.

Every object is equal to itself.
-/
axiom EqualityReflexivity {Carrier : Type u} (element : Carrier) :
    element = element

end LRA.Identity
