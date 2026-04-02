# Snoozefest Home Assistant Add-on

Snoozefest is a local-first alarm and timer brain for Home Assistant.

It runs the scheduler, keeps persistent state, and publishes MQTT discovery entities so you can control alarms and timers directly in Home Assistant.

## What you get with just the add-on

- one manager device (`Snoozefest`) with Add Alarm/Add Timer/Purge controls
- one device per alarm
- one device per timer
- reliable local state in `/config/snoozefest_data.json`

You can use Snoozefest immediately with no custom dashboard or voice setup.

## Quick install

1. Add repository: Settings -> System -> Add-ons -> Repositories
2. Add: `https://github.com/stefhartog/ha-addons`
3. Install `Snoozefest`
4. Start add-on
5. Confirm logs show the daemon is running and MQTT connected

## Prerequisite: MQTT broker

Snoozefest requires a working MQTT broker.

- Recommended: Home Assistant Mosquitto broker add-on
- Alternative: your own external MQTT server

Home Assistant MQTT integration must be configured to the same broker so Snoozefest discovery entities appear.

## Configuration

The add-on auto-configures against Home Assistant's internal MQTT broker by default.

Common option:

- `timer_add_seconds` (default `60`): how much time the Add Time action adds to timers

## Optional upgrades

After core add-on setup, you can optionally add:

1. Dashboard UI
- Use the cards in the main Snoozefest repo `dashboard/` folder for mobile-friendly alarm/timer control.
- Dashboard YAML uses these non-standard Lovelace cards/plugins:
	- `custom:button-card`
	- `custom:auto-entities`
	- `custom:config-template-card`
	- `custom:snoozefest-multiline-text-input-card` (from Snoozefest `dashboard/snoozefest_multiline_text_input.js`)
- Install external cards via HACS (or manual resources) before importing Snoozefest YAML cards.
- Copy custom card JS files into Home Assistant `www` (recommended: `/config/www/snoozefest/`):
	- `dashboard/snoozefest_entity_card.js`
	- `dashboard/snoozefest_multiline_text_input.js`
- In Home Assistant, go to Dashboards -> Resources and add as `module`:
	- `/local/snoozefest/snoozefest_entity_card.js`
	- `/local/snoozefest/snoozefest_multiline_text_input.js`
- Reload dashboard resources, then import/use the YAML cards from `dashboard/`.

2. Voice control
- Use `voice/` automations for deterministic local commands.
- Optionally expose LLM wrapper scripts for richer natural-language handling.

## Persistence

- Runtime config is generated in `/tmp/snoozefest.json`
- Persistent scheduler state lives in `/config/snoozefest_data.json`

## Notes for testers

- Add-on image pulls Snoozefest source from GitHub at build time.
- Bumping add-on version triggers rebuild and fresh source clone.
- Build logs include cloned commit SHA.

## More docs

- Project overview: `../../snoozefest/README.md`
- Migration notes: `../../snoozefest/MIGRATION.md`
