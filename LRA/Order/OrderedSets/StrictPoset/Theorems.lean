import LRA.Order.OrderedSets.StrictPoset.Characterizations

namespace LRA.Order.OrderedSets.StrictPoset

                                                         
theorem StrictPosetDoesNotRelateSelf
    (poset : LRA.Order.StrictPoset)
    (element : poset.Carrier) :
    Not (poset.StrictRelation element element) := by
  sorry

end LRA.Order.OrderedSets.StrictPoset
