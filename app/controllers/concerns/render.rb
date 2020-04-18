module Render
    extend ActiveSupport::Concern

    def json(data, type = :ok)
       return render_without_serializer(data) if Utils::Commons.new.primitive_element?(data)
       render_serializer(paginate(data), type)
    end

    def json_error(status, message)
        render json: { message: message }, status: status
    end

    private

    def render_without_serializer(data)
        render json: { data: data }, message: :ok, status: data.nil? ? 204 : 200
    end

    def render_serializer(data, type)
        render json: serialized_class(data), message: type, status: type == :created ? 201 : 200
    end

    def paginate(data)
        data.paginate(:page => params[:page])
    end

    def serialized_class(data)
        Object.const_get("#{class_name(data)}Serializer").new(data).serialized_json
        rescue NameError
        raise Utils::Errors::Serializer::ClassNotFound, 'returned data must belong to a serializer class'
    end

    def class_name(data)
        data.first.class.name
        rescue NoMethodError
        data.class.name
    end
end