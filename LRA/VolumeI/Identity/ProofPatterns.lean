import LRA.VolumeI.Identity.Native

namespace LRA.VolumeI.Identity

universe u v

/-!
Proof-pattern card for equality reasoning.

Predicate logic uses these as local proof-theoretic forms of the axiomatic
equality chapter: reflexivity starts an equality proof; Leibniz substitution
rewrites a proved equality through a property; congruence transports equality
through functions and relations.
-/

/-- Start an equality proof by reflexivity. -/
theorem EqualityReasoningByReflexivity {Carrier : Type u} (x : Carrier) :
    x = x :=
  EqualityReflexivity x

/-- Reverse a proved equality. -/
theorem EqualityReasoningBySymmetry {Carrier : Type u} {x y : Carrier}
    (EqualityProof : x = y) :
    y = x :=
  EqualitySymmetry EqualityProof

/-- Chain two proved equalities. -/
theorem EqualityReasoningByTransitivity {Carrier : Type u} {x y z : Carrier}
    (FirstEquality : x = y)
    (SecondEquality : y = z) :
    x = z :=
  EqualityTransitivity FirstEquality SecondEquality

/-- Rewrite a unary property along an equality. -/
theorem RewritePropertyByEquality {Carrier : Type u} {x y : Carrier}
    (EqualityProof : x = y)
    (Property : Carrier -> Prop) :
    Property x ↔ Property y :=
  LeibnizLaw EqualityProof Property

/-- Rewrite a function application along an equality. -/
theorem RewriteFunctionByEquality {Domain : Type u} {Codomain : Type v}
    {x y : Domain}
    (EqualityProof : x = y)
    (function : Domain -> Codomain) :
    function x = function y :=
  FunctionCongruence EqualityProof function

/-- Rewrite one coordinate of a binary relation along an equality. -/
theorem RewriteRelationLeftByEquality {Carrier : Type u}
    {x y z : Carrier}
    (EqualityProof : x = y)
    (relation : Carrier -> Carrier -> Prop) :
    relation x z ↔ relation y z :=
  SubstitutionPreservesRelationsLeft EqualityProof relation

end LRA.VolumeI.Identity
