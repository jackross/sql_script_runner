require 'hirb'

module SQLScriptRunner
  class Runner

    def self.run_folder(folder_path)
      self.new(Rails.env).run_folder folder_path
    end

    def self.run(file_path)
      self.new(Rails.env).run file_path
    end

    def initialize(env)
      @client = Connection.new(env).client
    end
    
    def run(path)
      start_time = Time.now
      puts "Started running script: #{path} at #{start_time}"
      script = Script.new(path)
      results = @client.execute(script.sql)
      results.each
      # puts Hirb::Helpers::AutoTable.render(results, :resize => false, :max_width => 2000)
      finish_time = Time.now
      duration = finish_time - start_time
      puts "Finished running script: #{path} at #{finish_time} (#{duration} seconds)"
    end

    def run_folder(folder_path, opts = {})
      exceptions = opts.delete(:except)
      (ConfigLoader.new(folder_path).tsorted_scripts - [exceptions].flatten).each do |script|
        run File.join(folder_path, script)
      end
    end
  end
end
