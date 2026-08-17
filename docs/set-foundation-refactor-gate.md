# Set Foundation Refactor Gate

This gate assesses the Volume I Set foundation refactor whose design is
specified in `docs/set-foundation-textbook-spec.md`.

The purpose of the refactor is not backward compatibility. The purpose is to
make the early set-theory Lean read and write like a textbook: single-sorted
Enderton-style sets by default, axiom-shaped hypotheses, named construction
predicates, and operations introduced only after existence/uniqueness has been
proved.

## Gate Summary

The refactor passes only if a learner can open the new Foundation files and see
ordinary set theory first:

```text
sets contain sets;
axioms assert existence;
definitions describe predicates;
theorems cite exactly the axioms they use;
chosen operations come after theorems, not before them.
```

## Required Shape

### Single-Sorted Foundation

`LRA/VolumeI/Set/Foundation/Universe.lean` must define a single-sorted universe:

```lean
structure Universe where
  SetObject : Type u
  member : SetObject -> SetObject -> Prop
```

The Foundation layer must not use `Element : Type v` or
`member : Element -> SetObject -> Prop` as its primary ontology.

### Textbook Membership

The Foundation universe must provide a `Membership` instance so statements can
use ordinary Lean membership notation:

```lean
w ∈ A
```

for `w A : universe.SetObject`.

### Named Predicates

`LRA/VolumeI/Set/Foundation/Definitions.lean` must define predicates before
chosen operations. At minimum:

```lean
IsEmptySet
IsPairSet
```

These predicates must not mention `SetInterface`, `PublicSetOperations`, or a
chosen operation such as `emptySet` or `pairSet`.

This file must also provide a Foundation-local `ExistsUnique` predicate with
the same witness-and-uniqueness shape as `∃!`, so the Foundation layer does not
need to import Mathlib just for unique-existence notation.

### Named Axiom Props

`LRA/VolumeI/Set/Foundation/Axioms.lean` must define named `Prop` axioms. At
minimum:

```lean
ExtensionalityAxiom
EmptySetAxiom
PairingAxiom
```

The axiom definitions must be ordinary Lean propositions over a `Universe`, not
operation fields in a structure.

The rest of ZFC should be added in later passes as named `Prop`s:

```lean
UnionAxiom
PowerSetAxiom
InfinityAxiom
SeparationSchema
ReplacementSchema
FoundationAxiom
ChoiceAxiom
```

The first refactor pass does not need to implement every one of these, but it
must leave an obvious home and pattern for them.

## Required Empty Set Surface

The new empty-set topic file must expose this conceptual surface:

```lean
IsEmptySet
EmptySetAxiom
EmptySetExist
EmptySetUnique
EmptySetExistsUnique
emptySet
emptySet_isEmpty
emptySet_unique
```

`EmptySetExist`, `EmptySetUnique`, and `EmptySetExistsUnique` must be proved,
not left as `sorry`.

The theorem statements must not take `SetInterface` or `SetInterfaceLaws`.
They should take only the axiom hypotheses they use, for example:

```lean
(extensionality : ExtensionalityAxiom universe)
(emptySetAxiom : EmptySetAxiom universe)
```

The proof of `EmptySetUnique` must visibly use extensionality and the
definition of emptiness. The proof of `EmptySetExistsUnique` must visibly use
existence from `EmptySetAxiom` and uniqueness from `EmptySetUnique`.

## Required Pairing Surface

The new pairing topic file must expose this conceptual surface:

```lean
IsPairSet
PairingAxiom
PairSetExist
PairSetUnique
PairingOutputExistsUnique
pairSet
pairSet_isPairSet
pairSet_unique
```

`PairSetExist`, `PairSetUnique`, and `PairingOutputExistsUnique` must be proved,
not left as `sorry`.

The theorem corresponding to the source label
`thm:pairing-output-exists-unique` must have the source-aligned shape:

```lean
theorem PairingOutputExistsUnique
    (extensionality : ExtensionalityAxiom universe)
    (pairing : PairingAxiom universe)
    (x1 x2 : universe.SetObject) :
    ExistsUnique (fun pairSet : universe.SetObject =>
      IsPairSet universe x1 x2 pairSet) := by
  ...
```

The proof must visibly follow the textbook proof:

1. apply Pairing to obtain a witness;
2. prove uniqueness by Extensionality.

It must not prove existence by choosing an already supplied operation field such
as `interface.pair`.

## Naming Gate

Use PascalCase for source-facing predicates, axioms, and textbook theorems:

```text
IsEmptySet
EmptySetAxiom
EmptySetUnique
PairingAxiom
PairingOutputExistsUnique
```

Use lower camel case and underscore-suffixed facts for chosen witnesses and
operation-level conveniences:

```text
emptySet
emptySet_isEmpty
emptySet_unique
pairSet
pairSet_isPairSet
pairSet_unique
```

Do not mix these registers without a documented reason.

## Dependency Gate

The new Foundation files must not import:

```text
LRA.VolumeI.Set.Public.Interface
LRA.VolumeI.Set.Operations.Public
LRA.VolumeI.Set.Operations.Native
LRA.VolumeI.Set.Implementations.*
```

The intended dependency direction is:

```text
Foundation -> later bridge/adapters -> Public/Operations/Implementations
```

not:

```text
Public/Operations -> Foundation
```

## Compatibility Gate

Backward compatibility is not required for this refactor.

It is acceptable to delete, replace, or stop importing the older
`Predicates/Existence/Uniqueness/Foundational` split once the new topic files
compile.

It is acceptable to update the few existing theorem references rather than keep
old names. Do not add transition names if they make the new textbook surface
harder to understand.

## Operations Gate

Chosen operations are allowed only after the relevant axiom-backed existence
statement exists.

For example:

```lean
noncomputable def pairSet
    (pairing : PairingAxiom universe)
    (x1 x2 : universe.SetObject) :
    universe.SetObject :=
  Classical.choose (pairing x1 x2)
```

This is acceptable because `pairSet` is derived from `PairingAxiom`. A primitive
field

```lean
pair : SetObject -> SetObject -> SetObject
```

is not acceptable as the Foundation-layer source of Pairing.

## Source Coverage Gate

The refactor should prioritize the Volume I source statements that are generic
set theory:

```text
ax:extensionality
ax:empty-set
ax:pairing
thm:empty-set-exists-unique
thm:pairing-output-exists-unique
```

Later passes should add:

```text
ax:union
ax:power-set
ax:separation
ax:replacement
ax:foundation
ax:choice
thm:union-output-exists-unique
thm:power-set-output-exists-unique
```

Number-system-specific results such as `\mathbb{Q}` countability and
`\mathbb{R}` uncountability are not part of this Foundation gate. They should
move to the appropriate Volume II number-system/cardinality development.

## Build Gate

At minimum, the refactor must pass the active Volume I Lean build target.

Preferred validation:

```powershell
.\build.ps1 build
```

or, if Docker is available:

```powershell
.\build.ps1 docker-build
.\build.ps1 build-all
```

If full validation is too expensive in the current pass, run the narrowest Lean
build that checks the modified Volume I modules and report the limitation.

## Human Readability Gate

A reviewer should be able to read the new empty-set and pairing files aloud as
ordinary mathematics.

Reject the refactor if the first theorem statements are dominated by:

```text
interface
laws
Element
SetObject as a separate element carrier
operation-law bundles
backend names
```

Accept the refactor if the first theorem statements are dominated by:

```text
universe
membership
IsEmptySet
IsPairSet
ExtensionalityAxiom
EmptySetAxiom
PairingAxiom
exists!
ExistsUnique
```
