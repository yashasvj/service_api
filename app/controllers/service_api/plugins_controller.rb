require_dependency "service_api/application_controller"

module ServiceApi
  class PluginsController < ApplicationController
    before_filter :authenticate
    before_action :get_plugin_params, only: [:create, :get_versions, :set_versions]

  	def index
  	  render json: $redis.hgetall('plugin')
  	end

  	def create
      plugin = $redis.hget('plugin', @plugin_id)
      if plugin.blank?
        jsonobj = Hash.new
        jsonobj[:name] = @software_name
        jsonobj[:version] = @software_version
        version = $redis.hset('plugin', @plugin_id, jsonobj.to_json) if @plugin_id.present? && @software_name.present? && @software_version.present?
        if version
          render json: $redis.hget('plugin', @plugin_id)
        else
          render json: { error: 'Could not set new plugin!' }, status: 400
        end
      else
        render json: { error: 'Plugin with same ID already exists' }, status: 400
      end
  	end

  	def get_versions
      plugin = $redis.hget('plugin', @plugin_id)
      @version = JSON.parse plugin if plugin.present?
      if @version.present?
        render json: @version
      else
        render json: { error: "Could not find plugin with ID - #{@plugin_id}" }, status: 400
      end
  	end

  	def set_versions
      plugin = $redis.hget('plugin', @plugin_id)
      unless plugin.blank?
        $redis.hdel('plugin', @plugin_id)
        plugin = JSON.parse plugin
        plugin[:name] = @software_name
        plugin[:version] = @software_version
        version = $redis.hset('plugin', @plugin_id, plugin.to_json)
        if version
          render json: $redis.hget('plugin', @plugin_id)
        else
          render json: { error: 'Failed to set plugin version!' }, status: 400
        end
      else
        render json: { error: "Could not find Plugin with ID - #{@plugin_id}" }
      end
  	end

    protected

    def authenticate
      authenticate_or_request_with_http_basic do |username, password| 
         (username == $api_user_1[:email] && password == $api_user_1[:password]) || 
         (username == $api_user_2[:email] && password == $api_user_2[:password])
      end
    end

    def get_plugin_params
      @plugin_id = params[:id].presence || params[:plugin_id]
      @software_name = params[:name]
      @software_version = params[:version]
      @version = nil
    end

  end
end
