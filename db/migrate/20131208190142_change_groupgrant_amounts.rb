class ChangeGroupgrantAmounts < ActiveRecord::Migration
  def change
  	Groupgrant.connection.execute("ALTER TABLE `meerkat_development`.`groupgrants` CHANGE COLUMN `goal_amount` `goal_amount` DECIMAL(10,2) NULL DEFAULT NULL  , CHANGE COLUMN `goal_status` `goal_status` DECIMAL(10,2) NULL DEFAULT NULL  ;
")
  end
end
