class ChangeRateDefaultOnBooks < ActiveRecord::Migration[6.1]
  def change
     change_column_default :books, :rate, from: nil, to: 0
  end
end
