import LRA.Set.Interop.Mathlib.PredicateSet
import LRA.Set.Interop.Mathlib.ZFSet
import LRA.Set.Interop.Mathlib.EndertonModel
import LRA.Set.Interop.Mathlib.ZFSetModel

/-!
Opt-in Mathlib interoperability for Set.

This includes Mathlib-backed set realizations and model-satisfaction bridges
that currently require Mathlib. No module imported by `LRA.Set` depends on
this aggregate.
-/
