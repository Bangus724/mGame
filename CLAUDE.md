# Project Map

Rojo `src/` maps to Roblox services. No Knit, no Services layer — gameplay systems are Controllers, booted by Startup + LoadOrder.

- **Client Controllers:** `src/ReplicatedStorage/Controllers/` via `StarterPlayerScripts/Startup` + `LoadOrder`
- **Server Controllers:** `src/ServerScriptService/Controllers/` via `ServerScriptService/Startup` + `LoadOrder`
- **Paired names:** client and server each have `TycoonController` and `TransactionController` (different modules)
- **Shared:** `Classes`, `Components` (incl. GameProperties), `Libraries`, `Data` (SharedTypes, AssetIDs, AssetProperties), `Packages`
- **Server-only:** `ServerScriptService/Classes`, `Components`, `Libraries`
- **UI:** Fusion under `InterfaceController/Components/` and `Custom/`

Packages: Network (sleitnick/net), Signal, Fusion, Trove, Promise, Observers, TableUtil, t.

Require Controllers with `require(ReplicatedStorage.Controllers.X)` / `require(ServerScriptService.Controllers.X)`. Gameplay uses `game:GetService`; Fusion UI may use `game.ReplicatedStorage.Packages…`. Match nearby peers; see scoped rules below.

## Scoped Rules

- @.claude/rules/controller-structure.md — `**/Controllers/**`
- @.claude/rules/classes-components-structure.md — `**/Classes/**`, `**/Components/**`, `**/Libraries/**`, `**/Data/**`
- @.claude/rules/networking.md — `**/Controllers/**`, `**/Data/SharedTypes.luau`
- @.claude/rules/luau-comment-convention.md — `**/*.luau`
- @.claude/rules/game-properties-constants.md — `**/*.luau`
- @.claude/rules/avoid-oneoff-functions.md — `**/*.luau`
- @.claude/rules/naming-convention.md — `**/*.luau`
