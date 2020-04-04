module Crud
    extend ActiveSupport::Concern

    def create(model, params)
        model = model.create(params)
        if model.save
            json(model, :created)
        else
            json(model, model.errors.messages)
        end
    end

    def update(model, params)
        data.update(params)
        if model.save
            json(model, :updated)
        else
            json(model, model.errors.messages)
        end
    end

    def delete(model)
        if model.delete
            json(model, :deleted)
        else
            json(model, model.errors.messages)
        end
    end
end