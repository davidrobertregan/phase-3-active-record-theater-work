class Role < ActiveRecord::Base
    has_many :auditions

    def locations 
        self.auditions.map { |aud| aud["location"] }
    end

    def actors
        self.auditions.map { |aud| aud["actor"] }
    end

    def lead
        self.auditions.find_by(hired: true) || "No actor has been hired for this role"
    end

    def understudy
        self.auditions.where(hired: true)[1] || "No actor has been hired as understudy for this role"
    end
end

# Auditions.find_by(hired: true) || “”

# Auditions.where(hired: true)[1] || ‘’