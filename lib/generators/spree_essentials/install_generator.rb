module SpreeEssentials
  module Generators
    class InstallGenerator < Rails::Generators::Base
      
      desc "Installs required migrations for spree_essentials"
      
      class_option :add_stylesheets, :type => :boolean, :default => true, :banner => 'Append spree_essentials to spree/backend.css'
      class_option :add_javascripts, :type => :boolean, :default => true, :banner => 'Append spree_essentials to spree/backend.js'
      
      def append_stylesheets
        return unless options[:add_stylesheets]
        gsub_file "app/assets/stylesheets/spree/backend.css", "*/", "*= require admin/spree_essentials\n*/"  
      end
      
      def append_javascripts
        return unless options[:add_javascripts]
        append_file "app/assets/javascripts/spree/backend.js", "//= require admin/spree_essentials"
      end

    end
  end
end
