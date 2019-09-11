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
    
    def blur(distance)
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
            
            d = distance
            height = 0
            while height < distance
                while d > 0
                    #checking top pixel
                    if r - d >= 0
                        image[r-d][c] = 1
                    end
                    #checking bottom pixels
                    if r + d < image.length
                        image[r+d][c] = 1
                    end
                    
                    #checking top left pixels
                    if c - d >= 0 and r - height >= 0
                        image[r-height][c-d] = 1
                        
                    end
                    #checking top right  pixels
                    if c + d < image[r-height].length and r - height >= 0
                        image[r-height][c+d] = 1
                    end
                    #check bottom left pixel
                    if c - d >= 0 and r + height < image.length
                        image[r+height][c-d] = 1
                    end
                    #checking bottom right pixels
                    if c + d < image[r-height].length and r + height < image.length 
                        image[r+height][c+d] = 1
                    end
                    d -= 1
                end
                height += 1
                d = distance - height
            end
        end
    end
end

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 1],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [1, 0, 0, 0, 0, 0, 0, 0],
])
image.blur(2)
image.output_image