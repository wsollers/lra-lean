import LRA.Function.Definition
import LRA.Function.Properties.Definition
import LRA.Relation.Operations.Converse.Definition
import LRA.Set.SetClass.Definition

namespace LRA.Function

universe u v

/--
`LeftInverse` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain) (inverse : LRA.Function Codomain Domain) (input : Domain), inverse (function input) = input

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (inverse : Codomain → Domain) (input : Domain), inverse (function input) = input

Logical form (Lean):

```lean
def LeftInverse
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain) : Prop :=
  ∀ input, inverse (function input) = input
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def LeftInverse
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain) : Prop :=
  ∀ input, inverse (function input) = input

/--
`RightInverse` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain) (inverse : LRA.Function Codomain Domain) (output : Codomain), function (inverse output) = output

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (inverse : Codomain → Domain) (output : Codomain), function (inverse output) = output

Logical form (Lean):

```lean
def RightInverse
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain) : Prop :=
  ∀ output, function (inverse output) = output
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def RightInverse
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain) : Prop :=
  ∀ output, function (inverse output) = output

/--
`TwoSidedInverse` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain) (inverse : LRA.Function Codomain Domain), (function.LeftInverse inverse ∧ function.RightInverse inverse)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (inverse : Codomain → Domain), (∀ (input : Domain), inverse (function input) = input ∧ ∀ (output : Codomain), function (inverse output) = output)

Logical form (Lean):

```lean
def TwoSidedInverse
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain) : Prop :=
  LeftInverse function inverse ∧ RightInverse function inverse
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def TwoSidedInverse
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain) : Prop :=
  LeftInverse function inverse ∧ RightInverse function inverse

/--
`IsInverseFunction` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (inverse : LRA.Function Codomain Domain) (function : LRA.Function Domain Codomain), (function.LeftInverse inverse ∧ function.RightInverse inverse)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (inverse : Codomain → Domain) (function : Domain → Codomain), (∀ (input : Domain), inverse (function input) = input ∧ ∀ (output : Codomain), function (inverse output) = output)

Logical form (Lean):

```lean
def IsInverseFunction
    {Domain : Type u} {Codomain : Type v}
    (inverse : LRA.Function Codomain Domain)
    (function : LRA.Function Domain Codomain) : Prop :=
  TwoSidedInverse function inverse
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def IsInverseFunction
    {Domain : Type u} {Codomain : Type v}
    (inverse : LRA.Function Codomain Domain)
    (function : LRA.Function Domain Codomain) : Prop :=
  TwoSidedInverse function inverse

/--
`SectionOf` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (sectionFunction : LRA.Function Codomain Domain) (function : LRA.Function Domain Codomain) (output : Codomain), function (sectionFunction output) = output

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (sectionFunction : Codomain → Domain) (function : Domain → Codomain) (output : Codomain), function (sectionFunction output) = output

Logical form (Lean):

```lean
abbrev SectionOf
    {Domain : Type u} {Codomain : Type v}
    (sectionFunction : LRA.Function Codomain Domain)
    (function : LRA.Function Domain Codomain) : Prop :=
  RightInverse function sectionFunction
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev SectionOf
    {Domain : Type u} {Codomain : Type v}
    (sectionFunction : LRA.Function Codomain Domain)
    (function : LRA.Function Domain Codomain) : Prop :=
  RightInverse function sectionFunction

/--
`RetractionOf` TODO

Predicate logic:

  ∀ {Small : Type u} {Large : Type v} (retraction : LRA.Function Large Small) (inclusion : LRA.Function Small Large) (input : Small), retraction (inclusion input) = input

Predicate logic (unfolded):

  ∀ {Small : Type u} {Large : Type v} (retraction : Large → Small) (inclusion : Small → Large) (input : Small), retraction (inclusion input) = input

Logical form (Lean):

```lean
abbrev RetractionOf
    {Small : Type u} {Large : Type v}
    (retraction : LRA.Function Large Small)
    (inclusion : LRA.Function Small Large) : Prop :=
  LeftInverse inclusion retraction
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev RetractionOf
    {Small : Type u} {Large : Type v}
    (retraction : LRA.Function Large Small)
    (inclusion : LRA.Function Small Large) : Prop :=
  LeftInverse inclusion retraction

/--
`LeftInverseOn` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain) (inverse : LRA.Function Codomain Domain) (source : LRA.Set.SetClass Domain) (input : Domain), source input → inverse (function input) = input

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (inverse : Codomain → Domain) (source : Domain → Prop) (input : Domain), source input → inverse (function input) = input

Logical form (Lean):

```lean
def LeftInverseOn
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain)
    (source : LRA.Set.SetClass Domain) : Prop :=
  ∀ input, source input → inverse (function input) = input
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def LeftInverseOn
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain)
    (source : LRA.Set.SetClass Domain) : Prop :=
  ∀ input, source input → inverse (function input) = input

/--
`RightInverseOn` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain) (inverse : LRA.Function Codomain Domain) (target : LRA.Set.SetClass Codomain) (output : Codomain), target output → function (inverse output) = output

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (inverse : Codomain → Domain) (target : Codomain → Prop) (output : Codomain), target output → function (inverse output) = output

Logical form (Lean):

```lean
def RightInverseOn
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain)
    (target : LRA.Set.SetClass Codomain) : Prop :=
  ∀ output, target output → function (inverse output) = output
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def RightInverseOn
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain)
    (target : LRA.Set.SetClass Codomain) : Prop :=
  ∀ output, target output → function (inverse output) = output

/--
`TwoSidedInverseOn` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain) (inverse : LRA.Function Codomain Domain) (source : LRA.Set.SetClass Domain) (target : LRA.Set.SetClass Codomain), (function.LeftInverseOn inverse source ∧ function.RightInverseOn inverse target)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (inverse : Codomain → Domain) (source : Domain → Prop) (target : Codomain → Prop), (∀ (input : Domain), source input → inverse (function input) = input ∧ ∀ (output : Codomain), target output → function (inverse output) = output)

Logical form (Lean):

```lean
def TwoSidedInverseOn
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain)
    (source : LRA.Set.SetClass Domain)
    (target : LRA.Set.SetClass Codomain) : Prop :=
  LeftInverseOn function inverse source ∧ RightInverseOn function inverse target
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def TwoSidedInverseOn
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain)
    (source : LRA.Set.SetClass Domain)
    (target : LRA.Set.SetClass Codomain) : Prop :=
  LeftInverseOn function inverse source ∧ RightInverseOn function inverse target

end LRA.Function
