# -*- coding: utf-8 -*-
class ContactInfo < ActiveRecord::Base
  include TranslationStuff

  translates :right_block, :left_block, fallbacks_for_empty_translations: true
  accepts_nested_attributes_for :translations

  attr_accessible :coords, :right_block, :left_block, :lj_url, :vk_url, :tw_url, :fb_url

  def name
    'Контактная информация'
  end
end
