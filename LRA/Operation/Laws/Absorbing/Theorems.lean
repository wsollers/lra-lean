import LRA.Operation.Laws.Absorbing.Definition

namespace LRA.Operation.Laws.Absorbing

open LRA.Operation

universe u

/--
`LeftAbsorbing.apply` TODO

Predicate logic:

  ∀ {Carrier : Type u} {operation : LRA.Operation.BinaryEndoOperation Carrier} {absorber : Carrier}, LRA.Operation.Laws.Absorbing.LeftAbsorbing operation absorber → ∀ (element : Carrier), operation absorber element = absorber

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    operation : BinaryEndoOperation Carrier
    absorber : Carrier
    law : LeftAbsorbing operation absorber
    element : Carrier
  Prove
    (∀ (element : Carrier), operation absorber element = absorber) → ∀ (element : Carrier), operation absorber element = absorber

Logical form (Lean):

```lean
theorem LeftAbsorbing.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (law : LeftAbsorbing operation absorber)
    (element : Carrier) :
    operation absorber element = absorber
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
theorem LeftAbsorbing.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (law : LeftAbsorbing operation absorber)
    (element : Carrier) :
    operation absorber element = absorber := by
  sorry
/--
`RightAbsorbing.apply` TODO

Predicate logic:

  ∀ {Carrier : Type u} {operation : LRA.Operation.BinaryEndoOperation Carrier} {absorber : Carrier}, LRA.Operation.Laws.Absorbing.RightAbsorbing operation absorber → ∀ (element : Carrier), operation element absorber = absorber

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    operation : BinaryEndoOperation Carrier
    absorber : Carrier
    law : RightAbsorbing operation absorber
    element : Carrier
  Prove
    (∀ (element : Carrier), operation element absorber = absorber) → ∀ (element : Carrier), operation element absorber = absorber

Logical form (Lean):

```lean
theorem RightAbsorbing.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (law : RightAbsorbing operation absorber)
    (element : Carrier) :
    operation element absorber = absorber
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
theorem RightAbsorbing.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (law : RightAbsorbing operation absorber)
    (element : Carrier) :
    operation element absorber = absorber := by
  sorry
/--
`TwoSidedAbsorbing.left` TODO

Predicate logic:

  ∀ {Carrier : Type u} {operation : LRA.Operation.BinaryEndoOperation Carrier} {absorber : Carrier}, LRA.Operation.Laws.Absorbing.TwoSidedAbsorbing operation absorber → LRA.Operation.Laws.Absorbing.LeftAbsorbing operation absorber

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    operation : BinaryEndoOperation Carrier
    absorber : Carrier
    law : TwoSidedAbsorbing operation absorber
  Prove
    ((∀ (element : Carrier), operation absorber element = absorber) ∧ (∀ (element : Carrier), operation element absorber = absorber)) → ∀ (element : Carrier), operation absorber element = absorber

Logical form (Lean):

```lean
theorem TwoSidedAbsorbing.left {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (law : TwoSidedAbsorbing operation absorber) :
    LeftAbsorbing operation absorber
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
theorem TwoSidedAbsorbing.left {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (law : TwoSidedAbsorbing operation absorber) :
    LeftAbsorbing operation absorber := by
  sorry
/--
`TwoSidedAbsorbing.right` TODO

Predicate logic:

  ∀ {Carrier : Type u} {operation : LRA.Operation.BinaryEndoOperation Carrier} {absorber : Carrier}, LRA.Operation.Laws.Absorbing.TwoSidedAbsorbing operation absorber → LRA.Operation.Laws.Absorbing.RightAbsorbing operation absorber

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    operation : BinaryEndoOperation Carrier
    absorber : Carrier
    law : TwoSidedAbsorbing operation absorber
  Prove
    ((∀ (element : Carrier), operation absorber element = absorber) ∧ (∀ (element : Carrier), operation element absorber = absorber)) → ∀ (element : Carrier), operation element absorber = absorber

Logical form (Lean):

```lean
theorem TwoSidedAbsorbing.right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (law : TwoSidedAbsorbing operation absorber) :
    RightAbsorbing operation absorber
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
theorem TwoSidedAbsorbing.right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (law : TwoSidedAbsorbing operation absorber) :
    RightAbsorbing operation absorber := by
  sorry
/--
`TwoSidedAbsorbing.of_left_right` TODO

Predicate logic:

  ∀ {Carrier : Type u} {operation : LRA.Operation.BinaryEndoOperation Carrier} {absorber : Carrier}, (LRA.Operation.Laws.Absorbing.LeftAbsorbing operation absorber ∧ LRA.Operation.Laws.Absorbing.RightAbsorbing operation absorber) → LRA.Operation.Laws.Absorbing.TwoSidedAbsorbing operation absorber

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    operation : BinaryEndoOperation Carrier
    absorber : Carrier
    leftLaw : LeftAbsorbing operation absorber
    rightLaw : RightAbsorbing operation absorber
  Prove
    ((∀ (element : Carrier), operation absorber element = absorber) ∧ (∀ (element : Carrier), operation element absorber = absorber)) → ((∀ (element : Carrier), operation absorber element = absorber) ∧ (∀ (element : Carrier), operation element absorber = absorber))

Logical form (Lean):

```lean
theorem TwoSidedAbsorbing.of_left_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (leftLaw : LeftAbsorbing operation absorber)
    (rightLaw : RightAbsorbing operation absorber) :
    TwoSidedAbsorbing operation absorber
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
theorem TwoSidedAbsorbing.of_left_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber : Carrier}
    (leftLaw : LeftAbsorbing operation absorber)
    (rightLaw : RightAbsorbing operation absorber) :
    TwoSidedAbsorbing operation absorber := by
  sorry
end LRA.Operation.Laws.Absorbing
