-- LRA/VolumeIII/Contracts.lean
--
-- The number-system contracts, as one importable surface.
--
-- Each file declares a carrier (stubbed construction) and the named OBLIGATIONS
-- it must satisfy — its final algebraic shape, every obligation `sorry` today.
-- The progression of DISTINGUISHING obligations is the arithmetic ladder:
--
--     ℕ   IsWellOrdered          (least element; no zero, no subtraction)
--     ℤ   HasNoZeroDivisors      (integral domain; gains zero/neg, no inverse)
--     ℚ   IsDenselyOrdered       (field; dense, but has gaps)
--     ℝ   RealsAreComplete       (the gap-filler)
--
-- SCOREBOARD: a declaration is GREEN iff `#print axioms` omits `sorryAx`.
-- The harvester reads that footprint to render green/red per obligation.
-- Nothing hand-maintained — the kernel keeps score.

import LRA.VolumeIII.Contracts.Natural
import LRA.VolumeIII.Contracts.Integer
import LRA.VolumeIII.Contracts.Rational
import LRA.VolumeIII.Contracts.Real
