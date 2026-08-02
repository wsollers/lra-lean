universe u

namespace LRA.VolumeI.Set

/-!
Well-foundedness and well-definedness, stated once, generically.

Two separate concerns, easy to conflate:

* Well-foundedness is about the membership relation itself: does `∈`
  admit an infinite descending chain? This only makes sense to ask for
  a *single-sorted* `Member : Carrier → Carrier → Prop` (element and
  container the same type) -- exactly the backends
  `NativeSetOperations.lean` is scoped to (`ZFCSet`, `ZFCTreeSet`,
  `ZFSet`). For `LRASet`/`MathlibSet`, the question can't even be
  typed, for the same reason Russell's paradox can't be stated for
  them -- see each backend's own `WellDefined.lean` for the resulting
  placeholder.
* Well-definedness is about operations respecting some notion of "the
  same object": does applying an operation to equivalent inputs give
  equivalent outputs? For a *plain* (non-quotient) carrier, take
  `Equiv := Eq` and every operation respects it for free, by ordinary
  Lean function congruence -- true of `LRASet`, `MathlibSet`, `ZFCSet`,
  `ZFSet` alike, none of which are quotient types. It only becomes
  real, non-trivial work for a *quotient* carrier (`ZFCTreeSet`, once
  built), where `Equiv` is the bisimulation the quotient was built
  from, and an operation defined via `Quotient.lift` genuinely has to
  be checked against it.
-/

/-- `Member` has no infinite descending chain: no `chain : Nat →
Carrier` with `chain (n + 1)` a member of `chain n` for every `n`. -/
def IsWellFounded {Carrier : Type u} (Member : Carrier → Carrier → Prop) : Prop :=
  ¬ ∃ chain : Nat → Carrier, ∀ n : Nat, Member (chain (n + 1)) (chain n)

/-- A unary operation respects an equivalence `Equiv`: applying it to
equivalent inputs gives equivalent outputs. -/
def RespectsEquivUnary {Carrier : Type u} (Equiv : Carrier → Carrier → Prop)
    (op : Carrier → Carrier) : Prop :=
  ∀ {a a' : Carrier}, Equiv a a' → Equiv (op a) (op a')

/-- A binary operation respects an equivalence `Equiv` in both
arguments. -/
def RespectsEquivBinary {Carrier : Type u} (Equiv : Carrier → Carrier → Prop)
    (op : Carrier → Carrier → Carrier) : Prop :=
  ∀ {a a' b b' : Carrier}, Equiv a a' → Equiv b b' → Equiv (op a b) (op a' b')

end LRA.VolumeI.Set
