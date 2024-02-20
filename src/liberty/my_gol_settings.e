class MY_GOL_SETTINGS

inherit GOL_SETTINGS
      redefine
         max_generations
      end

create {ANY}
   make

feature {}
   args: COMMAND_LINE_ARGUMENTS
   factory: COMMAND_LINE_ARGUMENT_FACTORY

feature {ANY}
   make
      do
         create factory
         create args.make(
            factory.no_parameters or
            (opt_help and opt_generations and arg_input_file)
                         )
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

   max_generations: INTEGER
      once
         if opt_generations.is_set then
            Result := opt_generations.item
         else
            Result := Precursor
         end
      end

feature {}
   arg_input_file: COMMAND_LINE_TYPED_ARGUMENT[FIXED_STRING]
      once
         Result := factory.positional_string("input_file", ".cells file to load. If not provided, a simple default pattern is used.")
      end

   opt_help: COMMAND_LINE_TYPED_ARGUMENT[BOOLEAN]
      once
         Result := factory.option_boolean("h", "help", "Print this help and exit")
      end

   opt_generations: COMMAND_LINE_TYPED_ARGUMENT[INTEGER_32]
      once
         Result := factory.option_integer("g", "generations", "generations", "How many generations to show")
      end

end
