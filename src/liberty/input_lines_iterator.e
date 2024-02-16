-- Wrapper exposing a subset of the INPUT_STREAM interface
-- and allowing to read lines either from a file or from stdin.
-- Required because the class hierarchies and interfaces
-- for file and stdin reading differ between Liberty and ISE.
class INPUT_LINES_ITERATOR

create {ANY}
   make

feature {}
   stream: INPUT_STREAM

feature {ANY}
   make (path: STRING)
      do
         if path.is_equal("-") then
            stream := std_input
         else
            create {TEXT_FILE_READ} stream.connect_to(path)
         end
      end

   is_connected: BOOLEAN
      do
         Result := stream.is_connected
      end

   disconnect
      do
         stream.disconnect
      end

   read_line
      do
         stream.read_line
      end

   end_of_input: BOOLEAN
      do
         Result := stream.end_of_input
      end

   last_string: STRING
      do
         Result := stream.last_string
      end
end
