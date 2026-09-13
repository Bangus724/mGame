# mGame

A Roblox **1vAll hidden-role** arena game. One player is secretly the **Killer**. Everyone else has to survive the round — and one of them is the **Sheriff**, armed with a revolver.

Crowded maps, short rounds, observation over accusation. You live or die by movement, timing, and whether the Sheriff (or a lucky Civilian) lands a shot.

## Session flow

1. **Lobby intermission** — players hang out in a shared lobby between rounds (cosmetics, chat, ready-up).
2. **Map vote** — the lobby picks the next arena from a short slate.
3. **Role assign** — server secretly assigns **one Killer**, **one Sheriff**, rest **Civilians**. Counts stay Classic even in large lobbies (10+).
4. **Grace** — short no-weapon window so people can scatter.
5. **Hunt** — weapons go live; the clock ticks.
6. **Results** — Killer wipe, Sheriff/Civilian win (Killer down or timer), then back to intermission.

Dead players spectate. Rounds are a few minutes, not a campaign.

## Roles

### Killer

Win by eliminating every other living player before time runs out.

- Looks identical to everyone else while the **knife** is holstered. Drawing it is the tell.
- Melee is instant and lethal.
- Can throw the knife as a skill-shot; throwing has a cooldown and leaves them briefly exposed.
- Can spend **Gold** on a one-shot revolver if they want range without throwing.

Playstyle: blend, isolate, strike, holster, walk away.

### Sheriff

Starts with a **revolver** once the hunt begins. Job is to find and drop the Killer without hitting Civilians.

- Infinite ammo, shot cooldown — missing is expensive.
- Hitting a Civilian kills **both** the Civilian and the Sheriff. No take-backs.
- If the Sheriff dies, the revolver **drops**. Any Civilian can pick it up and become the new Sheriff.
- Dropped revolvers should be locatable so the round does not stall with the only gun sitting in a corner.

Playstyle: watch the crowd, don't panic-fire, hold space the Killer wants.

### Civilian

Unarmed at spawn. Survive the clock, or get a shot of your own.

- Collect **Gold** around the map. Enough Gold buys a **one-shot** revolver.
- That shot can save the lobby — or wipe you if you hit the wrong person (friendly fire still punishes).
- A Civilian who downs the Killer is the round's hero. Flavor, not a fourth role.
- Can claim a dropped Sheriff revolver instead of farming Gold.

Playstyle: hide, group, farm, or hunt. All three are valid.

## Win conditions

| Side | Wins if... |
| --- | --- |
| Killer | Every other player is dead before the timer |
| Civilians + Sheriff | The Killer dies, **or** anyone non-Killer is still alive when time expires |

## Maps & dynamic environments

Arenas are toys, not empty corridors. Expect:

- **Gold** pickups that spawn during the round
- **Traps** and map gadgets (often Gold-gated): doors, pitfalls, movers, shortcuts
- **Moving elements** — platforms, conveyors, timed hazards, etc.

Concrete numbers live in `GameProperties`.

## Client feel

- **Fast-paced** but **grounded** movement: walk, run, jump — no flying, grappling, or parkour-as-the-genre
- **First person by default**; players can switch to third person
- Readable holster / draw tells matter more in first person — keep weapon state obvious to others in third-person view of other characters

## Design rules of thumb

- **Hidden role, visible behavior.** Information comes from animation, pathing, who has a gun out, who is near bodies — not from a role nametag over other players.
- **Lethal and readable.** Hits should feel certain. Fairness comes from cooldowns, holster tells, and friendly-fire risk — not sponge HP.
- **Server owns the truth.** Roles, damage, Gold, revolver drops, map gadgets, and round state are server-authoritative.
- **Observation, not meetings.** No discussion phase, no majority vote to eject, no tasks-as-win. Map votes happen only in lobby intermission.
- **Classic scaling.** Large lobbies (10+) still use one Killer and one Sheriff. Extra modes later, after Classic is fun.
- **Pressure valves:** grace period, Gold catch-up, revolver drop + locator, endgame heat when few Civilians remain.

## Repo

Rojo `src/` maps onto Roblox services. Gameplay systems are Controllers, booted by Startup + LoadOrder. See `AGENTS.md` for the project map.

This repo is an early scaffold — architecture is in place, match systems are not built yet.
