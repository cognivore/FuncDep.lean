import FuncDep

def countStrX (xs : String) : Nat :=
  FuncDep.CountParts.φ xs 'x'

def countNonsense (xs : String) : Char :=
  FuncDep.CountParts.φ xs 0.3

def main : IO Unit := do
  let nₓ := countStrX "Rhox"
  IO.println s!"{nₓ}"
  -- let n₂ := FuncDep.CountParts.φ "Tarmogoyf" 'o'
  -- IO.println s!"{n₂}"
  let n₃ := countNonsense "Paradox Engine"
  IO.println s!"{n₃}"
