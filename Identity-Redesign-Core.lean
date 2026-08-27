/-! Interface/Definitions — the generic API. No `Eq` anywhere. -/
namespace LRA.Identity
universe u

/-- The identity API. Any implementation supplies a relation and two laws.
`Ident` is the only thing downstream code may mention. -/
class IdentityRelation (Carrier : Type u) where
  Ident : Carrier → Carrier → Prop
  IdentReflexive : ∀ x : Carrier, Ident x x
  IdentLeibniz : ∀ {x y : Carrier}, Ident x y →
    ∀ Property : Carrier → Prop, Property x → Property y

export IdentityRelation (Ident IdentReflexive IdentLeibniz)

/-! ### Directly derivable vocabulary (Definitions) — all over `Ident` -/
section Definitions
variable {Carrier : Type u} [IdentityRelation Carrier]

def Distinct (left right : Carrier) : Prop := ¬ Ident left right
def HasWitness (P : Carrier → Prop) : Prop := ∃ x, P x
def HasNoWitness (P : Carrier → Prop) : Prop := ¬ ∃ x, P x
def AtMostOne (P : Carrier → Prop) : Prop :=
  ∀ left right, P left → P right → Ident left right
def NotAtMostOne (P : Carrier → Prop) : Prop :=
  ∃ left right, P left ∧ P right ∧ Distinct left right
def ExactlyOne (P : Carrier → Prop) : Prop := HasWitness P ∧ AtMostOne P
def AtLeastTwo (Carrier : Type u) [IdentityRelation Carrier] : Prop :=
  ∃ x y : Carrier, Distinct x y
def AtMostTwo (Carrier : Type u) [IdentityRelation Carrier] : Prop :=
  ∀ x y z : Carrier, Ident x y ∨ Ident y z ∨ Ident x z
end Definitions

/-! ### Theorems — proved once, from the API only -/
section Theorems
variable {Carrier : Type u} [IdentityRelation Carrier]

theorem IdentSymmetric {x y : Carrier} (h : Ident x y) : Ident y x :=
  IdentLeibniz h (fun z => Ident z x) (IdentReflexive x)

theorem IdentTransitive {x y z : Carrier} (hxy : Ident x y) (hyz : Ident y z) :
    Ident x z :=
  IdentLeibniz hyz (fun w => Ident x w) hxy

theorem IdentLeibnizIff {x y : Carrier} (h : Ident x y)
    (Property : Carrier → Prop) : Property x ↔ Property y :=
  ⟨IdentLeibniz h Property, IdentLeibniz (IdentSymmetric h) Property⟩

theorem IdentPreservesFunctions {Codomain : Type u} [IdentityRelation Codomain]
    {x y : Carrier} (h : Ident x y) (f : Carrier → Codomain) :
    Ident (f x) (f y) :=
  IdentLeibniz h (fun w => Ident (f x) (f w)) (IdentReflexive (f x))

theorem IdentPreservesRelations {x x' y y' : Carrier}
    (hx : Ident x x') (hy : Ident y y') (R : Carrier → Carrier → Prop) :
    R x y ↔ R x' y' := by
  constructor
  · intro hR
    exact IdentLeibniz hy (fun w => R x' w) (IdentLeibniz hx (fun w => R w y) hR)
  · intro hR
    exact IdentLeibniz (IdentSymmetric hy) (fun w => R x w)
      (IdentLeibniz (IdentSymmetric hx) (fun w => R w y') hR)

theorem IdentPreservesOperations {x x' y y' : Carrier}
    (hx : Ident x x') (hy : Ident y y') (op : Carrier → Carrier → Carrier) :
    Ident (op x y) (op x' y') :=
  IdentTransitive
    (IdentPreservesFunctions hx (fun w => op w y))
    (IdentPreservesFunctions hy (fun w => op x' w))

theorem DistinctIrreflexive (x : Carrier) : ¬ Distinct x x :=
  fun h => h (IdentReflexive x)

theorem DistinctSymmetric {x y : Carrier} (h : Distinct x y) : Distinct y x :=
  fun hyx => h (IdentSymmetric hyx)

theorem ExactlyOneNotAtLeastTwoWitnesses {P : Carrier → Prop}
    (h : ExactlyOne P) : ¬ NotAtMostOne P :=
  fun ⟨l, r, hl, hr, hd⟩ => hd (h.2 l r hl hr)
end Theorems

/-! ### The collapse theorem (Bridges). In Lean's logic, full Leibniz over
`Carrier → Prop` forces every implementation of the API to be `Eq`. -/
theorem IdentIsDiagonal {Carrier : Type u} [IdentityRelation Carrier]
    (x y : Carrier) : Ident x y ↔ x = y :=
  ⟨fun h => IdentLeibniz h (fun z => x = z) rfl,
   fun h => h ▸ IdentReflexive x⟩

end LRA.Identity

/-! Constructions/Mathlib — zero axioms. -/
namespace LRA.Identity.Construction.Mathlib
universe u
scoped instance instIdentityRelation (Carrier : Type u) : LRA.Identity.IdentityRelation Carrier where
  Ident := Eq
  IdentReflexive := fun _ => rfl
  IdentLeibniz := fun h _ hp => h ▸ hp
end LRA.Identity.Construction.Mathlib

/-! Constructions/Axiomatic (Kit A) — honest axioms introducing a NEW symbol. -/
namespace LRA.Identity.Construction.Axiomatic
universe u
axiom AxIdent {Carrier : Type u} : Carrier → Carrier → Prop
axiom AxIdentReflexive {Carrier : Type u} (x : Carrier) : AxIdent x x
axiom AxIdentLeibniz {Carrier : Type u} {x y : Carrier} (h : AxIdent x y)
    (Property : Carrier → Prop) : Property x → Property y

noncomputable scoped instance instIdentityRelation (Carrier : Type u) :
    LRA.Identity.IdentityRelation Carrier where
  Ident := AxIdent
  IdentReflexive := AxIdentReflexive
  IdentLeibniz := AxIdentLeibniz
end LRA.Identity.Construction.Axiomatic

/-! Interop: adapters, and the audit. -/
namespace LRA.Identity.Interop
universe u
open LRA.Identity

def toEq {Carrier : Type u} [IdentityRelation Carrier] {x y : Carrier}
    (h : Ident x y) : x = y := (IdentIsDiagonal x y).mp h
def ofEq {Carrier : Type u} [IdentityRelation Carrier] {x y : Carrier}
    (h : x = y) : Ident x y := (IdentIsDiagonal x y).mpr h

/-- The axiomatic identity is provably Lean equality — via the axioms. -/
theorem axiomaticIsEq {Carrier : Type u} (x y : Carrier) :
    Construction.Axiomatic.AxIdent x y ↔ x = y :=
  @IdentIsDiagonal Carrier (Construction.Axiomatic.instIdentityRelation Carrier) x y

#print axioms IdentTransitive
#print axioms IdentIsDiagonal
#print axioms axiomaticIsEq
#print axioms Construction.Mathlib.instIdentityRelation
end LRA.Identity.Interop
