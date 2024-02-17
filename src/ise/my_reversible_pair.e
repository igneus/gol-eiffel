class MY_REVERSIBLE_PAIR[E]

inherit
   REVERSIBLE_PAIR[E]

create {ANY}
   make

feature {ANY}
   first, second: E

feature {}
   auxiliary: E

feature {ANY}
   make(f, s: E)
      do
         first := f
         second := s
         auxiliary := f
      end

   reverse
      do
         auxiliary := first
         first := second
         second := auxiliary
      end

   put (item: E; index: INTEGER)
      do
         inspect index
         when 1 then
            first := item
         when 2 then
            second := item
         else
            -- TODO raise exception
         end
      end
end
