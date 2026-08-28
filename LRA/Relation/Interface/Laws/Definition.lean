import LRA.Relation.Interface.Definitions

namespace LRA.Relation
universe u v

/--
`Reflexive` TODO

Predicate logic:

  ∀ {α : Type u} (R : LRA.Relation.Endorelation α) (x : α), R x x

Predicate logic (unfolded):

  ∀ {α : Type u} (R : α → α → Prop) (x : α), R x x

Logical form (Lean):

```lean
def Reflexive {α : Type u} (R : Endorelation α) : Prop := ∀ x, R x x
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
def Reflexive {α : Type u} (R : Endorelation α) : Prop := ∀ x, R x x

/--
`Irreflexive` TODO

Predicate logic:

  ∀ {α : Type u} (R : LRA.Relation.Endorelation α) (x : α), ¬ R x x

Predicate logic (unfolded):

  ∀ {α : Type u} (R : α → α → Prop) (x : α), R x x → False

Logical form (Lean):

```lean
def Irreflexive {α : Type u} (R : Endorelation α) : Prop := ∀ x, ¬ R x x
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
def Irreflexive {α : Type u} (R : Endorelation α) : Prop := ∀ x, ¬ R x x

/--
`Symmetric` TODO

Predicate logic:

  ∀ {α : Type u} (R : LRA.Relation.Endorelation α) (x y : α), R x y → R y x

Predicate logic (unfolded):

  ∀ {α : Type u} (R : α → α → Prop) (x y : α), R x y → R y x

Logical form (Lean):

```lean
def Symmetric {α : Type u} (R : Endorelation α) : Prop := ∀ x y, R x y → R y x
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
def Symmetric {α : Type u} (R : Endorelation α) : Prop := ∀ x y, R x y → R y x

/--
`Antisymmetric` TODO

Predicate logic:

  ∀ {α : Type u} (R : LRA.Relation.Endorelation α) (x y : α), (R x y ∧ R y x) → x = y

Predicate logic (unfolded):

  ∀ {α : Type u} (R : α → α → Prop) (x y : α), (R x y ∧ R y x) → x = y

Logical form (Lean):

```lean
def Antisymmetric {α : Type u} (R : Endorelation α) : Prop := ∀ x y, R x y → R y x → x = y
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
def Antisymmetric {α : Type u} (R : Endorelation α) : Prop := ∀ x y, R x y → R y x → x = y

/--
`Asymmetric` TODO

Predicate logic:

  ∀ {α : Type u} (R : LRA.Relation.Endorelation α) (x y : α), R x y → ¬ R y x

Predicate logic (unfolded):

  ∀ {α : Type u} (R : α → α → Prop) (x y : α), (R x y ∧ R y x) → False

Logical form (Lean):

```lean
def Asymmetric {α : Type u} (R : Endorelation α) : Prop := ∀ x y, R x y → ¬ R y x
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
def Asymmetric {α : Type u} (R : Endorelation α) : Prop := ∀ x y, R x y → ¬ R y x

/--
`Transitive` TODO

Predicate logic:

  ∀ {α : Type u} (R : LRA.Relation.Endorelation α) (x y z : α), (R x y ∧ R y z) → R x z

Predicate logic (unfolded):

  ∀ {α : Type u} (R : α → α → Prop) (x y z : α), (R x y ∧ R y z) → R x z

Logical form (Lean):

```lean
def Transitive {α : Type u} (R : Endorelation α) : Prop := ∀ x y z, R x y → R y z → R x z
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
def Transitive {α : Type u} (R : Endorelation α) : Prop := ∀ x y z, R x y → R y z → R x z

/--
`Connex` TODO

Predicate logic:

  ∀ {α : Type u} (R : LRA.Relation.Endorelation α) (x y : α), Or (R x y) (R y x)

Predicate logic (unfolded):

  ∀ {α : Type u} (R : α → α → Prop) (x y : α), Or (R x y) (R y x)

Logical form (Lean):

```lean
def Connex {α : Type u} (R : Endorelation α) : Prop := ∀ x y, R x y ∨ R y x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, Or.inl, Or.inr, cases, rcases, unfold

-/
def Connex {α : Type u} (R : Endorelation α) : Prop := ∀ x y, R x y ∨ R y x

/--
`Total` TODO

Predicate logic:

  ∀ {α : Type u} (R : LRA.Relation.Endorelation α) (x y : α), Or (R x y) (R y x)

Predicate logic (unfolded):

  ∀ {α : Type u} (R : α → α → Prop) (x y : α), Or (R x y) (R y x)

Logical form (Lean):

```lean
def Total {α : Type u} (R : Endorelation α) : Prop := Connex R
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
def Total {α : Type u} (R : Endorelation α) : Prop := Connex R

/--
`Trichotomous` TODO

Predicate logic:

  ∀ {α : Type u} (R : LRA.Relation.Endorelation α) (x y : α), Or (R x y) (Or (x = y)(R y x))

