# Game Design

mGame is a Roblox **1vAll hidden-role** arena: one **Killer** vs one **Sheriff** + **Civilians**.

## Session

Lobby intermission → map vote → private roles → grace (no weapons) → hunt → results → repeat. Short rounds. Dead players spectate. Lobbies are large (10+); role counts stay Classic (1 Killer, 1 Sheriff).

**Roles:** Killer (knife; identical until drawn; throwable; may buy Gold one-shot). Sheriff (revolver; cooldown; shoot Civilian → both die; death drops revolver for any Civilian). Civilians farm **Gold** for a one-shot. Timer: Killer must wipe the lobby; survivors win if the Killer dies or time expires.

## Maps & client

- Dynamic arenas: Gold spawns, traps/gadgets, moving elements
- Fast grounded movement (walk / run / jump)
- First person default; optional third person

## Build this

- Observation tension (movement, holster tells, bodies) — no in-round discussion, ejections, or tasks-as-win
- Lethal, readable hits; fairness via cooldowns / tells / friendly fire, not sponge HP
- Server-authoritative roles, combat, Gold, revolver drops, gadgets, round state
- Classic 1vAll until that loop is fun; extra modes later
- Tune numbers in `GameProperties`

## Do not

- Put role names over other players' heads
- Add in-round voting/ejection or tasks-as-win as the core loop
