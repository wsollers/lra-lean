
import LRA.NumberSystems.Integers.Interface.ModelTheory.Model
import LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.Model
import LRA.NumberSystems.RealNumbers.Interface.ModelTheory.Model

namespace LRA.NumberSystems.RealNumbers.Dedekind

open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

variable (rational_model : RationalModel)

/--
`Rational` TODO

Predicate logic:

  abbrev Rational := rational_model.signature.carrier

Predicate logic (unfolded):

  abbrev Rational := rational_model.signature.carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Rational := rational_model.signature.carrier
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
abbrev Rational := rational_model.signature.carrier

/--
`RationalSet` TODO

Predicate logic:

  abbrev RationalSet := Rational rational_model → Prop

Predicate logic (unfolded):

  abbrev RationalSet := Rational rational_model → Prop (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev RationalSet := Rational rational_model → Prop
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
abbrev RationalSet := Rational rational_model → Prop

/--
`IsCut` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (lower_set : LRA.NumberSystems.RealNumbers.Dedekind.RationalSet rational_model), (Exists fun value => lower_set value ∧ (Exists fun value => ¬ lower_set value ∧ (∀ (upper : LRA.NumberSystems.RealNumbers.Dedekind.Rational rational_model) (lower : rational_model.signature.carrier), lower_set upper → rational_model.signature.StrictOrder lower upper → lower_set lower ∧ ∀ (value : LRA.NumberSystems.RealNumbers.Dedekind.Rational rational_model), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.StrictOrder value greater))))

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (lower_set : rational_model.signature.toCarrierBundle.1 → Prop), (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))

Logical form (Lean):

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

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

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

/--
`Cut` TODO

Predicate logic:

  abbrev Cut := { lower_set : RationalSet rational_model // IsCut rational_model lower_set }

Predicate logic (unfolded):

  abbrev Cut := { lower_set : RationalSet rational_model // IsCut rational_model lower_set } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Cut := { lower_set : RationalSet rational_model // IsCut rational_model lower_set }
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
abbrev Cut := { lower_set : RationalSet rational_model // IsCut rational_model lower_set }

/--
`contains` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (cut : LRA.NumberSystems.RealNumbers.Dedekind.Cut rational_model) (value : LRA.NumberSystems.RealNumbers.Dedekind.Rational rational_model), cut.1 value

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (cut : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))) (value : rational_model.signature.toCarrierBundle.1), cut.1 value

Logical form (Lean):

```lean
def contains (cut : Cut rational_model) (value : Rational rational_model) : Prop :=
  cut.1 value
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
def contains (cut : Cut rational_model) (value : Rational rational_model) : Prop :=
  cut.1 value

/--
`cut_extensionality` TODO

Predicate logic:

  first = second ↔ ∀ value, contains rational_model first value ↔ contains rational_model second value

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (first second : Subtype fun lower_set => (Exists fun value => lower_set value ∧ (Exists fun value => lower_set value → False ∧ (∀ (upper lower : rational_model.signature.toCarrierBundle.1), lower_set upper → rational_model.signature.toOrderedRingSignature.2 lower upper → lower_set lower ∧ ∀ (value : rational_model.signature.toCarrierBundle.1), lower_set value → Exists fun greater => (lower_set greater ∧ rational_model.signature.toOrderedRingSignature.2 value greater))))), first = second ↔ ∀ (value : rational_model.signature.toCarrierBundle.1), first.1 value ↔ second.1 value

Logical form (Lean):

```lean
theorem cut_extensionality (first second : Cut rational_model) :
    first = second ↔
      ∀ value,
        contains rational_model first value ↔
        contains rational_model second value
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem cut_extensionality (first second : Cut rational_model) :
    first = second ↔
      ∀ value,
        contains rational_model first value ↔
        contains rational_model second value := by
  sorry

end LRA.NumberSystems.RealNumbers.Dedekind
