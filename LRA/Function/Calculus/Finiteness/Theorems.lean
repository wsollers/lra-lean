import LRA.Function.Calculus.Finiteness.Definition
import LRA.Set.SetClass.Operations

namespace LRA.Function

open LRA.Set
universe u v

/--
`FiniteImageIffEnumerable` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain) (source : LRA.Set.SetClass Domain), function.FiniteImage source ↔ LRA.Function.HasFiniteEnumeration fun output => Exists fun input => (source input ∧ function input = output)

Predicate logic (unfolded):

  Ambient
    (Domain, Codomain)
  Objects
    function : LRA.Function Domain Codomain
    source : SetClass Domain
  Prove
    function.FiniteImage source ↔ LRA.Function.HasFiniteEnumeration fun output => Exists fun input => (source input ∧ function input = output)

Logical form (Lean):

```lean
theorem FiniteImageIffEnumerable {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (source : SetClass Domain) :
    FiniteImage function source ↔
      HasFiniteEnumeration
        (fun output : Codomain => ∃ input : Domain,
          source input ∧ function input = output)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, cases, rcases, use

-/
theorem FiniteImageIffEnumerable {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (source : SetClass Domain) :
    FiniteImage function source ↔
      HasFiniteEnumeration
        (fun output : Codomain => ∃ input : Domain,
          source input ∧ function input = output) := by
  sorry
/--
`FiniteRangeIffFiniteImageOfUniversal` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain), function.FiniteRange ↔ function.FiniteImage LRA.Set.SetClass.Universal

Predicate logic (unfolded):

  Ambient
    (Domain, Codomain)
  Objects
    function : LRA.Function Domain Codomain
  Prove
    function.FiniteRange ↔ function.FiniteImage LRA.Set.SetClass.Universal

Logical form (Lean):

```lean
theorem FiniteRangeIffFiniteImageOfUniversal {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    FiniteRange function ↔
      FiniteImage function (SetClass.Universal : SetClass Domain)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem FiniteRangeIffFiniteImageOfUniversal {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    FiniteRange function ↔
      FiniteImage function (SetClass.Universal : SetClass Domain) := by
  sorry
end LRA.Function
