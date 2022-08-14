class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.all.map { |audition| audition.actor }
    end

    def locations
        self.auditions.all.map { |audition| audition.location }
    end

    def lead
        lead = self.auditions.find_by(hired: true)
        if lead == nil
            'no actor has been hired for this role'
        else
            lead
        end
    end

    def understudy
        auditions = self.auditions.where(hired: true)
        if auditions.length >= 2
            auditions[1]
        else
            'no actor has been hired for understudy for this role'
        end
    end
end