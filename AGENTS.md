# Game

mGame is a Roblox **1vAll hidden-role** arena: one Killer vs one Sheriff + Civilians. Pitch: `README.md`. Constraints: `.Codex/rules/game-design.md`.

# Project Map

Rojo `src/` maps to Roblox services. No Knit, no Services layer — gameplay systems are Controllers, booted by Startup + LoadOrder.

- **Client Controllers:** `src/ReplicatedStorage/Controllers/` via `StarterPlayerScripts/Startup` + `LoadOrder`
- **Server Controllers:** `src/ServerScriptService/Controllers/` via `ServerScriptService/Startup` + `LoadOrder`
- **Paired names:** when client and server both need a domain, they share the Controller name (different modules)
- **Shared:** `Classes`, `Components` (incl. GameProperties), `Libraries`, `Data` (SharedTypes, AssetIDs, AssetProperties), `Packages`
- **Server-only:** `ServerScriptService/Classes`, `Components`, `Libraries`
- **UI:** Fusion under `InterfaceController/Components/` and `Custom/`

Packages: Network (sleitnick/net), Signal, Fusion, Trove, Promise, Observers, TableUtil, t.

Require Controllers with `require(ReplicatedStorage.Controllers.X)` / `require(ServerScriptService.Controllers.X)`. Gameplay uses `game:GetService`; Fusion UI may use `game.ReplicatedStorage.Packages…`. Tune match numbers in `GameProperties`. Match nearby peers; see scoped rules below.

## Scoped Rules

- @.Codex/rules/game-design.md — always
- @.Codex/rules/controller-structure.md — `**/Controllers/**`
- @.Codex/rules/classes-components-structure.md — `**/Classes/**`, `**/Components/**`, `**/Libraries/**`, `**/Data/**`
- @.Codex/rules/networking.md — `**/Controllers/**`, `**/Data/SharedTypes.luau`
- @.Codex/rules/luau-comment-convention.md — `**/*.luau`
- @.Codex/rules/game-properties-constants.md — `**/*.luau`
- @.Codex/rules/avoid-oneoff-functions.md — `**/*.luau`
- @.Codex/rules/naming-convention.md — `**/*.luau`
