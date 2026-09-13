# Luau Comments

Applies to: `**/*.luau`

Use this style for **new files** and when you are already rewriting comments. Don't convert `--//` (or `--*//`, `--//**`, `--[]`) as a drive-by.

**Exception:** Fusion UI under `InterfaceController/Components/` and `Custom/` — keep Moonwave `--[=[` `@class` / `@interface`.

## File header

```luau
--[[

    @class FooController

    One to three sentences of purpose.

--]]
```

Prefer `--[[` / `--]]` for gameplay modules. Optional `@author`, usage, or API list.

## Sections

`-- ALL_CAPS`, no slashes. Include only sections that have content: `-- DEPENDENCIES` (requires), `-- REFERENCES` (services / instances), `-- CONSTANTS`, `-- TYPES`, `-- VARIABLES` (mutable module state), `-- MODULE`. Long files may add `--[[ INTERNAL HELPERS ]]--` and `--[[ PUBLIC API ]]--`. Don't column-align `=`.

## Function docs

Non-trivial functions get EmmyLua `---` immediately above:

```luau
--- Finds a cached tycoon by GUID.
--- @param guid string -- Tycoon GUID.
--- @return Tycoon? -- Cached instance, or nil.
function TycoonController.GetTycoonObjFromGUID(guid: string): Tycoon?
```

Tiny helpers may use a single `---` line. Skip docs that only restate the name. Inline `--` explains *why* or a non-obvious step — not every line.
