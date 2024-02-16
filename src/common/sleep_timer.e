deferred class SLEEP_TIMER

feature {SLEEP_TIMER}
   sleep_length: NATURAL

feature {ANY}
   make (microseconds: NATURAL)
      do
         sleep_length := microseconds
      end

   sleep
      deferred
      end
end
