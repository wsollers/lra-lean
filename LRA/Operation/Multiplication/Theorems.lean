import LRA.Operation.Multiplication.Laws

namespace LRA.Operation.Multiplication

universe u

/--
`realization_mul` Accessor theorem for the underlying multiplication witness.

Predicate logic:

  ∀ {Carrier : Type u} (realization : LRA.Operation.Multiplication.Realization Carrier), realization.spec.mul = realization.spec.mul

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    realization : Realization Carrier
  Prove
    realization.spec.1 = realization.spec.1

Logical form (Lean):

```lean
theorem realization_mul {Carrier : Type u} (realization : Realization Carrier) :
    realization.spec.mul = realization.spec.mul
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
theorem realization_mul {Carrier : Type u} (realization : Realization Carrier) :
    realization.spec.mul = realization.spec.mul := by
  sorry
/--
`BaseLawExports.associative_law` Accessor theorem for the baseline multiplication associativity export.

Predicate logic:

  ∀ {Carrier : Type u} (laws : LRA.Operation.Multiplication.BaseLawExports Carrier), LRA.Operation.Laws.Associative.Associative laws.realization.spec.mul

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    laws : BaseLawExports Carrier
  Prove
    laws.realization.spec.1 (laws.realization.spec.1 first second) third = laws.realization.spec.1 first (laws.realization.spec.1 second third)

Logical form (Lean):

```lean
theorem BaseLawExports.associative_law {Carrier : Type u}
    (laws : BaseLawExports Carrier) :
    LRA.Operation.Laws.Associative.Associative laws.realization.spec.mul
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
theorem BaseLawExports.associative_law {Carrier : Type u}
    (laws : BaseLawExports Carrier) :
    LRA.Operation.Laws.Associative.Associative laws.realization.spec.mul := by
  sorry
/--
`CommutativeLawExports.commutative_law` Accessor theorem for the optional multiplication commutativity export.

Predicate logic:

  ∀ {Carrier : Type u} (laws : LRA.Operation.Multiplication.CommutativeLawExports Carrier), LRA.Operation.Laws.Commutative.Commutative laws.base.realization.spec.mul

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    laws : CommutativeLawExports Carrier
  Prove
    laws.base.realization.spec.1 first second = laws.base.realization.spec.1 second first

Logical form (Lean):

```lean
theorem CommutativeLawExports.commutative_law {Carrier : Type u}
    (laws : CommutativeLawExports Carrier) :
    LRA.Operation.Laws.Commutative.Commutative laws.base.realization.spec.mul
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
theorem CommutativeLawExports.commutative_law {Carrier : Type u}
    (laws : CommutativeLawExports Carrier) :
    LRA.Operation.Laws.Commutative.Commutative laws.base.realization.spec.mul := by
  sorry
/--
`IdentityLawExports.identity_law` Accessor theorem for the multiplication identity witness export.

Predicate logic:

  ∀ {Carrier : Type u} (laws : LRA.Operation.Multiplication.IdentityLawExports Carrier), LRA.Operation.Laws.Identity.TwoSidedIdentity laws.base.realization.spec.mul laws.identity

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    laws : IdentityLawExports Carrier
  Prove
    ((∀ (element : Carrier), laws.base.realization.spec.1 laws.2 element = element) ∧ (∀ (element : Carrier), laws.base.realization.spec.1 element laws.2 = element))

Logical form (Lean):

```lean
theorem IdentityLawExports.identity_law {Carrier : Type u}
    (laws : IdentityLawExports Carrier) :
    LRA.Operation.Laws.Identity.TwoSidedIdentity
      laws.base.realization.spec.mul
      laws.identity
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
theorem IdentityLawExports.identity_law {Carrier : Type u}
    (laws : IdentityLawExports Carrier) :
    LRA.Operation.Laws.Identity.TwoSidedIdentity
      laws.base.realization.spec.mul
      laws.identity := by
  sorry
/--
`InverseLawExports.inverse_law` Accessor theorem for the multiplication inverse witness export.

Predicate logic:

  ∀ {Carrier : Type u} (laws : LRA.Operation.Multiplication.InverseLawExports Carrier), LRA.Operation.Laws.Inverse.TwoSidedInverse laws.identityLaws.base.realization.spec.mul laws.identityLaws.identity laws.inverse

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    laws : InverseLawExports Carrier
  Prove
    ((∀ (element : Carrier), laws.identityLaws.base.realization.spec.1 (laws.2 element) element = laws.identityLaws.2) ∧ (∀ (element : Carrier), laws.identityLaws.base.realization.spec.1 element (laws.2 element) = laws.identityLaws.2))

Logical form (Lean):

```lean
theorem InverseLawExports.inverse_law {Carrier : Type u}
    (laws : InverseLawExports Carrier) :
    LRA.Operation.Laws.Inverse.TwoSidedInverse
      laws.identityLaws.base.realization.spec.mul
      laws.identityLaws.identity
      laws.inverse
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
theorem InverseLawExports.inverse_law {Carrier : Type u}
    (laws : InverseLawExports Carrier) :
    LRA.Operation.Laws.Inverse.TwoSidedInverse
      laws.identityLaws.base.realization.spec.mul
      laws.identityLaws.identity
      laws.inverse := by
  sorry
/--
`AbsorbingLawExports.absorbing_law` Accessor theorem for the optional multiplication absorber export.

Predicate logic:

  ∀ {Carrier : Type u} (laws : LRA.Operation.Multiplication.AbsorbingLawExports Carrier), LRA.Operation.Laws.Absorbing.TwoSidedAbsorbing laws.realization.spec.mul laws.absorber

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    laws : AbsorbingLawExports Carrier
  Prove
    ((∀ (element : Carrier), laws.realization.spec.1 laws.2 element = laws.2) ∧ (∀ (element : Carrier), laws.realization.spec.1 element laws.2 = laws.2))

Logical form (Lean):

```lean
theorem AbsorbingLawExports.absorbing_law {Carrier : Type u}
    (laws : AbsorbingLawExports Carrier) :
    LRA.Operation.Laws.Absorbing.TwoSidedAbsorbing
      laws.realization.spec.mul
      laws.absorber
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
theorem AbsorbingLawExports.absorbing_law {Carrier : Type u}
    (laws : AbsorbingLawExports Carrier) :
    LRA.Operation.Laws.Absorbing.TwoSidedAbsorbing
      laws.realization.spec.mul
      laws.absorber := by
  sorry
/--
`IdempotentLawExports.idempotent_law` Accessor theorem for the optional multiplication idempotence export.

Predicate logic:

  ∀ {Carrier : Type u} (laws : LRA.Operation.Multiplication.IdempotentLawExports Carrier), LRA.Operation.Laws.Idempotent.Idempotent laws.realization.spec.mul

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    laws : IdempotentLawExports Carrier
  Prove
    laws.realization.spec.1 element element = element

Logical form (Lean):

```lean
theorem IdempotentLawExports.idempotent_law {Carrier : Type u}
    (laws : IdempotentLawExports Carrier) :
    LRA.Operation.Laws.Idempotent.Idempotent laws.realization.spec.mul
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
theorem IdempotentLawExports.idempotent_law {Carrier : Type u}
    (laws : IdempotentLawExports Carrier) :
    LRA.Operation.Laws.Idempotent.Idempotent laws.realization.spec.mul := by
  sorry
end LRA.Operation.Multiplication
