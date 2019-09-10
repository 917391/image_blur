class Image
    attr_accessor :image
    def initialize(image)
        @image = image
    end
    
    def output_image
        rowstring = ""
        image.each do |x|
            rowstring = ""
            x.each do |pixel|
                rowstring += pixel.to_s
            end
            
            puts rowstring
        
        
        end
    end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image