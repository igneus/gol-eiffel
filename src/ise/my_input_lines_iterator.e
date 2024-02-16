class MY_INPUT_LINES_ITERATOR

inherit
   INPUT_LINES_ITERATOR

create {ANY}
   make

feature {}
   stream: PLAIN_TEXT_FILE

feature {ANY}
   make (path: STRING)
      do
         if path.is_equal("-") then
            stream := io.input
         else
            create stream.make_open_read(path)
         end
      end

   is_connected: BOOLEAN
      do
         Result := stream.is_open_read
      end

   disconnect
      do
         stream.close
      end

   read_line
      do
         stream.read_line
      end

   end_of_input: BOOLEAN
      do
         Result := stream.end_of_file
      end

   last_string: STRING
      do
         Result := stream.last_string
      end
end
