class MY_SLEEP_TIMER

inherit
   SLEEP_TIMER

insert
   UNISTD_EXTERNALS
      rename
         sleep as posix_sleep
      end

create {ANY}
   make

feature {ANY}
   sleep
      local
         sleep_result: INTEGER
      do
         -- we are required to take the return value even if we
         -- have no use for it
         sleep_result := usleep(sleep_length)
      end
end
