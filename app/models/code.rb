class Code < ActiveRecord::Base
	has_one :purchase

	monetize :value_cents
end

