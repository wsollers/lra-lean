import LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.LStructure
import LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.Theory
import LRA.Set.Constructions.GrothendieckUniverse.Axioms

namespace LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory

open LRA.Logic
open LRA.Logic.FirstOrder
open LRA.ModelTheory.FirstOrder
open LRA.Set.Constructions.ZFCSet.Interface.ModelTheory

universe u

/--
`TGUniverseAxiom` TODO

Predicate logic:

  ∀ (SetObject : Type u_1) [inst : Membership SetObject SetObject], LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseAxiom SetObject

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseAxiom SetObject

Logical form (Lean):

```lean
abbrev TGUniverseAxiom := LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseAxiom
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
abbrev TGUniverseAxiom := LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseAxiom

/--
`RelativizedAssignment` TODO

Predicate logic:

  def RelativizedAssignment
      {SetObject : Type u}
      [Membership SetObject SetObject]
      (structureData : UniverseLStructure SetObject) :=
    Nat → UniverseDomain structureData

Predicate logic (unfolded):

  def RelativizedAssignment
      {SetObject : Type u}
      [Membership SetObject SetObject]
      (structureData : UniverseLStructure SetObject) :=
    Nat → UniverseDomain structureData (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def RelativizedAssignment
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (structureData : UniverseLStructure SetObject) :=
  Nat → UniverseDomain structureData
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
def RelativizedAssignment
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (structureData : UniverseLStructure SetObject) :=
  Nat → UniverseDomain structureData

/--
`SatisfiesAllExpandedZFCAxioms` TODO

Predicate logic:

  ∀ {SetObject : Type u} (a : Membership SetObject SetObject) (model : LRA.ModelTheory.FirstOrder.Model LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.ExpandedMembershipSignature) (assignment : Nat → model.Domain) (φ : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat), φ ∈ LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.ZFCTheory → LRA.Logic.FirstOrder.Satisfies model assignment φ

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    φ ∈ LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.ZFCTheory → LRA.Logic.FirstOrder.Satisfies model assignment φ

Logical form (Lean):

```lean
def SatisfiesAllExpandedZFCAxioms
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (model : Model ExpandedMembershipSignature) : Prop :=
  model ∈ ModelsOfFormulaTheory ZFCTheory
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
def SatisfiesAllExpandedZFCAxioms
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (model : Model ExpandedMembershipSignature) : Prop :=
  model ∈ ModelsOfFormulaTheory ZFCTheory

/--
`SupportsTGExpansion` TODO

Predicate logic:

  ∀ (SetObject : Type u) [inst : Membership SetObject SetObject], LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseAxiom SetObject

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseAxiom SetObject

Logical form (Lean):

```lean
def SupportsTGExpansion
    (SetObject : Type u) [Membership SetObject SetObject] : Prop :=
  TGUniverseAxiom SetObject
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
def SupportsTGExpansion
    (SetObject : Type u) [Membership SetObject SetObject] : Prop :=
  TGUniverseAxiom SetObject

/--
`supportsTGExpansion_iff_universe_axiom` TODO

Predicate logic:

  ∀ (SetObject : Type u) [inst : Membership SetObject SetObject], LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.SupportsTGExpansion SetObject ↔ LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.TGUniverseAxiom SetObject

Predicate logic (unfolded):

  Ambient
    (SetObject, ∈)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.SupportsTGExpansion SetObject ↔ LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.TGUniverseAxiom SetObject

Logical form (Lean):

```lean
theorem supportsTGExpansion_iff_universe_axiom
    (SetObject : Type u) [Membership SetObject SetObject] :
    SupportsTGExpansion SetObject ↔ TGUniverseAxiom SetObject
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem supportsTGExpansion_iff_universe_axiom
    (SetObject : Type u) [Membership SetObject SetObject] :
    SupportsTGExpansion SetObject ↔ TGUniverseAxiom SetObject := by
  sorry

end LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory
