module ResourceController
  module ClassMethods

    # Use this method in your controller to specify which actions you'd like it to respond to.
    #
    #   class PostsController < ResourceController::Base
    #     actions :all, :except => :create
    #   end
    def actions(*opts)
      config = {}
      config.merge!(opts.pop) if opts.last.is_a?(Hash)

      all_actions = (singleton? ? ResourceController::SINGLETON_ACTIONS : ResourceController::ACTIONS) - [:new_action] + [:new]
      
      actions_to_remove = []
      actions_to_remove += all_actions - opts unless opts.first == :all                
      actions_to_remove += [*config[:except]] if config[:except]
      actions_to_remove.uniq!

      actions_to_remove.each { |action| undef_method(action) if method_defined?(action) }
    end
    
  end
end
