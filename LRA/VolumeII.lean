-- LRA/VolumeII.lean
-- Volume II: Foundations of Formal Number Systems
-- Project Landau — all proofs from first principles, no Mathlib.

import LRA.Foundation

-- PeanoSystems layer
import LRA.VolumeII.PeanoSystems.PeanoSystem
import LRA.VolumeII.PeanoSystems.Existence
import LRA.VolumeII.PeanoSystems.Induction
import LRA.VolumeII.PeanoSystems.BasicTheorems
import LRA.VolumeII.PeanoSystems.Recursion
import LRA.VolumeII.PeanoSystems.ParameterizedIteration

-- NaturalNumbers layer
import LRA.VolumeII.NaturalNumbers.PeanoN
import LRA.VolumeII.NaturalNumbers.Addition
import LRA.VolumeII.NaturalNumbers.Multiplication
import LRA.VolumeII.NaturalNumbers.Order
import LRA.VolumeII.NaturalNumbers.Utilities
import LRA.VolumeII.NaturalNumbers.StandardN

-- Existing integer source-variant layer
import LRA.VolumeII.Integers

-- Configurable Z → Q → R model tower and construction statements
import LRA.VolumeII.NumberSystems
