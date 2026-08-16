import LRA.VolumeI.Map.Fiber.Definition

namespace LRA.Map.Fiber

open LRA.Map.Typed

universe u v w

/--
Sources: British/Commonwealth spelling in geometry and bundle texts uses
"fibre"; LRA keeps American spelling `Fiber`.
-/
abbrev Fibre {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain)
    (output : Codomain) : Domain -> Prop :=
  Fiber map output

/--
Sources: Shurman and Makarov/Podkorytov define level sets as points mapping
to a fixed value. This is the predicate-level version of a fiber.
-/
abbrev LevelSet {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain)
    (output : Codomain) : Domain -> Prop :=
  Fiber map output

/--
Sources: Makarov/Podkorytov identify a level set with the preimage of a
one-point set. This alias records the singleton-preimage reading at predicate
level.
-/
abbrev SingletonPreimage {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain)
    (output : Codomain) : Domain -> Prop :=
  Fiber map output

/--
Sources: bundle and quotient-map language often describes the fiber over a
base point as the point fiber.
-/
abbrev PointFiber {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain)
    (output : Codomain) : Domain -> Prop :=
  Fiber map output

/--
Sources: British/Commonwealth spelling in geometry and bundle texts uses
"fibre set"; LRA keeps `FiberSet`.
-/
abbrev FibreSet {Domain : Type u} {Codomain : Type v}
    {DomainSet : Type w}
    [Membership Domain DomainSet]
    [LRA.Set.HasSeparation Domain DomainSet]
    [LRA.Set.HasUniversal DomainSet]
    (map : TypedMap Domain Codomain)
    (output : Codomain) : DomainSet :=
  FiberSet map output

end LRA.Map.Fiber
