import LRA.Operation.Definition
import LRA.Operation.Laws.Associative.Definition
import LRA.Operation.Laws.Identity.Definition
import LRA.Order.OrderedSets.Preorder.Definition

namespace LRA.Operation

universe u

/--
`Divides` TODO

Predicate logic:

  ∀ {Alpha : Type u} (multiplication : LRA.Operation.BinaryOperation Alpha) (a a_1 : Alpha), Exists fun witness => a_1 = multiplication a witness

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (multiplication : Alpha → Alpha → Alpha) (a a_1 : Alpha), Exists fun witness => a_1 = multiplication a witness

Logical form (Lean):

```lean
def Divides {Alpha : Type u}
    (multiplication : BinaryOperation Alpha) :
    LRA.Relation.Endorelation Alpha :=
  fun divisor dividend =>
    exists witness, dividend = multiplication divisor witness
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases, unfold

-/
def Divides {Alpha : Type u}
    (multiplication : BinaryOperation Alpha) :
    LRA.Relation.Endorelation Alpha :=
  fun divisor dividend =>
    exists witness, dividend = multiplication divisor witness

/--
`AssociatedByDivisibility` TODO

Predicate logic:

  ∀ {Alpha : Type u} (multiplication : LRA.Operation.BinaryOperation Alpha) (a a_1 : Alpha), (LRA.Operation.Divides multiplication a a_1 ∧ LRA.Operation.Divides multiplication a_1 a)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (multiplication : Alpha → Alpha → Alpha) (a a_1 : Alpha), (Exists fun witness => a_1 = multiplication a witness ∧ Exists fun witness => a = multiplication a_1 witness)

Logical form (Lean):

```lean
def AssociatedByDivisibility {Alpha : Type u}
    (multiplication : BinaryOperation Alpha) :
    LRA.Relation.Endorelation Alpha :=
  fun first second =>
    Divides multiplication first second /\ Divides multiplication second first
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def AssociatedByDivisibility {Alpha : Type u}
    (multiplication : BinaryOperation Alpha) :
    LRA.Relation.Endorelation Alpha :=
  fun first second =>
    Divides multiplication first second /\ Divides multiplication second first

/--
`DivisibilityPreorder` TODO

Predicate logic:

  LRA.Order.Preorder (Divides multiplication)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {multiplication : Alpha → Alpha → Alpha} {identity : Alpha}, (∀ (first second third : Alpha), multiplication (multiplication first second) third = multiplication first (multiplication second third) ∧ (∀ (element : Alpha), multiplication identity element = element ∧ ∀ (element : Alpha), multiplication element identity = element)) → (∀ (x : Alpha), Exists fun witness => x = multiplication x witness ∧ ∀ (x y z : Alpha), (Exists fun witness => y = multiplication x witness) → (Exists fun witness => z = multiplication y witness) → Exists fun witness => z = multiplication x witness)

Logical form (Lean):

```lean
theorem DivisibilityPreorder
    {Alpha : Type u}
    {multiplication : BinaryOperation Alpha}
    {identity : Alpha}
    (multiplicationIsAssociative :
      LRA.Operation.Laws.Associative.Associative multiplication)
    (identityIsTwoSided :
      LRA.Operation.Laws.Identity.TwoSidedIdentity multiplication identity) :
    LRA.Order.Preorder (Divides multiplication)
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
theorem DivisibilityPreorder
    {Alpha : Type u}
    {multiplication : BinaryOperation Alpha}
    {identity : Alpha}
    (multiplicationIsAssociative :
      LRA.Operation.Laws.Associative.Associative multiplication)
    (identityIsTwoSided :
      LRA.Operation.Laws.Identity.TwoSidedIdentity multiplication identity) :
    LRA.Order.Preorder (Divides multiplication) := by
  sorry
end LRA.Operation
