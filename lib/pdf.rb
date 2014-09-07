require "pdf/writer"

module PDF

    def PDF.generate_character_sheet(character)

        pdf = PDF::Writer.new
        
        pdf.open_object do |footer|
          pdf.save_state
          pdf.stroke_color! Color::RGB::Black
          pdf.stroke_style! PDF::Writer::StrokeStyle::DEFAULT
          s=6
          t = "Basic RPG Character Generator by James Jeffers, Basic Fantasy RPG © 2006-2007 Chris Gonnerman"
          w = pdf.text_width(t, s) / 2.0
          x = pdf.margin_x_middle
          y = pdf.absolute_bottom_margin
          pdf.add_text(x-w, y, t, s)
          x = pdf.absolute_left_margin
          w = pdf.absolute_right_margin
          y += (pdf.font_height(s) * 1.01)
          pdf.line(x, y, w, y).stroke
          pdf.restore_state
          pdf.close_object
          pdf.add_object(footer, :all_pages)
        end
        
        pdf.select_font "Times-Roman"
        pdf.start_columns(2)
        pdf.text character.name, :font_size => 20
        pdf.text character.race + " " + character.profession, :font_size => 16
        pdf.text "\n"

        pdf.text "STR: " + character.strength.to_s + " " +
            character.attr_modifier(character.strength) 
        pdf.text "INT: " + character.intelligence.to_s + " " +
            character.attr_modifier(character.intelligence)
        pdf.text "WIS: " + character.wisdom.to_s + " " +
            character.attr_modifier(character.wisdom)
        pdf.text "DEX: " + character.dexterity.to_s + " " +
            character.attr_modifier(character.dexterity)
        pdf.text "CON: " + character.constitution.to_s + " " +
            character.attr_modifier(character.constitution)
        pdf.text "CHA: " + character.charisma.to_s + " " +
            character.attr_modifier(character.charisma)

        pdf.text "\n"
        pdf.text "Equipment:"

        character.equipment.each do |equipment_item|
            pdf.text equipment_item.quantity.to_s + " " +
                equipment_item.name + ", " + 
                equipment_item.cost.to_s + "gp, " +
                equipment_item.weight.to_s + "lbs", :font_size => 12
        end
        
        pdf.text "\n"

        pdf.start_new_page

        pdf.text "\n", :font_size => 16

        pdf.text "Level: 1 XP 0 (" + character.getExperienceNeededFor2ndLevel() + ")",
            :font_size => 16
        pdf.text "\n"

        pdf.text "Armor Class: " + character.armor_class.to_s
        pdf.text "\n"
        
        pdf.text "Hit Points: " + character.hit_points.to_s
        pdf.text "\n"
        pdf.text "Attack Bonus: +1"
        pdf.text "\n"
        pdf.text "Money: " + character.money.to_s + "gp"
        pdf.text "\n"
        pdf.text "Encumbrance: " + character.encumbrance.to_s + "lbs (" +
            character.load_category + ")"
        pdf.text "\n"

        pdf.text "Saving Throws:"
        character.get_saving_throws.each do |k,v|
            pdf.text "    " + k + ": " + v.to_s, :font_size => 12
        end

        pdf.text "\n"
        
        pdf.text "Special Abilities:"
        character.get_special_abilities.each do |k,v|
            pdf.text k
       
            v.each do |name, detail|
                pdf.text "    " + name + ": " + detail, :font_size => 12
            end
        end
        
        
        
        return pdf
                
    end
        
end
