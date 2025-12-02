terraform {
  required_version = ">= 1.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

# Generate config.js based on environment
resource "local_file" "game_config" {
  filename = "${path.module}/../../frontend/config.js"
  content  = templatefile("${path.module}/config.js.tpl", {
    environment          = var.environment
    difficulty          = var.difficulty
    hunger_decay        = var.game_settings.hunger_decay_rate
    thirst_decay        = var.game_settings.thirst_decay_rate
    energy_decay        = var.game_settings.energy_decay_rate
    resource_multiplier = var.game_settings.resource_multiplier
    danger_level        = var.game_settings.danger_level
    crafting_enabled    = var.features.crafting_enabled
    weather_events      = var.features.weather_events
    random_events       = var.features.random_events
    starting_wood       = var.starting_resources.wood
    starting_stone      = var.starting_resources.stone
    starting_food       = var.starting_resources.food
    version             = var.game_version
  })
}

# Output the generated config path
output "config_file_path" {
  value       = local_file.game_config.filename
  description = "Path to the generated game configuration file"
}
