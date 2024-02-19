class MY_GOL_SETTINGS

inherit GOL_SETTINGS

create {ANY}
   make

feature {}
   args: COMMAND_LINE_ARGUMENTS
   factory: COMMAND_LINE_ARGUMENT_FACTORY

feature {ANY}
   make
      do
         create factory
         create args.make(opt_help or arg_input_file)
      end

   collect
      do
         is_valid := args.parse_command_line
      end

   is_valid: BOOLEAN

   print_usage
      do
         args.usage(std_output)
      end

   has_input_file: BOOLEAN
      do
         Result := arg_input_file.is_set
      end

   input_file: STRING
      require
         has_input_file
      do
         Result := arg_input_file.item.string
      end

   is_help: BOOLEAN
      do
         Result := opt_help.is_set
      end

feature {}
   arg_input_file: COMMAND_LINE_TYPED_ARGUMENT[FIXED_STRING]
      once
         Result := factory.positional_string("input_file", ".cells file to load. If not provided, a simple default pattern is used.")
      end

   opt_help: COMMAND_LINE_TYPED_ARGUMENT[BOOLEAN]
      once
         Result := factory.option_boolean("h", "help", "Print this help and exit").as_optional
      end

end
