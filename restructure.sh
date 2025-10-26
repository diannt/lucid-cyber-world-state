#!/bin/bash
# Create cartridge-based branch structure

CARTRIDGES=("neo-dream-weaver" "mystic-realms" "temporal-nexus" "digital-consciousness" "corporate-karma-wars")

# Create factions
for faction in light balance dark; do
  git checkout -b "factions/$faction" main
  mkdir -p "factions/$faction"
  touch "factions/$faction/.gitkeep"
  git add .
  git commit -m "Create $faction faction branch"
  git push origin "factions/$faction"
done

# Create cartridge structures
for cartridge in "${CARTRIDGES[@]}"; do
  # Create cartridge main
  git checkout main
  git checkout -b "cartridges/$cartridge/main"
  mkdir -p "cartridges/$cartridge"
  echo "# $cartridge - Cartridge Consensus State" > "cartridges/$cartridge/README.md"
  git add .
  git commit -m "Initialize $cartridge cartridge"
  git push origin "cartridges/$cartridge/main"
  
  # Create karma branches
  for karma in light balanced shadow; do
    git checkout -b "cartridges/$cartridge/$karma" "cartridges/$cartridge/main"
    mkdir -p "cartridges/$cartridge/$karma"
    touch "cartridges/$cartridge/$karma/.gitkeep"
    git add .
    git commit -m "Create $karma path for $cartridge"
    git push origin "cartridges/$cartridge/$karma"
  done
done

git checkout main
