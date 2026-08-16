import LRA.VolumeI.Map.Typed.Definition

namespace LRA.Map.Examples.Canonical

open LRA.Map.Typed

universe u v

/--
**[Definition — collapse]**

The canonical collision witness: two Boolean inputs collapse to one output.

Logical form:

```lean
def collapse : TypedMap Bool Unit
```
-/
def collapse : TypedMap Bool Unit :=
  fun _ => ()

/--
**[Definition — shift]**

The canonical missed-value witness: successor shifts natural numbers right and
misses zero.

Logical form:

```lean
def shift : Endomap Nat
```
-/
def shift : Endomap Nat :=
  Nat.succ

/--
**[Definition — vacuous]**

The canonical empty-domain witness.

Logical form:

```lean
def vacuous : TypedMap Empty Bool
```
-/
def vacuous : TypedMap Empty Bool :=
  fun input => nomatch input

/--
**[Definition — swap]**

The nontrivial Boolean bijection.

Logical form:

```lean
def swap : Endomap Bool
```
-/
def swap : Endomap Bool :=
  fun input => !input

/--
**[Definition — constant]**

The constant map at a selected output.

Logical form:

```lean
def constant {Domain : Type u} {Codomain : Type v}
    (output : Codomain) : TypedMap Domain Codomain
```
-/
def constant {Domain : Type u} {Codomain : Type v}
    (output : Codomain) : TypedMap Domain Codomain :=
  fun _ => output

end LRA.Map.Examples.Canonical
