# Pre-Restart Volume I Lean Catalog

This catalog records what existed under `LRA/VolumeI` before the restart archive
step and the generic logic machinery it imported from `LRA/Foundation/Logic`.

Purpose for the restart:

- identify what can be harvested into a new light logic prelude;
- identify what should remain archived as later reference material;
- avoid accidentally treating current experimental structure as settled
  architecture.

## Root Import

Pre-restart root:

```text
LRA/VolumeI.lean
```

Pre-restart imports:

```lean
import LRA.Foundation
import LRA.VolumeI.BooleanAlgebra.BooleanAlgebraDefinitions
import LRA.VolumeI.BooleanAlgebra.BooleanAlgebra
import LRA.VolumeI.PropositionalLogic.PropositionalLogic
import LRA.VolumeI.PropositionalLogic.SimpleLogic
import LRA.VolumeI.FirstOrderLogic.PeanoSystemModel
import LRA.VolumeI.FirstOrderLogic.PresburgerArithmetic
import LRA.VolumeI.FirstOrderLogic.Comparison
```

## Pre-Restart Files

```text
LRA/VolumeI/
  BooleanAlgebra/
    BooleanAlgebra.lean
    BooleanAlgebraDefinitions.lean
  FirstOrderLogic/
    Comparison.lean
    PeanoSystemModel.lean
    PresburgerArithmetic.lean
  PropositionalLogic/
    PropositionalLogic.lean
    SimpleLogic.lean
```

The generic logic engine these files used was outside `VolumeI`:

```text
LRA/Foundation/Logic/
  Propositional.lean
  FirstOrder.lean
```

## Foundation Logic: Propositional Engine

File:

```text
LRA/Foundation/Logic/Propositional.lean
```

Main contents:

- `PropositionalLanguage`
- `PropositionalFormula`
- `PropositionalStructure`
- `evaluateFormula`
- `StructureSatisfiesFormula`
- `PropositionalTheory`
- `StructureModelsTheory`
- compatibility abbreviations:
  `Signature`, `Formula`, `Structure`, `Theory`, `evaluate`

Restart assessment:

This is harvestable, but should be simplified and renamed carefully. It is a
good candidate for a light propositional syntax/semantics layer if we decide
to formalize object-language formulas rather than only Lean propositions.

Design caution:

This evaluates formulas to `Bool`, which is fine for propositional truth tables.
The restart should explicitly distinguish this object-language semantics from
Lean's own `Prop`.

## Foundation Logic: First-Order Engine

File:

```text
LRA/Foundation/Logic/FirstOrder.lean
```

Main contents:

- `FirstOrderLanguage`
- `Term`
- `Formula`
- `Term.shiftFreeVariablesAbove`
- `Term.substituteVariable`
- `Formula.substituteVariable`
- `FirstOrderStructure`
- `VariableAssignment`
- `extendAssignmentWithValue`
- `evaluateTerm`
- `StructureSatisfiesFormulaUnderAssignment`
- `StructureModelsFormula`
- `FirstOrderTheory`
- `StructureModelsTheory`
- `Model`
- `TheorySemanticallyEntailsFormula`
- toy signature/tests for substitution and evaluation

Restart assessment:

This is substantial and useful, but too heavy to blindly make step one. It is
good reference material for the later light model-theory layer.

Design caution:

It uses de Bruijn variables and a real Tarski-style satisfaction relation.
That is mathematically honest, but it may be more syntax machinery than the
first learning-oriented restart milestone needs.

## Volume I: Standard Propositional Logic

File:

```text
LRA/VolumeI/PropositionalLogic/PropositionalLogic.lean
```

Main contents:

- standard atom type: `StandardAtoms` with `P`, `Q`, `R`
- standard connectives:
  - `StandardUnaryConnective.not`
  - `StandardBinaryConnective.and`
  - `or`
  - `implies`
  - `iff`
- `StandardPropositionalLanguage`
- standard formula/structure/theory abbreviations
- formula constructors:
  - `atom`
  - `standardNot`
  - `standardAnd`
  - `standardOr`
  - `standardImplies`
  - `standardIff`
- notation for object-language connectives
- `StandardBooleanStructure`
- closure lemmas for formula formation
- minimality theorem for well-formed formulas
- Boolean evaluation theorems for each standard connective
- DNF-style connective completeness package
- metatheory certification structure
- model theory for propositional theories:
  - satisfiable theory
  - semantic entailment
  - model weakening
  - extensional equality of theories

Known `sorry` footprint:

- DNF/truth-table completeness theorems;
- determinacy of formula truth values;
- several propositional model-theory lemmas.

Restart assessment:

Good source for a propositional object-language chapter, but probably not the
first thing to rebuild. For the immediate restart, harvest the vocabulary and
small proof patterns, not the whole DNF package.

## Volume I: NAND-Only Propositional Logic

File:

```text
LRA/VolumeI/PropositionalLogic/SimpleLogic.lean
```

Main contents:

- `NandOnlyAtoms`
- `NandOnlyBinaryConnective.nand`
- `NandOnlyLanguage`
- `NandOnlyFormula`
- `NandOnlyStructure`
- `atom`
- `nand`
- `NandOnlyBooleanStructure`
- NAND definitions of:
  - negation;
  - conjunction;
  - disjunction;
  - implication;
  - biconditional.
