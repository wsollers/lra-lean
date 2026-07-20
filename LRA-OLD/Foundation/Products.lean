import LRA.Foundation.Sets

namespace LRA.Foundation

universe u v

abbrev Product (α β : LRACarrier) := α × β

abbrev Tuple (size : Nat) (α : LRACarrier) := Fin size → α

namespace Product

def first {α β : LRACarrier} (pair : Product α β) : α :=
  pair.1

def second {α β : LRACarrier} (pair : Product α β) : β :=
  pair.2

def cartesianProduct {α β : LRACarrier}
    (left : LRASet α) (right : LRASet β) : LRASet (Product α β) :=
  fun pair => LRASet.member pair.1 left ∧ LRASet.member pair.2 right

end Product

end LRA.Foundation
