-- LRA/VolumeII/Integers/Interface.lean
-- Common algebraic interfaces for integer implementations.

import LRA.VolumeI.Set
import LRA.VolumeI.Algebra

namespace LRA
namespace VolumeII
namespace Integers

/-!
Volume II label: integers-interface
Lean module: LRA.VolumeII.Integers.Interface
Verification status: checked interface module

The generic algebraic structures are carrier-level operation bundles. Integer
implementations extend them with successor and predecessor so construction
variants can attach law bundles as mixins at the level they have proved.
-/

/-- Carrier with additive group operations. -/
structure AdditiveStructure where
  carrier : LRA.VolumeI.Set.LRACarrier
  zero : LRA.VolumeI.Algebra.Operations.NullaryOperation carrier
  add : LRA.VolumeI.Algebra.Operations.BinaryOperation carrier
  neg : LRA.VolumeI.Algebra.Operations.UnaryOperation carrier

/-- Carrier with multiplicative operations. -/
structure MultiplicativeStructure where
  carrier : LRA.VolumeI.Set.LRACarrier
  zero : LRA.VolumeI.Algebra.Operations.NullaryOperation carrier
  one : LRA.VolumeI.Algebra.Operations.NullaryOperation carrier
  mul : LRA.VolumeI.Algebra.Operations.BinaryOperation carrier

/-- Carrier with strict and non-strict order relations. -/
structure OrderedStructure where
  carrier : LRA.VolumeI.Set.LRACarrier
  lt : LRA.VolumeI.Relations.Endorelation carrier
  le : LRA.VolumeI.Relations.Endorelation carrier

/-- Carrier with ring operations. -/
structure RingStructure extends AdditiveStructure, MultiplicativeStructure where

/-- Carrier with ordered-ring operations. -/
structure OrderedRingStructure extends RingStructure, OrderedStructure where

/-- Public structure for integer implementations. -/
structure IntegerStructure extends OrderedRingStructure where
  succ : carrier → carrier
  pred : carrier → carrier

end Integers
end VolumeII
end LRA
