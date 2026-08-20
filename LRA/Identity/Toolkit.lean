import LRA.Identity.Axioms
import LRA.Identity.Equality
import LRA.Identity.Substitution

namespace LRA.Identity

universe u v

/-! Opt-in proof patterns for equality reasoning. -/

/-- Start an equality proof by reflexivity. -/
theorem EqualityReasoningByReflexivity {Carrier : Type u} (x : Carrier) :
    x = x := by
  sorry

/-- Reverse a proved equality. -/
theorem EqualityReasoningBySymmetry {Carrier : Type u} {x y : Carrier}
    (EqualityProof : x = y) :
    y = x := by
  sorry

/-- Chain two proved equalities. -/
theorem EqualityReasoningByTransitivity {Carrier : Type u} {x y z : Carrier}
    (FirstEquality : x = y)
    (SecondEquality : y = z) :
    x = z := by
  sorry

/-- Rewrite a unary property along an equality. -/
theorem RewritePropertyByEquality {Carrier : Type u} {x y : Carrier}
    (EqualityProof : x = y)
    (Property : Carrier -> Prop) :
    Property x ↔ Property y := by
  sorry

/-- Rewrite a function application along an equality. -/
theorem RewriteFunctionByEquality {Domain : Type u} {Codomain : Type v}
    {x y : Domain}
    (EqualityProof : x = y)
    (function : Domain -> Codomain) :
    function x = function y := by
  sorry

/-- Rewrite the left coordinate of a binary relation along an equality. -/
theorem RewriteRelationLeftByEquality {Carrier : Type u}
    {x y z : Carrier}
    (EqualityProof : x = y)
    (relation : Carrier -> Carrier -> Prop) :
    relation x z ↔ relation y z := by
  sorry

end LRA.Identity
