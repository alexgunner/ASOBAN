module StaticPagesHelper
  def object_from_pg_document pg_document
    Rails.application.eager_load! # this makes sure all models are loaded
    document_model = nil
    ApplicationRecord.descendants.each do |model|
      if model.name.eql? pg_document.searchable_type
        document_model = model
      end
    end
    document_model.find(pg_document.searchable_id)
  end

  def put_s_if_needed count
    if count > 1
      's'
    end
  end
end
