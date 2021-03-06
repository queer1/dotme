module DotMe
  class Folder < Incubator 
    def incubate(*to)
      begin
        require 'git'

        { :git_clone => Git.open( @path ).config['remote.origin.url'], :to => ::File.join( '~', @relative ) }
      rescue
        FileUtils.cp_r @path, ::File.join( to, @basename )

        { :link => @basename, :to => ::File.join( '~', @relative ) }
      end
    end

    def self.incubates?(path)
      ::File.directory? path
    end
  end
end


