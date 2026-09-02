import LRA.Order.Bounds.LeastUpperBoundProperty.Definition

namespace LRA.Order

universe u v

/--
`OrderCompletenessLaws` TODO

Predicate logic:

  class OrderCompletenessLaws (R : Type u) (SetObject : Type v)
    [LE R] [Membership R SetObject] : Prop where
  Completeness :
    LRA.Order.LeastUpperBoundProperty
      SetObject (fun a b : R => a <= b)

Predicate logic (unfolded):

  class OrderCompletenessLaws (R : Type u) (SetObject : Type v)
    [LE R] [Membership R SetObject] : Prop where
  Completeness :
    LRA.Order.LeastUpperBoundProperty
      SetObject (fun a b : R => a <= b) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class OrderCompletenessLaws (R : Type u) (SetObject : Type v)
    [LE R] [Membership R SetObject] : Prop where
  Completeness :
    LRA.Order.LeastUpperBoundProperty
      SetObject (fun a b : R => a <= b)
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
class OrderCompletenessLaws (R : Type u) (SetObject : Type v)
    [LE R] [Membership R SetObject] : Prop where
  Completeness :
    LRA.Order.LeastUpperBoundProperty
      SetObject (fun a b : R => a <= b)

section Wrappers

variable {R : Type u} {SetObject : Type v}

/--
`Completeness` TODO

Predicate logic:

  LRA.Order.LeastUpperBoundProperty SetObject fun a b ∈ R => a <= b

Predicate logic (unfolded):

  ∀ {R : Type u} {SetObject : Type v} [inst : LE R] [inst_1 : Membership R SetObject], LRA.Order.OrderCompletenessLaws R SetObject → ∀ (subset : SetObject), (Exists fun element => inst_1.1 subset element ∧ Exists fun bound => ∀ (element : R), inst_1.1 subset element → (fun a b => inst.1 a b) element bound) → Exists fun supremum => (∀ (element : R), inst_1.1 subset element → (fun a b => inst.1 a b) element supremum ∧ ∀ (bound : R), (∀ (element : R), inst_1.1 subset element → (fun a b => inst.1 a b) element bound) → (fun a b => inst.1 a b) supremum bound)

Logical form (Lean):

```lean
theorem Completeness [LE R] [Membership R SetObject]
    [OrderCompletenessLaws R SetObject] :
    LRA.Order.LeastUpperBoundProperty
      SetObject (fun a b : R => a <= b)
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
theorem Completeness [LE R] [Membership R SetObject]
    [OrderCompletenessLaws R SetObject] :
    LRA.Order.LeastUpperBoundProperty
      SetObject (fun a b : R => a <= b) := by
  sorry
end Wrappers

end LRA.Order
