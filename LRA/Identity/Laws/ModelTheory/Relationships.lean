import LRA.Identity.Laws.ModelTheory.SOLHenkin
import LRA.Identity.Laws.ModelTheory.SOLFull
import LRA.Identity.Interface.ModelTheory.SOL.Relationships

namespace LRA.Identity.Logic.SOL

universe u

/--
`FullIdentityTheory.ToHenkin` TODO

Predicate logic:

  ∀ {Carrier : Type u} {R : Carrier → Carrier → Prop} (domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier), LRA.Identity.Logic.SOL.FullIdentityTheory R → LRA.Identity.Logic.SOL.HenkinIdentityTheory domain R

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {R : Carrier → Carrier → Prop} (domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier), ((∀ (x : Carrier), R x x) ∧ (∀ (x y : Carrier), R x y → ∀ (P : Carrier → Prop), True → P x → P y)) → ((∀ (x : Carrier), R x x) ∧ (∀ (x y : Carrier), R x y → ∀ (P : Carrier → Prop), domain.Admissible P → P x → P y))

Logical form (Lean):

```lean
theorem FullIdentityTheory.ToHenkin {Carrier : Type u}
    {R : Carrier -> Carrier -> Prop}
    (domain : HenkinPredicateDomain Carrier)
    (h : FullIdentityTheory R) : HenkinIdentityTheory domain R
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
theorem FullIdentityTheory.ToHenkin {Carrier : Type u}
    {R : Carrier -> Carrier -> Prop}
    (domain : HenkinPredicateDomain Carrier)
    (h : FullIdentityTheory R) : HenkinIdentityTheory domain R := by
  sorry

/--
`HenkinIdentityTheory.ToFullOfAllPredicates` TODO

Predicate logic:

  ∀ {Carrier : Type u} {domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier} {R : Carrier → Carrier → Prop}, (LRA.Identity.Logic.SOL.HenkinIdentityTheory domain R ∧ (∀ (P : Carrier → Prop), domain.Admissible P)) → LRA.Identity.Logic.SOL.FullIdentityTheory R

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier} {R : Carrier → Carrier → Prop}, (((∀ (x : Carrier), R x x) ∧ (∀ (x y : Carrier), R x y → ∀ (P : Carrier → Prop), domain.Admissible P → P x → P y)) ∧ (∀ (P : Carrier → Prop), domain.Admissible P)) → ((∀ (x : Carrier), R x x) ∧ (∀ (x y : Carrier), R x y → ∀ (P : Carrier → Prop), True → P x → P y))

Logical form (Lean):

```lean
theorem HenkinIdentityTheory.ToFullOfAllPredicates {Carrier : Type u}
    {domain : HenkinPredicateDomain Carrier}
    {R : Carrier -> Carrier -> Prop}
    (h : HenkinIdentityTheory domain R)
    (hAll : forall P, domain.Admissible P) : FullIdentityTheory R
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
theorem HenkinIdentityTheory.ToFullOfAllPredicates {Carrier : Type u}
    {domain : HenkinPredicateDomain Carrier}
    {R : Carrier -> Carrier -> Prop}
    (h : HenkinIdentityTheory domain R)
    (hAll : forall P, domain.Admissible P) : FullIdentityTheory R := by
  sorry

/--
`FullModelToHenkinIsFull` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} (M : LRA.ModelTheory.SecondOrder.FullModel S), LRA.Identity.ModelTheory.SOL.IsFull M.toHenkinModel

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} (M : LRA.ModelTheory.SecondOrder.FullModel S), ((∀ (arity : Nat) (relation_ : (Fin arity → M.toHenkinModel.Domain) → Prop), relation_ ∈ M.toHenkinModel.RelationDomain arity) ∧ (∀ (arity : Nat) (function_ : (Fin arity → M.toHenkinModel.Domain) → M.toHenkinModel.Domain), function_ ∈ M.toHenkinModel.FunctionDomain arity))

Logical form (Lean):

```lean
theorem FullModelToHenkinIsFull {S : LRA.Logic.Signature}
    (M : LRA.ModelTheory.SecondOrder.FullModel S) :
    LRA.Identity.ModelTheory.SOL.IsFull M.toHenkinModel
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
theorem FullModelToHenkinIsFull {S : LRA.Logic.Signature}
    (M : LRA.ModelTheory.SecondOrder.FullModel S) :
    LRA.Identity.ModelTheory.SOL.IsFull M.toHenkinModel := by
  sorry

end LRA.Identity.Logic.SOL
