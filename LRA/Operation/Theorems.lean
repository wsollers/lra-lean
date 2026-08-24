import LRA.Operation.Definition
import LRA.Function.Properties.Definition
import LRA.Operation.Laws.Associative.Definition
import LRA.Operation.Laws.Identity.Definition
import LRA.Operation.Laws.Inverse.Definition

namespace LRA.Operation

universe u v

section EndomapComposition

/--
`EndomapCompositionAssociative` TODO

Predicate logic:

  LRA.Operation.Laws.Associative.Associative (EndomapComposition Carrier)

Predicate logic (unfolded):

  ∀ (Carrier : Type u) (first second third : Carrier → Carrier), fun input => first (second (third input)) = funinput => first (second (third input))

Logical form (Lean):

```lean
theorem EndomapCompositionAssociative (Carrier : Type u) :
    LRA.Operation.Laws.Associative.Associative
      (EndomapComposition Carrier)
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
theorem EndomapCompositionAssociative (Carrier : Type u) :
    LRA.Operation.Laws.Associative.Associative
      (EndomapComposition Carrier) := by
  sorry

/--
`EndomapCompositionIdentity` TODO

Predicate logic:

  LRA.Operation.Laws.Identity.TwoSidedIdentity (EndomapComposition Carrier) (EndomapIdentity Carrier)

Predicate logic (unfolded):

  ∀ (Carrier : Type u), (∀ (element : Carrier → Carrier), fun input => element input = element ∧ ∀ (element : Carrier → Carrier), fun input => element input = element)

Logical form (Lean):

```lean
theorem EndomapCompositionIdentity (Carrier : Type u) :
    LRA.Operation.Laws.Identity.TwoSidedIdentity
      (EndomapComposition Carrier)
      (EndomapIdentity Carrier)
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
theorem EndomapCompositionIdentity (Carrier : Type u) :
    LRA.Operation.Laws.Identity.TwoSidedIdentity
      (EndomapComposition Carrier)
      (EndomapIdentity Carrier) := by
  sorry

/--
`BijectiveEndomapHasCompositionInverse` TODO

Predicate logic:

  (Carrier → Carrier) → ∃ inverse ∈ Carrier → Carrier, EndomapComposition Carrier inverse map = EndomapIdentity Carrier ∧ EndomapComposition Carrier map inverse = EndomapIdentity Carrier

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (map : Carrier → Carrier), (∀ (y x₁ x₂ : Carrier), map x₁ = y → map x₂ = y → x₁ = x₂ ∧ ∀ (y : Carrier), Exists fun x => map x = y) → Exists fun inverse => (fun input => inverse (map input) = funinput => input ∧ fun input => map (inverse input) = funinput => input)

Logical form (Lean):

```lean
theorem BijectiveEndomapHasCompositionInverse
    {Carrier : Type u}
    (map : Carrier → Carrier)
    (bijective : LRA.Function.Bijective map) :
    ∃ inverse : Carrier → Carrier,
      EndomapComposition Carrier inverse map = EndomapIdentity Carrier ∧
        EndomapComposition Carrier map inverse = EndomapIdentity Carrier
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem BijectiveEndomapHasCompositionInverse
    {Carrier : Type u}
    (map : Carrier → Carrier)
    (bijective : LRA.Function.Bijective map) :
    ∃ inverse : Carrier → Carrier,
      EndomapComposition Carrier inverse map = EndomapIdentity Carrier ∧
        EndomapComposition Carrier map inverse = EndomapIdentity Carrier := by
  sorry

end EndomapComposition

section PointwiseOperations

variable {Domain : Type u} {Codomain : Type v}

/--
`PointwiseAssociative` TODO

Predicate logic:

  LRA.Operation.Laws.Associative.Associative (PointwiseBinaryOperation Domain ∈ = Domain operation)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (operation : Codomain → Codomain → Codomain), (∀ (first second third : Codomain), operation (operation first second) third = operation first (operation second third)) → ∀ (first second third : Domain → Codomain), fun input => operation (operation (first input) (second input)) (third input) = funinput => operation (first input) (operation (second input) (third input))

Logical form (Lean):

```lean
theorem PointwiseAssociative
    (operation : BinaryEndoOperation Codomain)
    (associative :
      LRA.Operation.Laws.Associative.Associative operation) :
    LRA.Operation.Laws.Associative.Associative
      (PointwiseBinaryOperation (Domain := Domain) operation)
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
theorem PointwiseAssociative
    (operation : BinaryEndoOperation Codomain)
    (associative :
      LRA.Operation.Laws.Associative.Associative operation) :
    LRA.Operation.Laws.Associative.Associative
      (PointwiseBinaryOperation (Domain := Domain) operation) := by
  sorry

