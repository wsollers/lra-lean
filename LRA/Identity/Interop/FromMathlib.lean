import LRA.Identity.Interface
import LRA.Identity.Substitution

namespace LRA.Identity

universe u v

/--
`NativeEquality` TODO

Predicate logic:

  ∀ (Carrier : Type u) (a a_1 : Carrier), a = a_1

Predicate logic (unfolded):

  ∀ (Carrier : Type u) (a a_1 : Carrier), a = a_1

Logical form (Lean):

```lean
def NativeEquality (Carrier : Type u) : Carrier -> Carrier -> Prop :=
  EqualityDiagonal Carrier
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
def NativeEquality (Carrier : Type u) : Carrier -> Carrier -> Prop :=
  EqualityDiagonal Carrier

/--
`NativeEqualityIsDiagonal` TODO

Predicate logic:

  ∀ left right, NativeEquality Carrier left right ↔ left = right

Predicate logic (unfolded):

  ∀ (Carrier : Type u) (left right : Carrier), left = right ↔ left = right

Logical form (Lean):

```lean
theorem NativeEqualityIsDiagonal (Carrier : Type u) :
    ∀ left right, NativeEquality Carrier left right ↔ left = right
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
theorem NativeEqualityIsDiagonal (Carrier : Type u) :
    ∀ left right, NativeEquality Carrier left right ↔ left = right := by
  sorry

/--
`FunctionCongruence` TODO

Predicate logic:

  (left = right) → function left = function right

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} {left right : Domain}, left = right → ∀ (function : Domain → Codomain), function left = function right

Logical form (Lean):

```lean
theorem FunctionCongruence {Domain : Type u} {Codomain : Type v}
    {left right : Domain}
    (ObjectsAreEqual : left = right)
    (function : Domain -> Codomain) :
    function left = function right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem FunctionCongruence {Domain : Type u} {Codomain : Type v}
    {left right : Domain}
    (ObjectsAreEqual : left = right)
    (function : Domain -> Codomain) :
    function left = function right := by
  sorry

/--
`BinaryFunctionCongruence` TODO

Predicate logic:

  (left = left' ∧ right = right') → operation left right = operation left' right'

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {left left' right right' : Carrier}, (left = left' ∧ right = right') → ∀ (operation : Carrier → Carrier → Carrier), operation left right = operation left' right'

Logical form (Lean):

```lean
theorem BinaryFunctionCongruence {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left' right'
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem BinaryFunctionCongruence {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right')
    (operation : Carrier -> Carrier -> Carrier) :
    operation left right = operation left' right' := by
  sorry

/--
`RelationCongruence` TODO

Predicate logic:

  (left = right) → relation left ↔ relation right

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {left right : Carrier}, left = right → ∀ (relation : Carrier → Prop), relation left ↔ relation right

Logical form (Lean):

```lean
theorem RelationCongruence {Carrier : Type u}
    {left right : Carrier}
    (ObjectsAreEqual : left = right)
    (relation : Carrier -> Prop) :
    relation left ↔ relation right
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
theorem RelationCongruence {Carrier : Type u}
    {left right : Carrier}
    (ObjectsAreEqual : left = right)
    (relation : Carrier -> Prop) :
    relation left ↔ relation right := by
  sorry

/--
`BinaryRelationCongruence` TODO

Predicate logic:

  (left = left' ∧ right = right') → relation left right ↔ relation left' right'

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {left left' right right' : Carrier}, (left = left' ∧ right = right') → ∀ (relation : Carrier → Carrier → Prop), relation left right ↔ relation left' right'

Logical form (Lean):

```lean
theorem BinaryRelationCongruence {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right')
    (relation : Carrier -> Carrier -> Prop) :
    relation left right ↔ relation left' right'
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
theorem BinaryRelationCongruence {Carrier : Type u}
    {left left' right right' : Carrier}
    (LeftsAreEqual : left = left')
    (RightsAreEqual : right = right')
    (relation : Carrier -> Carrier -> Prop) :
    relation left right ↔ relation left' right' := by
  sorry

end LRA.Identity
