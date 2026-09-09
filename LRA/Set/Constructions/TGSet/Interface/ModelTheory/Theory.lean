import LRA.Set.Interface.ModelTheory.LStructure
import LRA.Set.Constructions.TGSet.Definition
import LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.LStructure
import LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.Theory
import LRA.Set.Constructions.GrothendieckUniverse.Axioms
import LRA.Set.Constructions.GrothendieckUniverse.Definitions

/-!
TGSet's model-theory interface: the TG carrier as an `L_∈`-structure, plus
TGSet's actual export over ZFCSet's theory — the TG universe axiom and its
associated internal-universe predicate.
-/

namespace LRA.Set.Constructions.TGSet.Interface.ModelTheory

open LRA.Logic
open LRA.Logic.FirstOrder
open LRA.ModelTheory.FirstOrder
open LRA.Set.ModelTheory
open LRA.Set.Constructions.ZFCSet.Interface.ModelTheory

/--
`PureMembershipSignature` TODO

Predicate logic:

  abbrev PureMembershipSignature :=
    LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.PureMembershipSignature

Predicate logic (unfolded):

  abbrev PureMembershipSignature :=
    LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.PureMembershipSignature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev PureMembershipSignature :=
  LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.PureMembershipSignature
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev PureMembershipSignature :=
  LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.PureMembershipSignature

/--
`TGSetObject` TODO

Predicate logic:

  Type

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Type

Logical form (Lean):

```lean
axiom TGSet : Type
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
abbrev TGSetObject := LRA.Set.Constructions.TGSet

/--
`TGAmbientLStructure` The ambient `L_∈`-structure for TG set theory uses the TG carrier with the standard membership relation.

Predicate logic:

  abbrev TGAmbientLStructure := TGSetObject

Predicate logic (unfolded):

  abbrev TGAmbientLStructure := TGSetObject (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev TGAmbientLStructure := TGSetObject
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev TGAmbientLStructure := TGSetObject

/--
`InternalUniverseLStructure` TODO

Predicate logic:

  abbrev InternalUniverseLStructure :=
    LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.UniverseLStructure

Predicate logic (unfolded):

  abbrev InternalUniverseLStructure :=
    LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.UniverseLStructure (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev InternalUniverseLStructure :=
  LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.UniverseLStructure
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev InternalUniverseLStructure :=
  LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.UniverseLStructure

/--
`TGUniverseAxiom` The TG-specific universe axiom: every set is contained in some Grothendieck universe.

Predicate logic:

  LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseAxiom LRA.Set.Constructions.TGSet.Interface.ModelTheory.TGSetObject

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseAxiom LRA.Set.Constructions.TGSet.Interface.ModelTheory.TGSetObject

Logical form (Lean):

```lean
abbrev TGUniverseAxiom :=
  LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseAxiom TGSetObject
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev TGUniverseAxiom :=
  LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseAxiom TGSetObject

/--
`TGUniversePredicate` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (A U : SetObject), (A ∈ U ∧ LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverse U)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (inst.1 U A ∧ ((∀ ⦃x y : SetObject⦄, inst.1 U x → inst.1 x y → inst.1 U y) ∧ ((∀ ⦃x y : SetObject⦄, inst.1 U x → inst.1 U y → Exists fun pair => (inst.1 U pair ∧ (∀ (x_1 : SetObject), inst.1 pair x_1 ↔ Or (x_1 = x)(x_1 = y)))) ∧ ((∀ ⦃x : SetObject⦄, inst.1 U x → Exists fun powerSet => (inst.1 U powerSet ∧ (∀ (x_1 : SetObject), inst.1 powerSet x_1 ↔ ∀ (y : SetObject), inst.1 x_1 y → inst.1 x y))) ∧ ((∀ ⦃indexSet : SetObject⦄, inst.1 U indexSet → ∀ (family : SetObject → SetObject), (∀ (i : SetObject), inst.1 indexSet i → inst.1 U (family i)) → Exists fun image => (inst.1 U image ∧ ((∀ (y : SetObject), inst.1 image y ↔ Exists fun i => (inst.1 indexSet i ∧ y = family i)) ∧ (Exists fun union => (inst.1 U union ∧ (∀ (x : SetObject), inst.1 union x ↔ Exists fun i => (inst.1 indexSet i ∧ inst.1 (family i) x))))))) ∧ (Exists fun omega => (inst.1 U omega ∧ ((Exists fun empty => (inst.1 omega empty ∧ (∀ (x : SetObject), inst.1 empty x → False))) ∧ (∀ (x : SetObject), inst.1 omega x → Exists fun successor => (inst.1 omega successor ∧ (∀ (x_1 : SetObject), inst.1 successor x_1 ↔ Or (inst.1 x x_1) (x_1 = x))))))))))))

Logical form (Lean):

```lean
def IsGrothendieckUniverseFor (A U : SetObject) : Prop :=
  A ∈ U ∧ IsGrothendieckUniverse U
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
abbrev TGUniversePredicate (A U : TGSetObject) : Prop :=
  LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U

/--
`SatisfiesTGTheory` Interface-level notion of satisfying TG: the ambient structure satisfies ZFC and supports the universe axiom.

Predicate logic:

  ∀ (model : LRA.ModelTheory.FirstOrder.Model LRA.Set.ModelTheory.MembershipSignature), (model ∈ LRA.ModelTheory.FirstOrder.ModelsOfFormulaTheory LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.ZFCTheory ∧ LRA.Set.Constructions.TGSet.Interface.ModelTheory.TGUniverseAxiom)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((model ∈ fun M => ∀ (assignment : Nat → M.1) (φ : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat), φ ∈ LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.ZFCTheory → LRA.Logic.FirstOrder.Satisfies M assignment φ) ∧ LRA.Set.Constructions.TGSet.Interface.ModelTheory.TGUniverseAxiom)

Logical form (Lean):

```lean
def SatisfiesTGTheory (model : Model MembershipSignature) : Prop :=
  model ∈ ModelsOfFormulaTheory ZFCTheory ∧ TGUniverseAxiom
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
def SatisfiesTGTheory (model : Model MembershipSignature) : Prop :=
  model ∈ ModelsOfFormulaTheory ZFCTheory ∧ TGUniverseAxiom

end LRA.Set.Constructions.TGSet.Interface.ModelTheory
