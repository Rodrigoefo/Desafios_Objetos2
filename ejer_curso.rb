class Course
require "date"


  def initialize (name, start, finish)
    @name=name
    @start=Date.parse(start)
    @finish=Date.parse(finish)

  end

  def self.read_file(file = 'archivo.txt')
    data = File.open(file,'r').readlines.map(&:chomp)
    courses_objects = []

    data.each do |line|
      course_data = line.split(', ')
      courses_objects << Table.new(*course_data)
    end

    return courses_objects
  end

  def self.start_at(filter = Date.today)
    course=self.read_file
    


  end

end

Course.read_file




#Crear una clase Course cuyo constructor reciba el nombre del curso y las fechas de inicio y
#término


#Crear un método que permita leer el archivo y crear una instancia de la clase Course por
#línea del archivo.
