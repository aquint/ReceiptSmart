class Receipt < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
  	validates :user_id, presence: true
  	validates :subtotal, presence: true
  	validates :total, presence: true
  	validates :store, presence: true
  	validates :credit_card, presence: true

  	def self.filter(query,param)
      
      if query
        query = "%" + query.downcase + "%"
          where('LOWER('+ param +') LIKE ?', query )
      else
          scoped
      end
    end
    def self.search(query)
      
      if query
        query = "%" + query.downcase + "%"
          where('LOWER(store) LIKE ? OR LOWER(credit_card) LIKE ?', query, query)
      else
          scoped
      end
    end
    def self.monthlyTotal
      where(:created_at => Time.now.beginning_of_month..Time.now.end_of_month).sum(:total)
    end
end
