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

   has_input_file: BOOLEAN
      deferred
      end

   input_file: STRING
      deferred
      end

end
