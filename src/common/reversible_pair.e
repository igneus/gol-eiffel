class REVERSIBLE_PAIR[E]

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
end
