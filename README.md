# FiveM BDA Script

A **FiveM script** for summoning players in a vocal in discord with notifications, Discord webhooks, and multi-language support.  

---

## Features

- `/bda` command (configurable) to summon a player by ID.  
- Supports multiple **notification systems**: `ox_lib`, `esx`, `mythic_notify`, or custom.  
- Sends **notifications** to the target player and the command issuer.  
- **Discord webhook** integration with configurable message format.  
- Multi-language support (`fr`, `en`), with easy `_U` translation system.  
- Configurable **authorized users** by license, discord ID or Steam ID.  
- Configurable **command name**, messages, and webhook details.  

---

## Installation

1. Place the resource folder in your `resources` directory.  
2. Add it to your `server.cfg`:

```cfg
ensure bda_script
