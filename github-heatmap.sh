#!/usr/bin/env bash

USERNAME="${1:-polatengin}"

GRAY=$'\033[48;5;236m  \033[0m'       # No contributions   (level 0)
GREEN1=$'\033[48;5;22m  \033[0m'      # Few contributions  (level 1) - darkest green
GREEN2=$'\033[48;5;28m  \033[0m'      # Some contributions (level 2) - darker green
GREEN3=$'\033[48;5;34m  \033[0m'      # Many contributions (level 3) - medium green
GREEN4=$'\033[48;5;120m  \033[0m'     # Most contributions (level 4) - brightest green

declare -a levels
index=0

while read -r cell; do
  if [[ -n "${cell}" ]]; then
    levels[index]=$(echo "${cell}" | sed -n 's/.*data-level="\([0-4]\)".*/\1/p')
    ((index++))
  fi
done <<< "$(curl -s "https://github.com/users/${USERNAME}/contributions" | grep -o '<td[^>]*data-level="[0-4]"[^>]*>')"

total_cells=${#levels[@]}

for day in $(seq 0 6); do
  for week in $(seq 0 52); do
    cell_index=$((day * 53 + week))

    if [[ cell_index -lt total_cells ]]; then
      level=${levels[cell_index]}

      case ${level} in
        0) tile=${GRAY} ;;
        1) tile=${GREEN1} ;;
        2) tile=${GREEN2} ;;
        3) tile=${GREEN3} ;;
        4) tile=${GREEN4} ;;
        *) tile=${GRAY} ;;
      esac

      printf "%s" "${tile}"
    fi
  done
  echo
done
