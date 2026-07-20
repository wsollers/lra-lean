-- LRA/VolumeIV/MathematicalSpaces/Basic.lean
-- Generic mathematical spaces.

import LRA.Foundation.Sets.Implementation

namespace LRA
namespace VolumeIV
namespace MathematicalSpaces

/-!
Volume IV label: mathematical-spaces-basic
Lean module: LRA.VolumeIV.MathematicalSpaces.Basic
Verification status: checked definitions module

At this level, a mathematical space is just a selected active set of points.
Additional structure, such as topology, is layered on top of this carrier set.
-/

abbrev MathematicalSpace (pointCarrier : Foundation.LRACarrier) : Foundation.LRACarrier :=
  Foundation.Sets.Active.Set pointCarrier

namespace MathematicalSpace

abbrev contains {pointCarrier : Foundation.LRACarrier}
    (space : MathematicalSpace pointCarrier) (point : pointCarrier) : Prop :=
  Foundation.Sets.Active.member point space

abbrev universal (pointCarrier : Foundation.LRACarrier) : MathematicalSpace pointCarrier :=
  Foundation.Sets.Active.universal pointCarrier

abbrev singleton {pointCarrier : Foundation.LRACarrier}
    (point : pointCarrier) : MathematicalSpace pointCarrier :=
  Foundation.Sets.Active.singleton point

end MathematicalSpace

end MathematicalSpaces
end VolumeIV
end LRA
