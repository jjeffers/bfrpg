
class CharacterGeneratorController < ApplicationController
 
  def index
      @character = find_character
      
  end

  def auto_complete_for_equipment_item_name
      @equipment_list_items = Equipment.find(:all,
        :conditions => [ 'LOWER(name) LIKE ?',
        '%' + params[:equipment_item][:name].downcase + '%' ], 
        :order => 'name ASC',
        :limit => 8)

      render(:partial => "equipment_list_items")
      
  end
  

  def remove_equipment_item

      @character = find_character

      name = params[:name]
      cost = params[:cost].to_f
      weight = params[:weight].to_f

      @character.remove_equipment(name, cost, weight)

  end
  
  def add_equipment_item
      
      @character = find_character

      begin
          description = params[:equipment_item][:name]
          stats = ParseCSV.parse_csv(description)
          
          if stats.size != 3
              render :nothing => true
              return
          end
          
          name = stats[0].strip
          cost = (stats[1].strip).to_f
          weight = (stats[2].strip).to_f
      
          @character.add_equipment(name, cost, weight)
          
      rescue
        render :nothing => true
      end
      

      
      
  end
  
  def make_new_character
      @character = Character.new

      @character.name = "Morgan Ironwolf"
      @character.race = "Human"
      @character.profession = "Fighter"
      @character.rollAbilityScores()
            
      session[:character] = @character
      update_character_stats()
  end

  def set_character_name
      @character = find_character
      @character.name = params[:value]

      render(:text => @character.name)
  end

  def set_character_money
      @character = find_character
      @character.money = params[:value].to_f

      render(:text => @character.money.to_s)
  end

  def set_character_hit_points
      @character = find_character
      @character.hit_points = params[:value].to_f

      render(:text => @character.hit_points.to_i.to_s)
  end

  def set_character_race
      @character = find_character
      @character.race = params[:race]

      if @character.get_eligible_races.index(@character.race) == nil
          @character.race = "Human"
      end
      
     
      
      update_character_stats()
  end

  def set_character_profession
      @character = find_character
      @character.profession = params[:profession]

      RAILS_DEFAULT_LOGGER.debug("profession: " + @character.profession)
      
      if @character.get_eligible_professions.index(@character.profession) == nil
          @character.profession = "Fighter"
      end

      update_character_stats()

      RAILS_DEFAULT_LOGGER.debug("after update profession: " + @character.profession)
  end

  def update_character_stats
      @character = find_character

      @character.hit_points = @character.rollHitPoints()
  end

  def pdf
      
      @character = find_character
      
      pdf = PDF.generate_character_sheet(@character)
      
      send_data pdf.render, :filename => @character.name + '.pdf', 
        :type => "application/pdf"
  end
  
  private

  def redirect_to_index(msg = nil)
      redirect_to :action => :index
  end

  def find_character
      unless session[:character]
      end
      session[:character]
  end

end
