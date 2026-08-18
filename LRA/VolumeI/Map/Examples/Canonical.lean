import LRA.Function.Definition

namespace LRA.Map.Examples.Canonical


universe u v

/--
**[Definition — collapse]**

The canonical collision witness: two Boolean inputs collapse to one output.

Logical form:

```lean
def collapse : LRA.Function Bool Unit
```
-/
def collapse : LRA.Function Bool Unit :=
  fun _ => ()

/--
**[Definition — shift]**

The canonical missed-value witness: successor shifts natural numbers right and
misses zero.

Logical form:

```lean
def shift : LRA.Function Nat Nat
```
-/
def shift : LRA.Function Nat Nat :=
  Nat.succ

/--
**[Definition — vacuous]**

The canonical empty-domain witness.

Logical form:

```lean
def vacuous : LRA.Function Empty Bool
```
-/
def vacuous : LRA.Function Empty Bool :=
  fun input => nomatch input

/--
**[Definition — swap]**

The nontrivial Boolean bijection.

Logical form:

```lean
def swap : LRA.Function Bool Bool
```
-/
def swap : LRA.Function Bool Bool :=
  fun input => !input

/--
**[Definition — constant]**

The constant map at a selected output.

Logical form:

```lean
def constant {Domain : Type u} {Codomain : Type v}
    (output : Codomain) : LRA.Function Domain Codomain
```
-/
def constant {Domain : Type u} {Codomain : Type v}
    (output : Codomain) : LRA.Function Domain Codomain :=
  fun _ => output

end LRA.Map.Examples.Canonical
