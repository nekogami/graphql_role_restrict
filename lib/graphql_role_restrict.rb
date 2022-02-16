# frozen_string_literal: true

# This is based on the #visible? method described in
# https://graphql-ruby.org/authorization/visibility.html
module GraphqlRoleRestrict
  # register a new option `role_restrict`
  def initialize(*args, role_restrict: :logged_in, **kwargs, &block)
    @role_restrict = role_restrict

    # Pass on the default args:
    super(*args, **kwargs, &block)
  end

  def to_graphql
    field_defn = super # Returns a GraphQL::Field
    field_defn.metadata[:role_restrict] = @role_restrict
    field_defn
  end

  def visible?(context)
    super && context_role_valid?(context, @role_restrict)
  end

  #
  # Check the validatity of the the role_restrict value against an object representing
  # the current_user stored in context[:current_user]
  # (injection of that value has to be done at the controller level before accessing graphql code)
  #
  # Method NEEDS to be Overwritten once the module is included in your Argument/Field class to allow
  # custom logic
  #
  # @param [GraphQL::Query::Context] context Graphql context object
  # @param [Any] role_restrict Any value passed in to a role_restrict option of a field / argument
  #
  # @return [Boolean]
  #
  def context_role_valid?(context, role_restrict)
    case role_restrict
    when :logged_in
      !!context[:current_user]
    else
      true
    end
  end
end
