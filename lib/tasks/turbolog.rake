#require railtie.rb in turbolog.rb
require 'turbolog'
require 'thor'

namespace :turbolog do

  class Hammer < Thor
    include Thor::Actions
  end

  desc "remove devise files"
  task :clean=> :environment do
   if remove_devise?
     puts "Done......................"
   end
  end

  def remove_devise?
      return (hammer :gsub_file, 'config/routes.rb',/devise_for.*\n/,'') ? true : false
  end

  private
  def hammer(*args)
    Hammer.new.send *args
  end
end


