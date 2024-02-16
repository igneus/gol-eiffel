class REVERSIBLE_PAIR[E]

inherit
   ARRAY[E]
      rename
         make as array_make
      end

create {ANY}
   make

feature {ANY}
   make(f, s: E)
      do
         array_make(1, 2)
         put(f, 1)
         put(s, 2)
      end

   second: E
      do
         Result := item(2)
      end
end
