class FamilyGoal < ActiveRecord::Base
  has_many :users_family_goals
  has_many :users, through: :users_family_goals

  #Lo utilizo para el select multiple de la vista
  def all
    "#{name}| #{code}| #{cargo}| #{area}| #{mundo}"
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      name  = spreadsheet.cell(i,'A')
      code  = spreadsheet.cell(i,'B')
      cargo = spreadsheet.cell(i,'C')
      area  = spreadsheet.cell(i,'D')
      mundo = spreadsheet.cell(i,'E')
      # Validando un poco sino existe creo
      if !FamilyGoal.exists?(:name => name, :code =>code, :cargo =>cargo, :area =>area, :mundo =>mundo)
         f = FamilyGoal.new
         f.name  = name
         f.code  = code
         f.cargo = cargo
         f.area  = area
         f.mundo = mundo
         f.save
      end
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)   
    when ".xlsx" then Roo::Excelx.new(file.path, packed: false, file_warning: :ignore)  
    else raise "Se desconoce ese archivo: #{file.original_filename}"
    end  
  end

end
