-- LRA/NumberSystems/NaturalNumbers/Constructions/WholeNumbers/Carrier.lean
-- Construction of whole numbers by adjoining zero to the active natural-number carrier.

import LRA.NumberSystems.PeanoSystem.Definition

namespace LRA.NumberSystems.NaturalNumbers.Constructions.WholeNumbers

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/-!
Lean module: LRA.NumberSystems.NaturalNumbers.Constructions.WholeNumbers.Carrier
Source: docs/number-systems/gpt-01b-whole-numbers.md
Verification status: definitions complete; theorem proofs pending

A fourth construction of the zero-based naturals, alongside `VonNeumann`
(ZFC), `Presburger` (a fresh inductive type), and (indirectly, as the thing
being adjoined to) `Landau`: adjoin a new zero to *any* one-based Peano
system via `Option`. Generic over `Element`/`SetObject`, the same call made
for `Landau`'s own arithmetic and `Presburger`'s generic `PresburgerModel` --
not hard-committed to `LandauElement` specifically, since nothing here
requires it.
-/

/-- Arithmetic data already constructed on the one-based natural carrier. -/
structure NaturalArithmeticForWholeNumbers
    (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject
  strictOrder : Element → Element → Prop

variable (natural_data : NaturalArithmeticForWholeNumbers Element SetObject)

/-- `none` is the newly adjoined zero; `some n` is the embedded positive natural `n`. -/
abbrev Carrier
    (_natural_data : NaturalArithmeticForWholeNumbers Element SetObject) :=
  Option Element

/-- The adjoined zero. -/
def zero : Carrier natural_data := none

/-- The embedded one. -/
def one : Carrier natural_data := some natural_data.model.one

/-- Inclusion of the one-based natural carrier into the whole numbers. -/
def naturalEmbedding (value : Element) : Carrier natural_data := some value

/-- Successor on the whole numbers. -/
def successor : Carrier natural_data → Carrier natural_data
  | none => some natural_data.model.one
  | some value => some (natural_data.model.successor value)

/-- Strict order puts zero below every positive natural and otherwise uses
natural order. -/
def strictOrder : Carrier natural_data → Carrier natural_data → Prop
  | none, none => False
  | none, some _ => True
  | some _, none => False
  | some left, some right => natural_data.strictOrder left right

/-- Non-strict order is strict order or equality. -/
def nonstrictOrder (left right : Carrier natural_data) : Prop :=
  strictOrder natural_data left right ∨ left = right

end LRA.NumberSystems.NaturalNumbers.Constructions.WholeNumbers
