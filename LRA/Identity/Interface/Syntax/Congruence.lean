namespace LRA.Identity.Syntax

universe u

/-- A relation is preserved by an `arity`-ary syntactic constructor.

Logical form:
`(forall i, R (left i) (right i)) -> R (constructor left) (constructor right)`.
-/
def PreservedByConstructor {Syntax : Type u}
    (R : Syntax -> Syntax -> Prop) (arity : Nat)
    (constructor : (Fin arity -> Syntax) -> Syntax) : Prop :=
  forall left right, (forall i, R (left i) (right i)) ->
    R (constructor left) (constructor right)

end LRA.Identity.Syntax
