import LRA.NumberSystems.NaturalNumbers.Constructions.Landau
import LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann
import LRA.NumberSystems.NaturalNumbers.Constructions.Presburger
import LRA.NumberSystems.Integers.Constructions.Polish
import LRA.NumberSystems.GaussianIntegers.Interface.ModelTheory.LStructure
import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs
import LRA.NumberSystems.RealNumbers.Constructions.Dyadic

namespace LRA.NumberSystems.Carriers

universe u

abbrev N_Landau :=
  LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauElement

abbrev N_VonNeumann :=
  LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement

abbrev N_Presburger :=
  LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerElement

abbrev N := N_Landau

abbrev N_0 := N_VonNeumann

abbrev Z_Polish :=
  LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z

abbrev Z := Z_Polish

abbrev GaussianInt_OrderedPairs :=
  LRA.NumberSystems.GaussianIntegers.Interface.ModelTheory.ActiveGaussianInteger

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

abbrev C (R : Type u) :=
  LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.ComplexNumber R

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

abbrev R_Dyadic :=
  LRA.NumberSystems.RealNumbers.Dyadic.Expansion

end LRA.NumberSystems.Carriers
