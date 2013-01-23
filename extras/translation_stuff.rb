module TranslationStuff
  extend ActiveSupport::Concern

  included do
    attr_accessible :translations_attributes
    after_save :create_missing_translations
  end

  module InstanceMethods
    protected

    def create_missing_translations
      ADDITIONAL_LOCALES.each do |lang|
        t = translations.find_by_locale(lang[0].to_s)
        if t.nil?
          translations.create(:locale => lang[0].to_s)
        end
      end
    end
  end

end
