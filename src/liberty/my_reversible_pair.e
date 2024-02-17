class MY_REVERSIBLE_PAIR[E]

inherit
   REVERSIBLE_PAIR[E]
      undefine
         -- concrete features inherited from ANY colliding with
         -- those inherited below from ARRAY2
         default_create,
         out_in_tagged_out_memory,
         copy,
         is_equal
      end

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
