import FuncDep

def countStrX (xs : String) : FuncDep.instCountPartsString.α :=
  FuncDep.CountParts.φ xs 'x'

def main : IO Unit := do
  let nₓ := countStrX "Rhox"
  -- IO.println s!"{nₓ}"
  let n₂ := FuncDep.CountParts.φ "Tarmogoyf" 'o'
  -- IO.println s!"{n₂}"
