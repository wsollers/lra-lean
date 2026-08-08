import LRA.VolumeI.Set.Algebra.SigmaAlgebra

namespace LRA.VolumeI.Set.Algebra

/-!
Borel algebras of sets.
-/

/-- A Borel-algebra signature is a sigma-algebra signature equipped with a
distinguished generating family. -/
structure BorelAlgebraSignature extends SigmaAlgebraSignature where
  generator : carrier → Prop

/-- Laws for a Borel-algebra signature.

The current contract records the underlying sigma-algebra laws and that every
generator is admitted. Minimality/generation theorems belong here as the Borel
layer is developed. -/
structure BorelAlgebraLaws (signature : BorelAlgebraSignature) : Prop
    extends SigmaAlgebraLaws signature.toSigmaAlgebraSignature where
  GeneratorIsMember :
    ∀ setObject, signature.generator setObject → signature.IsMember setObject

/-- A bundled model of a Borel algebra. -/
structure BorelAlgebraModel where
  signature : BorelAlgebraSignature
  laws : BorelAlgebraLaws signature

end LRA.VolumeI.Set.Algebra
