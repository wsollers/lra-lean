import LRA.Pilot.OrderBounds

/-!
# Bounds metadata extraction check

This compile-time check demonstrates that the stable concept identifier is
read from Lean's compiled environment rather than copied from a source parser
or a parallel registry.
-/

namespace LRA.Pilot.OrderBounds.MetadataCheck

open Lean Elab Command
open LRA.Pilot.Metadata

run_cmd do
  let environment ← getEnv
  let actual := CanonicalConceptId? environment ``OrderBounds.UpperBound
  unless actual = some "order.upper-bound" do
    throwError "expected canonical concept order.upper-bound, got {actual}"

end LRA.Pilot.OrderBounds.MetadataCheck
