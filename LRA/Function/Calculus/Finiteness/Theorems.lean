import LRA.Function.Calculus.Finiteness.Definition
import LRA.Set.SetClass.Operations

namespace LRA.Function

open LRA.Set
universe u v

/--
`FiniteImageIffEnumerable` TODO

Predicate logic:

  FiniteImage function source ↔ HasFiniteEnumeration fun output ∈ Codomain => ∃ input ∈ Domain, source input ∧ function input = output

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (source : Domain → Prop), Exists fun values => ∀ (value : Codomain), List.instMembership.1 values value ↔ Exists fun x => (source x ∧ function x = value) ↔ Exists fun values => ∀ (value : Codomain), List.instMembership.1 values value ↔ (fun output => Exists fun input => (source input ∧ function input = output)) value

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

  FiniteRange function ↔ FiniteImage function SetClass.Universal ∈ SetClass Domain

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain), Exists fun values => ∀ (value : Codomain), List.instMembership.1 values value ↔ Exists fun x => function x = value ↔ Exists fun values => ∀ (value : Codomain), List.instMembership.1 values value ↔ Exists fun x => (True ∧ function x = value)

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
