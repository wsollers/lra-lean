import LRA.VolumeI.Function.Typed.Definition

namespace LRA.Function.Examples.Canonical

open LRA.Function

universe u v

/--
**[Definition — collapse]**

The canonical collision witness: two Boolean inputs collapse to one output.

Logical form:

```lean
def collapse : Function Bool Unit
```
-/
def collapse : Function Bool Unit :=
  fun _ => ()

/--
**[Definition — shift]**

The canonical missed-value witness: successor shifts natural numbers right and
misses zero.

Logical form:

```lean
def shift : Endofunction Nat
```
-/
def shift : Endofunction Nat :=
  Nat.succ

/--
**[Definition — vacuous]**

The canonical empty-domain witness.

Logical form:

```lean
def vacuous : Function Empty Bool
```
-/
def vacuous : Function Empty Bool :=
  fun input => nomatch input

/--
**[Definition — swap]**

The nontrivial Boolean bijection.

Logical form:

```lean
def swap : Endofunction Bool
```
-/
def swap : Endofunction Bool :=
  fun input => !input

/--
**[Definition — constant]**

The constant map at a selected output.

Logical form:

```lean
def constant {Domain : Type u} {Codomain : Type v}
    (output : Codomain) : Function Domain Codomain
```
-/
def constant {Domain : Type u} {Codomain : Type v}
    (output : Codomain) : Function Domain Codomain :=
  fun _ => output

end LRA.Function.Examples.Canonical
