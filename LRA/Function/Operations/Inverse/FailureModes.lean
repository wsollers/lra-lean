import LRA.Function.Operations.Inverse.Definition

namespace LRA.Function

universe u v

/--
`MultipleLeftInverses` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain), Exists fun first => Exists fun second => (Ne first second ∧ (function.LeftInverse first ∧ function.LeftInverse second))

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain), Exists fun first => Exists fun second => (first = second → False ∧ (∀ (input : Domain), first (function input) = input ∧ ∀ (input : Domain), second (function input) = input))

Logical form (Lean):

```lean
def MultipleLeftInverses {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  ∃ first second : LRA.Function Codomain Domain,
    first ≠ second ∧ LeftInverse function first ∧ LeftInverse function second
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use, unfold

-/
def MultipleLeftInverses {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  ∃ first second : LRA.Function Codomain Domain,
    first ≠ second ∧ LeftInverse function first ∧ LeftInverse function second

/--
`MultipleRightInverses` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain), Exists fun first => Exists fun second => (Ne first second ∧ (function.RightInverse first ∧ function.RightInverse second))

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain), Exists fun first => Exists fun second => (first = second → False ∧ (∀ (output : Codomain), function (first output) = output ∧ ∀ (output : Codomain), function (second output) = output))

Logical form (Lean):

```lean
def MultipleRightInverses {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  ∃ first second : LRA.Function Codomain Domain,
    first ≠ second ∧ RightInverse function first ∧ RightInverse function second
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use, unfold

-/
def MultipleRightInverses {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  ∃ first second : LRA.Function Codomain Domain,
    first ≠ second ∧ RightInverse function first ∧ RightInverse function second

end LRA.Function
