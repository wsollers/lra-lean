-- LRA/NumberSystems/RealNumbers/Constructions/Dedekind/Carrier.lean
-- The Dedekind-cut predicate and carrier: rational carrier abbreviations,
-- the cut predicate, the cut subtype, membership, and extensionality.

import LRA.VolumeII.NumberSystems.Models

namespace LRA.NumberSystems.RealNumbers.Dedekind

open LRA.NumberSystems.Models

/-!
Lean module: LRA.NumberSystems.RealNumbers.Dedekind
Source: LRA/VolumeII/RealNumbers/Dedekind.lean
Verification status: definitions and final theorem statements complete; proofs pending

Moved from `LRA.VolumeII.RealNumbers.Dedekind` (previously one 1388-line
file covering the whole pipeline); split per §1.6.1 into `Carrier` (this
file), `Equivalence`, `WellFoundedness`, `Operations`, `WellDefinedness`,
`Laws`, `Behavior`, `Instances`. Unlike the quotient-based Rational/Cauchy
constructions, `Cut` is a subtype (no `Setoid`/`Quotient`), so
`Equivalence.lean` is repurposed to carry the order structure that plays
the analogous role -- see its header comment. See `RealNumbers/ProofOrder.md`.
-/

variable (rational_model : RationalModel)

/--
**[Abbrev — Rational]**

Mathematical statement (Lean): `abbrev Rational`.


Logical form:

```lean
abbrev Rational := rational_model.signature.carrier
```
-/
abbrev Rational := rational_model.signature.carrier
/--
**[Abbrev — RationalSet]**

Mathematical statement (Lean): `abbrev RationalSet`.


Logical form:

```lean
abbrev RationalSet := Rational rational_model → Prop
```
-/
abbrev RationalSet := Rational rational_model → Prop


/-- Definition 1.1: the Dedekind-cut predicate.

Mathematical statement (Lean): `def IsCut (lower_set : RationalSet rational_model) : Prop`.


Logical form:

```lean
def IsCut (lower_set : RationalSet rational_model) : Prop :=
  (∃ value, lower_set value) ∧
  (∃ value, ¬ lower_set value) ∧
  (∀ upper lower,
    lower_set upper →
    rational_model.signature.StrictOrder lower upper →
    lower_set lower) ∧
  (∀ value,
    lower_set value →
    ∃ greater,
      lower_set greater ∧
      rational_model.signature.StrictOrder value greater)
```
-/
def IsCut (lower_set : RationalSet rational_model) : Prop :=
  (∃ value, lower_set value) ∧
  (∃ value, ¬ lower_set value) ∧
  (∀ upper lower,
    lower_set upper →
    rational_model.signature.StrictOrder lower upper →
    lower_set lower) ∧
  (∀ value,
    lower_set value →
    ∃ greater,
      lower_set greater ∧
      rational_model.signature.StrictOrder value greater)


/-- Definition 1.2: the Dedekind-real carrier.

Mathematical statement (Lean): `abbrev Cut`.


Logical form:

```lean
abbrev Cut := { lower_set : RationalSet rational_model // IsCut rational_model lower_set }
```
-/
abbrev Cut := { lower_set : RationalSet rational_model // IsCut rational_model lower_set }


/-- Membership of a rational in a cut.

Mathematical statement (Lean): `def contains (cut : Cut rational_model) (value : Rational rational_model) : Prop`.


Logical form:

```lean
def contains (cut : Cut rational_model) (value : Rational rational_model) : Prop :=
  cut.1 value
```
-/
def contains (cut : Cut rational_model) (value : Rational rational_model) : Prop :=
  cut.1 value


/-- Theorem 1.3: equality of cuts is extensional equality.

Mathematical statement (Lean): `theorem cut_extensionality (first second : Cut rational_model) : first = second ↔ ∀ value, contains rational_model first value ↔ contains rational_model second value`.

*Proof status:* proof pending


Logical form:

```lean
theorem cut_extensionality (first second : Cut rational_model) :
    first = second ↔
      ∀ value,
        contains rational_model first value ↔
        contains rational_model second value
```
-/
theorem cut_extensionality (first second : Cut rational_model) :
    first = second ↔
      ∀ value,
        contains rational_model first value ↔
        contains rational_model second value := by
  sorry

end LRA.NumberSystems.RealNumbers.Dedekind
