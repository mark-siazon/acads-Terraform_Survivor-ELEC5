variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "development"

  validation {
    condition     = contains(["development", "staging", "production"], var.environment)
    error_message = "Environment must be development, staging, or production."
  }
}

variable "difficulty" {
  description = "Game difficulty level"
  type        = string
  default     = "normal"

  validation {
    condition     = contains(["easy", "normal", "hard", "extreme"], var.difficulty)
    error_message = "Difficulty must be easy, normal, hard, or extreme."
  }
}

variable "github_repo" {
  description = "GitHub repository in format 'username/repo'"
  type        = string
  default     = ""
}

variable "game_version" {
  description = "Game version"
  type        = string
  default     = "1.0.0"
}

variable "starting_resources" {
  description = "Starting resources for the player"
  type = object({
    wood  = number
    stone = number
    food  = number
  })
  default = {
    wood  = 5
    stone = 3
    food  = 2
  }
}

variable "game_settings" {
  description = "Game difficulty settings"
  type = object({
    hunger_decay_rate   = number
    thirst_decay_rate   = number
    energy_decay_rate   = number
    resource_multiplier = number
    danger_level        = number
  })
  default = {
    hunger_decay_rate   = 2.0
    thirst_decay_rate   = 3.0
    energy_decay_rate   = 1.5
    resource_multiplier = 1.0
    danger_level        = 0.3
  }
}

variable "features" {
  description = "Game features toggles"
  type = object({
    crafting_enabled = bool
    weather_events   = bool
    random_events    = bool
  })
  default = {
    crafting_enabled = true
    weather_events   = true
    random_events    = true
  }
}
