import LRA.Identity.Interface.Logic.FOL.Theory

namespace LRA.Identity.Logic.FOL

universe u

/-- An FOL identity theory supplies its predicate-relative Leibniz schema.

Logical form: `IdentityTheoryFor Expressible R -> LeibnizSchema Expressible R`.
-/
theorem IdentityTheoryFor.LeibnizSchemaOfTheory {Carrier : Type u}
    {Expressible : (Carrier -> Prop) -> Prop}
    {R : Carrier -> Carrier -> Prop}
    (h : IdentityTheoryFor Expressible R) :
    LeibnizSchema Expressible R := by
  sorry

end LRA.Identity.Logic.FOL
