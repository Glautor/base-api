module Crud
  extend ActiveSupport::Concern

  def model_create(model, params)
    model = model.create(params)
    if model.save
      json(model, :created)
    else
      json_error(:error, model.errors.messages)
    end
  end

  def model_update(model, params)
    model.update(params)
    if model.save
      json(model, :updated)
    else
      json_error(:error, model.errors.messages)
    end
  end

  def model_delete(model)
    if model.delete
      json(model, :deleted)
    else
      json_error(:error, model.errors.messages)
    end
  end
end
