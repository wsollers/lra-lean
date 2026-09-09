import LRA.Set.Constructions.GrothendieckUniverse.Definitions
import LRA.Set.Interface.ModelTheory.LStructure

namespace LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory

open LRA.Logic
open LRA.Logic.FirstOrder
open LRA.Set.Constructions.GrothendieckUniverse

universe u

/--
`PureMembershipRelationSymbol` TODO

Predicate logic:

  inductive PureMembershipRelationSymbol : Type where
    | mem
    deriving DecidableEq

Predicate logic (unfolded):

  inductive PureMembershipRelationSymbol : Type where
    | mem
    deriving DecidableEq (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive PureMembershipRelationSymbol : Type where
  | mem
  deriving DecidableEq
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
inductive PureMembershipRelationSymbol : Type where
  | mem
  deriving DecidableEq

/--
`PureMembershipFunctions` TODO

Predicate logic:

  def PureMembershipFunctions : ArityIndexedSymbols where
    Symbol := Empty
    arity := Empty.elim

Predicate logic (unfolded):

  def PureMembershipFunctions : ArityIndexedSymbols where
    Symbol := Empty
    arity := Empty.elim (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PureMembershipFunctions : ArityIndexedSymbols where
  Symbol := Empty
  arity := Empty.elim
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
def PureMembershipFunctions : ArityIndexedSymbols where
  Symbol := Empty
  arity := Empty.elim

/--
`PureMembershipRelations` TODO

Predicate logic:

  def PureMembershipRelations : ArityIndexedSymbols where
    Symbol := PureMembershipRelationSymbol
    arity := fun _ => 2

Predicate logic (unfolded):

  def PureMembershipRelations : ArityIndexedSymbols where
    Symbol := PureMembershipRelationSymbol
    arity := fun _ => 2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PureMembershipRelations : ArityIndexedSymbols where
  Symbol := PureMembershipRelationSymbol
  arity := fun _ => 2
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
def PureMembershipRelations : ArityIndexedSymbols where
  Symbol := PureMembershipRelationSymbol
  arity := fun _ => 2

/--
`PureMembershipSignature` TODO

Predicate logic:

  def PureMembershipSignature : Signature where
    Functions := PureMembershipFunctions
    Relations := PureMembershipRelations
    Constants := Empty

Predicate logic (unfolded):

  def PureMembershipSignature : Signature where
    Functions := PureMembershipFunctions
    Relations := PureMembershipRelations
    Constants := Empty (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PureMembershipSignature : Signature where
  Functions := PureMembershipFunctions
  Relations := PureMembershipRelations
  Constants := Empty
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
def PureMembershipSignature : Signature where
  Functions := PureMembershipFunctions
  Relations := PureMembershipRelations
  Constants := Empty

/--
`ExpandedMembershipSignature` TODO

Predicate logic:

  abbrev ExpandedMembershipSignature := LRA.Set.ModelTheory.MembershipSignature

Predicate logic (unfolded):

  abbrev ExpandedMembershipSignature := LRA.Set.ModelTheory.MembershipSignature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev ExpandedMembershipSignature := LRA.Set.ModelTheory.MembershipSignature
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
abbrev ExpandedMembershipSignature := LRA.Set.ModelTheory.MembershipSignature

/--
`pureMembershipLanguageHasNoFunctionSymbols` TODO

Predicate logic:

  IsEmpty LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.PureMembershipFunctions.Symbol

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    IsEmpty LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.PureMembershipFunctions.1

Logical form (Lean):

```lean
theorem pureMembershipLanguageHasNoFunctionSymbols :
    IsEmpty PureMembershipFunctions.Symbol
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
theorem pureMembershipLanguageHasNoFunctionSymbols :
    IsEmpty PureMembershipFunctions.Symbol := by
  sorry

/--
`pureMembershipLanguageHasNoConstantSymbols` TODO

Predicate logic:

  IsEmpty LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.PureMembershipSignature.Constants

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    IsEmpty LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.PureMembershipSignature.3

Logical form (Lean):

```lean
theorem pureMembershipLanguageHasNoConstantSymbols :
    IsEmpty PureMembershipSignature.Constants
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
theorem pureMembershipLanguageHasNoConstantSymbols :
    IsEmpty PureMembershipSignature.Constants := by
  sorry

/--
`pureMembershipRelationSymbolIsBinary` TODO

Predicate logic:

  LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.PureMembershipSignature.IsBinaryRelationSymbol LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.PureMembershipRelationSymbol.mem

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.PureMembershipSignature.Relations.2 LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.PureMembershipRelationSymbol.mem = 2

Logical form (Lean):

```lean
theorem pureMembershipRelationSymbolIsBinary :
    PureMembershipSignature.IsBinaryRelationSymbol .mem
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
theorem pureMembershipRelationSymbolIsBinary :
    PureMembershipSignature.IsBinaryRelationSymbol .mem := by
  sorry

/--
`UniverseLStructure` TODO

Predicate logic:

  structure UniverseLStructure (SetObject : Type u) [Membership SetObject SetObject] where
    base : SetObject
    carrier : SetObject
    carrierHypothesis : IsGrothendieckUniverseFor base carrier

Predicate logic (unfolded):

  structure UniverseLStructure (SetObject : Type u) [Membership SetObject SetObject] where
    base : SetObject
    carrier : SetObject
    carrierHypothesis : IsGrothendieckUniverseFor base carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure UniverseLStructure (SetObject : Type u) [Membership SetObject SetObject] where
  base : SetObject
  carrier : SetObject
  carrierHypothesis : IsGrothendieckUniverseFor base carrier
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
structure UniverseLStructure (SetObject : Type u) [Membership SetObject SetObject] where
  base : SetObject
  carrier : SetObject
  carrierHypothesis : IsGrothendieckUniverseFor base carrier

/--
`UniverseDomain` TODO

Predicate logic:

  def UniverseDomain {SetObject : Type u} [Membership SetObject SetObject]
      (structureData : UniverseLStructure SetObject) : Type u :=
    { x : SetObject // x ∈ structureData.carrier }

Predicate logic (unfolded):

  def UniverseDomain {SetObject : Type u} [Membership SetObject SetObject]
      (structureData : UniverseLStructure SetObject) : Type u :=
    { x : SetObject // x ∈ structureData.carrier } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def UniverseDomain {SetObject : Type u} [Membership SetObject SetObject]
    (structureData : UniverseLStructure SetObject) : Type u :=
  { x : SetObject // x ∈ structureData.carrier }
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
def UniverseDomain {SetObject : Type u} [Membership SetObject SetObject]
    (structureData : UniverseLStructure SetObject) : Type u :=
  { x : SetObject // x ∈ structureData.carrier }

/--
`universeMembershipInterpretation` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (structureData : LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.UniverseLStructure SetObject) (a a_1 : LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.UniverseDomain structureData), inst.1 a_1.val a.val

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    inst.1 a_1.1 a.1

Logical form (Lean):

```lean
def universeMembershipInterpretation
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (structureData : UniverseLStructure SetObject) :
    UniverseDomain structureData → UniverseDomain structureData → Prop :=
  fun (left right : UniverseDomain structureData) => left.1 ∈ right.1
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
def universeMembershipInterpretation
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (structureData : UniverseLStructure SetObject) :
    UniverseDomain structureData → UniverseDomain structureData → Prop :=
  fun (left right : UniverseDomain structureData) => left.1 ∈ right.1

/--
`universeDomainNonempty` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (structureData : LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.UniverseLStructure SetObject), Nonempty (LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.UniverseDomain structureData)

Predicate logic (unfolded):

  Ambient
    (SetObject, ∈)
  Objects
    structureData : UniverseLStructure SetObject
  Prove
    Nonempty (Subtype fun x => inst.1 structureData.2 x)

Logical form (Lean):

```lean
theorem universeDomainNonempty
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (structureData : UniverseLStructure SetObject) :
    Nonempty (UniverseDomain structureData)
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
theorem universeDomainNonempty
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (structureData : UniverseLStructure SetObject) :
    Nonempty (UniverseDomain structureData) := by
  sorry

/--
`IsNormalMembershipStructure` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (structureData : LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.UniverseLStructure SetObject) (left right : LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.UniverseDomain structureData), LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.universeMembershipInterpretation structureData left right ↔ left.val ∈ right.val

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.universeMembershipInterpretation structureData left right ↔ left.val ∈ right.val

Logical form (Lean):

```lean
def IsNormalMembershipStructure
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (structureData : UniverseLStructure SetObject) : Prop :=
  ∀ left right : UniverseDomain structureData,
    universeMembershipInterpretation structureData left right ↔ left.1 ∈ right.1
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, unfold

-/
def IsNormalMembershipStructure
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (structureData : UniverseLStructure SetObject) : Prop :=
  ∀ left right : UniverseDomain structureData,
    universeMembershipInterpretation structureData left right ↔ left.1 ∈ right.1

/--
`IsStandardTransitiveMembershipStructure` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (structureData : LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.UniverseLStructure SetObject), (LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.IsNormalMembershipStructure structureData ∧ LRA.Set.Constructions.GrothendieckUniverse.IsTransitiveUniverse structureData.carrier)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (left right : Subtype fun x => inst.1 structureData.2 x), inst.1 right.1 left.1 ↔ inst.1 right.1 left.1) ∧ (∀ ⦃x y : SetObject⦄, inst.1 structureData.2 x → inst.1 x y → inst.1 structureData.2 y))

Logical form (Lean):

```lean
def IsStandardTransitiveMembershipStructure
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (structureData : UniverseLStructure SetObject) : Prop :=
  IsNormalMembershipStructure structureData ∧
    IsTransitiveUniverse structureData.carrier
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
def IsStandardTransitiveMembershipStructure
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (structureData : UniverseLStructure SetObject) : Prop :=
  IsNormalMembershipStructure structureData ∧
    IsTransitiveUniverse structureData.carrier

/--
`universeStructureIsNormal` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (structureData : LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.UniverseLStructure SetObject), LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.IsNormalMembershipStructure structureData

Predicate logic (unfolded):

  Ambient
    (SetObject, ∈)
  Objects
    structureData : UniverseLStructure SetObject
  Prove
    inst.1 right.1 left.1 ↔ inst.1 right.1 left.1

Logical form (Lean):

```lean
theorem universeStructureIsNormal
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (structureData : UniverseLStructure SetObject) :
    IsNormalMembershipStructure structureData
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
theorem universeStructureIsNormal
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (structureData : UniverseLStructure SetObject) :
    IsNormalMembershipStructure structureData := by
  sorry

/--
`universeStructureIsStandardTransitive` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (structureData : LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.UniverseLStructure SetObject), LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.IsStandardTransitiveMembershipStructure structureData

Predicate logic (unfolded):

  Ambient
    (SetObject, ∈)
  Objects
    structureData : UniverseLStructure SetObject
  Prove
    ((∀ (left right : Subtype fun x => inst.1 structureData.2 x), inst.1 right.1 left.1 ↔ inst.1 right.1 left.1) ∧ (∀ ⦃x y : SetObject⦄, inst.1 structureData.2 x → inst.1 x y → inst.1 structureData.2 y))

Logical form (Lean):

```lean
theorem universeStructureIsStandardTransitive
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (structureData : UniverseLStructure SetObject) :
    IsStandardTransitiveMembershipStructure structureData
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
theorem universeStructureIsStandardTransitive
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (structureData : UniverseLStructure SetObject) :
    IsStandardTransitiveMembershipStructure structureData := by
  sorry

end LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory
