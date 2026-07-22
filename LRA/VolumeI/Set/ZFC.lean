import LRA.VolumeI.Set.ZFC.Language
import LRA.VolumeI.Set.ZFC.Syntax
import LRA.VolumeI.Set.ZFC.Theory
import LRA.VolumeI.Set.ZFC.Model
import LRA.VolumeI.Set.ZFC.Semantics

/-!
Aggregate import shim for `Set/ZFC/`, organized to mirror the `Logic/`
layer -- ZFC is a first-order *theory* built on `Logic.FirstOrder`'s
existing `Signature`/`Model`/`Formula`/`Satisfies` machinery, so its files
are grouped the same way that machinery is:

  - `Language/`  -- the ZFC signature (one binary relation `∈`);
  - `Syntax/`    -- the concrete variable supply and fresh-variable
                    generators, the ZFC formula aliases and wrappers,
                    free and all-variable specializations, and the derived
                    set-theoretic vocabulary;
  - `Theory/`    -- the asserted content unique to ZFC: the named axioms
                    and the Separation/Replacement schemas (this folder
                    has no counterpart in `Logic/`, which is not a theory);
  - `Model/`     -- the `ZFCModel` alias (and, later, the concrete model
                    and its isomorphism to a Mathlib set type);
  - `Semantics/` -- satisfaction of ZFC formulas, the model-facing
                    axiom-satisfaction predicates, and schema-correctness
                    readings.

Namespaces stay flat (`LRA.VolumeI.Set.ZFC` throughout), matching how
`Logic/` decouples folder layout from namespace.
-/
