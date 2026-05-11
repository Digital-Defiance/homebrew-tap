# Digital Defiance Homebrew Tap

This tap provides BrightDate time utilities — Rust implementations of classic Unix date/time tools that display time as decimal days since the J2000.0 epoch (2000-01-01T12:00:00 UTC).

## What is BrightDate?

BrightDate represents time as a floating-point number of days since J2000.0 (Julian Date 2451545.0). It provides a compact, precise, and human-readable alternative to Unix timestamps and ISO 8601 strings.

- **Epoch**: J2000.0 = 2000-01-01T12:00:00 UTC = BrightDate 0.0
- **Millidays**: 1 md = 86.4 seconds; 1000 md = 1 day
- **Precision**: up to 12 decimal places

## Install

```sh
brew tap digital-defiance/homebrew-tap
```

Then install any of the tools:

```sh
brew install bdate     # date replacement — shows current BrightDate
brew install btime     # time replacement — shows elapsed in BrightDate units
brew install buptime   # uptime replacement — shows system uptime in BrightDate
brew install bcal      # cal replacement — calendar with BrightDate values
brew install bwatch    # watch replacement — runs commands with BrightDate timestamps
```

## Tools

### `bdate` — BrightDate date utility

```
bdate [OPTIONS] [DATE]
```

Shows the current time (or a given date) as a BrightDate value. Supports:

- BrightDate values (`0`, `9123.45`)
- ISO 8601 (`2000-01-01T12:00:00Z`)
- Julian Date (`JD:2451545.0`)
- Modified Julian Date (`MJD:51544.5`)
- Unix milliseconds (integers > 1e10)

Options: `--format bright|millidays|iso|unix|julian|gps|all`, `--precision N`, `--breakdown`, `--tai`, `--diff DATE2`

### `btime` — BrightDate time utility

```
btime COMMAND [ARGS...]
```

Runs a command and prints elapsed time to stderr in days and millidays, along with start/end BrightDate timestamps.

### `buptime` — BrightDate uptime

```
buptime
```

Shows system uptime as `up X.XXXXX days (Y.YYY millidays) — boot BD:ZZZZZ`.

### `bcal` — BrightDate calendar

```
bcal [OPTIONS] [YEAR [MONTH]]
```

Displays a calendar where each date shows its BrightDate value at noon (T12:00:00Z). Supports `--precision N`, `-3` (three-month view), `-y/--year` (full year), `--no-color`.

### `bwatch` — BrightDate watch

```
bwatch [OPTIONS] COMMAND [ARGS...]
```

Repeatedly runs a command, clearing the screen each time and displaying a BrightDate timestamp and elapsed time. Options: `--interval N` (seconds, default 2.0), `--count N` (0 = infinite).

## Publishing and crates.io

The source library `brightdate` and all binary crates are published on [crates.io](https://crates.io/crates/brightdate):

```sh
cargo install bdate
cargo install btime
cargo install buptime
cargo install bcal
cargo install bwatch
```

## License

MIT — Copyright © Digital Defiance / Jessica Mulein
