import Mathlib.Data.PNat.Defs
import LRA.NumberSystems.NaturalNumbers.Constructions.Landau
import LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.Carrier
import LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.Carrier

namespace LRA.NumberSystems.NaturalNumbers

/-!
`NaturalNumbers` owns the naturals-family carrier choices. The redundant
successor-adjacent subjects consume these aliases until their retirement pass:

- `PositiveNaturals` -> `LRA_N_Landau`
- `ZeroBasedNaturals` -> `LRA_N_VonNeumann`
- `PresburgerArithmetic` -> `LRA_N_Presburger`
- `FirstOrderArithmetic` -> `LRA_MATHLIB_N`
-/

/--
`LRA_N_Landau` TODO

Predicate logic:

  Type

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Type

Logical form (Lean):

```lean
axiom LandauElement : Type
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
abbrev LRA_N_Landau :=
  LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauElement

/--
`LRA_N_Presburger` TODO

Predicate logic:

  abbrev LRA_N_Presburger :=
    LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerElement

Predicate logic (unfolded):

  abbrev LRA_N_Presburger :=
    LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerElement (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev LRA_N_Presburger :=
  LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerElement
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
abbrev LRA_N_Presburger :=
  LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerElement

/--
`LRA_N_VonNeumann` TODO

Predicate logic:

  abbrev LRA_N_VonNeumann :=
    LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement

Predicate logic (unfolded):

  abbrev LRA_N_VonNeumann :=
    LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev LRA_N_VonNeumann :=
  LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement
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
abbrev LRA_N_VonNeumann :=
  LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement

/--
`LRA_N` TODO

Predicate logic:

  abbrev LRA_N := LRA_N_Landau

Predicate logic (unfolded):

  abbrev LRA_N := LRA_N_Landau (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev LRA_N := LRA_N_Landau
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
abbrev LRA_N := LRA_N_Landau

/--
`LRA_Nat` TODO

Predicate logic:

  abbrev LRA_Nat := LRA_N

Predicate logic (unfolded):

  abbrev LRA_Nat := LRA_N (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev LRA_Nat := LRA_N
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
abbrev LRA_Nat := LRA_N

/--
`LRA_DefaultCarrier` TODO

Predicate logic:

  abbrev LRA_DefaultCarrier := LRA_Nat

Predicate logic (unfolded):

  abbrev LRA_DefaultCarrier := LRA_Nat (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev LRA_DefaultCarrier := LRA_Nat
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
abbrev LRA_DefaultCarrier := LRA_Nat

/--
`LRA_MATHLIB_N` TODO

Predicate logic:

  abbrev LRA_MATHLIB_N := Nat

Predicate logic (unfolded):

  abbrev LRA_MATHLIB_N := Nat (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev LRA_MATHLIB_N := Nat
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
abbrev LRA_MATHLIB_N := Nat

/--
`LRA_MATHLIB_N_Pos` TODO

Predicate logic:

  abbrev LRA_MATHLIB_N_Pos := PNat

Predicate logic (unfolded):

  abbrev LRA_MATHLIB_N_Pos := PNat (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev LRA_MATHLIB_N_Pos := PNat
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
abbrev LRA_MATHLIB_N_Pos := PNat

/-!
`NaturalNumbers` is already the one-based positive owner in this tree, so the
generic `N+` refinement collapses to the parent carrier instead of introducing
an extra subtype wrapper.
-/
/--
`LRA_N_Pos` TODO

Predicate logic:

  abbrev LRA_N_Pos := LRA_N

Predicate logic (unfolded):

  abbrev LRA_N_Pos := LRA_N (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev LRA_N_Pos := LRA_N
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
abbrev LRA_N_Pos := LRA_N

end LRA.NumberSystems.NaturalNumbers
