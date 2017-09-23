class Image < ActiveRecord::Base

  after_save  :update_file
  after_destroy  :delete_file

  attr_accessor :data_stream, :width, :height

  belongs_to :imageable, polymorphic: true

  def filename
    "#{id}.jpg"
  end

  def path
    "/images/#{imageable_type.pluralize.underscore}/"
  end

  def to_s
    "#{path}#{filename}"
  end

  def full_path
    "#{Rails.root}/public/#{path}/#{filename}"
  end

  def update_file
    return false if data_stream.blank?
    data = data_stream.read
    return false if data.empty?
    delete_file
    check_path
    write_data(data)
    resize
  end

  private

  def resize
    return unless @width || @height
    image = MiniMagick::Image.new(full_path)
    image.resize "#{@width}x#{@height}"
  end

  def delete_file
    File.unlink(full_path) if File.exist?(full_path)
  end

  def check_path
    dir = File.expand_path(File.dirname(full_path))
    FileUtils.mkpath(dir) unless Dir.exist?(dir)
  end

  def write_data(data)
    File.open(full_path, 'wb') do |file|
    file.write(data)
  end
    check_size
  end

  def check_size
    File.size(full_path) > 0
  end
end
