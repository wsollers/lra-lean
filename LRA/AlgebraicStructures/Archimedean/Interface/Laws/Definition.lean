import LRA.Order.Bounds.Cofinal.Definition
import LRA.Set.Constructions.TypeSet.Definition

namespace LRA.AlgebraicStructures

universe u

/--
`IteratedSelfSum` `n`-fold self-sum of `x`, indexed from `0` rather than `1`: `IteratedSelfSum 0 x = x` (one copy), `IteratedSelfSum n x = (n + 1) • x` in Mathlib's `nsmul` terms. Harmless for the Archimedean property below — a cofinal set of "at least one copy" multiples is cofinal iff the set including the `0`-copy (`0 • x = 0`) is, since `0` is never a needed witness except when `point < 0`, and `IteratedSelfSum 0 x = x` already covers that case.

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
`Multiples` The set of (one-indexed) multiples of `x`.

Predicate logic:

  ∀ {R : Type u} [inst : Add R] (x a : R), Exists fun n => a = LRA.AlgebraicStructures.IteratedSelfSum n x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun n => a = LRA.AlgebraicStructures.IteratedSelfSum n x

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
`ArchimedeanLaw` The Archimedean property for an ordered additive structure `(R, +, <, 0)`: for every positive `x`, the multiples of `x` are cofinal under `<` — for every `point : R`, some multiple of `x` exceeds it. This is the standard formulation for ordered groups and ordered fields alike (`∀ a > 0, ∀ b, ∃ n, n·a > b`); the purely-algebraic (unordered) formulation via divisibility in a commutative semigroup, and the valuation-theoretic (Ostrowski) formulation for absolute values, are different mathematical settings entirely and are not what this class states — they'd need their own home if ever formalized, not a case split inside this one.

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

  ∀ {R : Type u} [inst : Add R] [inst_1 : LT R] [inst_2 : OfNat R 0], LRA.AlgebraicStructures.ArchimedeanLaw R → ∀ (x : R), inst_1.lt 0 x → LRA.Order.Cofinal (fun x1 x2 => inst_1.lt x1 x2) (LRA.AlgebraicStructures.Multiples x)

Predicate logic (unfolded):

  Ambient
    (R, <)
  Objects
    (none)
  Prove
    LRA.AlgebraicStructures.ArchimedeanLaw R → ∀ (x : R), inst_1.lt 0 x → ∀ (point : R), Exists fun element => (LRA.Set.Constructions.instMembershipTypeSet.1 (fun y => Exists fun n => y = LRA.AlgebraicStructures.IteratedSelfSum n x) element ∧ (fun x1 x2 => inst_1.lt x1 x2) point element)

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
