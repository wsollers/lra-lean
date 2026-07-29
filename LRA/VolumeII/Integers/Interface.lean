-- LRA/VolumeII/Integers/Interface.lean
-- Common algebraic interfaces for integer implementations.

import LRA.VolumeI.Set
import LRA.VolumeI.Algebra

namespace LRA.VolumeII.Integers

/-!
Volume II label: integers-interface
Lean module: LRA.VolumeII.Integers.Interface
Verification status: checked interface module

The generic algebraic structures are carrier-level operation bundles. Integer
implementations extend them with successor and predecessor so construction
variants can attach law bundles as mixins at the level they have proved.
-/


/-- Carrier with additive group operations.

Mathematical statement (Lean): `structure AdditiveStructure`.
-/
structure AdditiveStructure where
  carrier : LRA.VolumeI.Set.LRACarrier
  zero : LRA.VolumeI.Operations.NullaryOperation carrier
  add : LRA.VolumeI.Operations.BinaryOperation carrier
  neg : LRA.VolumeI.Operations.UnaryOperation carrier


/-- Carrier with multiplicative operations.

Mathematical statement (Lean): `structure MultiplicativeStructure`.
-/
structure MultiplicativeStructure where
  carrier : LRA.VolumeI.Set.LRACarrier
  zero : LRA.VolumeI.Operations.NullaryOperation carrier
  one : LRA.VolumeI.Operations.NullaryOperation carrier
  mul : LRA.VolumeI.Operations.BinaryOperation carrier


/-- Carrier with strict and non-strict order relations.

Mathematical statement (Lean): `structure OrderedStructure`.
-/
structure OrderedStructure where
  carrier : LRA.VolumeI.Set.LRACarrier
  lt : LRA.VolumeI.Relations.Endorelation carrier
  le : LRA.VolumeI.Relations.Endorelation carrier


/-- Carrier with ring operations.

Mathematical statement (Lean): `structure RingStructure extends AdditiveStructure, MultiplicativeStructure`.
-/
structure RingStructure extends AdditiveStructure, MultiplicativeStructure where


/-- Carrier with ordered-ring operations.

Mathematical statement (Lean): `structure OrderedRingStructure extends RingStructure, OrderedStructure`.
-/
structure OrderedRingStructure extends RingStructure, OrderedStructure where


/-- Public structure for integer implementations.

Mathematical statement (Lean): `structure IntegerStructure extends OrderedRingStructure`.
-/
structure IntegerStructure extends OrderedRingStructure where
  succ : carrier → carrier
  pred : carrier → carrier

end LRA.VolumeII.Integers
