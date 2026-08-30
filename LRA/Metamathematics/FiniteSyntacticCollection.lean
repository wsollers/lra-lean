namespace LRA.Metamathematics

/-!
`FiniteSyntacticCollection` names a deliberately minimal, foundation-cheap
stand-in for "a finite collection of symbols" -- used only where this
subject's own schemas (`SubstitutionSafety`, and any future file with the
same need) must talk about collections of variables or symbols BEFORE
`LRA.Logic` or `LRA.Set` exist to supply anything richer.

## Why this file exists, instead of reaching for an existing `Set`

Two existing candidates were considered and rejected, for two different
reasons:

1. **`Mathlib.Data.Set` (`Set α := α → Prop`).** This is foundationally
   heavier than anything else in `LRA.Metamathematics`: it presupposes
   full impredicative propositional comprehension (every predicate on
   `α` yields a "set"), which is a strong assumption in its own right,
   not a free consequence of Lean's core type theory. Renaming it
   locally (e.g. `abbrev MetaSet := Set`) would not reduce this cost, it
   would only hide where the cost was paid. Since `LRA.Metamathematics`
   exists specifically to be the layer everything else in `LRA.Logic`
   can rely on as foundationally prior, quietly importing a strong,
   externally-sourced comprehension principle here would undermine the
   entire point of the subject.

2. **`LRA.Set` (this project's own from-scratch ZFC/TGSet/NBGSet/TypeSet
   constructions).** Importing this here would be a genuine, real
   dependency inversion: `LRA.Set` is a full formalization project of
   its own, built on top of `LRA.Logic`'s model-theory machinery for
   stating and satisfying the ZFC axioms (see `LRA.Set.Interface
   .ModelTheory`). `LRA.Metamathematics` is supposed to sit BENEATH
   `LRA.Logic`, so depending on `LRA.Set` here would be circular in the
   conceptual (not the Lean-import) sense -- the metatheoretic layer
   would depend on a fully-built object-level theory that itself depends
   on the metatheoretic layer's own consumer, `LRA.Logic`.

## What this file actually does instead

`MetaCollection` is nothing more than `List` under a documented name,
with membership inherited directly from Lean's own `List.Mem` (part of
the core prelude, not Mathlib, not `LRA.Set` -- it is exactly as
foundationally cheap as the inductive type `List` itself, which is built
from nothing but the ability to form finite sequences, no comprehension
principle of any kind). This buys exactly what `SubstitutionSafety`'s
schema needs -- "is this symbol among this finite collection" -- and
nothing more.

## Explicit scope limitation

`MetaCollection` is NOT a general-purpose set type, is NOT meant to
replace `LRA.Set`'s eventual ZFC-backed construction for object-language
use, and should NOT be exported or relied on outside this foundational
layer. Once `LRA.Set` (and `LRA.Logic`'s own machinery) mature, it will
be worth asking whether `LRA.Metamathematics` should be restated against
something richer -- deliberately deferred, not forgotten, and named here
explicitly so the deferral is a decision on record rather than a silent
gap.
-/

/-- A finite collection of values of type `α`, named separately from
`List α` only so that call sites in this subject read as "a collection of
symbols" rather than "a sequence" -- the underlying representation,
operations, and cost are identical to `List α` in every respect. -/
abbrev MetaCollection (α : Type u) := List α

/-- Membership in a `MetaCollection` is exactly `List.Mem`, restated here
under this file's name only so later files can cite
`MetaCollection.Mem` rather than reaching past this abstraction back to
`List` directly -- a purely presentational indirection, not a semantic
one. -/
abbrev MetaCollection.Mem {α : Type u} (a : α) (xs : MetaCollection α) : Prop :=
  a ∈ xs

instance {α : Type u} : Membership α (MetaCollection α) :=
  inferInstanceAs (Membership α (List α))

end LRA.Metamathematics
