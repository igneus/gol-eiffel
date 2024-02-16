class SLEEP_TIMER

inherit
   EXECUTION_ENVIRONMENT
      rename
         sleep as nano_sleep
      end

create {ANY}
   make

feature {}
   sleep_length: NATURAL

feature {ANY}
   make (microseconds: NATURAL)
      do
         sleep_length := microseconds * 1000
      end

   sleep
      do
         -- TODO: in Gobo this seems to always sleep for at least
         -- a second, investigate why
         nano_sleep(sleep_length)
      end
end
