class Code
    def initialize()
        @code = []
    end

    def create_code()
        @code = []

        i = 1
        while i<5
            @code.push(1+rand(6))
            i += 1
        end
        puts @code
    end

    def win?(guess)
        answer = []
        
        i = 0
        while i<guess.length
            if guess[i] == @code[i]
                answer.push('x')
            elsif @code.include?(guess[i])
                answer.push('o')
            else
                answer.push(' ')
            end

            i += 1
        end
        
        if answer == ['x','x','x','x']
            return true
        else
            p answer.shuffle.join(' | ')
            return false
        end
    end

end

class Player
    attr_reader :attempts

    def initialize()
        @attempts = 0
    end

    def guess()
        guess = []

        i = 1
        while i<5
            p "Guess position #{i}."
            input = gets.chomp.to_i
            guess.push(input)
            i += 1
        end
        @attempts += 1
        return guess
    end

    def win()
        p "You won in #{@attempts} attempts!"
    end

    def lose()
        p "You lost."
    end
end

def game()
    board = Code.new()
    player = Player.new()

    board.create_code()

    while true
        guess = player.guess()
        wins = board.win?(guess)

        if wins
            player.win()
            break
        elsif player.attempts > 9
            player.lose()
            break
        end
    end
end

game()


