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
    
    def blur
        temp = []
        temp_r = []
        column = 0
        row = 0
        image.each do |x|
            x.each do |pixel|
                if pixel == 1
                    #store locations
                    temp.push(column)
                    temp_r.push(row)
                end
                column += 1
            end
            row += 1
            column = 0
        end
        r, c = 0
        while temp.length > 0 do
            #extract location
            r = temp_r.pop
            c = temp.pop
            #check the top of the pixel
            
            if r - 1 >= 0
                image[r - 1][c] = 1
                
            end
            #check the left pixel
            if c - 1 >= 0
                image[r][c-1] = 1
            end
            #check the bottom pixel
            if r + 1 < image.length
                image[r+1][c] = 1
                
            end
            #check the right pixel
            if c + 1 < image[r].length
                image[r][c+1] = 1
            end
        end
    end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.blur
image.output_image