Predicate logic (unfolded):

  ∀ {α : Type u} (R : α → α → Prop) (x y : α), Or (R x y) (Or (x = y)(R y x))

Logical form (Lean):

```lean
def Trichotomous {α : Type u} (R : Endorelation α) : Prop := ∀ x y, R x y ∨ x = y ∨ R y x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, Or.inl, Or.inr, cases, rcases, unfold

-/
def Trichotomous {α : Type u} (R : Endorelation α) : Prop := ∀ x y, R x y ∨ x = y ∨ R y x

/--
`ExactlyOneOfThree` TODO

Predicate logic:

  ∀ (P Q S : Prop), Or ((P ∧ (¬ Q ∧ ¬ S))) (Or ((Q ∧ (¬ P ∧ ¬ S))) ((S ∧ (¬ P ∧ ¬ Q))))

Predicate logic (unfolded):

  ∀ (P Q S : Prop), Or ((P ∧ (Q → False ∧ S → False))) (Or ((Q ∧ (P → False ∧ S → False))) ((S ∧ (P → False ∧ Q → False))))

Logical form (Lean):

```lean
def ExactlyOneOfThree (P Q S : Prop) : Prop :=
  (P ∧ ¬ Q ∧ ¬ S) ∨ (Q ∧ ¬ P ∧ ¬ S) ∨ (S ∧ ¬ P ∧ ¬ Q)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, Or.inl, Or.inr, unfold

-/
def ExactlyOneOfThree (P Q S : Prop) : Prop :=
  (P ∧ ¬ Q ∧ ¬ S) ∨ (Q ∧ ¬ P ∧ ¬ S) ∨ (S ∧ ¬ P ∧ ¬ Q)

/--
`ExactlyTrichotomous` TODO

Predicate logic:

  ∀ {α : Type u} (R : LRA.Relation.Endorelation α) (x y : α), LRA.Relation.ExactlyOneOfThree (R x y) (x = y)(R y x)

Predicate logic (unfolded):

  ∀ {α : Type u} (R : α → α → Prop) (x y : α), Or ((R x y ∧ (x = y → False ∧ R y x → False))) (Or ((x = y ∧ (R x y → False ∧ R y x → False))) ((R y x ∧ (R x y → False ∧ x = y → False))))

Logical form (Lean):

```lean
def ExactlyTrichotomous {α : Type u} (R : Endorelation α) : Prop :=
  ∀ x y, ExactlyOneOfThree (R x y) (x = y) (R y x)
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
def ExactlyTrichotomous {α : Type u} (R : Endorelation α) : Prop :=
  ∀ x y, ExactlyOneOfThree (R x y) (x = y) (R y x)

/--
`LeftEuclidean` TODO

Predicate logic:

  ∀ {α : Type u} (R : LRA.Relation.Endorelation α) (z x y : α), (R x z ∧ R y z) → R x y

Predicate logic (unfolded):

  ∀ {α : Type u} (R : α → α → Prop) (z x y : α), (R x z ∧ R y z) → R x y

Logical form (Lean):

```lean
def LeftEuclidean {α : Type u} (R : Endorelation α) : Prop :=
  ∀ z x y, R x z → R y z → R x y
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
def LeftEuclidean {α : Type u} (R : Endorelation α) : Prop :=
  ∀ z x y, R x z → R y z → R x y

/--
`RightEuclidean` TODO

Predicate logic:

  ∀ {α : Type u} (R : LRA.Relation.Endorelation α) (z x y : α), (R z x ∧ R z y) → R x y

Predicate logic (unfolded):

  ∀ {α : Type u} (R : α → α → Prop) (z x y : α), (R z x ∧ R z y) → R x y

Logical form (Lean):

```lean
def RightEuclidean {α : Type u} (R : Endorelation α) : Prop :=
  ∀ z x y, R z x → R z y → R x y
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
def RightEuclidean {α : Type u} (R : Endorelation α) : Prop :=
  ∀ z x y, R z x → R z y → R x y

/--
`Dense` TODO

Predicate logic:

  ∀ {α : Type u} (R : LRA.Relation.Endorelation α) (x y : α), R x y → Exists fun z => (R x z ∧ R z y)

Predicate logic (unfolded):

  ∀ {α : Type u} (R : α → α → Prop) (x y : α), R x y → Exists fun z => (R x z ∧ R z y)

Logical form (Lean):

```lean
def Dense {α : Type u} (R : Endorelation α) : Prop :=
  ∀ x y, R x y → ∃ z, R x z ∧ R z y
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
def Dense {α : Type u} (R : Endorelation α) : Prop :=
  ∀ x y, R x y → ∃ z, R x z ∧ R z y

/--
`LeftTotal` TODO

Predicate logic:

  ∀ {α : Type u} {β : Type v} (R : LRA.Relation.HeterogeneousBinaryRelation α β) (x : α), Exists fun y => R x y

