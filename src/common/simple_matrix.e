-- subset of the public interface of Liberty's ARRAY2
deferred class SIMPLE_MATRIX[E]

feature {ANY}
   make (lines, columns: INTEGER_32)
      deferred
      end

   resize (lines, columns: INTEGER_32)
      deferred
      end

   put (element: E; line, column: INTEGER_32)
      deferred
      end

   set_all_with (element: E)
      deferred
      end

   -- The alias is required in order to be able to effect
   -- this method by inheriting from ARRAY2 in ISE
   item alias "[]" (line, column: INTEGER_32): E
      deferred
      end

   line_count: INTEGER_32
      deferred
      end

   column_count: INTEGER_32
      deferred
      end

   valid_line (line: INTEGER_32): BOOLEAN
      deferred
      end

   valid_column (column: INTEGER_32): BOOLEAN
      deferred
      end
end
