# Classes, Components, Libraries, Data

Applies to: `**/Classes/**,**/Components/**,**/Libraries/**,**/Data/**`

Match nearby peers in the same tree.

| Bucket | Where | What belongs |
|---|---|---|
| **Classes** | `ReplicatedStorage/Classes`, `ServerScriptService/Classes` | Instantiated OOP. Client and server `Tycoon` are different modules. |
| **Components** | `…/Components` | Templates (`.new` + `.check`), buffers (`Encode` + `Versions/` + `Migrations/`), small OOP (`RateLimiter`). Not CollectionService. |
| **Libraries** | `ReplicatedStorage/Libraries` | Stateless helpers (`ObjectSolver`, `TycoonUtil`). |
| **Data** | `ReplicatedStorage/Data` | `SharedTypes`, `AssetIDs`, `AssetProperties`. |

Feature Classes/Components may live under the owning Controller. UI Fusion: `InterfaceController/Components/` and `Custom/` — `return function(Scope, Props)`, Moonwave `--[=[`, `innerScope` + `Util.CombineProps` / `Fallback`; follow `Base` / `Button`. Folder + `init.luau` when there are helpers; single-file when peers are single-file.

## OOP

```luau
local Foo = {}
Foo.__index = Foo

function Foo.new(...)
	local self = setmetatable({}, Foo)
	return self
end

function Foo.destroy(self: Foo)
	setmetatable(self, nil)
	table.clear(self)
end

export type Foo = typeof(Foo.new(nil :: any))
return Foo
```

Use `__index`, `.new`, `.destroy` when peers do. Helpers in `script.Dependencies.…`. Subclass with `setmetatable(ParentClass.new(…), Child)`. `BuildSession/Classes/ObjectClass` is a plain table factory (no `__index`) — match it only when extending it.

Don't flesh out `ServerScriptService/Classes/Player` or the stub `ServerScriptService/Libraries/ObjectSolver` / `TemplateVerifier` (real ObjectSolver is under ReplicatedStorage). Match Trove `:destroy` vs `:Destroy` in the file you're editing.
