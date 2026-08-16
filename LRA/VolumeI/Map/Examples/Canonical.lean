import LRA.VolumeI.Map.Typed.Definition

namespace LRA.Map.Examples.Canonical

open LRA.Map.Typed

universe u v

/--
The canonical collision witness: two Boolean inputs collapse to one output.
-/
def collapse : TypedMap Bool Unit :=
  fun _ => ()

/--
The canonical missed-value witness: successor shifts natural numbers right and
misses zero.
-/
def shift : Endomap Nat :=
  Nat.succ

/--
The canonical empty-domain witness.
-/
def vacuous : TypedMap Empty Bool :=
  fun input => nomatch input

/--
The nontrivial Boolean bijection.
-/
def swap : Endomap Bool :=
  fun input => !input

/--
The constant map at a selected output.
-/
def constant {Domain : Type u} {Codomain : Type v}
    (output : Codomain) : TypedMap Domain Codomain :=
  fun _ => output

end LRA.Map.Examples.Canonical
