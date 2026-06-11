import LRA.VolumeI.PropositionalLogic.MetaLogic

namespace LRA.VolumeI.PropositionalLogic.SimpleLogic
open LRA.VolumeI.PropositionalLogic

-- 0. Define atoms, binary operators, signature, and formula types
inductive SimpleAtoms where
  | p | q

inductive SimpleBinary where
  | nand

def SimpleSig : Signature := {
  Atoms := SimpleAtoms
  BinOps := SimpleBinary
}

abbrev SimpleFormula := Formula SimpleSig

def nand (ϕ ψ : SimpleFormula) : SimpleFormula :=
  Formula.binary SimpleBinary.nand ϕ ψ

-- 1. Define the Semantics (Truth Table for NAND)
def evaluate (v : SimpleAtoms → Bool) : SimpleFormula → Bool
  | Formula.atom a => v a
  | Formula.binary op ϕ ψ => match op with
    | SimpleBinary.nand => !(evaluate v ϕ && evaluate v ψ)
  | Formula.unary _ _ => false
  | Formula.neg _ => false
  | Formula.conj _ _ => false

-- 2. Construct 'NOT' out of pure NAND
-- In logic, ¬P is equivalent to (P NAND P)
def build_not (ϕ : SimpleFormula) : SimpleFormula :=
  nand ϕ ϕ

-- 3. THE COMPLETENESS THEOREM
-- We formally prove that our 'build_not' function perfectly matches 
-- the mathematical definition of a boolean NOT operation.
theorem simple_logic_has_not (v : SimpleAtoms → Bool) (ϕ : SimpleFormula) : 
  evaluate v (build_not ϕ) = !(evaluate v ϕ) := by
  
  -- Step 1: Unfold our custom definitions
  dsimp [build_not, evaluate, nand]
  
  -- Step 2: We are left with proving !(b && b) = !b. 
  -- We tell Lean to test both True and False cases for the evaluated formula.
  cases h : evaluate v ϕ
  
  -- Case: evaluate v ϕ = false
  case false => rfl  -- !(false && false) = !false (True = True)
  
  -- Case: evaluate v ϕ = true
  case true => rfl   -- !(true && true) = !true (False = False)


-- 4. UNIT TESTS AND NEGATIVE CASES

-- Step A: Define a specific test state (Valuation) 
-- We create a universe where both P and Q are explicitly TRUE.
def test_val_all_true : SimpleAtoms → Bool
  | SimpleAtoms.p => true
  | SimpleAtoms.q => true

-- Step B: Define the formula we want to test: (P NAND Q)
def test_formula_pq : SimpleFormula :=
  nand (Formula.atom SimpleAtoms.p) (Formula.atom SimpleAtoms.q)

-- ==========================================
-- TEST 1: The Compile-Time Assertion
-- ==========================================
-- This tests the engine using standard execution.
-- We assert that evaluating the formula MUST equal false.
#guard (evaluate test_val_all_true test_formula_pq) == false


-- ==========================================
-- TEST 2: The Formal Proof of the Negative
-- ==========================================
-- This mathematically proves the negative case. 
-- 'example' is just an anonymous theorem.
example : evaluate test_val_all_true test_formula_pq = false := by
  -- Because our formula and valuation are finite and fully defined,
  -- 'rfl' simply computes !(true && true) and sees that it equals false.
  rfl

end LRA.VolumeI.PropositionalLogic.SimpleLogic
