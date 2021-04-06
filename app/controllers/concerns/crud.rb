module Crud
  extend ActiveSupport::Concern

  def create_crud(model, params)
    model = model.create(params)
    if model.save
      json(model, :created)
    else
      json_error(:error, model.errors.messages)
    end
  end

  def update_crud(model, params)
    model.update(params)
    if model.save
      json(model, :updated)
    else
      json_error(:error, model.errors.messages)
    end
  end

  def delete_crud(model)
    if model.delete
      json(model, :deleted)
    else
      json_error(:error, model.errors.messages)
    end
  end
end