/--
`PointwiseTwoSidedIdentity` TODO

Predicate logic:

  (∀ identity ∈ Codomain), LRA.Operation.Laws.Identity.TwoSidedIdentity (PointwiseBinaryOperation Domain ∈ = Domain operation) fun _input ∈ Domain => identity

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (operation : Codomain → Codomain → Codomain) (identity : Codomain), (∀ (element : Codomain), operation identity element = element ∧ ∀ (element : Codomain), operation element identity = element) → (∀ (element : Domain → Codomain), fun input => operation ((fun _input => identity) input) (element input) = element ∧ ∀ (element : Domain → Codomain), fun input => operation (element input) ((fun _input => identity) input) = element)

Logical form (Lean):

```lean
theorem PointwiseTwoSidedIdentity
    (operation : BinaryEndoOperation Codomain)
    (identity : Codomain)
    (identityLaw :
      LRA.Operation.Laws.Identity.TwoSidedIdentity operation identity) :
    LRA.Operation.Laws.Identity.TwoSidedIdentity
      (PointwiseBinaryOperation (Domain := Domain) operation)
      (fun _input : Domain => identity)
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
theorem PointwiseTwoSidedIdentity
    (operation : BinaryEndoOperation Codomain)
    (identity : Codomain)
    (identityLaw :
      LRA.Operation.Laws.Identity.TwoSidedIdentity operation identity) :
    LRA.Operation.Laws.Identity.TwoSidedIdentity
      (PointwiseBinaryOperation (Domain := Domain) operation)
      (fun _input : Domain => identity) := by
  sorry

/--
`PointwiseTwoSidedInverse` TODO

Predicate logic:

  (∀ identity ∈ Codomain), LRA.Operation.Laws.Inverse.TwoSidedInverse (PointwiseBinaryOperation Domain ∈ = Domain operation) fun _input ∈ Domain => identity (PointwiseUnaryOperation Domain ∈ = Domain inverse)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (operation : Codomain → Codomain → Codomain) (identity : Codomain) (inverse : Codomain → Codomain), (∀ (element : Codomain), operation (inverse element) element = identity ∧ ∀ (element : Codomain), operation element (inverse element) = identity) → (∀ (element : Domain → Codomain), fun input => operation (inverse (element input)) (element input) = fun_input => identity ∧ ∀ (element : Domain → Codomain), fun input => operation (element input) (inverse (element input)) = fun_input => identity)

Logical form (Lean):

```lean
theorem PointwiseTwoSidedInverse
    (operation : BinaryEndoOperation Codomain)
    (identity : Codomain)
    (inverse : UnaryEndoOperation Codomain)
    (inverseLaw :
      LRA.Operation.Laws.Inverse.TwoSidedInverse
        operation identity inverse) :
    LRA.Operation.Laws.Inverse.TwoSidedInverse
      (PointwiseBinaryOperation (Domain := Domain) operation)
      (fun _input : Domain => identity)
      (PointwiseUnaryOperation (Domain := Domain) inverse)
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
theorem PointwiseTwoSidedInverse
    (operation : BinaryEndoOperation Codomain)
    (identity : Codomain)
    (inverse : UnaryEndoOperation Codomain)
    (inverseLaw :
      LRA.Operation.Laws.Inverse.TwoSidedInverse
        operation identity inverse) :
    LRA.Operation.Laws.Inverse.TwoSidedInverse
      (PointwiseBinaryOperation (Domain := Domain) operation)
      (fun _input : Domain => identity)
      (PointwiseUnaryOperation (Domain := Domain) inverse) := by
  sorry

end PointwiseOperations

end LRA.Operation
