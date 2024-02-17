class MY_SLEEP_TIMER

inherit
   SLEEP_TIMER
   EXECUTION_ENVIRONMENT
      rename
         sleep as nano_sleep
      end

create {ANY}
   make

feature {ANY}
   sleep
      do
         -- TODO: in Gobo this seems to always sleep for at least
         -- a second, investigate why
         nano_sleep(sleep_length * 1000)
      end
end
