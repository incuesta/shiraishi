# 2018-04-21

# Title:
#     Online Lending and Loan Management with Accounting and Decision Support System for Antipolo City Government Employees Credit Cooperative

# Author: 
#     Leopoldo Deogenes P. Cuesta II
#     BS-IT Student
#     AMA Computer University, College of East Rizal


    

class ImageUploader < CarrierWave::Uploader::Base
    # Include RMagick or MiniMagick support:
    # include CarrierWave::RMagick
    include CarrierWave::MiniMagick

    # Choose what kind of storage to use for this uploader:
    storage :file
    # storage :fog

    # Override the directory where uploaded files will be stored.
    # This is a sensible default for uploaders that are meant to be mounted:
    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    # Provide a default URL as a default if there hasn't been a file uploaded:
    def default_url(*args)
      # For Rails 3.1+ asset pipeline compatibility:
      # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
    
      "/images/fallback/" + [version_name, "default.png"].compact.join('_')
    end

    # Process files as they are uploaded:
    # process scale: [200, 300]
    #
    # def scale(width, height)
    #   # do something
    # end


    # resize to 200 when image is 200px+
    process resize_to_limit: [200, 200]


    # Create different versions of your uploaded files:

    version :img_32 do
      process resize_to_fit: [32, 32]
    end

    version :img_50 do
      process resize_to_fit: [50, 50]
    end

    version :img_100 do
      process resize_to_fit: [100, 100]
    end

    version :img_200 do
      process resize_to_fit: [200, 200]
    end

    version :img_450 do
      process resize_to_fit: [450, nil]
    end


    # Add a white list of extensions which are allowed to be uploaded.
    # For images you might use something like this:
    def extension_whitelist
      %w(jpg jpeg gif png)
    end

    # Override the filename of the uploaded files:
    # Avoid using model.id or version_name here, see uploader/store.rb for details.
    # def filename
    #   "something.jpg" if original_filename
    # end
end
