# -*- coding: utf-8 -*-

class FigureFileUploader < CarrierWave::Uploader::Base

  def store_dir
    "ff/#{model.id}"
  end
end
