module Crefo
  class Service
    class Search
      class Response < Service::Response
        self.response_name = :search

        def result
          hits.map do |hit|
            Company.new.tap do |company|
              company.identificationnumber = hit[:identificationnumber]
              company.companyname = hit[:companyname]
              company.street = hit[:street]
              company.zipcode = hit[:postcode]
              company.city = hit[:city]
              company.country = hit[:country][:designation]
             end
          end
        end

        def hits
          @hits ||= begin
            object = document_body_hash[:hit]
            if object.nil?
              []
            elsif object.respond_to?(:to_ary)
              object.to_ary || [object]
            else
              [object]
            end
          end
        end
      end
    end
  end
end
