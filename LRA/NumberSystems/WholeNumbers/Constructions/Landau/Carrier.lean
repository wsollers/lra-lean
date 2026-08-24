
import LRA.NumberSystems.NaturalNumbers.Constructions.Landau.Operations

namespace LRA.NumberSystems.WholeNumbers.Constructions.Landau

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`NaturalArithmeticForWholeNumbers` TODO

Predicate logic:

  structure NaturalArithmeticForWholeNumbers
    (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject
  strictOrder : Element → Element → Prop
  strictOrder_trichotomous :
    ∀ first second,
      strictOrder first second ∨ first = second ∨ strictOrder second first
  strictOrder_transitive :
    ∀ first second third,
      strictOrder first second →
      strictOrder second third →
      strictOrder first third
  addition_preserves_and_reflects_strictOrder :
    ∀ first second translation,
      strictOrder first second ↔
        strictOrder
          (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition
            model first translation)
          (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition
            model second translation)
  multiplication_preserves_and_reflects_strictOrder :
    ∀ first second factor,
      strictOrder first second ↔
        strictOrder
          (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication
            model first factor)
          (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication
            model second factor)

Predicate logic (unfolded):

  structure NaturalArithmeticForWholeNumbers
    (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject
  strictOrder : Element → Element → Prop
  strictOrder_trichotomous :
    ∀ first second,
      strictOrder first second ∨ first = second ∨ strictOrder second first
  strictOrder_transitive :
    ∀ first second third,
      strictOrder first second →
      strictOrder second third →
      strictOrder first third
  addition_preserves_and_reflects_strictOrder :
    ∀ first second translation,
      strictOrder first second ↔
        strictOrder
          (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition
            model first translation)
          (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition
            model second translation)
  multiplication_preserves_and_reflects_strictOrder :
    ∀ first second factor,
      strictOrder first second ↔
        strictOrder
          (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication
            model first factor)
          (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication
            model second factor) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure NaturalArithmeticForWholeNumbers
    (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject
  strictOrder : Element → Element → Prop
  strictOrder_trichotomous :
    ∀ first second,
      strictOrder first second ∨ first = second ∨ strictOrder second first
  strictOrder_transitive :
    ∀ first second third,
      strictOrder first second →
      strictOrder second third →
      strictOrder first third
  addition_preserves_and_reflects_strictOrder :
    ∀ first second translation,
      strictOrder first second ↔
        strictOrder
          (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition
            model first translation)
          (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition
            model second translation)
  multiplication_preserves_and_reflects_strictOrder :
    ∀ first second factor,
      strictOrder first second ↔
        strictOrder
          (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication
            model first factor)
          (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication
            model second factor)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, Or.inl, Or.inr, cases, rcases

-/
structure NaturalArithmeticForWholeNumbers
    (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject
  strictOrder : Element → Element → Prop
  strictOrder_trichotomous :
    ∀ first second,
      strictOrder first second ∨ first = second ∨ strictOrder second first
  strictOrder_transitive :
    ∀ first second third,
      strictOrder first second →
      strictOrder second third →
      strictOrder first third
  addition_preserves_and_reflects_strictOrder :
    ∀ first second translation,
      strictOrder first second ↔
        strictOrder
          (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition
            model first translation)
          (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition
            model second translation)
  multiplication_preserves_and_reflects_strictOrder :
    ∀ first second factor,
      strictOrder first second ↔
        strictOrder
          (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication
            model first factor)
          (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication
            model second factor)

variable (natural_data : NaturalArithmeticForWholeNumbers Element SetObject)

/--
`Carrier` TODO

Predicate logic:

  abbrev Carrier
    (_natural_data : NaturalArithmeticForWholeNumbers Element SetObject) :=
  Option Element

Predicate logic (unfolded):

  abbrev Carrier
    (_natural_data : NaturalArithmeticForWholeNumbers Element SetObject) :=
  Option Element (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Carrier
    (_natural_data : NaturalArithmeticForWholeNumbers Element SetObject) :=
  Option Element
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
abbrev Carrier
    (_natural_data : NaturalArithmeticForWholeNumbers Element SetObject) :=
  Option Element

/--
`zero` TODO

Predicate logic:

  def zero : Carrier natural_data := none

Predicate logic (unfolded):

  def zero : Carrier natural_data := none (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def zero : Carrier natural_data := none
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
def zero : Carrier natural_data := none

/--
`one` TODO

Predicate logic:

  def one : Carrier natural_data := some natural_data.model.one

Predicate logic (unfolded):

  def one : Carrier natural_data := some natural_data.model.one (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def one : Carrier natural_data := some natural_data.model.one
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
def one : Carrier natural_data := some natural_data.model.one

/--
`naturalEmbedding` TODO

Predicate logic:

  def naturalEmbedding (value : Element) : Carrier natural_data := some value

Predicate logic (unfolded):

  def naturalEmbedding (value : Element) : Carrier natural_data := some value (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def naturalEmbedding (value : Element) : Carrier natural_data := some value
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
def naturalEmbedding (value : Element) : Carrier natural_data := some value

/--
`successor` TODO

Predicate logic:

  def successor : Carrier natural_data → Carrier natural_data
  | none => some natural_data.model.one
  | some value => some (natural_data.model.successor value)

Predicate logic (unfolded):

  def successor : Carrier natural_data → Carrier natural_data
  | none => some natural_data.model.one
  | some value => some (natural_data.model.successor value) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def successor : Carrier natural_data → Carrier natural_data
  | none => some natural_data.model.one
  | some value => some (natural_data.model.successor value)
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
def successor : Carrier natural_data → Carrier natural_data
  | none => some natural_data.model.one
  | some value => some (natural_data.model.successor value)

/--
`strictOrder` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject) (a a_1 : LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data), Option.rec (Option.casesOn a_1 ((fun _ => False) Unit.unit) fun val => (fun val => True) val) (fun val => (fun val => Option.casesOn a_1 ((fun val => False) val) fun val_1 => (fun left right => natural_data.strictOrder left right) val val_1) val) a

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject) (a a_1 : Option Element), Option.rec (Option.rec ((fun _ => False) Unit.unit) (fun val => (fun val => (fun val => True) val) val) a_1) (fun val => (fun val => Option.rec ((fun val => False) val) (fun val_1 => (fun val_2 => (fun left right => natural_data.2 left right) val val_2) val_1) a_1) val) a

Logical form (Lean):

```lean
def strictOrder : Carrier natural_data → Carrier natural_data → Prop
  | none, none => False
  | none, some _ => True
  | some _, none => False
  | some left, some right => natural_data.strictOrder left right
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
def strictOrder : Carrier natural_data → Carrier natural_data → Prop
  | none, none => False
  | none, some _ => True
  | some _, none => False
  | some left, some right => natural_data.strictOrder left right

/--
`nonstrictOrder` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject) (left right : LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier natural_data), Or (LRA.NumberSystems.WholeNumbers.Constructions.Landau.strictOrder natural_data left right) (left = right)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (natural_data : LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers Element SetObject) (left right : Option Element), Or (Option.rec (Option.rec ((fun _ => False) Unit.unit) (fun val => (fun val => (fun val => True) val) val) right) (fun val => (fun val => Option.rec ((fun val => False) val) (fun val_1 => (fun val_2 => (fun left right => natural_data.2 left right) val val_2) val_1) right) val) left) (left = right)

Logical form (Lean):

```lean
def nonstrictOrder (left right : Carrier natural_data) : Prop :=
  strictOrder natural_data left right ∨ left = right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases, unfold

-/
def nonstrictOrder (left right : Carrier natural_data) : Prop :=
  strictOrder natural_data left right ∨ left = right

end LRA.NumberSystems.WholeNumbers.Constructions.Landau
