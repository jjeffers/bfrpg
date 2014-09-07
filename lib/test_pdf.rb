require "pdf"

require "../app/models/character"

character = Character.new
character.rollAbilityScores()
character.name = "Testy"
character.race = "Human"
character.profession = "Fighter"
character.hit_points = character.rollHitPoints()

charsheet = PDF.generate_character_sheet(character)
charsheet.save_as("Testy.pdf")
