import LRA.VolumeI.Set.Enderton
import LRA.VolumeI.Set.LRASet
import LRA.VolumeI.Set.Interface

/-!
Aggregate import for the Set chapter.

Two backends with genuinely different ontologies: `Enderton` (fully
axiomatic, single-sorted, every element is itself a set) and `LRASet`
(typed predicate sets, elements are ordinary carrier values). Both are
registered against Lean's shared notation classes, so `A ∪ B`, `A ∩ B`,
`A ⊆ B`, `A \ B`, `∅`, and `x ∈ A` resolve at either backend's type
exactly as they would at Mathlib's `Set`.

`Interface` is the backend-agnostic layer: per-family operation classes
(`ᶜ`, `𝒰`, `∆`) and `Prop`-valued law certificates (`UnionLaws`, ...,
`ComplementLaws`), with one fluent theorem per law. Each backend proves
its own laws in its `Laws/` directory and registers one certificate
instance per family it supports; after that, `UnionCommutative A B`
resolves the backend from the type of `A` by instance search --  no law
arguments, no plumbing. Capability differences are structural: Enderton
registers every family except complement (impossible by Russell's
paradox -- `Aᶜ`/`𝒰` do not even elaborate at `Enderton.Set`), while
`LRASet` registers all of them.
-/
