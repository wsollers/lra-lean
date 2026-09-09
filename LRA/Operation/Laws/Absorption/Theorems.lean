import LRA.Operation.Laws.Absorption.Definition
import LRA.Operation.Laws.Idempotent.Definition

namespace LRA.Operation.Laws.Absorption

open LRA.Operation

universe u

/--
`MutualAbsorptionLaw.first_idempotent` TODO

Predicate logic:

  ∀ {Carrier : Type u} {first second : LRA.Operation.BinaryEndoOperation Carrier}, LRA.Operation.Laws.Absorption.MutualAbsorptionLaw first second → LRA.Operation.Laws.Idempotent.Idempotent first

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    first second : BinaryEndoOperation Carrier
    law : MutualAbsorptionLaw first second
  Prove
    ((∀ (left right : Carrier), first left (second left right) = left) ∧ (∀ (left right : Carrier), second left (first left right) = left)) → ∀ (element : Carrier), first element element = element

Logical form (Lean):

```lean
theorem MutualAbsorptionLaw.first_idempotent {Carrier : Type u}
    {first second : BinaryEndoOperation Carrier}
    (law : MutualAbsorptionLaw first second) :
    LRA.Operation.Laws.Idempotent.Idempotent first
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem MutualAbsorptionLaw.first_idempotent {Carrier : Type u}
    {first second : BinaryEndoOperation Carrier}
    (law : MutualAbsorptionLaw first second) :
    LRA.Operation.Laws.Idempotent.Idempotent first := by
  sorry
/--
`MutualAbsorptionLaw.second_idempotent` TODO

Predicate logic:

  ∀ {Carrier : Type u} {first second : LRA.Operation.BinaryEndoOperation Carrier}, LRA.Operation.Laws.Absorption.MutualAbsorptionLaw first second → LRA.Operation.Laws.Idempotent.Idempotent second

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    first second : BinaryEndoOperation Carrier
    law : MutualAbsorptionLaw first second
  Prove
    ((∀ (left right : Carrier), first left (second left right) = left) ∧ (∀ (left right : Carrier), second left (first left right) = left)) → ∀ (element : Carrier), second element element = element

Logical form (Lean):

```lean
theorem MutualAbsorptionLaw.second_idempotent {Carrier : Type u}
    {first second : BinaryEndoOperation Carrier}
    (law : MutualAbsorptionLaw first second) :
    LRA.Operation.Laws.Idempotent.Idempotent second
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem MutualAbsorptionLaw.second_idempotent {Carrier : Type u}
    {first second : BinaryEndoOperation Carrier}
    (law : MutualAbsorptionLaw first second) :
    LRA.Operation.Laws.Idempotent.Idempotent second := by
  sorry
end LRA.Operation.Laws.Absorption
