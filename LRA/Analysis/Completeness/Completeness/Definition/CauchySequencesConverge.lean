namespace LRA.Analysis.Completeness

universe u

/--
`CauchySequencesConverge` TODO

Predicate logic:

  ∀ (F : Type u) [inst : Add F] [inst_1 : Neg F] [inst_2 : OfNat F 0] [inst_3 : LE F] (a : Nat → F), (∀ (ε : F), inst_3.le 0 ε → Ne ε 0 → Exists fun N => ∀ (m n : Nat), instLENat.le N m → instLENat.le N n → (inst_3.le (inst_1.neg ε) (instHAdd.hAdd (a m) (inst_1.neg (a n))) ∧ inst_3.le (instHAdd.hAdd (a m) (inst_1.neg (a n))) ε)) → Exists fun L => ∀ (ε : F), inst_3.le 0 ε → Ne ε 0 → Exists fun N => ∀ (n : Nat), instLENat.le N n → (inst_3.le (inst_1.neg ε) (instHAdd.hAdd (a n) (inst_1.neg L)) ∧ inst_3.le (instHAdd.hAdd (a n) (inst_1.neg L)) ε)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (ε : F), inst_3.le 0 ε → (ε = 0 → False) → Exists fun N => ∀ (m n : Nat), instLENat.le N m → instLENat.le N n → (inst_3.le (inst_1.neg ε) ({ hAdd := fun a b => inst.add a b }.hAdd (a m) (inst_1.neg (a n))) ∧ inst_3.le ({ hAdd := fun a b => inst.add a b }.hAdd (a m) (inst_1.neg (a n))) ε)) → Exists fun L => ∀ (ε : F), inst_3.le 0 ε → (ε = 0 → False) → Exists fun N => ∀ (n : Nat), instLENat.le N n → (inst_3.le (inst_1.neg ε) ({ hAdd := fun a b => inst.add a b }.hAdd (a n) (inst_1.neg L)) ∧ inst_3.le ({ hAdd := fun a b => inst.add a b }.hAdd (a n) (inst_1.neg L)) ε)

Logical form (Lean):

```lean
def CauchySequencesConverge
    (F : Type u) [Add F] [Neg F] [OfNat F 0] [LE F] : Prop :=
  ∀ a : Nat → F,
    (∀ ε : F, 0 ≤ ε → ε ≠ 0 →
      ∃ N : Nat, ∀ m n : Nat, N ≤ m → N ≤ n →
        -ε ≤ a m + -(a n) ∧ a m + -(a n) ≤ ε) →
    ∃ L : F, ∀ ε : F, 0 ≤ ε → ε ≠ 0 →
      ∃ N : Nat, ∀ n : Nat, N ≤ n →
        -ε ≤ a n + -L ∧ a n + -L ≤ ε
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
def CauchySequencesConverge
    (F : Type u) [Add F] [Neg F] [OfNat F 0] [LE F] : Prop :=
  ∀ a : Nat → F,
    (∀ ε : F, 0 ≤ ε → ε ≠ 0 →
      ∃ N : Nat, ∀ m n : Nat, N ≤ m → N ≤ n →
        -ε ≤ a m + -(a n) ∧ a m + -(a n) ≤ ε) →
    ∃ L : F, ∀ ε : F, 0 ≤ ε → ε ≠ 0 →
      ∃ N : Nat, ∀ n : Nat, N ≤ n →
        -ε ≤ a n + -L ∧ a n + -L ≤ ε

end LRA.Analysis.Completeness
