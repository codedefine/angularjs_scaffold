
root = global ? window

<%= @controller %>IndexCtrl = ($scope, <%= @model_name %>, flash) ->
  $scope.<%= @plural_model_name %> = <%= @model_name %>.query()

  $scope.destroy = ->
    if confirm("Are you sure?")
      original = @<%= @resource_name %>
      @<%= @resource_name %>.destroy ->
        $scope.<%= @plural_model_name %> = _.without($scope.<%= @plural_model_name %>, original)
        flash.success = "<%= @model_name %> destroyed successfully"
        
<%= @controller %>IndexCtrl.$inject = ['$scope', '<%= @model_name %>', 'flash'];

<%= @controller %>CreateCtrl = ($scope, $location, <%= @model_name %>, flash) ->
  $scope.save = ->
    <%= @model_name %>.save $scope.<%= @resource_name %>, (<%= @resource_name %>) ->
      $location.path "/<%= @plural_model_name %>"
      flash.success = "<%= @model_name %> created successfully"
      
<%= @controller %>CreateCtrl.$inject = ['$scope', '$location', '<%= @model_name %>', 'flash'];

<%= @controller %>ShowCtrl = ($scope, $location, $stateParams, <%= @model_name %>, flash) ->
  <%= @model_name %>.get
    id: $stateParams.id
  , (<%= @resource_name %>) ->
    @original = <%= @resource_name %>
    $scope.<%= @resource_name %> = new <%= @model_name %>(@original)

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.<%= @resource_name %>.destroy ->
        $location.path "/<%= @plural_model_name %>"
        flash.success = "<%= @model_name %> destroyed successfully"
        
<%= @controller %>ShowCtrl.$inject = ['$scope', '$location', '$stateParams', '<%= @model_name %>', 'flash'];

<%= @controller %>EditCtrl = ($scope, $location, $stateParams, <%= @model_name %>, flash) ->
  <%= @model_name %>.get
    id: $stateParams.id
  , (<%= @resource_name %>) ->
    @original = <%= @resource_name %>
    $scope.<%= @resource_name %> = new <%= @model_name %>(@original)

  $scope.isClean = ->
    console.log "[<%= @controller %>EditCtrl, $scope.isClean]"
    angular.equals @original, $scope.<%= @resource_name %>

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.<%= @resource_name %>.destroy ->
        $location.path "/<%= @plural_model_name %>"
        flash.success = "<%= @model_name %> destroyed successfully"

  $scope.save = ->
    <%= @model_name %>.update $scope.<%= @resource_name %>, (<%= @resource_name %>) ->
      $location.path "/<%= @plural_model_name %>"
      flash.success = "<%= @model_name %> saved successfully"

<%= @controller %>EditCtrl.$inject = ['$scope', '$location', '$stateParams', '<%= @model_name %>', 'flash'];

# exports
root.<%= @controller %>IndexCtrl  = <%= @controller %>IndexCtrl
root.<%= @controller %>CreateCtrl = <%= @controller %>CreateCtrl
root.<%= @controller %>ShowCtrl   = <%= @controller %>ShowCtrl
root.<%= @controller %>EditCtrl   = <%= @controller %>EditCtrl 