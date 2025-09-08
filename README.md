# GitHub Heatmap Terminal Visualizer

A bash script that fetches and displays GitHub contribution history as a colorful heatmap directly in the terminal, replicating the familiar GitHub contribution calendar.

## What It Does

This script creates a visual representation of GitHub contribution activity using colored terminal output. It fetches contribution data from a GitHub user's public profile and displays it as a grid of colored squares, similar to the contribution graph you see on GitHub profiles.

## Features

- 🎨 **Color-coded visualization** - Uses different shades of green to represent contribution levels
- 📅 **Full year calendar** - Shows contribution data in a 7×53 grid (days × weeks)
- 🖥️ **Terminal-native** - Runs directly in your terminal with ANSI color support
- 🚀 **Zero dependencies** - Uses only standard bash utilities (curl, grep, sed)
- 🔄 **Real-time data** - Fetches live data from GitHub's public contribution page

## How It Works

### Technical Overview

1. **Data Fetching**: Uses `curl` to retrieve the GitHub contributions page HTML
1. **HTML Parsing**: Extracts contribution level data from `<td>` elements with `data-level` attributes
1. **Data Processing**: Stores contribution levels (0-4) in a bash array
1. **Visualization**: Maps contribution levels to ANSI color codes and renders a 7×53 grid

### Color Scheme

The script uses GitHub's standard contribution levels:

| Level | Description | Color | ANSI Code |
|-------|-------------|-------|-----------|
| 0 | No contributions | Gray | `236` |
| 1 | Few contributions | Dark Green | `22` |
| 2 | Some contributions | Medium Green | `28` |
| 3 | Many contributions | Bright Green | `34` |
| 4 | Most contributions | Brightest Green | `120` |

### Layout

The output is organized as:

- **7 rows**: Representing days of the week (Sunday to Saturday)
- **53 columns**: Representing weeks of the year
- **Horizontal orientation**: Matches GitHub's contribution calendar layout

## Requirements

### System Requirements

- **Bash shell** (version 4.0 or later)
- **curl** - for fetching GitHub data
- **Terminal with color support** - for ANSI color display
- **Internet connection** - to access GitHub's public API

### Dependencies

All required utilities are typically pre-installed on most Unix-like systems:

- `curl` - HTTP client
- `grep` - text pattern matching
- `sed` - stream editor
- `seq` - sequence generation

## Usage

### Basic Usage

**Option 1: Direct execution with username parameter**

```bash
curl -s https://raw.githubusercontent.com/polatengin/virginia/refs/heads/main/github-heatmap.sh | bash -s -- {GITHUB_USERNAME}
```

Replace `{GITHUB_USERNAME}` with the desired GitHub username, for example:

```bash
curl -s https://raw.githubusercontent.com/polatengin/virginia/refs/heads/main/github-heatmap.sh | bash -s -- polatengin
```

**Option 2: Safer way to download and run the script directly**

```bash
curl -O https://raw.githubusercontent.com/polatengin/virginia/refs/heads/main/github-heatmap.sh

chmod +x github-heatmap.sh

./github-heatmap.sh {GITHUB_USERNAME}
```

## Technical Notes

### GitHub API Limitations

- Uses publicly available HTML content (no API rate limits)
- Only works with public GitHub profiles
- Data reflects GitHub's contribution calculation algorithm
