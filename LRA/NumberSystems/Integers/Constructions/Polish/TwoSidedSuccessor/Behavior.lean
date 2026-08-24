
import LRA.NumberSystems.Integers.Constructions.Polish.TwoSidedSuccessor.Laws

namespace LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor

/--
`succ_zero_eq_one` TODO

Predicate logic:

  succ Z.zero = one

Predicate logic (unfolded):

  LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) n) a) a) LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.one

Logical form (Lean):

```lean
theorem succ_zero_eq_one : succ Z.zero = one
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
theorem succ_zero_eq_one : succ Z.zero = one := by
  sorry

/--
`pred_zero_eq_neg_one` TODO

Predicate logic:

  pred Z.zero = -one

Predicate logic (unfolded):

  LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.1 LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.one

Logical form (Lean):

```lean
theorem pred_zero_eq_neg_one : pred Z.zero = -one
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
theorem pred_zero_eq_neg_one : pred Z.zero = -one := by
  sorry

/--
`neg_one_lt_zero_lt_one` TODO

Predicate logic:

  -one ∈ Z < Z.zero ∧ Z.zero ∈ Z < one

Predicate logic (unfolded):

  (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.1 (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.1 LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.one) LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero ∧ LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.1 LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.one)

Logical form (Lean):

```lean
theorem neg_one_lt_zero_lt_one : (-one : Z) < Z.zero ∧ (Z.zero : Z) < one
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem neg_one_lt_zero_lt_one : (-one : Z) < Z.zero ∧ (Z.zero : Z) < one := by
  sorry

end LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor
