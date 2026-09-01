import Mathlib.Data.Complex.Basic
import Mathlib.Data.Real.Basic
import LRA.NumberSystems.NaturalNumbers.Definition
import LRA.NumberSystems.Integers.Constructions.Polish
import LRA.NumberSystems.GaussianIntegers.Interface.ModelTheory.LStructure
import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs
import LRA.NumberSystems.RealNumbers.Constructions.Dyadic

namespace LRA.NumberSystems.Carriers

universe u

/--
`N_Landau` TODO

Predicate logic:

  abbrev N_Landau :=
  LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauElement

Predicate logic (unfolded):

  abbrev N_Landau :=
  LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauElement (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev N_Landau := LRA.NumberSystems.NaturalNumbers.LRA_N_Landau
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
abbrev N_Landau :=
  LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauElement

/--
`N_VonNeumann` TODO

Predicate logic:

  abbrev N_VonNeumann :=
  LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement

Predicate logic (unfolded):

  abbrev N_VonNeumann :=
  LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev N_VonNeumann := LRA.NumberSystems.NaturalNumbers.LRA_N_VonNeumann
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
abbrev N_VonNeumann :=
  LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement

/--
`N_Presburger` TODO

Predicate logic:

  abbrev N_Presburger :=
  LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerElement

Predicate logic (unfolded):

  abbrev N_Presburger :=
  LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerElement (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev N_Presburger := LRA.NumberSystems.NaturalNumbers.LRA_N_Presburger
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
abbrev N_Presburger :=
  LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerElement

/--
`N` TODO

Predicate logic:

  abbrev N := N_Landau

Predicate logic (unfolded):

  abbrev N := N_Landau (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev N := N_Landau
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
abbrev N := N_Landau

abbrev N_LRA := N

abbrev N_Mathlib := LRA.NumberSystems.NaturalNumbers.LRA_MATHLIB_N

/--
`N_0` TODO

Predicate logic:

  abbrev N_0 := N_VonNeumann

Predicate logic (unfolded):

  abbrev N_0 := N_VonNeumann (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev N_0 := N_VonNeumann
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
abbrev N_0 := N_VonNeumann

abbrev W_Mathlib := Nat

/--
`Z_Polish` TODO

Predicate logic:

  abbrev Z_Polish :=
  LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z

Predicate logic (unfolded):

  abbrev Z_Polish :=
  LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Z_Polish :=
  LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z
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
abbrev Z_Polish :=
  LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z

/--
`Z` TODO

Predicate logic:

  abbrev Z := Z_Polish

Predicate logic (unfolded):

  abbrev Z := Z_Polish (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Z := Z_Polish
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
abbrev Z := Z_Polish

abbrev Z_LRA := Z

abbrev Z_Mathlib := Int

abbrev Q_Mathlib := Rat

abbrev R_Mathlib := Real

/--
`GaussianInt_OrderedPairs` TODO

Predicate logic:

  abbrev GaussianInt_OrderedPairs :=
  LRA.NumberSystems.GaussianIntegers.Interface.ModelTheory.ActiveGaussianInteger

Predicate logic (unfolded):

  abbrev GaussianInt_OrderedPairs :=
  LRA.NumberSystems.GaussianIntegers.Interface.ModelTheory.ActiveGaussianInteger (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev GaussianInt_OrderedPairs :=
  LRA.NumberSystems.GaussianIntegers.Interface.ModelTheory.ActiveGaussianInteger
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
abbrev GaussianInt_OrderedPairs :=
  LRA.NumberSystems.GaussianIntegers.Interface.ModelTheory.ActiveGaussianInteger

/--
`GaussianInt` TODO

Predicate logic:

  abbrev GaussianInt := GaussianInt_OrderedPairs

Predicate logic (unfolded):

  abbrev GaussianInt := GaussianInt_OrderedPairs (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev GaussianInt := GaussianInt_OrderedPairs
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
abbrev GaussianInt := GaussianInt_OrderedPairs

/-!
`ComplexNumbers`'s only construction, `OrderedPairs.ComplexNumber R`, is
already generic over any base type `R` — it's the generic interface
itself, not a fixed construction that needs one canonical witness the way
`NaturalNumbers`/`Integers`/`RationalNumbers`/`RealNumbers` do. Its
`Add`/`Mul`/`Neg`/`Inv`/`OfNat` instances are picked up automatically from
whatever instances `R` itself carries (`ComplexNumbers/Constructions/
OrderedPairs/Operations.lean`), so `C` is kept generic here rather than
defaulted to one concrete `R` — unlike `N`/`Z`/`GaussianInt`, there isn't
a canonical choice to default to. Concrete instantiations (e.g. over
`Q_RationalQuotientFractions`) live in `Carriers/Witnesses.lean`.
-/

/--
`C` TODO

Predicate logic:

  abbrev C (R : Type u) :=
  LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R

Predicate logic (unfolded):

  abbrev C (R : Type u) :=
  LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev C (R : Type u) :=
  LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R
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
abbrev C (R : Type u) :=
  LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R

abbrev C_Mathlib := ℂ

/-!
Unlike the other five `RealNumbers` constructions grounded in
`Carriers/Witnesses.lean`, `Dyadic`'s ground carrier needs no witness at
all: `Dyadic.Expansion` (signed binary expansions — `zero`, or a sign
plus a `NonzeroUnsignedExpansion` built from a finite `WholeBinaryNumeral`
integer part and an infinite canonical `CanonicalFraction` fractional
part) is a self-contained `inductive`, entirely independent of any
`RationalNumberSystem` parameter. It's the theory *around* `Expansion`
(relating it back to `Q`/Cauchy reals — arithmetic, order, the
isomorphism with `Cauchy.Carrier`) that needs a
`RationalDyadicApproximationData` witness, and that witness is not built
— see `Carriers/Witnesses.lean` for why.
-/

/--
`R_Dyadic` TODO

Predicate logic:

  abbrev R_Dyadic :=
  LRA.NumberSystems.RealNumbers.Dyadic.Expansion

Predicate logic (unfolded):

  abbrev R_Dyadic :=
  LRA.NumberSystems.RealNumbers.Dyadic.Expansion (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev R_Dyadic :=
  LRA.NumberSystems.RealNumbers.Dyadic.Expansion
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
abbrev R_Dyadic :=
  LRA.NumberSystems.RealNumbers.Dyadic.Expansion

end LRA.NumberSystems.Carriers
