-- LRA/NumberSystems/Integers/Constructions/Polish/TwoSidedSuccessor/Carrier.lean
-- The two-sided successor carrier: zero plus a successor-generated positive
-- ray and a predecessor-generated negative ray.

namespace LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor

/-!
Volume II label: experimental-integers-polish-two-sided-successor
Lean module: LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Carrier
Verification status: experimental checked core, pending source integration

This module tests a direct construction of the integers as the disjoint union of
zero, a successor-generated positive ray, and a predecessor-generated negative
ray. It is intentionally isolated from the canonical integer construction.

Source variant: Polish integer axiomatization tradition, following the
Peano-like successor/predecessor systems discussed by Iwanuś and
Wybraniec-Skardowska.

Moved from `LRA.VolumeII.Integers.Polish.TwoSidedSuccessor` (formerly one
file covering the whole pipeline); split per §1.6.1 into `Carrier` (this
file, the pre-carrier), `WellFoundedness` (the recursion/induction
principles), `Operations` (`add`/`neg`/`mul`), and `Instances`
(registration).
-/

/--
**[Inductive — P]**

Mathematical statement (Lean): `inductive P : Type`.


Logical form:

```lean
inductive P : Type where
  | succZero : P
  | succ : P → P
```
-/
inductive P : Type where
  | succZero : P
  | succ : P → P

/--
**[Inductive — N]**

Mathematical statement (Lean): `inductive N : Type`.


Logical form:

```lean
inductive N : Type where
  | predZero : N
  | pred : N → N
```
-/
inductive N : Type where
  | predZero : N
  | pred : N → N

/--
**[Inductive — Z]**

Mathematical statement (Lean): `inductive Z : Type`.


Logical form:

```lean
inductive Z : Type where
  | zero : Z
  | pos : P → Z
  | neg : N → Z
```
-/
inductive Z : Type where
  | zero : Z
  | pos : P → Z
  | neg : N → Z

open Z

/--
**[Def — succ]**

Logical form:

```lean
def succ : Z → Z
  | zero => pos P.succZero
  | pos p => pos (P.succ p)
  | neg n =>
      match n with
      | N.predZero => zero
      | N.pred n' => neg n'
```
-/
def succ : Z → Z
  | zero => pos P.succZero
  | pos p => pos (P.succ p)
  | neg n =>
      match n with
      | N.predZero => zero
      | N.pred n' => neg n'

/--
**[Def — pred]**

Logical form:

```lean
def pred : Z → Z
  | zero => neg N.predZero
  | pos p =>
      match p with
      | P.succZero => zero
      | P.succ p' => pos p'
  | neg n => neg (N.pred n)
```
-/
def pred : Z → Z
  | zero => neg N.predZero
  | pos p =>
      match p with
      | P.succZero => zero
      | P.succ p' => pos p'
  | neg n => neg (N.pred n)

/-- The distinguished element one. Moved from `LandauWorkup`, where it sat
alongside the algebraic laws; relocated here to keep distinguished elements
with the carrier, matching `Landau.Carrier`'s placement of `LandauOne`.

Logical form:

```lean
def one : Z := Z.pos P.succZero
```
-/
def one : Z := Z.pos P.succZero

end LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor
