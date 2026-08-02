namespace LRA.VolumeI.Set

/-!
Well-foundedness and well-definedness for `ZFCTreeSet`.

Status: placeholder. This is expected to be the interesting file, once
`ZFCTreeSet` exists: well-foundedness should be close to free
(structural, from the pre-set tree's own inductive definition), while
well-definedness is genuinely non-trivial here, unlike every other
backend -- operations will need to be shown to respect the bisimulation
equivalence the quotient is built from, not just ordinary `Eq`.
-/

end LRA.VolumeI.Set
