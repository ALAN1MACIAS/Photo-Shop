class PhotoValidator < ActiveModel::Validator
  def validate(record)
    for badword in BADWORDS do
      if record.description.downcase.include?(badword.downcase)
        record.errors.add(:description, "The word #{badword} is not allowed")
      end
    end
  end
end
