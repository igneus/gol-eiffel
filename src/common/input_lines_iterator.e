-- Public interface modelled after a subset of Liberty's INPUT_STREAM
deferred class INPUT_LINES_ITERATOR

feature {ANY}
   make (path: STRING)
      deferred
      end

   is_connected: BOOLEAN
      deferred
      end

   disconnect
      deferred
      end

   read_line
      deferred
      end

   end_of_input: BOOLEAN
      deferred
      end

   last_string: STRING
      deferred
      end
end
