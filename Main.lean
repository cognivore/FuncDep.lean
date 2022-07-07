import FuncDep

def countStrX (xs : String) : Nat :=
  FuncDep.CountParts.φ xs 'x'

def countNonsense (xs : String) : Char :=
  FuncDep.CountParts.φ xs 0.3

def concreteInstanceCall (xs : String) : FuncDep.instCountParts_String.α  :=
  FuncDep.CountParts_.φ xs 'x'

def deducedInstanceCall (xs : T) [i : FuncDep.CountParts_ T] :=
  FuncDep.CountParts_.φ xs

/-
failed to synthesize instance
  FuncDep.CountParts_ Char
-/
-- def concreteDeducedInstanceCall (x : Char) := deducedInstanceCall x

/-
application type mismatch
  deducedInstanceCall x y
argument
  y
has type
  Float : Type
but is expected to have type
  FuncDep.CountParts_.μ Char : Type ?u.341
-/
-- def concreteDeducedInstanceCall' (x : Char) (y : Float) : Char := deducedInstanceCall x y

/-
application type mismatch
  deducedInstanceCall x y
argument
  y
has type
  T1 : Type ?u.354
but is expected to have type
  FuncDep.CountParts_.μ Char : Type ?u.367
-/
-- def concreteDeducedInstanceCall'' (x : Char) [i : FuncDep.CountParts Char T1 T2] (y : T1) : T2 := deducedInstanceCall x y

def main : IO Unit := do
  let nₓ := countStrX "Rhox"
  IO.println s!"{nₓ}"
  let n₂ : Nat := FuncDep.CountParts_.φ "Tarmogoyf" 'o'
  IO.println s!"{n₂}"
  let n₂' := (FuncDep.CountParts_.φ "Tarmogoyf" 'o' : Nat)
  /-
  failed to synthesize instance
    ToString (FuncDep.CountParts_.α String)
  -/
  -- IO.println s!"{n₂'}"
  let n₃ : Nat := FuncDep.CountParts.φ "Magnivore" 'o'
  IO.println s!"{n₃}"
  let n₄ := countNonsense "Paradox Engine"
  IO.println s!"{n₄}"
