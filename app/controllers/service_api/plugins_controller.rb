require_dependency "service_api/application_controller"

module ServiceApi
  class PluginsController < ApplicationController

  	def index
  	  # To show all plugins and versions
  	end

  	def create
  	  software_id = params[:id].to_s
  	  software_name = params[:name]
  	  software_version = params[:version]
  	  version = redis.hset software_id, software_name, software_version if software_id.present? && software_name.present? && software_version.present?
  	  if version.present?
  	  	render json: { name: software_name, version: software_version }, status: :ok
  	  else
  	  	render json: { error: 'Could not set new plugin!' }, status: 400
  	  end
  	end

  	def get_versions
  	  version = nil
  	  software_id = params[:id].to_s
  	  software_name = get_software_from_version(software_id)
  	  version = redis.hget software_id, software_name if software_id.present? && software_name.present?
  	  if version.present?
  	  	render json: { name: software_name, version: version }, status: :ok
  	  else
  	  	render json: { error: 'Could not find plugin!' }, status: 400
  	  end
  	end

  	def set_versions
  	  version = nil
      software_id = params[:id].to_s
      software_version = params[:version]
  	  software_name = get_software_from_version(software_id)
  	  version = redis.hset software_id, software_name, software_version if software_name.present? && software_version.present?
  	  if version.present?
  	  	render json: { name: software_name, version: software_version }, status: :ok
  	  else
  	  	render json: { error: 'Could not set plugin version!' }, status: 400
  	  end
  	end

  	private

  	def get_software_from_version(s_id)
  	  case s_id
	    when '1' then 'AutoCAD'
	    when '2' then 'Revit'
	  end
  	end

  end
end
