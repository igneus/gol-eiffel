-- Knows how to collect settings, exposes the collected values
deferred class GOL_SETTINGS

feature {ANY}
   -- Collects and exposes settings
   collect
      deferred
      end

   -- Did the collection succeed, producing valid settings?
   is_valid: BOOLEAN
      deferred
      end

   print_usage
      deferred
      end

   has_input_file: BOOLEAN
      deferred
      end

   input_file: STRING
      deferred
      end

   is_help: BOOLEAN
      deferred
      end

   -- How many generations to show
   max_generations: INTEGER
      once
         Result := 30
      end

   -- Delay between generations in milliseconds
   sleep: INTEGER
      once
         Result := 250
      end

end
