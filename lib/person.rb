require 'pry'

class Person
    attr_reader :name
    attr_accessor :bank_account, :happiness, :hygiene

    def initialize(name)
        @name = name
        @bank_account = 25
        @happiness = 8
        @hygiene = 8
    end

    def name
        @name
    end

    def bank_account(value = @bank_account)
        @bank_account == value ? @bank_account : self.bank_account = value
    end

    def happiness(value = @happiness)
        @happiness = attribution(value)
    end

    def hygiene(value = @hygiene)
        @hygiene = attribution(value)
    end

    def attribution(value)
        if value.between?(0,10)
            value
        elsif value > 10
            10
        else 
            0
        end
    end

    def clean?
        self.hygiene > 7
    end

    def happy?
        self.happiness > 7
    end

    def get_paid(amount)
        @bank_account += amount
        "all about the benjamins"
    end

    def take_bath
        self.hygiene=(@hygiene + 4)
        "♪ Rub-a-dub just relaxing in the tub ♫"
    end

    def work_out
        self.happiness=(@happiness + 2)
        self.hygiene=(@hygiene - 3)
        "♪ another one bites the dust ♫"
    end

    def call_friend(friend)
        self.happiness=(@happiness + 3)
        friend.happiness=(friend.happiness + 3)
        "Hi #{friend.name}! It's #{self.name}. How are you?"
    end

    def start_conversation(friend, topic)
        happiness_obj = topic_happiness(topic)
        self.happiness=(@happiness + happiness_obj[:point])
        friend.happiness=(friend.happiness + happiness_obj[:point])
        happiness_obj[:quote]
    end

    def topic_happiness(topic)
        if topic.downcase == 'politics'
            {point: -2, quote: "blah blah partisan blah lobbyist"}
        elsif topic.downcase == 'weather'
            {point: 1, quote: "blah blah sun blah rain"}
        else
            {point: 0, quote: "blah blah blah blah blah"}
        end 
    end
end