class Roulette
attr_accessor :bet, :roulette_choice

  def initialize (bet, roulette_choice)
    @bet=bet
    @roulette_choice=roulette_choice

  end

  def play
    if @bet==@roulette_choice
      puts "Felicitaciones, has ganado"
    else
      puts "Lo siento, has perdido"
    end
  end

  def saving
    if @bet!=@roulette_choice
        File.open("roulette_history.txt", "a") do |f|
          f.puts @roulette_choice
        end
    else
        File.open("winners.txt", "a") do |f|
        f.puts "Números ganadores #{@bet}"
        end
      end
  end
  def self.more_likely
    data=[]
    mayor=0
    data=File.open("roulette_history.txt", "r").readlines.map(&:to_i)
    conteo=data.group_by{|x| x}

        conteo.each do |k,v|
          conteo[k]=v.count
        end

    puts "El número que más es elegido al azar es el: #{conteo.invert[conteo.values.max]} "
    puts conteo


  end

end

r=(1..10).to_a
player_bet=Roulette.new(6, r.sample)
player_bet.play
player_bet.saving
Roulette.more_likely
