require "project_gen/version"

module ProjectGen
  class CLI
    def initialize args, options
      @project_name = args[0]
      @parent_directory = "#{options[:directory]}/#{args[1]}"
      @options = options
    end

    def generate
      case @options[:type]
      when :gem
        generate_gem
      when :pip
        generate_pip
      else
        generate_blank
      end

      add_rvmrc if @options[:rvm]
    end

    def generate_gem
      execute "cd #{@parent_directory} && bundle gem #{@project_name}"
    end

    def generate_pip
      execute "cd #{@parent_directory} && snake_skin shed #{@project_name}"
    end

    def generate_blank
      if File.exists? File.expand_path("#{@parent_directory}/#{@project_name}")
        puts "Project '#{@project_name}' already exists!"
      else
        execute "cd #{@parent_directory} && mkdir #{@project_name} && cd #{@project_name} && git init"
        puts "Project #{@project_name} created in #{@parent_directory}"
      end     
    end

    def execute statement
      IO.popen statement, 'r+' do |process|
        process.close_write
        puts process.gets until process.eof?
      end
    end
  end
end