Predicate logic (unfolded):

  ∀ {α : Type u} {β : Type v} (R : α → β → Prop) (x : α), Exists fun y => R x y

Logical form (Lean):

```lean
def LeftTotal {α : Type u} {β : Type v}
    (R : HeterogeneousBinaryRelation α β) : Prop :=
  ∀ x, ∃ y, R x y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def LeftTotal {α : Type u} {β : Type v}
    (R : HeterogeneousBinaryRelation α β) : Prop :=
  ∀ x, ∃ y, R x y

/--
`RightTotal` TODO

Predicate logic:

  ∀ {α : Type u} {β : Type v} (R : LRA.Relation.HeterogeneousBinaryRelation α β) (y : β), Exists fun x => R x y

Predicate logic (unfolded):

  ∀ {α : Type u} {β : Type v} (R : α → β → Prop) (y : β), Exists fun x => R x y

Logical form (Lean):

```lean
def RightTotal {α : Type u} {β : Type v}
    (R : HeterogeneousBinaryRelation α β) : Prop :=
  ∀ y, ∃ x, R x y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def RightTotal {α : Type u} {β : Type v}
    (R : HeterogeneousBinaryRelation α β) : Prop :=
  ∀ y, ∃ x, R x y

/--
`RightUnique` TODO

Predicate logic:

  ∀ {α : Type u} {β : Type v} (R : LRA.Relation.HeterogeneousBinaryRelation α β) (x : α) (y₁ y₂ : β), (R x y₁ ∧ R x y₂) → y₁ = y₂

Predicate logic (unfolded):

  ∀ {α : Type u} {β : Type v} (R : α → β → Prop) (x : α) (y₁ y₂ : β), (R x y₁ ∧ R x y₂) → y₁ = y₂

Logical form (Lean):

```lean
def RightUnique {α : Type u} {β : Type v}
    (R : HeterogeneousBinaryRelation α β) : Prop :=
  ∀ x y₁ y₂, R x y₁ → R x y₂ → y₁ = y₂
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
def RightUnique {α : Type u} {β : Type v}
    (R : HeterogeneousBinaryRelation α β) : Prop :=
  ∀ x y₁ y₂, R x y₁ → R x y₂ → y₁ = y₂

/--
`LeftUnique` TODO

Predicate logic:

  ∀ {α : Type u} {β : Type v} (R : LRA.Relation.HeterogeneousBinaryRelation α β) (y : β) (x₁ x₂ : α), (R x₁ y ∧ R x₂ y) → x₁ = x₂

Predicate logic (unfolded):

  ∀ {α : Type u} {β : Type v} (R : α → β → Prop) (y : β) (x₁ x₂ : α), (R x₁ y ∧ R x₂ y) → x₁ = x₂

Logical form (Lean):

```lean
def LeftUnique {α : Type u} {β : Type v}
    (R : HeterogeneousBinaryRelation α β) : Prop :=
  ∀ y x₁ x₂, R x₁ y → R x₂ y → x₁ = x₂
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
def LeftUnique {α : Type u} {β : Type v}
    (R : HeterogeneousBinaryRelation α β) : Prop :=
  ∀ y x₁ x₂, R x₁ y → R x₂ y → x₁ = x₂

/--
`MinimalElement` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject) (minimum : Element), (minimum ∈ subset ∧ ∀ (element : Element), element ∈ subset → ¬ relation element minimum)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : Element → Element → Prop) (subset : SetObject) (minimum : Element), (inst.1 subset minimum ∧ ∀ (element : Element), inst.1 subset element → relation element minimum → False)

Logical form (Lean):

```lean
def MinimalElement {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : Endorelation Element)
    (subset : SetObject)
    (minimum : Element) : Prop :=
  minimum ∈ subset ∧
    ∀ element, element ∈ subset → ¬ relation element minimum
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def MinimalElement {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : Endorelation Element)
    (subset : SetObject)
    (minimum : Element) : Prop :=
  minimum ∈ subset ∧
    ∀ element, element ∈ subset → ¬ relation element minimum

/--
`MaximalElement` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject) (maximum : Element), (maximum ∈ subset ∧ ∀ (element : Element), element ∈ subset → ¬ relation maximum element)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : Element → Element → Prop) (subset : SetObject) (maximum : Element), (inst.1 subset maximum ∧ ∀ (element : Element), inst.1 subset element → relation maximum element → False)

Logical form (Lean):

```lean
def MaximalElement {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : Endorelation Element)
    (subset : SetObject)
    (maximum : Element) : Prop :=
  maximum ∈ subset ∧
    ∀ element, element ∈ subset → ¬ relation maximum element
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def MaximalElement {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : Endorelation Element)
    (subset : SetObject)
    (maximum : Element) : Prop :=
  maximum ∈ subset ∧
    ∀ element, element ∈ subset → ¬ relation maximum element

end LRA.Relation
