import Mathlib
import LRA.VolumeII.Integers.Polish

namespace LRA
namespace VolumeIII
namespace Interop
namespace PolishInt

namespace PolishZ

abbrev P := VolumeII.Integers.Polish.TwoSidedSuccessor.P
abbrev N := VolumeII.Integers.Polish.TwoSidedSuccessor.N
abbrev Z := VolumeII.Integers.Polish.TwoSidedSuccessor.Z

def positiveMagnitude : P → Nat
  | P.succZero => 1
  | P.succ predecessor => positiveMagnitude predecessor + 1

def negativeMagnitude : N → Nat
  | N.predZero => 1
  | N.pred predecessor => negativeMagnitude predecessor + 1

def toMathlibInt : Z → Int
  | Z.zero => 0
  | Z.pos positiveRay => positiveMagnitude positiveRay
  | Z.neg negativeRay => -Int.ofNat (negativeMagnitude negativeRay)

def ofNatAsPolish : Nat → Z
  | 0 => Z.zero
  | n + 1 => VolumeII.Integers.Polish.TwoSidedSuccessor.succ (ofNatAsPolish n)

def ofNegSuccAsPolish : Nat → Z
  | 0 => VolumeII.Integers.Polish.TwoSidedSuccessor.pred Z.zero
  | n + 1 => VolumeII.Integers.Polish.TwoSidedSuccessor.pred (ofNegSuccAsPolish n)

def ofMathlibInt : Int → Z
  | Int.ofNat n => ofNatAsPolish n
  | Int.negSucc n => ofNegSuccAsPolish n

def polishAddMathlib (left : Z) (right : Int) : Int :=
  toMathlibInt left + right

def mathlibAddPolish (left : Int) (right : Z) : Z :=
  ofMathlibInt (left + toMathlibInt right)

def polishMulMathlib (left : Z) (right : Int) : Int :=
  toMathlibInt left * right

def mathlibMulPolish (left : Int) (right : Z) : Z :=
  ofMathlibInt (left * toMathlibInt right)

def polishSubMathlib (left : Z) (right : Int) : Int :=
  toMathlibInt left - right

def mathlibSubPolish (left : Int) (right : Z) : Z :=
  ofMathlibInt (left - toMathlibInt right)

def polishNegMathlib (value : Z) : Int :=
  -toMathlibInt value

def mathlibNegPolish (value : Int) : Z :=
  ofMathlibInt (-value)

def polishLtMathlib (left : Z) (right : Int) : Prop :=
  toMathlibInt left < right

def mathlibLtPolish (left : Int) (right : Z) : Prop :=
  left < toMathlibInt right

def polishLeMathlib (left : Z) (right : Int) : Prop :=
  toMathlibInt left ≤ right

def mathlibLePolish (left : Int) (right : Z) : Prop :=
  left ≤ toMathlibInt right

def zero : Z := Z.zero
def one : Z := VolumeII.Integers.Polish.TwoSidedSuccessor.succ zero
def two : Z := VolumeII.Integers.Polish.TwoSidedSuccessor.succ one
def minusOne : Z := VolumeII.Integers.Polish.TwoSidedSuccessor.pred zero
def minusTwo : Z := VolumeII.Integers.Polish.TwoSidedSuccessor.pred minusOne
def minusThree : Z := VolumeII.Integers.Polish.TwoSidedSuccessor.pred minusTwo

example : polishAddMathlib two (-5 : Int) = (-3 : Int) := by
  norm_num [polishAddMathlib, toMathlibInt, two, one, zero, positiveMagnitude]

example : mathlibAddPolish (-5 : Int) two = minusThree := by
  norm_num [
    mathlibAddPolish, ofMathlibInt, ofNegSuccAsPolish, toMathlibInt,
    two, one, zero, minusThree, minusTwo, minusOne, positiveMagnitude
  ]

example : polishMulMathlib minusTwo (3 : Int) = (-6 : Int) := by
  norm_num [
    polishMulMathlib, toMathlibInt, minusTwo, minusOne, zero, negativeMagnitude
  ]

example : mathlibMulPolish (3 : Int) minusTwo = ofMathlibInt (-6 : Int) := by
  norm_num [
    mathlibMulPolish, ofMathlibInt, ofNegSuccAsPolish, toMathlibInt,
    minusTwo, minusOne, zero, negativeMagnitude
  ]

example : polishSubMathlib two (5 : Int) = (-3 : Int) := by
  norm_num [polishSubMathlib, toMathlibInt, two, one, zero, positiveMagnitude]

example : mathlibSubPolish (5 : Int) two = ofMathlibInt (3 : Int) := by
  norm_num [
    mathlibSubPolish, ofMathlibInt, ofNatAsPolish, toMathlibInt,
    two, one, zero, positiveMagnitude
  ]

example : polishNegMathlib minusTwo = (2 : Int) := by
  norm_num [polishNegMathlib, toMathlibInt, minusTwo, minusOne, zero, negativeMagnitude]

example : mathlibNegPolish (-2 : Int) = two := by
  norm_num [
    mathlibNegPolish, ofMathlibInt, ofNatAsPolish, two, one, zero
  ]

example : polishLtMathlib minusTwo (1 : Int) := by
  norm_num [
    polishLtMathlib, toMathlibInt, minusTwo, minusOne, zero, negativeMagnitude
  ]

example : mathlibLtPolish (-3 : Int) minusTwo := by
  norm_num [
    mathlibLtPolish, toMathlibInt, minusTwo, minusOne, zero, negativeMagnitude
  ]

example : polishLeMathlib two (2 : Int) := by
  norm_num [polishLeMathlib, toMathlibInt, two, one, zero, positiveMagnitude]

example : mathlibLePolish (-2 : Int) minusTwo := by
  norm_num [
    mathlibLePolish, toMathlibInt, minusTwo, minusOne, zero, negativeMagnitude
  ]

end PolishZ

end PolishInt
end Interop
end VolumeIII
end LRA