- theorems that NAND defines the standard connectives;
- translation from standard formulas to NAND-only formulas;
- functional completeness theorem for standard propositional logic;
- small `#guard`/example tests.

Known `sorry` footprint:

- none found in this file.

Restart assessment:

Nice later enrichment. It is probably too specialized for the first logic
prelude, but worth preserving as a proof-friendly example of “specific signs”
and definitional economy.

## Volume I: Peano Successor First-Order Theory

File:

```text
LRA/VolumeI/FirstOrderLogic/PeanoSystemModel.lean
```

Main contents:

- successor-only first-order language:
  - `zero`;
  - `successor`;
  - no primitive relation symbols.
- terms:
  - `zeroTerm`;
  - `successorTerm`;
  - `numeral`.
- axioms:
  - zero is not a successor;
  - successor is injective;
  - induction schema.
- `Axiom`
- `theory`
- `PeanoSystemModel`
- standard natural-number interpretation;
- proofs that the standard model satisfies the first two axioms;
- tests showing numerals evaluate as expected.

Known `sorry` footprint:

- no proof `sorry` found; comments mention deliberately avoiding `sorry` for
  the unfinished full model assembly.

Restart assessment:

Useful later, but not part of the logic/set restart. It belongs near the later
number construction discussion, not in the first foundation pass.

## Volume I: Presburger Arithmetic

File:

```text
LRA/VolumeI/FirstOrderLogic/PresburgerArithmetic.lean
```

Main contents:

- first-order language with:
  - `zero`;
  - `successor`;
  - binary `addition`;
  - no primitive relation symbols.
- terms:
  - `zeroTerm`;
  - `successorTerm`;
  - `additionTerm`;
  - `numeral`.
- axioms:
  - zero is not a successor;
  - successor is injective;
  - addition base;
  - addition step;
  - induction schema.
- `Axiom`
- `theory`
- `PresburgerModel`
- standard natural-number interpretation;
- proofs of the successor axioms in the standard model;
- tests for numeral addition evaluation.

Known `sorry` footprint:

- no proof `sorry` found; comments mention future full model assembly without
  inserting `sorry`.

Restart assessment:

Useful later as a light model-theory example and as background for number
construction choices. It should not drive the set foundation.

## Volume I: Peano/Presburger Comparison

File:

```text
LRA/VolumeI/FirstOrderLogic/Comparison.lean
```

Main contents:

- numeral evaluation theorem for successor-only Peano standard model;
- numeral evaluation theorem for Presburger standard model;
- theorem that Presburger `addition` denotes `Nat.add` in the standard model;
- theorem that Presburger numeral addition matches successor numerals;
- theorem comparing Peano and Presburger numeral values;
- theorem that the addition axioms force ordinary natural-number addition;
- proofs that the standard model satisfies Presburger addition base and step.

Known `sorry` footprint:

- none found in this file.

Restart assessment:

Mathematically useful, but belongs later. This should be archived and harvested
only after the set layer and number-construction plan are stable.

## Volume I: Boolean Algebra / Boolean Rings

Files:

```text
LRA/VolumeI/BooleanAlgebra/BooleanAlgebraDefinitions.lean
LRA/VolumeI/BooleanAlgebra/BooleanAlgebra.lean
```

Main contents:

- `BooleanRing` structure;
- carrier and operations:
  - addition;
  - multiplication;
  - additive inverse;
  - additive identity;
  - multiplicative identity.
- axioms:
  - additive associativity;
  - additive commutativity;
  - additive identity law;
  - additive inverse law;
  - multiplicative associativity;
  - left and right distributivity;
  - left and right multiplicative identity;
  - multiplicative idempotence.
- named constants:
  - `Zero`;
  - `One`.
- theorems:
  - `ZeroUnique`;
  - `OneUnique`;
  - `ZeroAddLeft`;
  - `AdditiveInverseLeft`;
  - `AdditiveFixedPointIsZero`;
  - `SquareOfDouble`;
  - `AdditiveIdempotence`;
  - `MultiplicativeCommutativity`.

Known `sorry` footprint:

- `MultiplicativeCommutativity` has unfinished proof steps.

Restart assessment:

Do not harvest into the first logic/set restart. Boolean algebra may become a
later example once set algebra and algebraic structures are stable. It is not
the Bourbaki-style opening layer.

## Summary

Current Volume I Lean is not just a light logic prelude. It already contains:

- a generic propositional syntax/semantics engine;
- a generic first-order syntax/semantics/model engine;
- standard propositional logic;
- NAND-only propositional logic;
- first-order Peano and Presburger arithmetic examples;
- comparison theorems for standard arithmetic interpretations;
- a Boolean ring development.

For the restart, the useful harvest is narrow:

- keep the idea of a propositional object language, but decide whether the new
  prelude really needs syntax trees or just Lean `Prop` theorem patterns;
- keep the first-order language/structure/model vocabulary as reference, but
  defer de Bruijn syntax unless we want a real object-language formalization;
- keep the Peano/Presburger files as later examples, not as architecture for
  the opening logic and set layers;
- keep Boolean rings out of the first restart phase.
