namespace LRA.AlgebraicStructures

universe u

/-- A magma is `(M, *)` with `M` nonempty and `*` closed. Closure is free from the
type `M → M → M` (a total function); nonemptiness is not free — unlike every
structure above Magma in this hierarchy, a magma has no identity/zero/one constant to
witness `Nonempty M` automatically, so it has to be required explicitly. It's required
here as an ambient assumption (`[Nonempty M]`), not a stored field: a stored field
would collide by name with any other atomic `<X>Laws` class that also stores its own
nonemptiness field, the moment some later `class abbrev` combines both (this is
exactly what happened when `AdditiveSemigroupLaws` first got a `CarrierNonempty`
field — see its doc comment). With nothing left to store, `MagmaLaws` itself is now
content-free: being a magma just *is* having `Mul` and `Nonempty` together. -/
class MagmaLaws (M : Type u) [Mul M] [Nonempty M] : Prop

end LRA.AlgebraicStructures
