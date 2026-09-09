import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/--
`DistributiveLaws` TODO

Predicate logic:

  class DistributiveLaws (R : Type u) [Add R] [Mul R] : Prop where
    LeftDistributive :
      LRA.Operation.Laws.Distributive.LeftDistributive
        (fun a b : R => a * b) (fun a b : R => a + b)
    RightDistributive :
      LRA.Operation.Laws.Distributive.RightDistributive
        (fun a b : R => a * b) (fun a b : R => a + b)

Predicate logic (unfolded):

  class DistributiveLaws (R : Type u) [Add R] [Mul R] : Prop where
    LeftDistributive :
      LRA.Operation.Laws.Distributive.LeftDistributive
        (fun a b : R => a * b) (fun a b : R => a + b)
    RightDistributive :
      LRA.Operation.Laws.Distributive.RightDistributive
        (fun a b : R => a * b) (fun a b : R => a + b) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class DistributiveLaws (R : Type u) [Add R] [Mul R] : Prop where
  LeftDistributive :
    LRA.Operation.Laws.Distributive.LeftDistributive
      (fun a b : R => a * b) (fun a b : R => a + b)
  RightDistributive :
    LRA.Operation.Laws.Distributive.RightDistributive
      (fun a b : R => a * b) (fun a b : R => a + b)
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
class DistributiveLaws (R : Type u) [Add R] [Mul R] : Prop where
  LeftDistributive :
    LRA.Operation.Laws.Distributive.LeftDistributive
      (fun a b : R => a * b) (fun a b : R => a + b)
  RightDistributive :
    LRA.Operation.Laws.Distributive.RightDistributive
      (fun a b : R => a * b) (fun a b : R => a + b)

section Wrappers

variable {R : Type u} [Add R] [Mul R] [DistributiveLaws R]

/--
`LeftDistributive` TODO

Predicate logic:

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R], LRA.AlgebraicStructures.DistributiveLaws R → ∀ (a b c : R), instHMul.hMul a (instHAdd.hAdd b c) = instHAdd.hAdd (instHMul.hMul a b) (instHMul.hMul a c)

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    (none)
  Prove
    LRA.AlgebraicStructures.DistributiveLaws R → ∀ (a b c : R), { hMul := fun a b => inst_1.mul a b }.hMul a ({ hAdd := fun a b => inst.add a b }.hAdd b c) = { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul a b) ({ hMul := fun a b => inst_1.mul a b }.hMul a c)

Logical form (Lean):

```lean
theorem LeftDistributive : ∀ a b c : R, a * (b + c) = a * b + a * c
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
theorem LeftDistributive : ∀ a b c : R, a * (b + c) = a * b + a * c := by
  sorry
/--
`RightDistributive` TODO

Predicate logic:

  ∀ {R : Type u} [inst : Add R] [inst_1 : Mul R], LRA.AlgebraicStructures.DistributiveLaws R → ∀ (a b c : R), instHMul.hMul (instHAdd.hAdd a b) c = instHAdd.hAdd (instHMul.hMul a c) (instHMul.hMul b c)

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    (none)
  Prove
    LRA.AlgebraicStructures.DistributiveLaws R → ∀ (a b c : R), { hMul := fun a b => inst_1.mul a b }.hMul ({ hAdd := fun a b => inst.add a b }.hAdd a b) c = { hAdd := fun a b => inst.add a b }.hAdd ({ hMul := fun a b => inst_1.mul a b }.hMul a c) ({ hMul := fun a b => inst_1.mul a b }.hMul b c)

Logical form (Lean):

```lean
theorem RightDistributive : ∀ a b c : R, (a + b) * c = a * c + b * c
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
theorem RightDistributive : ∀ a b c : R, (a + b) * c = a * c + b * c := by
  sorry
end Wrappers

end LRA.AlgebraicStructures
