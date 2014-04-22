module EventHelper
  def cover_for(event)
    case event.category
      when 'PairProgramming'
        image_path('event-pairwithme-cover.png')

      when 'Scrum'
        image_path('event-scrum-cover.png')

      else
        ''
    end
  end

  def current_occurrence_time(event)
    puts event
    time = nested_hash_value(event, :time)
    
    time_zone = event[:time_zone] if event.has_key?(:time_zone)
      
    return nil if time.nil?

    if !time_zone.nil?
      time.in_time_zone(time_zone).strftime("%F at %I:%M%p") 
    else
      time.strftime("%F at %I:%M%p")
    end
  end
end
