deferred class GOL_MATRIX

feature {ANY}
   is_live(line, column: INTEGER): BOOLEAN
      deferred
      end

   next_state
      deferred
      end

feature {ANY} -- cf. ARRAY2
   line_count: INTEGER_32
      deferred
      end

   column_count: INTEGER_32
      deferred
      end

   put(element: BOOLEAN; line, column: INTEGER_32)
      deferred
      end
end
