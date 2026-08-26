import LRA.Order.Bounds.Cofinal.Definition
import LRA.Set.Constructions.TypeSet.Definition

namespace LRA.AlgebraicStructures

universe u

/--
`IteratedSelfSum` TODO

Predicate logic:

  def IteratedSelfSum {R : Type u} [Add R] : Nat → R → R
  | 0, x => x
  | n + 1, x => IteratedSelfSum n x + x

Predicate logic (unfolded):

  def IteratedSelfSum {R : Type u} [Add R] : Nat → R → R
  | 0, x => x
  | n + 1, x => IteratedSelfSum n x + x (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def IteratedSelfSum {R : Type u} [Add R] : Nat → R → R
  | 0, x => x
  | n + 1, x => IteratedSelfSum n x + x
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
def IteratedSelfSum {R : Type u} [Add R] : Nat → R → R
  | 0, x => x
  | n + 1, x => IteratedSelfSum n x + x

/--
`Multiples` TODO

Predicate logic:

  ∀ {R : Type u} [inst : Add R] (x a : R), Exists fun n => a = LRA.AlgebraicStructures.IteratedSelfSum n x

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] (x a : R), Exists fun n => a = LRA.AlgebraicStructures.IteratedSelfSum n x

Logical form (Lean):

```lean
def Multiples {R : Type u} [Add R] (x : R) : LRA.Set.Constructions.TypeSet R :=
  fun y => exists n : Nat, y = IteratedSelfSum n x
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
def Multiples {R : Type u} [Add R] (x : R) : LRA.Set.Constructions.TypeSet R :=
  fun y => exists n : Nat, y = IteratedSelfSum n x

/--
`ArchimedeanLaw` TODO

Predicate logic:

  class ArchimedeanLaw (R : Type u)
    [Add R] [LT R] [OfNat R 0] : Prop where
  MultiplesAreCofinal :
    forall x : R, 0 < x -> LRA.Order.Cofinal (· < · : R → R → Prop) (Multiples x)

Predicate logic (unfolded):

  class ArchimedeanLaw (R : Type u)
    [Add R] [LT R] [OfNat R 0] : Prop where
  MultiplesAreCofinal :
    forall x : R, 0 < x -> LRA.Order.Cofinal (· < · : R → R → Prop) (Multiples x) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class ArchimedeanLaw (R : Type u)
    [Add R] [LT R] [OfNat R 0] : Prop where
  MultiplesAreCofinal :
    forall x : R, 0 < x -> LRA.Order.Cofinal (· < · : R → R → Prop) (Multiples x)
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
class ArchimedeanLaw (R : Type u)
    [Add R] [LT R] [OfNat R 0] : Prop where
  MultiplesAreCofinal :
    forall x : R, 0 < x -> LRA.Order.Cofinal (· < · : R → R → Prop) (Multiples x)

section Wrappers

variable {R : Type u}

/--
`MultiplesAreCofinal` TODO

Predicate logic:

  forall x : R, 0 < x -> LRA.Order.Cofinal · < · ∈ R → R → Prop (Multiples x)

Predicate logic (unfolded):

  ∀ {R : Type u} [inst : Add R] [inst_1 : LT R] [inst_2 : OfNat R (instOfNatNat 0).1], LRA.AlgebraicStructures.ArchimedeanLaw R → ∀ (x : R), inst_1.1 inst_2.1 x → ∀ (point : R), Exists fun element => (LRA.Set.instMembershipPredicateSet.1 (fun y => Exists fun n => y = LRA.AlgebraicStructures.IteratedSelfSum n x) element ∧ (fun x1 x2 => inst_1.1 x1 x2) point element)

Logical form (Lean):

```lean
theorem MultiplesAreCofinal
    [Add R] [LT R] [OfNat R 0] [ArchimedeanLaw R] :
    forall x : R, 0 < x -> LRA.Order.Cofinal (· < · : R → R → Prop) (Multiples x)
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
theorem MultiplesAreCofinal
    [Add R] [LT R] [OfNat R 0] [ArchimedeanLaw R] :
    forall x : R, 0 < x -> LRA.Order.Cofinal (· < · : R → R → Prop) (Multiples x) := by
  sorry

end Wrappers

end LRA.AlgebraicStructures
